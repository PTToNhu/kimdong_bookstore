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
    public function getSocialMain()
    {
        $query = "SELECT title, image_url FROM social_section LIMIT 1";
        return mysqli_query($this->connection, $query);
    }

    public function getSocialSchools()
    {
        $query = "SELECT id, year, location FROM social_section_schools WHERE social_id = 1";
        return mysqli_query($this->connection, $query);
    }

    public function updateSocialSection($title, $image_url)
    {
        $title = mysqli_real_escape_string($this->connection, $title);
        $image_url = mysqli_real_escape_string($this->connection, $image_url);

        $query = "UPDATE social_section SET title = '$title', image_url = '$image_url' LIMIT 1";
        return mysqli_query($this->connection, $query);
    }
    public function deleteSocialSchool($id)
    {
        $id = mysqli_real_escape_string($this->connection, $id);
        $query = "DELETE FROM social_section_schools WHERE id = '$id'";
        return mysqli_query($this->connection, $query);
    }
    public function addSocialSchool($year, $location)
    {
        $year = (int)$year;
        $location = mysqli_real_escape_string($this->connection, $location);
        $query = "INSERT INTO social_section_schools (social_id, year, location) VALUES (1, $year, '$location')";
        return mysqli_query($this->connection, $query);
    }
    public function updateSocialSchool($id, $year, $location)
    {
        $id = (int)$id;
        $year = (int)$year;
        $location = mysqli_real_escape_string($this->connection, $location);
        $query = "UPDATE social_section_schools SET year = $year, location = '$location' WHERE id = $id";
        return mysqli_query($this->connection, $query);
    }
}
