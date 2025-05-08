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
        $query = "Select * from comment where NewsID=$id order by CreatedAt $order limit $limit offset $offset";
        $data = mysqli_query($this->connection, $query);
        $comments = [];
        while ($row = mysqli_fetch_assoc($data)) {
            $comments[] = $row;
        }
        $countQuery = "SELECT COUNT(*) as total FROM comment WHERE NewsID = $id";
        $countResult = mysqli_query($this->connection, $countQuery);
        $countRow = mysqli_fetch_assoc($countResult);
        $total = $countRow['total'];
        return [
            'data' => $comments,
            'total' => $total,
        ];
    }
}
