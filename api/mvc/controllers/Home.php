<?php
require_once __DIR__ . '/../models/AuthorModel.php';
require_once __DIR__ . '/../models/PostModel.php';
require_once __DIR__ . '/../models/BookModel.php';
class Home extends Controller
{
    function Sayhi()
    {
        // echo "Home-Sayhi";
        // $book = $this->model("BookModel");
        // $category = $book->GetCategory();
        // $categories = [];
        // while ($row = $category->fetch_assoc()) {
        //     $categories[] = $row;
        // }
        // print_r($categories);
        // $this->view("home", ["Danh_muc" => $category]);
    }
    public function getListAuthor() {
        $data = json_decode(file_get_contents("php://input"), true);
    
        // Optional: fallback if num not sent
        $num = isset($data['num']) ? intval($data['num']) : 10;
    
        // Get authors
        $authorModel = new AuthorModel();
        $authors = $authorModel->GetListAuthor($num); // Assuming this returns an array
    
        if (count($authors) > 0) {
            echo json_encode([
                "success" => true,
                "data" => [
                    "authors" => $authors
                ],
                "message" => "Authors retrieved successfully.",
                "error" => null
            ]);
        } else {
            http_response_code(404);
            echo json_encode([
                "success" => false,
                "data" => null,
                "message" => "No authors found.",
                "error" => [
                    "code" => 404,
                    "details" => "The system couldn't find any authors matching your request."
                ]
            ]);
        }
        
    }
    public function getListPost(){
        $data = json_decode(file_get_contents("php://input"), true);
    
        // Optional: fallback if num not sent
        $num = isset($data['num']) ? intval($data['num']) : 10;
    
        // Get authors
        $PostModel = new PostModel();
        $posts = $PostModel->GetListPost($num); // Assuming this returns an array
    
        if (count($posts) > 0) {
            echo json_encode([
                "success" => true,
                "data" => [
                    "posts" => $posts
                ],
                "message" => "Posts retrieved successfully.",
                "error" => null
            ]);
        } else {
            http_response_code(404);
            echo json_encode([
                "success" => false,
                "data" => null,
                "message" => "No posts found.",
                "error" => [
                    "code" => 404,
                    "details" => "The system couldn't find any posts matching your request."
                ]
            ]);
        }
    }
    public function getListBook(){
        $data = json_decode(file_get_contents("php://input"), true);
    
        // Optional: fallback if num not sent
        $num = isset($data['num']) ? intval($data['num']) : 10;
    
        // Get authors
        $BookModel = new BookModel();
        $books = $BookModel->GetListBook($num); // Assuming this returns an array
    
        if (count($books) > 0) {
            echo json_encode([
                "success" => true,
                "data" => [
                    "books" => $books
                ],
                "message" => "Books retrieved successfully.",
                "error" => null
            ]);
        } else {
            http_response_code(404);
            echo json_encode([
                "success" => false,
                "data" => null,
                "message" => "No books found.",
                "error" => [
                    "code" => 404,
                    "details" => "The system couldn't find any books matching your request."
                ]
            ]);
        }
    }
    
}
