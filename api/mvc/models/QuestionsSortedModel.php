<?php
class QuestionsSortedModel extends Database
{
    public function getAllQuestionsByFeature($id)
    {
        $query = "SELECT question, answer FROM feature_questions WHERE feature_id = $id";;
        return mysqli_query($this->connection, $query);
    }
}
