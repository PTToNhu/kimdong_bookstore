<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'DbConnect.php';
$objDb = new DbConnect();
$conn = $objDb->connect();
$currentPage = $_SERVER['REQUEST_URI'];

$id = isset($_GET['id']) ? $_GET['id'] : null;
$phone = isset($_GET['phone']) ? $_GET['phone'] : null;

if ($id === null) {
    echo json_encode(['error' => 'ID parameter is missing']);
    exit;
}

$sql = "DELETE FROM favorite WHERE id = :id AND phone = :phone";
$stmt = $conn->prepare($sql);
$stmt->bindParam(':id', $id, PDO::PARAM_STR); 
$stmt->bindParam(':phone', $phone, PDO::PARAM_STR); 

if ($stmt->execute()) {
    if ($stmt->rowCount() > 0) {
        echo json_encode(['success' => 'Record deleted successfully']);
    } else {
        echo json_encode(['error' => 'No record found with the given ID']);
    }
} else {
    echo json_encode(['error' => 'Failed to delete record']);
}

$conn = null; 
?>