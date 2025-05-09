<?php
class BookModel extends Database{
    public function GetCategory(){
        $query = "Select * from category";
        return mysqli_query($this->connection, $query);
    }
    public function __construct() {
        parent::__construct();  
        $this->conn = $this->getConnection();  
    }
    public function GetListBook($num) {
        $num = intval($num);
    
        $stmt = $this->conn->prepare("SELECT * FROM tiem_sach.tat_ca_san_pham LIMIT :num");
        $stmt->bindValue(':num', $num, PDO::PARAM_INT);
        $stmt->execute();
    
        // Fetch all rows
        $books = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
        // Check if there are results
        if ($stmt->rowCount() > 0) {
            return $books;
        } else {
            return array(); // Empty array if no authors
        }
    }
}

?>