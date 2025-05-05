<?php
require_once __DIR__ . '/../core/Database.php';
class CustomerModel extends Database {
    // private $conn;

    public function __construct() {
        parent::__construct();  
        $this->conn = $this->getConnection();  
    }

    public function GetCustomerbyE($email) {
        $query = $this->conn->prepare("SELECT * FROM kdbookstore.customer WHERE cus_email = ?");
        $query->execute([$email]); 
        return $query->fetch(PDO::FETCH_ASSOC);
    }
    public function InsertNewCus($email, $userName, $password) {
        $query = $this->conn->prepare("
            INSERT INTO kdbookstore.customer (cus_name, cus_password, cus_email)
            VALUES (?, SHA1(?), ?)
        ");
        $query->execute([$userName, $password, $email]);
    
        $query1 = $this->conn->prepare("
            SELECT * FROM kdbookstore.customer WHERE cus_email = ?
        ");
        $query1->execute([$email]);
    
        return $query1->fetch(PDO::FETCH_ASSOC);
    }
    
}
?>