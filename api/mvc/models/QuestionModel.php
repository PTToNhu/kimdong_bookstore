<?php
class QuestionModel extends Database
{
    public function getAllQuestions()
    {
        $query = "
        SELECT 
            q.id,
            q.question AS title,
            q.created_at AS time,
            u.name AS user,
            (
                SELECT a.answer
                FROM answers a
                WHERE a.question_id = q.id
                ORDER BY a.created_at DESC
                LIMIT 1
            ) AS comment,
            (
                SELECT COUNT(*)
                FROM answers a
                WHERE a.question_id = q.id
            ) AS total_answers
        FROM questions q
        LEFT JOIN users u ON q.user_id = u.id
    ";
        return mysqli_query($this->connection, $query);
    }
    public function searchQuestion($keyword)
    {
        $keyword_escaped = mysqli_real_escape_string($this->connection, mb_strtolower($keyword));

        $query = "
    SELECT * FROM questions
    WHERE LOWER(CONVERT(question USING utf8)) COLLATE utf8_bin LIKE '%$keyword_escaped%'
";
        error_log("✅ keyword_escaped chạy: $keyword_escaped");
        error_log("✅ QUERY chạy: $query");

        $result = mysqli_query($this->connection, $query);

        if (!$result) {
            error_log("❌ MYSQL ERROR: " . mysqli_error($this->connection));
            return false;
        }

        $data = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $data[] = $row;
        }

        return $data;
    }



    // ✅ Thêm hàm này vào class
    private function stripUnicode($str)
    {
        $unicode = [
            'a' => 'á|à|ả|ã|ạ|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ',
            'd' => 'đ',
            'e' => 'é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ',
            'i' => 'í|ì|ỉ|ĩ|ị',
            'o' => 'ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ',
            'u' => 'ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự',
            'y' => 'ý|ỳ|ỷ|ỹ|ỵ'
        ];

        foreach ($unicode as $nonAccent => $accentGroup) {
            $str = preg_replace("/($accentGroup)/i", $nonAccent, $str);
        }

        return $str;
    }
}
