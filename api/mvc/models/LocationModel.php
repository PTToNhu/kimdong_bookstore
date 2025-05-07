<?php
require_once __DIR__ . '/../core/Database.php';
class LocationModel extends Database {
    // private $conn;

    public function __construct() {
        parent::__construct();  
        $this->conn = $this->getConnection();  
    }

    public function GetLocations() {
        $query = $this->conn->prepare("SELECT * FROM kdbookstore.locations");
        $query->execute(); 
        $locations = $query->fetchAll(PDO::FETCH_ASSOC);
        if (count($locations) > 0) {
            return $locations;
        } else {
            return array(); 
        }
    }
    
    public function GetMainBranch() {
        $query = $this->conn->prepare("SELECT * FROM kdbookstore.locations WHERE main_branch = true LIMIT 1");
        $query->execute(); 
        return $query->fetch(PDO::FETCH_ASSOC);
    }
    
    
}
?>