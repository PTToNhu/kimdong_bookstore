<?php
require_once __DIR__ . '/../core/Database.php';

class LocationModel extends Database {
    public $conn;

    public function __construct() {
        parent::__construct();  
        $this->conn = $this->getConnection();  
    }

    public function GetLocations() {
        $query = $this->conn->prepare("SELECT * FROM kdbookstore.locations");
        $query->execute();
        $result = $query->get_result();
        $locations = [];

        while ($row = $result->fetch_assoc()) {
            $locations[] = $row;
        }

        if (count($locations) > 0) {
            return $locations;
        } else {
            return array(); 
        }
    }

    public function GetMainBranch() {
        $query = $this->conn->prepare("SELECT * FROM kdbookstore.locations WHERE main_branch = true LIMIT 1");
        $query->execute();
        $result = $query->get_result();
        return $result->fetch_assoc();
    }
}
?>
