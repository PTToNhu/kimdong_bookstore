<?php
class Category extends Controller
{
    function GetCategory()
    {
        $news = $this->model("CategoryModel")->GetCategory();
        $categories = [];
        while ($row = $news->fetch_assoc()) {
            $categories[] = $row;
        }
        echo json_encode($categories);
    }
}
