<?php
class NewsModel extends Database
{
    public function getNews($offset, $limit)
    {
        $query = "Select * from news where status=1 order by id desc limit $limit offset $offset";
        $data = mysqli_query($this->connection, $query);
        $news = [];
        while ($row = mysqli_fetch_assoc($data)) {
            $news[] = $row;
        }

        $countQuery = "SELECT COUNT(*) as total FROM news WHERE status = 1";
        $countResult = mysqli_query($this->connection, $countQuery);
        $countRow = mysqli_fetch_assoc($countResult);
        $total = $countRow['total'];
        return [
            'data' => $news,
            'total' => $total,
        ];
    }
    public function getNewsByCategoryID($id, $offset, $limit)
    {
        $query = "Select * from news where status=1 and CategoryID = $id order by id desc limit $limit offset $offset";
        $data = mysqli_query($this->connection, $query);
        $news = [];
        while ($row = mysqli_fetch_assoc($data)) {
            $news[] = $row;
        }
        $countQuery = "SELECT COUNT(*) as total FROM news WHERE status = 1 and CategoryID = $id";
        $countResult = mysqli_query($this->connection, $countQuery);
        $countRow = mysqli_fetch_assoc($countResult);
        $total = $countRow['total'];
        return [
            'data' => $news,
            'total' => $total,
        ];
    }
    public function getNewByID($id)
    {
        $query = "Select * from news where status=1 and id = $id";
        $data = mysqli_query($this->connection, $query);
        $new = mysqli_fetch_assoc($data);
        return [
            'data' => $new,
        ];
    }
    public function postNews($data)
    {
        $title = mysqli_real_escape_string($this->connection, $data['title']);
        $text = mysqli_real_escape_string($this->connection, $data['text']);
        $thumbnail = mysqli_real_escape_string($this->connection, $data['thumbnail']);
        $scheduleAt = mysqli_real_escape_string($this->connection, $data['scheduleAt']);
        $status = (int)$data['status'];
        $categoryID = (int)$data['categoryID'];
        $writtenByAdminID = (int)$data['writtenByAdminID'];
        $writtenDate = mysqli_real_escape_string($this->connection, $data['writtenDate']);

        $query = "INSERT INTO `news`(`Title`, `Text`, `Thumbnail`, `ScheduledAt`, `Status`, `CategoryID`, `WrittenByAdminID`, `WrittenDate`) 
              VALUES ('$title', '$text', '$thumbnail', '$scheduleAt', $status, $categoryID, $writtenByAdminID, '$writtenDate')";

        if (mysqli_query($this->connection, $query)) {
            return [
                'status' => 'success',
                'message' => 'Thêm bài viết thành công',
            ];
        } else {
            return [
                'status' => 'error',
                'message' => 'Thêm bài viết thất bại: ' . mysqli_error($this->connection),
            ];
        }
    }
    public function deleteNew($id)
    {
        $query = "DELETE FROM news WHERE id = $id";
        if (mysqli_query($this->connection, $query)) {
            return [
                'status' => 'success',
                'message' => 'Xóa bài viết thành công',
            ];
        } else {
            return [
                'status' => 'error',
                'message' => 'Xóa bài viết thất bại: ' . mysqli_error($this->connection),
            ];
        }
    }
}
