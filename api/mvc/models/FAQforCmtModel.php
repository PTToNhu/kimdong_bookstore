<?php
class FAQforCmtModel extends Database
{
    public function getQuestionByIdWithAnswers($id)
    {
        $id = mysqli_real_escape_string($this->connection, $id);

        // 1. Lấy thông tin câu hỏi và user
        $queryQuestion = "
        SELECT q.*, u.name, u.avatar_url 
        FROM questions q
        JOIN users u ON q.user_id = u.id
        WHERE q.id = '$id'
    ";
        $resultQuestion = mysqli_query($this->connection, $queryQuestion);

        if (!$resultQuestion || mysqli_num_rows($resultQuestion) == 0) {
            return null;
        }

        $question = mysqli_fetch_assoc($resultQuestion);
        $questionData = [
            "id" => $question["id"],
            "question" => $question["question"],
            "created_at" => $question["created_at"],
            "user" => [
                "name" => $question["name"],
                "avatar_url" => $question["avatar_url"]
            ]
        ];

        // 2. Lấy toàn bộ answer (bao gồm cả reply)
        $queryAnswers = "
        SELECT a.*, u.name, u.avatar_url
        FROM answers a
        JOIN users u ON a.user_id = u.id
        WHERE a.question_id = '$id'
        ORDER BY a.created_at ASC
    ";
        $resultAnswers = mysqli_query($this->connection, $queryAnswers);
        $allAnswers = [];

        // 3. Gán mảng reply trống và user vào từng answer
        while ($row = mysqli_fetch_assoc($resultAnswers)) {
            $row["user"] = [
                "name" => $row["name"],
                "avatar_url" => $row["avatar_url"]
            ];
            $row["replies"] = [];
            $allAnswers[$row["id"]] = $row;
        }

        // 4. Đệ quy lồng replies
        $rootAnswers = [];
        foreach ($allAnswers as $id => &$answer) {
            if (!empty($answer["reply_to_answer_id"])) {
                $parentId = $answer["reply_to_answer_id"];
                if (isset($allAnswers[$parentId])) {
                    $allAnswers[$parentId]["replies"][] = &$answer;
                }
            } else {
                $rootAnswers[] = &$answer;
            }
        }

        // 5. Kết quả cuối cùng
        $questionData["answers"] = $rootAnswers;
        return $questionData;
    }
    public function countLevel1AnswersByQuestionId($questionId)
    {
        $questionId = mysqli_real_escape_string($this->connection, $questionId);

        $query = "
        SELECT COUNT(*) as total
        FROM answers
        WHERE question_id = '$questionId' AND level = 1
    ";

        $result = mysqli_query($this->connection, $query);

        if ($row = mysqli_fetch_assoc($result)) {
            return (int)$row["total"];
        }

        return 0;
    }
    public function addAnswer($data)
    {
        $question_id = mysqli_real_escape_string($this->connection, $data["question_id"]);
        $user_id = mysqli_real_escape_string($this->connection, $data["user_id"]);
        $answer = mysqli_real_escape_string($this->connection, $data["answer"]);
        $created_at = mysqli_real_escape_string($this->connection, $data["created_at"]);
        $reply_to_answer_id = isset($data["reply_to_answer_id"]) ? mysqli_real_escape_string($this->connection, $data["reply_to_answer_id"]) : "NULL";
        $reply_to_user_id = isset($data["reply_to_user_id"]) ? mysqli_real_escape_string($this->connection, $data["reply_to_user_id"]) : "NULL";

        // Xác định level
        $level = $reply_to_answer_id !== "NULL" ? 2 : 1;

        $query = "
        INSERT INTO answers (question_id, user_id, answer, created_at, level, reply_to_answer_id, reply_to_user_id)
        VALUES ('$question_id', '$user_id', '$answer', '$created_at', $level, $reply_to_answer_id, $reply_to_user_id)
    ";

        return mysqli_query($this->connection, $query);
    }
    public function addQuestion($user_id, $question, $created_at)
    {
        $user_id = (int)$user_id;
        $question = mysqli_real_escape_string($this->connection, $question);
        $created_at = mysqli_real_escape_string($this->connection, $created_at);

        $query = "INSERT INTO questions (user_id, question, created_at) 
                  VALUES ($user_id, '$question', '$created_at')";

        return mysqli_query($this->connection, $query);
    }
}