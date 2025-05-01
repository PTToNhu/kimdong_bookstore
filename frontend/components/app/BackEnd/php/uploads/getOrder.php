<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'DbConnect.php';
$objDb = new DbConnect();
$conn = $objDb->connect();

$variable = isset($_GET['variable']) ? $_GET['variable'] : null;

$sql = "SELECT * FROM don_dat_hang";
$stmt = $conn->prepare($sql);
$stmt->execute(); // No parameters to bind here

$order = $stmt->fetchAll(PDO::FETCH_ASSOC);

if(!$order) {
    echo json_encode(['message' => 'No records found']);
}
echo json_encode($order);
$conn = null;
?>