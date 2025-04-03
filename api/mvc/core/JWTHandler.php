<?php
require_once __DIR__ . '/../../vendor/autoload.php'; 
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

class JWTHandler {
    private $secret_key = "your_secret_key"; 

    // Hàm tạo token JWT
    public function generateToken($payload) {
        return JWT::encode($payload, $this->secret_key, 'HS256');
    }

    // Hàm kiểm tra token JWT
    public function validateToken($token) {
        try {
            $decoded = JWT::decode($token, new Key($this->secret_key, 'HS256'));
            return (array) $decoded;
        } catch (Exception $e) {
            return false;
        }
    }
}
?>
