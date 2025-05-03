<?php
class FeatureModel extends Database
{
    public function getAllFeatures()
    {
        $query = "SELECT id, name AS title, icon FROM features";
        return mysqli_query($this->connection, $query);
    }
}
