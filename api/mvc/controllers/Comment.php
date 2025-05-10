<?php
class Comment extends Controller
{
    function getTotalCommentsByNewID()
    {
        $ID = $_GET['newid'] ?? 1;
        $comments = $this->model("CommentModel")->getTotalCommentsByNewID($ID);
        $res = $comments->fetch_assoc();
        if ($res) {
            echo json_encode($res);
        } else {
            echo json_encode(null);
        }
    }
    function getCommentByNewID()
    {
        $ID = $_GET['newid'] ?? 1;
        $offset = $_GET['offset'] ?? 0;
        $limit = $_GET['limit'] ?? 10;
        $order = $_GET['order'] ?? 'ASC';
        $res = $this->model("CommentModel")->getCommentByNewID($ID, $offset, $limit, $order);
        $now = new DateTime('now', new DateTimeZone('Asia/Ho_Chi_Minh'));
        foreach ($res['data'] as $key => $value) {
            $date = new DateTime($value['CreatedAt'], new DateTimeZone('Asia/Ho_Chi_Minh'));
            $interval = $now->diff($date);
            if ($interval->y > 0) {
                $res['data'][$key]['CreatedAt'] = $interval->y . ' năm trước';
            } elseif ($interval->m > 0) {
                $res['data'][$key]['CreatedAt'] = $interval->m . ' tháng trước';
            } elseif ($interval->d > 0) {
                $res['data'][$key]['CreatedAt'] = $interval->d . ' ngày trước';
            } elseif ($interval->h > 0) {
                $res['data'][$key]['CreatedAt'] = $interval->h . ' giờ trước';
            } elseif ($interval->i > 0) {
                $res['data'][$key]['CreatedAt'] = $interval->i . ' phút trước';
            } else {
                $res['data'][$key]['CreatedAt'] = 'Vừa xong';
            }
        }
        $res['total'] = $res['total'] ?? 0;
        if ($res) {
            echo json_encode($res);
        } else {
            echo json_encode(null);
        }
    }
    function getCommentByID($id)
    {
        $res = $this->model("CommentModel")->getCommentByID($id);
        if ($res) {
            echo json_encode(['data' => $res, 'message' => 'success']);
        } else {
            echo json_encode(['data' => null, 'message' => 'Comment not found']);
        }
    }
    function addComment()
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
            $comment = $this->model("CommentModel")->getCommentByID($commentID);
            echo json_encode(['data' => $comment, 'message' => 'success']);
        } else {
            echo json_encode(['data' => null, 'message' => 'Failed to add comment']);
        }
    }
    public function updateComment()
    {
        header("Access-Control-Allow-Origin: *"); // Cho phép tất cả các nguồn truy cập
        header("Access-Control-Allow-Methods: POST, GET, OPTIONS"); // Cho phép các phương thức POST, GET, OPTIONS
        header("Access-Control-Allow-Headers: Content-Type, Authorization"); // Cho phép các header cần thiết
        header('Content-Type: application/json');
        $data = json_decode(file_get_contents("php://input"), true);
        $id = $data['id'];
        if (empty($id)) {
            echo json_encode(['data' => null, 'message' => 'ID is required']);
            return;
        }
        $content = htmlspecialchars(trim($data['content']));
        if (empty($content)) {
            echo json_encode(['data' => null, 'message' => 'Content is required']);
            return;
        }
        $res = $this->model("CommentModel")->updateComment($id, $content);
        if ($res) {
            echo json_encode(['message' => 'success']);
        } else {
            echo json_encode(['message' => 'Failed to update comment']);
        }
    }
    public function deleteComment()
    {
        header("Access-Control-Allow-Origin: *"); // Cho phép tất cả các nguồn truy cập
        header("Access-Control-Allow-Methods: POST, GET, OPTIONS"); // Cho phép các phương thức POST, GET, OPTIONS
        header("Access-Control-Allow-Headers: Content-Type, Authorization"); // Cho phép các header cần thiết
        header('Content-Type: application/json');
        $data = json_decode(file_get_contents("php://input"), true);
        $id = $data['id'];
        if (empty($id)) {
            echo json_encode(['data' => null, 'message' => 'ID is required']);
            return;
        }
        $res = $this->model("CommentModel")->deleteComment($id);
        if ($res) {
            echo json_encode(['message' => 'success']);
        } else {
            echo json_encode(['message' => 'Failed to delete comment']);
        }
    }
    public function getChildCommentByParentID()
    {
        $id= $_GET['parentID'] ?? 1;
        $res = $this->model("CommentModel")->getChildCommentByParentID($id);
        $now = new DateTime('now', new DateTimeZone('Asia/Ho_Chi_Minh'));
        foreach ($res['data'] as $key => $value) {
            $date = new DateTime($value['CreatedAt'], new DateTimeZone('Asia/Ho_Chi_Minh'));
            $interval = $now->diff($date);
            if ($interval->y > 0) {
                $res['data'][$key]['CreatedAt'] = $interval->y . ' năm trước';
            } elseif ($interval->m > 0) {
                $res['data'][$key]['CreatedAt'] = $interval->m . ' tháng trước';
            } elseif ($interval->d > 0) {
                $res['data'][$key]['CreatedAt'] = $interval->d . ' ngày trước';
            } elseif ($interval->h > 0) {
                $res['data'][$key]['CreatedAt'] = $interval->h . ' giờ trước';
            } elseif ($interval->i > 0) {
                $res['data'][$key]['CreatedAt'] = $interval->i . ' phút trước';
            } else {
                $res['data'][$key]['CreatedAt'] = 'Vừa xong';
            }
        }
        if ($res) {
            echo json_encode(['data' => $res, 'message' => 'success']);
        } else {
            echo json_encode(['data' => null, 'message' => 'No child comments found']);
        }
    }
}
