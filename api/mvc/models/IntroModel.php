<?php
class IntroModel extends Database
{
    public function getIntroMain()
    {
        $query = "SELECT title, subtitle, image_url, highlight FROM intro_section LIMIT 1";
        return mysqli_query($this->connection, $query);
    }

    public function getIntroParagraphs()
    {
        $query = "SELECT content FROM intro_section_paragraphs WHERE intro_id = 1";
        return mysqli_query($this->connection, $query);
    }
}
