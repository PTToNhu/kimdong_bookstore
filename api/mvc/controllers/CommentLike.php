<?php
class CommentLike extends Controller
{
    function getToTalLikesByCommentID()
    {
        $ID = $_GET['commentid'] ?? 1;
        $res = $this->model("CommentLikeModel")->getToTalLikesByCommentID($ID);
        echo json_encode($res);
    }
    function getLikedByCommentIDandUserID()
    {
        $commentID = $_GET['commentid'] ?? 1;
        $userID = $_GET['userid'] ?? 1;
        $res = $this->model("CommentLikeModel")->getLikedByCommentIDandUserID($commentID, $userID);
        echo json_encode($res);
    }
    function postCommentLike()
    {
        header("Access-Control-Allow-Origin: *");
        header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header("Content-Type: application/json");

        $data = json_decode(file_get_contents("php://input"), true);

        if (!isset($data['commentID']) || !isset($data['userID'])) {
            echo json_encode([
                "status" => "error",
                "message" => "Thiếu commentID hoặc userID"
            ]);
            return;
        }

        $res = $this->model("CommentLikeModel")->postCommentLike(
            $data['commentID'],
            $data['userID']
        );

        echo json_encode($res);
    }
}
