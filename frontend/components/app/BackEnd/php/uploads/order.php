<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "tiem_sach";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die(json_encode(["success" => false, "message" => "Kết nối thất bại: " . $conn->connect_error]));
}

header('Access-Control-Allow-Origin: http://localhost:3000');
header('Content-Type: application/json; charset=utf-8');
$conn->set_charset("utf8");

$ho_va_ten = isset($_GET['ho_va_ten']) ? $_GET['ho_va_ten'] : null;
$email = isset($_GET['email']) ? $_GET['email'] : null;
$phone = isset($_GET['phone']) ? $_GET['phone'] : null;
$dia_chi = isset($_GET['dia_chi']) ? $_GET['dia_chi'] : null;
$thanh_pho = isset($_GET['thanh_pho']) ? $_GET['thanh_pho'] : null;
$huyen = isset($_GET['huyen']) ? $_GET['huyen'] : null;
$xa = isset($_GET['xa']) ? $_GET['xa'] : null;
$total = isset($_GET['total']) ? $_GET['total'] : null;
$book = isset($_GET['book']) ? $_GET['book'] : null;
$status = "Chưa giao";

$sql = "INSERT INTO don_dat_hang (ho_va_ten, email, phone, dia_chi, thanh_pho, huyen, xa, total, book, Status) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

$stmt = $conn->prepare($sql);
$stmt->bind_param("ssssssssss", $ho_va_ten, $email, $phone, $dia_chi, $thanh_pho, $huyen, $xa, $total, $book, $status);

if ($stmt->execute()) {
    echo json_encode(["success" => true, "message" => "Đơn đặt hàng đã được thêm thành công."]);
} else {
    echo json_encode(["success" => false, "message" => "Lỗi: " . $stmt->error]);
}

$stmt->close();
$conn->close();
?>