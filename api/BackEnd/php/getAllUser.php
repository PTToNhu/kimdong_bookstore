<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'DbConnect.php';
$objDb = new DbConnect();
$conn = $objDb->connect();

$sql = "SELECT * FROM account";
$stmt = $conn->prepare($sql);
$stmt->execute(); 

$order = $stmt->fetchAll(PDO::FETCH_ASSOC);

if(!$order) {
    echo json_encode(['message' => 'No records found']);
}
echo json_encode($order);
$conn = null;
?>