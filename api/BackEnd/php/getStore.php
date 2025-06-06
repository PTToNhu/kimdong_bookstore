<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'DbConnect.php';
$objDb = new DbConnect();
$conn = $objDb->connect();
$currentPage = $_SERVER['REQUEST_URI'];

$url = isset($_GET['id']) ? $_GET['id'] : null;

if ($url === null) {
    echo json_encode(['error' => 'ID parameter is missing']);
    exit;
}

$sql = "SELECT * FROM store WHERE id = :id";
$stmt = $conn->prepare($sql);
$stmt->bindParam(':id', $url, PDO::PARAM_STR); 
$stmt->execute();
$users = $stmt->fetchAll(PDO::FETCH_ASSOC);

if (empty($users)) {
    echo json_encode(['error' => 'No product found for the given ID']);
    exit;
}
echo json_encode($users); 
$conn = null;
?>