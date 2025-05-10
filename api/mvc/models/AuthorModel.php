<?php
require_once __DIR__ . '/../core/Database.php';

class AuthorModel extends Database {
    public $conn;

    public function __construct() {
        parent::__construct();  
        $this->conn = $this->getConnection();  
    }

    public function GetListAuthor($num) {
        // Sanitize input
        $num = intval($num);

        // Prepare query using placeholder (?)
        $stmt = $this->conn->prepare("SELECT * FROM kdbookstore.author LIMIT ?");
        if (!$stmt) {
            die("Lỗi khi chuẩn bị truy vấn: " . $this->conn->error);
        }

        // Bind the parameter
        $stmt->bind_param("i", $num); // "i" for integer

        // Execute the query
        $stmt->execute();

        // Get the result
        $result = $stmt->get_result();
        $authors = $result->fetch_all(MYSQLI_ASSOC);

        // Check if there are results
        if (count($authors) > 0) {
            return $authors;
        } else {
            return array(); // Empty array if no authors
        }
    }
}
?>
