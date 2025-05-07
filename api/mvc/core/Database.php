<?php
class Database{
    public $connection;
    public $servername = "localhost";
    public $username= "root";
    public $password ="Moimoi5@"; 
    public $databasename ="tiem_sach";
    public $db = "tiem_sach";
    public $pw = "Moimoi5@";
    public $conn;
    function __construct()
    {
        $this->connection = mysqli_connect($this->servername, $this->username, $this->password);
        if (!$this->connection) {
            die("Connection failed: " . mysqli_connect_error());
        }
        mysqli_select_db($this->connection, $this->databasename);
        mysqli_query($this->connection, "SET NAMES 'utf8'");
        try {
            $this->conn = new PDO("mysql:host=$this->servername;dbname=$this->db;charset=utf8", 
                                  $this->username, 
                                  $this->pw);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            die("Connection failed: " . $e->getMessage());
        }

        
    }
    public function getConnection() {
        return $this->conn;
    }
}
?>