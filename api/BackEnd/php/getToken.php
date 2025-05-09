<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
error_reporting(E_ALL);
ini_set('display_errors', 1);
include 'DbConnect.php';

$objDb = new DbConnect();
$conn = $objDb->connect();

function base64UrlEncode($data) {
    return rtrim(strtr(base64_encode($data), '+/', '-_'), '=');
}

function createJwt($user, $secret) {
    $header = json_encode(['alg' => 'HS256', 'typ' => 'JWT']);
    $payload = json_encode([
        'userId' => $user['phone'], // Sử dụng phone hoặc email làm userId
        'username' => $user['name'], // Sử dụng name cho username
        'exp' => time() + 3600 
    ]);

    $encodedHeader = base64UrlEncode($header);
    $encodedPayload = base64UrlEncode($payload);
    $signature = base64UrlEncode(hash_hmac('sha256', "$encodedHeader.$encodedPayload", $secret, true));

    return "$encodedHeader.$encodedPayload.$signature";
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);

    if (isset($data['userId']) && isset($data['identifier'])) {
        $userId = $data['userId'];
        $identifier = $data['identifier'];

        $stmt = $conn->prepare("SELECT * FROM account WHERE phone = :phone OR email = :email");
        $stmt->bindParam(':phone', $userId);
        $stmt->bindParam(':email', $identifier);

        if ($stmt->execute()) {
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if (count($result) > 0) {
                $user = $result[0];

                $secret = '0368287072'; 
                $token = createJwt($user, $secret);

                echo json_encode(['user' => $user, 'jwt' => $token]);
            } else {
                echo json_encode(['message' => 'User not found.']);
            }
        } else {
            echo json_encode(['message' => 'Error executing query.']);
        }
    } else {
        echo json_encode(['message' => 'Invalid input.']);
    }
} else {
    echo json_encode(['message' => 'Invalid request method.']);
}

$conn = null; 
?>