<?php
class Database
{
    public $connection;
    public $servername = "localhost";
    public $username = "root";
    public $password = "";
    public $databasename = "tiem_sach";

    function __construct()
    {
        $this->connection = mysqli_connect($this->servername, $this->username, $this->password);
        if (!$this->connection) {
            die("Connection failed: " . mysqli_connect_error());
        }
        mysqli_select_db($this->connection, $this->databasename);
        mysqli_query($this->connection, "SET NAMES 'utf8'");
    }
}
