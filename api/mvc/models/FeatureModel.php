<?php
class FeatureModel extends Database
{
    public function getAllFeatures()
    {
        $query = "SELECT id, name AS title, description, icon FROM features";
        return mysqli_query($this->connection, $query);
    }
    // Xóa 1 feature theo ID
    public function deleteFeature($id)
    {
        $id = mysqli_real_escape_string($this->connection, $id);
        $query = "DELETE FROM features WHERE id = '$id'";
        return mysqli_query($this->connection, $query);
    }

    // Cập nhật thông tin 1 feature theo ID
    public function updateFeature($id, $name, $description, $icon)
    {
        $id = mysqli_real_escape_string($this->connection, $id);
        $name = mysqli_real_escape_string($this->connection, $name);
        $description = mysqli_real_escape_string($this->connection, $description);
        $icon = mysqli_real_escape_string($this->connection, $icon);

        $query = "UPDATE features SET name = '$name', icon = '$icon', description = '$description' WHERE id = '$id'";
        return mysqli_query($this->connection, $query);
    }
    public function addFeature($name, $description, $icon)
    {
        $stmt = $this->connection->prepare("INSERT INTO features (name, description, icon) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $name, $description, $icon);
        return $stmt->execute();
    }
}
