<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'DbConnect.php';
$objDb = new DbConnect();
$conn = $objDb->connect();

$variable = isset($_GET['variable']) ? $_GET['variable'] : null;
$url = isset($_GET['url']) ? $_GET['url'] : null;

if ($url && $variable) {
    $sql = "SELECT * FROM `$url` WHERE name LIKE :variable";
    $stmt = $conn->prepare($sql);
    
    $likeVariable = "%" . $variable . "%";
    $stmt->bindParam(':variable', $likeVariable);
    $stmt->execute();
    
    $users = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if ($users) {
        echo json_encode($users);
    } else {
        echo json_encode(['message' => 'No records found']);
    }
} else {
    echo json_encode(['message' => 'Invalid parameters']);
}

$conn = null;
?>