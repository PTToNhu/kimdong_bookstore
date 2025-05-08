<?php
class CommentReplyModel extends Database{
    public function getNews($id){
        $query = "Select * from news where ParentCommentID=$id";
        return mysqli_query($this->connection, $query);
    }
}
?>