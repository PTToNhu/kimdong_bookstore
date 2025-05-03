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
    public function getQuestions()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $model = $this->model("QuestionModel");
        $result = $model->getAllQuestions();

        $data = [];

        if ($result && $result instanceof mysqli_result) {
            while ($row = mysqli_fetch_assoc($result)) {
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
}
