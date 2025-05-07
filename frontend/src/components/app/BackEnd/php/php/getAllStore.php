<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'DbConnect.php';
$objDb = new DbConnect();
$conn = $objDb->connect();
$currentPage = $_SERVER['REQUEST_URI'];

$phone = isset($_GET['phone']) ? $_GET['phone'] : null;

if ($phone === null) {
    echo json_encode(['error' => 'Phone parameter is missing']);
    exit;
}

$sql = "SELECT * FROM store WHERE phone = :phone";
$stmt = $conn->prepare($sql);
$stmt->bindParam(':phone', $phone, PDO::PARAM_STR);

$stmt->execute();
$products = $stmt->fetchAll(PDO::FETCH_ASSOC);

if (empty($products)) {
    echo json_encode(['error' => 'No products found for the given phone number']);
    exit;
}

echo json_encode($products); 
$conn = null;
?>