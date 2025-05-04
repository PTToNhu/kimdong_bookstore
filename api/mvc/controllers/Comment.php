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
        $now=new DateTime();
        foreach ($res['data'] as $key => $value) {
            $date = new DateTime($value['CreatedAt']);
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
}
