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
}
