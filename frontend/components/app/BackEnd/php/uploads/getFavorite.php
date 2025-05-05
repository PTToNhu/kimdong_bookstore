<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'DbConnect.php';
$objDb = new DbConnect();
$conn = $objDb->connect();

$url = isset($_GET['id']) ? $_GET['id'] : null;
$phone = isset($_GET['phone']) ? $_GET['phone'] : null;

if ($url === null) {
    echo json_encode(['error' => 'ID parameter is missing']);
    exit;
}

$sql = "SELECT * FROM favorite WHERE id = :id AND phone = :phone";
$stmt = $conn->prepare($sql);
$stmt->bindParam(':id', $url, PDO::PARAM_STR); 
$stmt->bindParam(':phone', $phone, PDO::PARAM_STR); 
$stmt->execute();
$users = $stmt->fetchAll(PDO::FETCH_ASSOC);

if (empty($users)) {
    echo json_encode(['error' => 'No product found for the given ID and phone']);
    exit;
}

echo json_encode($users); 
$conn = null;
?>