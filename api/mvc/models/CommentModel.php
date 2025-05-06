<?php
class CommentModel extends Database
{
    public function getTotalCommentsByNewID($id)
    {
        $query = "SELECT NewsID, COUNT(*) AS TOTAL 
                    FROM COMMENT 
                    WHERE NewsID = $id
                    GROUP BY NewsID;";
        return mysqli_query($this->connection, $query);
    }
    public function getCommentByNewID($id, $offset = 0, $limit = 10, $order = 'ASC')
    {
        $query = "Select * from comment where NewsID=$id AND ID NOT IN (SELECT CommentID FROM commentreply) order by CreatedAt $order limit $limit offset $offset";
        $data = mysqli_query($this->connection, $query);
        $comments = [];
        while ($row = mysqli_fetch_assoc($data)) {
            $comments[] = $row;
        }
        $countQuery = "SELECT COUNT(*) as total FROM comment WHERE NewsID = $id AND ID NOT IN (SELECT CommentID FROM commentreply)";
        $countResult = mysqli_query($this->connection, $countQuery);
        $countRow = mysqli_fetch_assoc($countResult);
        $total = $countRow['total'];
        return [
            'data' => $comments,
            'total' => $total,
        ];
    }
    public function getCommentByID($id)
    {
        $query = "SELECT * FROM comment WHERE ID = $id";
        $data = mysqli_query($this->connection, $query);
        return mysqli_fetch_assoc($data);
    }
    public function addComment($newsID, $userID, $content)
    {
        $stmt = $this->connection->prepare("INSERT INTO comment (NewsID, UserID, Content, CreatedAt) VALUES (?, ?, ?, NOW())");
        if ($stmt === false) {
            return false;
        }

        $stmt->bind_param("iis", $newsID, $userID, $content);
        if ($stmt->execute()) {
            return $stmt->insert_id;
        } else {
            return false;
        }
    }
    public function updateComment($id, $content)
    {
        $stmt = $this->connection->prepare("UPDATE comment SET Content = ? WHERE ID = ?");
        if ($stmt === false) {
            return false;
        }
        $stmt->bind_param("si", $content, $id);
        if ($stmt->execute()) {
            return true;
        } else {
            return false;
        }
    }
    public function deleteComment($id)
    {
        $stmt = $this->connection->prepare("DELETE FROM comment WHERE ID = ?");
        if ($stmt === false) {
            return false;
        }
        $stmt->bind_param("i", $id);
        if ($stmt->execute()) {
            return true;
        } else {
            return false;
        }
    }
    public function getChildCommentByParentID($parentID)
    {
        $query = "select * from comment where ID in (select CommentID from commentreply where ParrentCommentID=$parentID)";
        $data = mysqli_query($this->connection, $query);
        $comments = [];
        while ($row = mysqli_fetch_assoc($data)) {
            $comments[] = $row;
        }
        return [
            'data' => $comments,
        ];
    }
}
