<?php
class SocialModel extends Database
{
    public function getAllSocial()
    {
        $query = "
            SELECT 
            s.title, 
            s.image_url, 
            sc.year, 
            sc.location
            FROM social_section s
            JOIN social_section_schools sc ON s.id = sc.social_id;

    ";
        return mysqli_query($this->connection, $query);
    }
}
