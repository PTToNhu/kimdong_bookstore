<?php
class CommentReplyModel extends Database
{
    public function addCommentReply($commentID, $parentID)
    {
        $stmt = $this->connection->prepare("INSERT INTO `commentreply`(`CommentID`, `ParrentCommentID`) VALUES (?,?)");
        if ($stmt === false) {
            return false;
        }
        $stmt->bind_param("ii", $commentID, $parentID);
        if ($stmt->execute()) {
            return true;
        } else {
            return false;
        }
    }
}
