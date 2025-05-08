<?php
class Faq extends Controller
{
    public function getFeatures()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $model = $this->model("FeatureModel");
        $result = $model->getAllFeatures();

        $data = [];

        if ($result && $result instanceof mysqli_result) {
            while ($row = mysqli_fetch_assoc($result)) {
                $data[] = $row;
            }
        }

        echo json_encode($data);
    }
    public function deleteFeature($id)
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: DELETE, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $model = $this->model("FeatureModel");

        $result = $model->deleteFeature($id);

        if ($result) {
            echo json_encode(["success" => true, "message" => "Đã xóa tính năng thành công."]);
        } else {
            http_response_code(500);
            echo json_encode(["success" => false, "message" => "Lỗi khi xóa tính năng."]);
        }
    }

    public function updateFeature()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: PUT, OPTIONS"); // Đổi lại đúng method
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        // Kiểm tra và debug nếu có lỗi
        if (!is_array($data) || !isset($data['id'], $data['name'], $data['description'], $data['icon'])) {
            echo json_encode([
                "success" => false,
                "message" => "Thiếu dữ liệu đầu vào.",
                "debug_raw" => $raw,
                "json_error" => json_last_error_msg()
            ]);
            return;
        }

        $model = $this->model("FeatureModel");
        $result = $model->updateFeature($data['id'], $data['name'], $data['description'], $data['icon']);

        if ($result) {
            echo json_encode(["success" => true, "message" => "Đã cập nhật tính năng thành công."]);
        } else {
            http_response_code(500);
            echo json_encode(["success" => false, "message" => "Lỗi khi cập nhật tính năng."]);
        }
    }

    public function addFeature()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: POST, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        // Debug xem có nhận được không
        if ($data === null) {
            echo json_encode([
                "success" => false,
                "message" => "Thiếu dữ liệu đầu vào.",
                "debug_raw" => $raw,
                "json_error" => json_last_error_msg()
            ]);
            return;
        }

        $name = $data["name"];
        $description = $data["description"];
        $icon = $data["icon"];

        $model = $this->model("FeatureModel");
        $result = $model->addFeature($name, $description, $icon);

        if ($result) {
            echo json_encode(["success" => true, "message" => "Đã thêm thành công."]);
        } else {
            http_response_code(500);
            echo json_encode(["success" => false, "message" => "Lỗi thêm vào cơ sở dữ liệu."]);
        }
    }


    public function getQuestions()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $questionModel = $this->model("QuestionModel");
        $answerModel = $this->model("FAQforCmtModel"); // model chứa hàm đếm comment

        $result = $questionModel->getAllQuestions();
        $data = [];

        if ($result && $result instanceof mysqli_result) {
            while ($row = mysqli_fetch_assoc($result)) {
                $questionId = $row['id'];

                // Gọi model tính số comment cấp 1
                $commentCount = $answerModel->countLevel1AnswersByQuestionId($questionId);

                // Thêm vào dữ liệu trả về
                $row['comment'] = $commentCount;
                $data[] = $row;
            }
        }

        echo json_encode($data);
    }



    public function getQuestionsByFeature($id)
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $model = $this->model("QuestionsSortedModel");
        $result = $model->getAllQuestionsByFeature($id);

        $data = [];

        if ($result && $result instanceof mysqli_result) {
            while ($row = mysqli_fetch_assoc($result)) {
                $data[] = $row;
            }
        }

        echo json_encode($data);
    }
    public function getQuestionById($id)
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $questionModel = $this->model("QuestionModel");
        $answerModel = $this->model("FAQforCmtModel"); // model chứa hàm đếm comment

        $result = $questionModel->getAllQuestions();
        $data = [];

        if ($result && $result instanceof mysqli_result) {
            while ($row = mysqli_fetch_assoc($result)) {
                $questionId = $row['id'];

                // Gọi model tính số comment cấp 1
                $commentCount = $answerModel->countLevel1AnswersByQuestionId($questionId);
                if ($row["id"] == $id) {
                    $row['comment'] = $commentCount;
                    $data[] = $row;
                }
                // Thêm vào dữ liệu trả về
            }
        }

        
        echo json_encode($data);
    }

    public function addQuestion()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: POST, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        if ($data === null) {
            echo json_encode([
                "success" => false,
                "message" => "Thiếu dữ liệu đầu vào.",
                "debug_raw" => $raw,
                "json_error" => json_last_error_msg()
            ]);
            return;
        }

        $model = $this->model("QuestionsSortedModel");
        $result = $model->addQuestion($data['feature_id'], $data['question'], $data['answer']);

        if ($result) {
            echo json_encode(["success" => true, "message" => "Thêm câu hỏi thành công."]);
        } else {
            http_response_code(500);
            echo json_encode(["success" => false, "message" => "Lỗi khi thêm câu hỏi."]);
        }
    }
    public function updateQuestion()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: PUT, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        if (!isset($data['id']) || !isset($data['question']) || !isset($data['answer'])) {
            echo json_encode(["success" => false, "message" => "Thiếu dữ liệu để cập nhật."]);
            return;
        }

        $model = $this->model("QuestionsSortedModel");
        $result = $model->updateQuestion($data['id'], $data['question'], $data['answer']);

        if ($result) {
            echo json_encode(["success" => true, "message" => "Cập nhật câu hỏi thành công."]);
        } else {
            http_response_code(500);
            echo json_encode(["success" => false, "message" => "Lỗi khi cập nhật câu hỏi."]);
        }
    }
    public function deleteQuestion($id)
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: DELETE, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $model = $this->model("QuestionsSortedModel");
        $result = $model->deleteQuestion($id);

        if ($result) {
            echo json_encode(["success" => true, "message" => "Xóa câu hỏi thành công."]);
        } else {
            http_response_code(500);
            echo json_encode(["success" => false, "message" => "Lỗi khi xóa câu hỏi."]);
        }
    }

    public function searchQuestion()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: DELETE, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');



        // ✅ Lấy keyword từ query string
        $keyword = $_GET['q'] ?? '';
        error_log("KEYWORD từ query: " . $keyword);
        $model = $this->model("QuestionModel");
        $result = $model->searchQuestion($keyword);

        echo json_encode($result);
    }
}
