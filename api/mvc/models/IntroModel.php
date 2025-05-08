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
        $query = "SELECT id, content FROM intro_section_paragraphs WHERE intro_id = 1";
        return mysqli_query($this->connection, $query);
    }

    public function updateIntroSection($title, $subtitle, $highlight, $image_url)
    {
        $title = mysqli_real_escape_string($this->connection, $title);
        $subtitle = mysqli_real_escape_string($this->connection, $subtitle);
        $highlight = mysqli_real_escape_string($this->connection, $highlight);
        $image_url = mysqli_real_escape_string($this->connection, $image_url);

        $query = "UPDATE intro_section SET title = '$title', subtitle = '$subtitle', highlight = '$highlight', image_url = '$image_url' LIMIT 1";
        return mysqli_query($this->connection, $query);
    }
    public function deleteIntroParagraph($id)
    {
        $id = mysqli_real_escape_string($this->connection, $id);
        $query = "DELETE FROM intro_section_paragraphs WHERE id = '$id'";
        return mysqli_query($this->connection, $query);
    }
    public function addIntroParagraph($content)
    {
        $content = mysqli_real_escape_string($this->connection, $content);
        $query = "INSERT INTO intro_section_paragraphs (intro_id, content) VALUES (1, '$content')";
        return mysqli_query($this->connection, $query);
    }
    public function updateIntroParagraph($id, $content)
    {
        $id = (int)$id;
        $content = mysqli_real_escape_string($this->connection, $content);
        $query = "UPDATE intro_section_paragraphs SET content = '$content' WHERE id = $id";
        return mysqli_query($this->connection, $query);
    }
}
