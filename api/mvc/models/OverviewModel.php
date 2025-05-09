<?php
require_once __DIR__ . '/../core/Database.php';

class OverviewModel extends Database {
    public $conn;

    public function __construct() {
        parent::__construct();  
        $this->conn = $this->getConnection();  
    }

    public function Update($title, $header, $content, $img) {
        try {
            $sql = "UPDATE overview SET 
                        title = ?, 
                        header = ?, 
                        content = ?, 
                        img = ? 
                    WHERE id = 1";

            $stmt = $this->conn->prepare($sql);
            $stmt->bind_param("ssss", $title, $header, $content, $img);
            
            return $stmt->execute();
        } catch (Exception $e) {
            error_log("UpdateOverview error: " . $e->getMessage());
            return false;
        }
    }

    public function get() {
        $sql = "SELECT * FROM tiem_sach.overview LIMIT 1";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();

        $result = $stmt->get_result();
        if ($result->num_rows > 0) {
            return $result->fetch_assoc();
        } else {
            return array(); 
        }
    }
}
?>
