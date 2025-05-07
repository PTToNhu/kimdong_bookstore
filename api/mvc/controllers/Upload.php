<?php
class Upload extends Controller
{
    function UploadFile()
    {
        header("Access-Control-Allow-Origin: *"); // Cho phép tất cả các nguồn truy cập
        header("Access-Control-Allow-Methods: POST, GET, OPTIONS"); // Cho phép các phương thức POST, GET, OPTIONS
        header("Access-Control-Allow-Headers: Content-Type, Authorization"); // Cho phép các header cần thiết
        header('Content-Type: application/json');
        //tạo thu mục uploads nếu chưa có
        $target_dir = "uploads/";
        if (!file_exists($target_dir)) {
            mkdir($target_dir, 0755, true);
        }
        //lấy file từ request
        $file = $_FILES["file"];
        $imageFileType = strtolower(pathinfo($file["name"], PATHINFO_EXTENSION));
        $allowedTypes = ['jpg', 'jpeg', 'png', 'gif'];

        if (!in_array($imageFileType, $allowedTypes)) {
            http_response_code(400);
            echo json_encode(["error" => "Invalid file type"]);
            return;
        }

        // if ($file["size"] > 500000) {
        //     http_response_code(400);
        //     echo json_encode(["error" => "File too large"]);
        //     return;
        // }

        $newFileName = uniqid() . "." . $imageFileType;
        $target_file = $target_dir . $newFileName;

        if (move_uploaded_file($file["tmp_name"], $target_file)) {
            echo json_encode([
                "location" => "http://localhost/kimdong_bookstore/api/uploads/" . $newFileName
            ]);
        } else {
            http_response_code(500);
            echo json_encode(["error" => "Upload failed"]);
        }
    }
}
