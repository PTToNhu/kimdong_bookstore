<?php
require_once __DIR__ . '/../core/Database.php';
class AuthorModel extends Database {
    // private $conn;

    public function __construct() {
        parent::__construct();  
        $this->conn = $this->getConnection();  
    }
    public function GetListAuthor($num) {
        // Sanitize input
        $num = intval($num);
    
        // Prepare query with LIMIT as a parameter (to avoid injection)
        $stmt = $this->conn->prepare("SELECT * FROM kdbookstore.author LIMIT :num");
        $stmt->bindValue(':num', $num, PDO::PARAM_INT);
        $stmt->execute();
    
        // Fetch all rows
        $authors = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
        // Check if there are results
        if ($stmt->rowCount() > 0) {
            return $authors;
        } else {
            return array(); // Empty array if no authors
        }
    }
    
}
?>