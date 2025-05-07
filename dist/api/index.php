<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS"); 
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header('Content-Type: application/json; charset=UTF-8');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}


require_once __DIR__ . "/mvc/Bridge.php";
session_start();

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
// var_dump($_SERVER['REQUEST_URI']);
$base_path = "/Ass/kimdong_bookstore/dist/api/be"; 
$relative_uri = str_replace($base_path, "", $uri);

if ($relative_uri == "/login" && $_SERVER['REQUEST_METHOD'] == "POST") {
    $controller = new AuthController();
    
    $controller->login();
}
else if ($relative_uri == "/contact/delete" && $_SERVER['REQUEST_METHOD'] == "DELETE") {
    $controller = new Contact();
    $controller -> deleteContact();
}
else if ($relative_uri == "/contact/sendEmail" && $_SERVER['REQUEST_METHOD'] == "POST") {
    $controller = new Mail();
    $controller -> send();
}
else if ($relative_uri == "/getGeneralInfo" && $_SERVER['REQUEST_METHOD'] == "GET") {
    $controller = new Contact();
    $controller -> getGeneralInfo();
}

else if ($relative_uri == "/contact/getContacts" && $_SERVER['REQUEST_METHOD'] == "POST") {
    $controller = new Contact();
    $controller -> getContacts();
}
else if ($relative_uri == "/contact/changeStatus" && $_SERVER['REQUEST_METHOD'] == "POST") {
    $controller = new Contact();
    $controller -> changeStatus();
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
$myApp = new App();