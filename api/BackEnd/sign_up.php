<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

header("Access-Control-Allow-Origin: http://localhost:3000");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

print("=== PHP STARTED ===\n");
print_r("Request Method: " . $_SERVER['REQUEST_METHOD'] . "\n");

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "tiem_sach";

$conn = new mysqli($servername, $username, $password, $dbname);
$conn->set_charset("utf8");


if ($conn->connect_error) {
    echo json_encode(["success" => false, "message" => "Kết nối thất bại: " . $conn->connect_error]);
    exit;
}
print_r("Kết nối DB thành công.\n");


if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["success" => false, "message" => "Invalid request method."]);
    exit;
}

$requiredFields = ["name", "phone", "email", "birthdate", "password", "confirmPassword", "studentStatus"];
foreach ($requiredFields as $field) {
    if (!isset($_POST[$field])) {
        echo json_encode(["success" => false, "message" => "Thiếu thông tin: $field"]);
        exit;
    }
}


$sql = "SELECT MAX(id) AS max_id FROM account";
$result = $conn->query($sql);

if ($result) {
    $row = $result->fetch_assoc();
    $id = $row['max_id'] ? $row['max_id'] + 1 : 1;
    $name = $conn->real_escape_string($_POST["name"]);
    $phone = $conn->real_escape_string($_POST["phone"]);
    $email = $conn->real_escape_string($_POST["email"]);
    $birthdate = $conn->real_escape_string($_POST["birthdate"]);
    $password = $_POST["password"];
    $confirmPassword = $_POST["confirmPassword"];
    $studentStatus = $conn->real_escape_string($_POST["studentStatus"]);

    if ($password !== $confirmPassword) {
        echo json_encode(["success" => false, "message" => "Mật khẩu không khớp."]);
        exit;
    }

    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    $sql = "INSERT INTO account (id ,name, phone, email, birthdate, password, isStudent) VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);

    if (!$stmt) {
        echo json_encode(["success" => false, "message" => "Lỗi truy vấn: " . $conn->error]);
        exit;
    }

    $stmt->bind_param("sssssss", $id, $name, $phone, $email, $birthdate, $hashedPassword, $studentStatus);

    if ($stmt->execute()) {
        echo json_encode(["success" => true, "message" => "Đăng ký thành công!"]);
    } else {
        echo json_encode(["success" => false, "message" => "Lỗi khi đăng ký: " . $stmt->error]);
        exit;
    }
    $uploadDir = "./images/User/$id/";
    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0777, true);
        print_r("Đã tạo thư mục ảnh.\n");
    }

    if (isset($_FILES['file'])) {
        $response = ["success" => true, "message" => "Tải lên thành công."];
        
        foreach ($_FILES['file']['name'] as $key => $name) {
            $temp_path = $_FILES['file']['tmp_name'][$key];
            $fileInfo = pathinfo($name);
            $filename = $id . '.' . $fileInfo['extension']; 
            $target_path = $uploadDir . $filename;
    
            if (move_uploaded_file($temp_path, $target_path)) {
                foreach ($tables as $table) {
                    if (isset($_POST[$table])) {
                        $dir = "./images/User/" . strtolower($table) . "/"; 
                        if (!is_dir($dir)) {
                            mkdir($dir, 0777, true);
                        }
                        copy($target_path, $dir . $filename);
                    }
                }
            } else {
                $response['success'] = false;
                $response['message'] = 'Lỗi khi tải lên file: ' . $name;
                break; 
            }
        }
    } 
} else {
    echo json_encode(["success" => true, "message" => "Lỗi truy vấn: " . $conn->error]);
    exit;
}


$stmt->close();
$conn->close();
