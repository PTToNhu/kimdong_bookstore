<?php
require_once __DIR__ . '/../models/CustomerModel.php';
require_once __DIR__ . '/../core/JWTHandler.php'; 

class AuthController {
    public function login() {
        $data = json_decode(file_get_contents("php://input"), true);
        $email = $data['email'];
        $password = sha1($data['password']); 

        $userModel = new CustomerModel();
        $user = $userModel->GetCustomerbyE($email);

        if ($user && ($password === $user['cus_password'])) {
            
            $jwt = new JWTHandler();
            $token = $jwt->generateToken([
                "email" => $email,
                "name" => $user['cus_name'],
                "cus_id"=> $user ['cus_id'],
                "exp" => time() + 3600 // Token hết hạn sau 1 giờ
            ]);

            echo json_encode(["success" => true, "token" => $token]);
        } else {
            http_response_code(401);
            echo json_encode(["success" => false, "message" => "Incorrect email or password!"]);
        }
    }
    public function register() {
        $data = json_decode(file_get_contents("php://input"), true);
        $email = $data['email'];
        $username = $data['userName'];
        $password = sha1($data['password']); 

        $userModel = new CustomerModel();
        $checkValidEmail = $userModel -> GetCustomerbyE($email);
        if ($checkValidEmail){
            http_response_code(401);
            echo json_encode(["success" => false, "message" => "Tài khoản với email trên đã tồn tại!"]);
            return;
        }
        $user = $userModel->InsertNewCus($email, $username, $password);

        if ($user) {
            
            $jwt = new JWTHandler();
            $token = $jwt->generateToken([
                "email" => $email,
                "name" => $user['cus_name'],
                "cus_id"=> $user ['cus_id'],
                "exp" => time() + 3600 // Token hết hạn sau 1 giờ
            ]);

            echo json_encode(["success" => true, "token" => $token]);
        } else {
            http_response_code(401);
            echo json_encode(["success" => false, "message" => "Đăng ký không thành công!"]);
        }
    }
}
?>
