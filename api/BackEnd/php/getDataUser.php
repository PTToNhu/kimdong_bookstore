<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'DbConnect.php';
$objDb = new DbConnect();
$conn = $objDb->connect();

$id = isset($_GET['id']) ? $_GET['id'] : null;

$sql = "SELECT * FROM account WHERE id = :id"; 
$stmt = $conn->prepare($sql);
$stmt->bindParam(':id', $id, PDO::PARAM_STR); 
$stmt->execute();
$users = $stmt->fetchAll(PDO::FETCH_ASSOC);

if ($users) {
    echo json_encode($users);
} else {
    echo json_encode(['message' => 'No records found']);
}

$conn = null;
?>