<?php
header("Access-Control-Allow-Origin: *");
header('Content-Type: application/json; charset=UTF-8');

session_start();
require_once "./mvc/Bridge.php";
$myApp = new App();