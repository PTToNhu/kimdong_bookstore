<?php
class AuthorsModel extends Database
{
    // GET
    public function getAuthorInfo()
    {
        $query = "
            SELECT 
                a.title, 
                a.subtitle, 
                p.content
            FROM author_section a
            JOIN author_section_paragraphs p ON a.id = p.author_id
        ";
        return mysqli_query($this->connection, $query);
    }

    public function getAuthorActivities()
    {
        $query = "
            SELECT 
                id,
                year_from, 
                year_to, 
                description
            FROM author_section_activities
            WHERE author_id = 1
        ";
        return mysqli_query($this->connection, $query);
    }
    public function getAuthorMain()
    {
        $query = "SELECT title, subtitle FROM author_section LIMIT 1";
        return mysqli_query($this->connection, $query);
    }

    public function getAuthorParagraphs()
    {
        $query = "SELECT id, content FROM author_section_paragraphs WHERE author_id = 1";
        return mysqli_query($this->connection, $query);
    }

    // 4. Cập nhật Author Section

    public function updateAuthorSection($title, $subtitle)
    {
        $title = mysqli_real_escape_string($this->connection, $title);
        $subtitle = mysqli_real_escape_string($this->connection, $subtitle);

        $query = "UPDATE author_section SET title = '$title', subtitle = '$subtitle' LIMIT 1";
        return mysqli_query($this->connection, $query);
    }
    public function deleteAuthorParagraph($id)
    {
        $id = mysqli_real_escape_string($this->connection, $id);
        $query = "DELETE FROM author_section_paragraphs WHERE id = '$id'";
        return mysqli_query($this->connection, $query);
    }
    public function deleteAuthorActivity($id)
    {
        $id = mysqli_real_escape_string($this->connection, $id);
        $query = "DELETE FROM author_section_activities WHERE id = '$id'";
        return mysqli_query($this->connection, $query);
    }
    public function addAuthorParagraph($content)
    {
        $content = mysqli_real_escape_string($this->connection, $content);
        $query = "INSERT INTO author_section_paragraphs (author_id, content) VALUES (1, '$content')";
        return mysqli_query($this->connection, $query);
    }


    public function addAuthorActivity($year_from, $year_to, $description)
    {
        $year_from = (int)$year_from;
        $year_to = (int)$year_to;
        $description = mysqli_real_escape_string($this->connection, $description);
        $query = "INSERT INTO author_section_activities (author_id, year_from, year_to, description) 
              VALUES (1, $year_from, $year_to, '$description')";
        return mysqli_query($this->connection, $query);
    }
    public function updateAuthorParagraph($id, $content)
    {
        $id = (int)$id;
        $content = mysqli_real_escape_string($this->connection, $content);
        $query = "UPDATE author_section_paragraphs SET content = '$content' WHERE id = $id";
        return mysqli_query($this->connection, $query);
    }

    public function updateAuthorActivity($id, $year_from, $year_to, $description)
    {
        $id = (int)$id;
        $year_from = (int)$year_from;
        $year_to = (int)$year_to;
        $description = mysqli_real_escape_string($this->connection, $description);
        $query = "UPDATE author_section_activities SET 
                year_from = $year_from, 
                year_to = $year_to, 
                description = '$description' 
              WHERE id = $id";
        return mysqli_query($this->connection, $query);
    }
}
