<?php
class FAQforCMT extends Controller
{
    public function getFAQById($id)
    {
        header('Access-Control-Allow-Origin: *');
        header('Content-Type: application/json');

        $model = $this->model("FAQforCmtModel");
        $question = $model->getQuestionByIdWithAnswers($id);

        // Không cần xử lý lồng replies ở controller nữa
        echo json_encode($question);
    }
    public function countLevel1Comments($id)
    {
        header('Access-Control-Allow-Origin: *');
        header('Content-Type: application/json');

        $model = $this->model("FAQforCmtModel");
        $count = $model->countLevel1AnswersByQuestionId($id);

        echo json_encode([
            "question_id" => $id,
            "level_1_comment_count" => $count
        ]);
    }
    public function addAnswer()
    {
        header("Access-Control-Allow-Origin: *");
        header("Content-Type: application/json");
        header("Access-Control-Allow-Methods: POST");
        header("Access-Control-Allow-Headers: Content-Type");

        $data = json_decode(file_get_contents("php://input"), true);
        if (!$data || !isset($data["question_id"], $data["user_id"], $data["answer"], $data["created_at"])) {
            echo json_encode(["status" => "error", "message" => "Thiếu dữ liệu bắt buộc"]);
            return;
        }

        $model = $this->model("FAQforCmtModel");
        $result = $model->addAnswer($data);

        if ($result) {
            echo json_encode(["status" => "success", "message" => "Thêm bình luận thành công"]);
        } else {
            echo json_encode(["status" => "error", "message" => "Thêm thất bại"]);
        }
    }
    public function addQuestion()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: POST");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        if ($data === null) {
            echo json_encode(["success" => false, "message" => "Thiếu dữ liệu đầu vào.", "debug_raw" => $raw, "json_error" => json_last_error_msg()]);
            return;
        }

        $user_id = $data["user_id"];
        $question = $data["question"];
        $created_at = $data["created_at"];

        $model = $this->model("FAQforCmtModel");
        $result = $model->addQuestion($user_id, $question, $created_at);

        if ($result) {
            echo json_encode(["status" => "success"]);
        } else {
            echo json_encode(["status" => "error", "message" => "Không thể thêm câu hỏi"]);
        }
    }
}
