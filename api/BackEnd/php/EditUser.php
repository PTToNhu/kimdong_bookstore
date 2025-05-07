<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'DbConnect.php';

$objDb = new DbConnect();
$conn = $objDb->connect();

$id = $_POST['id'] ?? '';
$name = $_POST['name'] ?? '';
$birthdate = $_POST['birthdate'] ?? '';
$email = $_POST['email'] ?? '';
$phone = $_POST['phone'] ?? '';
$file = $_FILES['file'] ?? null;

$response = ['success' => false, 'message' => ''];

if (empty($id) || empty($name) || empty($birthdate) || empty($email) || empty($phone)) {
    $response['message'] = 'All fields are required.';
    echo json_encode($response);
    exit;
}

$sql = "UPDATE account SET name = ?, birthdate = ?, email = ?, phone = ? WHERE id = ?";
$stmt = $conn->prepare($sql);

try {
    $stmt->execute([$name, $birthdate, $email, $phone, $id]);

    function deleteDirectory($dir) {
        if (!is_dir($dir)) {
            return false;
        }
    
        $files = array_diff(scandir($dir), ['.', '..']);
    
        foreach ($files as $file) {
            $filePath = "$dir/$file";
            if (is_dir($filePath)) {
                deleteDirectory($filePath);
            } else {
                unlink($filePath);
            }
        }
        return rmdir($dir);
    }
    
    $targetDir = "./../images/User/$id"; // Use double quotes for string interpolation
    
    // Delete the existing directory and its contents
    deleteDirectory($targetDir);
    
    // Create the target directory if it doesn't exist
    if (!is_dir($targetDir)) {
        mkdir($targetDir, 0777, true);
    }
    
    if ($file && $file['error'] == UPLOAD_ERR_OK) {
        $targetFile = $targetDir . '/' . $id . '.' . pathinfo($file['name'], PATHINFO_EXTENSION); // Use $id for the filename
    
        // If the file already exists, delete it
        if (file_exists($targetFile)) {
            unlink($targetFile); 
        }
        
        // Move the uploaded file to the target directory
        if (move_uploaded_file($file['tmp_name'], $targetFile)) {
            $response['success'] = true;
            $response['message'] = 'User updated successfully, file uploaded.';
        } else {
            $response['success'] = false; 
            $response['message'] = 'User updated, but file upload failed.';
        }
    } else {
        $response['success'] = true;
        $response['message'] = 'User updated successfully.';
    }
} catch (PDOException $e) {
    $response['success'] = false; 
    $response['message'] = 'Database error: ' . $e->getMessage();
}

$conn = null;

echo json_encode($response);
?>