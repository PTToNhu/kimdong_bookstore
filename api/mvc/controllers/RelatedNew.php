<?php
class RelatedNew extends Controller
{
    function getRelatedNewsByNewID()
    {
        $newID = $_GET['newid'] ?? 1;
        $news = $this->model("RelatedNewModel")->getRelatedNewsByNewID($newID);
        $categories = [];
        while ($row = $news->fetch_assoc()) {
            $categories[] = $row;
        }
        echo json_encode($categories);
    }
}
