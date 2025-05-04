<?php
class News extends Controller
{
    function getNews()
    {
        $res = $this->model("NewsModel")->getNews($_GET['offset'], $_GET['limit']);
        echo json_encode($res);
    }

    function getNewsByCategoryID()
    {
        $categoryID = $_GET['categoryID'] ?? 1;
        $res = $this->model("NewsModel")->getNewsByCategoryID($categoryID, $_GET['offset'], $_GET['limit']);
        echo json_encode($res);
    }
    function getNewByID()
    {
        $id = $_GET['newid'] ?? 1;
        $res = $this->model("NewsModel")->getNewByID($id);
        echo json_encode($res);
    }
    function postNews()
    {
        header("Access-Control-Allow-Origin: *"); // Cho phép tất cả các nguồn truy cập
        header("Access-Control-Allow-Methods: POST, GET, OPTIONS"); // Cho phép các phương thức POST, GET, OPTIONS
        header("Access-Control-Allow-Headers: Content-Type, Authorization"); // Cho phép các header cần thiết
        header('Content-Type: application/json');
        $data = json_decode(file_get_contents("php://input"), true); // Lấy dữ liệu JSON từ request body, chuyển đổi json thành mảng
        $res = $this->model("NewsModel")->postNews($data);
        echo json_encode($res);
    }
}
