<?php
class QuestionModel extends Database
{
    public function getAllQuestions()
    {
        $query = "
        SELECT 
            q.id,
            q.question AS title,
            q.created_at AS time,
            u.name AS user,
            (
                SELECT a.answer
                FROM answers a
                WHERE a.question_id = q.id
                ORDER BY a.created_at DESC
                LIMIT 1
            ) AS comment,
            (
                SELECT COUNT(*)
                FROM answers a
                WHERE a.question_id = q.id
            ) AS total_answers
        FROM questions q
        LEFT JOIN users u ON q.user_id = u.id
    ";
        return mysqli_query($this->connection, $query);
    }
}
