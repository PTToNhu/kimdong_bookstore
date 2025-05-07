<?php
require_once __DIR__ . '/../core/Database.php';
class GeneralInfoModel extends Database {
    // private $conn;

    public function __construct() {
        parent::__construct();  
        $this->conn = $this->getConnection();  
    }
    public function getGeneralInfo() {
        $stmt = $this->conn->prepare("SELECT * FROM tiem_sach.generalInfo LIMIT 1");
        $stmt->execute();
        $generalInfo = $stmt->fetch(PDO::FETCH_ASSOC);
    
        if ($stmt->rowCount() > 0) {
            return $generalInfo;
        } else {
            return array(); 
        }
    }
    
}
?>