<?php
class InternationalModel extends Database
{
    public function getAllInternational()
    {
        $query = "
        SELECT 
            i.title, 
            p.region, 
            p.country_name, 
            p.flag_url, 
            p.count
        FROM international_section i
        JOIN international_section_partners p ON i.id = p.international_id;
        ";
        return mysqli_query($this->connection, $query);
    }
    // Lấy dữ liệu bảng international_section (bỏ id)
    public function getInternationalSection()
    {
        $query = "SELECT title FROM international_section LIMIT 1";
        return mysqli_query($this->connection, $query);
    }

    // Lấy danh sách các partner từ bảng international_section_partners
    public function getInternationalPartners()
    {
        $query = "SELECT id, region, country_name, flag_url, count FROM international_section_partners WHERE international_id = 1";
        return mysqli_query($this->connection, $query);
    }

    // 3. Cập nhật International Section
    public function updateInternationalSection($title)
    {
        $title = mysqli_real_escape_string($this->connection, $title);

        $query = "UPDATE international_section SET title = '$title' LIMIT 1";
        return mysqli_query($this->connection, $query);
    }
    public function deleteInternationalPartner($id)
    {
        $id = mysqli_real_escape_string($this->connection, $id);
        $query = "DELETE FROM international_section_partners WHERE id = '$id'";
        return mysqli_query($this->connection, $query);
    }
    public function addInternationalPartner($region, $country_name, $flag_url, $count)
    {
        $region = mysqli_real_escape_string($this->connection, $region);
        $country_name = mysqli_real_escape_string($this->connection, $country_name);
        $flag_url = mysqli_real_escape_string($this->connection, $flag_url);
        $count = (int)$count;

        $query = "INSERT INTO international_section_partners (international_id, region, country_name, flag_url, count) 
              VALUES (1, '$region', '$country_name', '$flag_url', $count)";
        return mysqli_query($this->connection, $query);
    }
    public function updateInternationalPartner($id, $region, $country_name, $flag_url, $count)
    {
        $id = (int)$id;
        $region = mysqli_real_escape_string($this->connection, $region);
        $country_name = mysqli_real_escape_string($this->connection, $country_name);
        $flag_url = mysqli_real_escape_string($this->connection, $flag_url);
        $count = (int)$count;

        $query = "UPDATE international_section_partners SET 
                region = '$region', 
                country_name = '$country_name', 
                flag_url = '$flag_url', 
                count = $count 
              WHERE id = $id";
        return mysqli_query($this->connection, $query);
    }
}
