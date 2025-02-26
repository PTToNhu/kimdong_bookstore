<?php
class BookModel extends Database{
    public function GetCategory(){
        $query = "Select * from category";
        return mysqli_query($this->connection, $query);
    }
}

?>