<?php
require_once __DIR__ . '/../core/Database.php';
class BookhpModel extends Database {
    public $conn;
    public function __construct() {
        parent::__construct();  
        $this->conn = $this->getConnection();  
    }

    public function GetListBook($num) {
        // Sanitize input
        $num = intval($num);

        // Prepare query with LIMIT as a parameter (to avoid injection)
        $stmt = $this->conn->prepare("SELECT * FROM tiem_sach.bookhp LIMIT ?");
        if (!$stmt) {
            die("Error in preparing statement: " . $this->conn->error);
        }

        // Bind parameters
        $stmt->bind_param("i", $num); // "i" means integer

        // Execute query
        $stmt->execute();

        // Get the result
        $result = $stmt->get_result();

        // Fetch all rows
        $books = $result->fetch_all(MYSQLI_ASSOC);

        // Check if there are results
        if (count($books) > 0) {
            return $books;
        } else {
            return array(); // Empty array if no books
        }
    }
}
?>
