<?php
    class AccountModel extends Database
    {
        public function getAccountByID($id)
        {
            $query = "SELECT * FROM account WHERE id = $id";
            $data = mysqli_query($this->connection, $query);
            return mysqli_fetch_assoc($data);
        }
    }
?>