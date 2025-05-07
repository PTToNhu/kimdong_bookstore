<?php
require_once __DIR__ . '/../core/Database.php';
class AdminModel extends Database {
    // private $conn;

    public function __construct() {
        parent::__construct();  
        $this->conn = $this->getConnection();  
    }
    public function GetAdminByEmail($email) {
        $stmt = $this->conn->prepare("SELECT * FROM kdbookstore.admin WHERE ad_email = ?");
        $stmt->execute([$email]);
    
        $admin = $stmt->fetch(PDO::FETCH_ASSOC); // chỉ lấy 1 dòng duy nhất
    
        return $admin ?: null; // nếu không có dữ liệu thì trả về null
    }
    
    
}
?>