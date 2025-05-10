<?php
require_once __DIR__ . '/../core/Database.php';

class GeneralInfoModel extends Database {
    public $conn;

    public function __construct() {
        parent::__construct();  
        $this->conn = $this->getConnection();  
    }

    public function getGeneralInfo() {
        
        $stmt = $this->conn->prepare("SELECT id, main_address, email, company_name, company_inter_name, agency,
        established_date, phone, director, license FROM tiem_sach.generalInfo LIMIT 1");
        $stmt->execute();
        $result = $stmt->get_result();
        
        $generalInfo = $result->fetch_assoc();
        
        if ($generalInfo) {
            return $generalInfo;
        } else {
            return array(); 
        }
    }
}
?>
