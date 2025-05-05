<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
error_reporting(E_ALL);
ini_set('display_errors', 1);

$secretKey = '0368287072';

function base64UrlDecode($data) {
    $padding = strlen($data) % 4;
    if ($padding) {
        $data .= str_repeat('=', 4 - $padding);
    }
    return base64_decode(strtr($data, '-_', '+/'));
}

function verifyToken($token) {
    global $secretKey;

    list($header64, $payload64, $signature64) = explode('.', $token);

    $header = json_decode(base64UrlDecode($header64), true);
    $payload = json_decode(base64UrlDecode($payload64), true);
    $signature = base64UrlDecode($signature64);

    $expectedSignature = hash_hmac('sha256', "$header64.$payload64", $secretKey, true);

    if ($signature === $expectedSignature && isset($payload['exp']) && $payload['exp'] > time()) {
        return $payload; 
    return null; 
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $headers = getallheaders();
    if (isset($headers['Authorization'])) {
        $authHeader = $headers['Authorization'];
        $token = str_replace('Bearer ', '', $authHeader);

        $userData = verifyToken($token);
        if ($userData) {
            echo json_encode(['success' => true, 'data' => $userData]);
        } else {
            echo json_encode(['success' => false, 'message' => 'Token không hợp lệ.']);
        }
    } else {
        echo json_encode(['success' => false, 'message' => 'Không có token.']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Phương thức yêu cầu không hợp lệ.']);
}
}
?>