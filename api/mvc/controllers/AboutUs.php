<?php
class AboutUs extends Controller
{
    public function getIntro()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $model = $this->model("IntroModel");

        // Lấy phần chính (title, subtitle,...)
        $mainResult = $model->getIntroMain(); // SELECT * FROM intro_section
        $paragraphsResult = $model->getIntroParagraphs(); // SELECT content FROM intro_section_paragraphs WHERE intro_id = 1

        $intro = [
            "title" => "",
            "subtitle" => "",
            "image_url" => "",
            "highlight" => "",
            "content" => []
        ];

        // Gán dữ liệu chính
        if ($mainResult && $row = mysqli_fetch_assoc($mainResult)) {
            $intro["title"] = $row["title"];
            $intro["subtitle"] = $row["subtitle"];
            $intro["image_url"] = $row["image_url"];
            $intro["highlight"] = $row["highlight"];
        }

        // Gán content
        if ($paragraphsResult && $paragraphsResult instanceof mysqli_result) {
            while ($row = mysqli_fetch_assoc($paragraphsResult)) {
                $intro["content"][] = $row["content"];
            }
        }

        echo json_encode($intro);
    }

    public function getAuthor()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $model = $this->model("AuthorModel");

        // Lấy title, subtitle, content
        $infoResult = $model->getAuthorInfo();

        $authorSection = [
            "title" => "",
            "subtitle" => "",
            "content" => [],
            "activities" => []
        ];

        if ($infoResult && $infoResult instanceof mysqli_result) {
            while ($row = mysqli_fetch_assoc($infoResult)) {
                if (empty($authorSection["title"])) {
                    $authorSection["title"] = $row["title"];
                    $authorSection["subtitle"] = $row["subtitle"];
                }
                $authorSection["content"][] = $row["content"];
            }
        }

        // Lấy hoạt động tiêu biểu
        $activitiesResult = $model->getAuthorActivities();

        if ($activitiesResult && $activitiesResult instanceof mysqli_result) {
            while ($row = mysqli_fetch_assoc($activitiesResult)) {
                $authorSection["activities"][] = [
                    "year_from" => (int)$row["year_from"],
                    "year_to" => (int)$row["year_to"],
                    "description" => $row["description"]
                ];
            }
        }

        echo json_encode($authorSection);
    }


    public function getSocial()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $model = $this->model("SocialModel");
        $result = $model->getAllSocial();

        $socialSection = [
            "title" => "",
            "image_url" => "",
            "schools" => []
        ];

        if ($result && $result instanceof mysqli_result) {
            while ($row = mysqli_fetch_assoc($result)) {
                if (empty($socialSection["title"])) {
                    $socialSection["title"] = $row["title"];
                    $socialSection["image_url"] = $row["image_url"];
                }

                $socialSection["schools"][] = [
                    "year" => $row["year"],
                    "location" => $row["location"]
                ];
            }
        }

        echo json_encode($socialSection);
    }
    public function getInternational()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $model = $this->model("InternationalModel");
        $result = $model->getAllInternational();

        $internationalSection = [
            "title" => "",
            "partners" => []
        ];

        if ($result && $result instanceof mysqli_result) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Chỉ set title một lần
                if ($internationalSection["title"] === "") {
                    $internationalSection["title"] = $row["title"];
                }

                $internationalSection["partners"][] = [
                    "region" => $row["region"],
                    "country_name" => $row["country_name"],
                    "flag_url" => $row["flag_url"],
                    "count" => (int) $row["count"]
                ];
            }
        }

        echo json_encode($internationalSection);
    }
}
