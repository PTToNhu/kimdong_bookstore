<?php
class QuestionsSortedModel extends Database
{
    public function getAllQuestionsByFeature($id)
    {
        $query = "SELECT id, feature_id, question, answer FROM feature_questions WHERE feature_id = $id";;
        return mysqli_query($this->connection, $query);
    }
    public function deleteQuestion($id)
    {
        $id = mysqli_real_escape_string($this->connection, $id);
        $query = "DELETE FROM feature_questions WHERE id = '$id'";
        return mysqli_query($this->connection, $query);
    }
    public function updateQuestion($id, $question, $answer)
    {
        $id = mysqli_real_escape_string($this->connection, $id);
        $question = mysqli_real_escape_string($this->connection, $question);
        $answer = mysqli_real_escape_string($this->connection, $answer);
        $query = "UPDATE feature_questions SET question = '$question', answer = '$answer' WHERE id = '$id'";
        return mysqli_query($this->connection, $query);
    }

    public function addQuestion($feature_id, $question, $answer)
    {
        $feature_id = mysqli_real_escape_string($this->connection, $feature_id);
        $question = mysqli_real_escape_string($this->connection, $question);
        $answer = mysqli_real_escape_string($this->connection, $answer);

        $query = "INSERT INTO feature_questions (feature_id, question, answer) VALUES ('$feature_id', '$question', '$answer')";
        return mysqli_query($this->connection, $query);
    }

}
