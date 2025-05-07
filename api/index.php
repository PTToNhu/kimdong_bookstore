<?php
header("Access-Control-Allow-Origin: *"); // hoặc cụ thể: http://localhost:5173
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

session_start();
require_once "./mvc/Bridge.php";
$myApp = new App();