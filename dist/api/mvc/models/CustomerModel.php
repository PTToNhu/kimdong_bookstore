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
}
?>