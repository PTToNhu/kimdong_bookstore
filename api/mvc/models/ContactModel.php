<?php
require_once __DIR__ . '/../core/Database.php';
class ContactModel extends Database {
    // private $conn;

    public function __construct() {
        parent::__construct();  
        $this->conn = $this->getConnection();  
    }
    public function InsertNewContact($name, $email, $title, $content) {
        try {
            $query = $this->conn->prepare("
                INSERT INTO kdbookstore.contact (ct_name, ct_email, ct_title, ct_content, ct_time, ct_is_read, ct_is_responsed)
                VALUES (?, ?, ?, ?, NOW(), ?, ?)
            ");
    
            $result = $query->execute([$name, $email, $title, $content, 0, 0]);
    
            if ($result) {
                return "success";
            } else {
                return "Có lỗi khi ghi dữ liệu vào cơ sở dữ liệu!";
            }
    
        } catch (PDOException $e) {
            return "Lỗi: " . $e->getMessage();
        }
    }
    
    
}
?>