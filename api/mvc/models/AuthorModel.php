<?php
class AuthorModel extends Database
{
    // Lấy thông tin title, subtitle và các đoạn content
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

    // Lấy danh sách hoạt động tiêu biểu
    public function getAuthorActivities()
    {
        $query = "
            SELECT 
                year_from, 
                year_to, 
                description
            FROM author_section_activities
            WHERE author_id = 1
        ";
        return mysqli_query($this->connection, $query);
    }
}
