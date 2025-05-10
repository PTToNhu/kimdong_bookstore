<?php
class News extends Controller
{
    function getNews()
    {
        $offset = $_GET['offset'] ?? 0; // Giá trị mặc định là 0 nếu không có tham số offset
        $limit = $_GET['limit'] ?? 100; // Giá trị mặc định là 10 nếu không có tham số limit
        $res = $this->model("NewsModel")->getNews($offset, $limit);
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
    function deleteNew()
    {
        header("Access-Control-Allow-Origin: *");
        header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $data = json_decode(file_get_contents("php://input"), true);

        if (!isset($data['id']) || !is_numeric($data['id'])) {
            echo json_encode([
                'status' => 'error',
                'message' => 'ID không hợp lệ hoặc không được cung cấp'
            ]);
            return;
        }

        $id = intval($data['id']);

        $res = $this->model("NewsModel")->deleteNew($id);
        echo json_encode($res);
    }
    function updateNew()
    {
        header("Access-Control-Allow-Origin: *");
        header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $data = json_decode(file_get_contents("php://input"), true);

        if (!isset($data['id']) || !is_numeric($data['id'])) {
            echo json_encode([
                'status' => 'error',
                'message' => 'ID không hợp lệ hoặc không được cung cấp'
            ]);
            return;
        }
        $res = $this->model("NewsModel")->updateNew($data);
        echo json_encode($res);
    }
}
