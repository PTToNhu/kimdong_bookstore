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
$password = $_POST['password'] ?? ''; // Get password from $_POST
$file = $_FILES['file'] ?? null;

$response = ['success' => false, 'message' => ''];

if (empty($id) || empty($name) || empty($birthdate) || empty($email) || empty($phone)) {
    $response['message'] = 'All fields are required.';
    echo json_encode($response);
    exit;
}

// Validate password (optional, but recommended)
if (empty($password)) {
    $response['message'] = 'Password is required.'; // Or 'Password cannot be empty if you want to change it'
    echo json_encode($response);
    exit;
}

// Hash the password
$hashedPassword = password_hash($password, PASSWORD_DEFAULT);

$sql = "UPDATE account SET name = ?, birthdate = ?, email = ?, phone = ?, password = ? WHERE id = ?";
$stmt = $conn->prepare($sql);

try {
    $stmt->execute([$name, $birthdate, $email, $phone, $hashedPassword, $id]);

    if ($stmt->rowCount() > 0) {
        $response['success'] = true;
        $response['message'] = 'Account updated successfully.';

         // File Upload Logic (moved inside the successful update block)
        function deleteDirectory($dir) {
            if (!is_dir($dir)) {
                return true; // Return true if directory doesn't exist, nothing to delete
            }

            $files = array_diff(scandir($dir), ['.', '..']);

            foreach ($files as $file) {
                $filePath = "$dir/$file";
                if (is_dir($filePath)) {
                    if(!deleteDirectory($filePath)) {
                        return false; // Stop if recursive deletion fails
                    }
                } else {
                    if(!unlink($filePath)) {
                        return false; // Stop if file deletion fails
                    }
                }
            }
            return rmdir($dir);
        }

        $targetDir = "./../images/User/$id";

        if (is_dir($targetDir)) {
            if(!deleteDirectory($targetDir)) {
                $response['success'] = false;
                $response['message'] = 'Failed to delete old directory.';
                echo json_encode($response);
                exit;
            }
        }

        if (!is_dir($targetDir)) {
            if(!mkdir($targetDir, 0777, true)) {
                $response['success'] = false;
                $response['message'] = 'Failed to create directory.';
                echo json_encode($response);
                exit;
            }
        }

        if ($file && $file['error'] == UPLOAD_ERR_OK) {
            $file_name = basename($file['name']); // Sanitize filename
            $file_ext = strtolower(pathinfo($file_name, PATHINFO_EXTENSION)); // Get file extension
            $targetFile = $targetDir . '/' . $id . '.' . $file_ext; // Use $id for the filename

            //Basic file type validation (example: allow only images)
            $allowed_extensions = array("jpg", "jpeg", "png", "gif");
            if(!in_array($file_ext, $allowed_extensions)){
                $response['success'] = false;
                $response['message'] = 'Invalid file type. Only JPG, JPEG, PNG and GIF files are allowed.';
                echo json_encode($response);
                exit;
            }

            if (file_exists($targetFile)) {
                if(!unlink($targetFile)) {
                    $response['success'] = false;
                    $response['message'] = 'Failed to delete old file.';
                    echo json_encode($response);
                    exit;
                }
            }

            if (move_uploaded_file($file['tmp_name'], $targetFile)) {
                $response['success'] = true;
                $response['message'] = 'User updated successfully, file uploaded.';
            } else {
                $response['success'] = false;
                $response['message'] = 'User updated, but file upload failed.';
            }
        } else {
            // No file uploaded, but account updated successfully
            $response['success'] = true;
            $response['message'] = 'User updated successfully.';
        }


    } else {
        $response['message'] = 'No changes were made to the account.'; // Or 'Account not found' if no rows were updated
    }

} catch (PDOException $e) {
    $response['success'] = false;
    $response['message'] = 'Database error: ' . $e->getMessage();
} finally {
    $conn = null; // Close the connection in the finally block
}

echo json_encode($response);
?>