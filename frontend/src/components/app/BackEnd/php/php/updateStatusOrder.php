<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "tiem_sach";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die(json_encode(["success" => false, "message" => "Kết nối thất bại: " . $conn->connect_error]));
}

header('Content-Type: application/json; charset=utf-8');
$conn->set_charset("utf8");

$status = isset($_GET['status']) ? $_GET['status'] : null;
$id = isset($_GET['id']) ? $_GET['id'] : null;

if ($status !== null && $id !== null) {
    $sql = "UPDATE don_dat_hang SET Status = ? WHERE id = ?";
    
    $stmt = $conn->prepare($sql);
    
    $stmt->bind_param("si", $status, $id);

    if ($stmt->execute()) {
        echo json_encode(["success" => true, "message" => "Đơn đặt hàng đã được cập nhật thành công."]);
    } else {
        echo json_encode(["success" => false, "message" => "Lỗi: " . $stmt->error]);
    }

    $stmt->close();
} else {
    echo json_encode(["success" => false, "message" => "Thiếu thông tin id hoặc status."]);
}

$conn->close();
?>