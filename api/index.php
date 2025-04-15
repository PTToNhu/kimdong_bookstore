<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS"); 
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header('Content-Type: application/json; charset=UTF-8');


require_once __DIR__ . "/mvc/Bridge.php";
$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
// var_dump($_SERVER['REQUEST_URI']);
$base_path = "/Ass/kimdong_bookstore/api"; 
$relative_uri = str_replace($base_path, "", $uri);

if ($relative_uri == "/login" && $_SERVER['REQUEST_METHOD'] == "POST") {
    $controller = new AuthController();
    
    $controller->login();
}
else if($relative_uri == "/home/listAuthor" && $_SERVER['REQUEST_METHOD'] == "GET"){
    $controller = new Home();
    $controller->getListAuthor();
}
else if($relative_uri == "/home/listPost" && $_SERVER['REQUEST_METHOD'] == "GET"){
    $controller = new Home();
    $controller->getListPost();
}
else if($relative_uri == "/home/listBook" && $_SERVER['REQUEST_METHOD'] == "GET"){
    $controller = new Home();
    $controller->getListBook();
}
else {
    http_response_code(404);
    echo json_encode(["message" => "API not exist"]);
}
session_start();
$myApp = new App();
?>