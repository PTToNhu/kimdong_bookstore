<?php
class CommentLikeModel extends Database
{
    public function getToTalLikesByCommentID($id)
    {
        $query = "SELECT COUNT(*) as total FROM commentlike WHERE CommentID=$id";
        $result = mysqli_query($this->connection, $query);
        $row = mysqli_fetch_assoc($result);
        return [
            'total' => $row['total'],
        ];
    }
    public function getLikedByCommentIDandUserID($commentID, $userID)
    {
        $query = "SELECT * FROM commentlike WHERE CommentID=$commentID and UserID=$userID";
        $result = mysqli_query($this->connection, $query);
        $row = mysqli_fetch_assoc($result);
        if ($row) {
            return [
                'status' => true,
                'data' => $row,
            ];
        } else {
            return [
                'status' => false,
                'data' => null,
            ];
        }
    }
    public function postCommentLike($commentID, $userID)
    {
        $checkQuery = "SELECT * FROM commentlike WHERE CommentID = ? AND UserID = ?";
        $stmt = $this->connection->prepare($checkQuery);
        $stmt->bind_param("ii", $commentID, $userID);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $deleteQuery = "DELETE FROM commentlike WHERE CommentID = ? AND UserID = ?";
            $deleteStmt = $this->connection->prepare($deleteQuery);
            $deleteStmt->bind_param("ii", $commentID, $userID);
            $deleteStmt->execute();

            return [
                "status" => "unliked",
                "message" => "Đã bỏ like bình luận"
            ];
        } else {
            $insertQuery = "INSERT INTO commentlike (CommentID, UserID) VALUES (?, ?)";
            $insertStmt = $this->connection->prepare($insertQuery);
            $insertStmt->bind_param("ii", $commentID, $userID);
            $insertStmt->execute();

            return [
                "status" => "liked",
                "message" => "Đã like bình luận"
            ];
        }
    }
}
