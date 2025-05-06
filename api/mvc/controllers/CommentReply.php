<?php
class CommentReply extends Controller
{
    function addCommentReply()
    {
        header("Access-Control-Allow-Origin: *"); // Cho phép tất cả các nguồn truy cập
        header("Access-Control-Allow-Methods: POST, GET, OPTIONS"); // Cho phép các phương thức POST, GET, OPTIONS
        header("Access-Control-Allow-Headers: Content-Type, Authorization"); // Cho phép các header cần thiết
        header('Content-Type: application/json');
        $data = json_decode(file_get_contents("php://input"), true);
        $newsID = $data['newsID'];
        if (empty($newsID)) {
            echo json_encode(['data' => null, 'message' => 'NewsID is required']);
            return;
        }
        $userID = $data['userID'];
        if (empty($userID)) {
            echo json_encode(['data' => null, 'message' => 'UserID is required']);
            return;
        }
        $content = htmlspecialchars(trim($data['content']));
        if (empty($content)) {
            echo json_encode(['data' => null, 'message' => 'Content is required']);
            return;
        }
        $commentID = $this->model("CommentModel")->addComment($newsID, $userID, $content);
        if ($commentID) {
            $parentID = $data['parentID'];
            if (empty($parentID)) {
                echo json_encode(['data' => null, 'message' => 'ParentID is required']);
                return;
            }
            $reply = $this->model("CommentReplyModel")->addCommentReply($commentID, $parentID);
            if (!$reply) {
                echo json_encode(['data' => null, 'message' => 'Failed to add comment reply']);
                return;
            }
            $comment = $this->model("CommentModel")->getCommentByID($commentID);
            echo json_encode(['data' => $comment, 'message' => 'success']);
        } else {
            echo json_encode(['data' => null, 'message' => 'Failed to add comment']);
        }
    }
}
