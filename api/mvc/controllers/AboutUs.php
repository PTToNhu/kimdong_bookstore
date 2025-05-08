<?php
class AboutUs extends Controller
{
    // Intro part
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



    // Author part
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


    // Social part
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

    // Internaltional part
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

    // Get for Admin
    public function getAdminIntro()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: GET");
        header("Access-Control-Allow-Headers: Content-Type");
        header('Content-Type: application/json');

        $model = $this->model("IntroModel");

        // Lấy phần từ bảng intro_section
        $introMainResult = $model->getIntroMain();
        $introSection = [];

        if ($introMainResult && $row = mysqli_fetch_assoc($introMainResult)) {
            $introSection = [
                "title" => $row["title"],
                "subtitle" => $row["subtitle"],
                "image_url" => $row["image_url"],
                "highlight" => $row["highlight"]
            ];
        }

        // Lấy phần paragraphs từ intro_section_paragraphs
        $paragraphsResult = $model->getIntroParagraphs();
        $introParagraphs = [];

        if ($paragraphsResult && $paragraphsResult instanceof mysqli_result) {
            while ($row = mysqli_fetch_assoc($paragraphsResult)) {
                $introParagraphs[] = [
                    "id" => (int)$row["id"],
                    "content" => $row["content"]
                ];
            }
        }

        echo json_encode([
            "intro_section" => $introSection,
            "intro_paragraphs" => $introParagraphs
        ]);
    }
    public function getAdminSocial()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: GET");
        header("Access-Control-Allow-Headers: Content-Type");
        header('Content-Type: application/json');

        $model = $this->model("SocialModel");

        // Lấy phần từ bảng social_section
        $mainResult = $model->getSocialMain();
        $mainData = mysqli_fetch_assoc($mainResult);

        // Lấy các dòng từ bảng social_section_schools
        $schoolsResult = $model->getSocialSchools();
        $schoolList = [];
        while ($row = mysqli_fetch_assoc($schoolsResult)) {
            $schoolList[] = [
                'id' => (int)$row['id'],
                'year' => (int)$row['year'],
                'location' => $row['location']
            ];
        }

        // Xuất JSON
        echo json_encode([
            'social_section' => $mainData,
            'social_schools' => $schoolList
        ], JSON_UNESCAPED_UNICODE);
    }
    public function getAdminInternational()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: GET");
        header("Access-Control-Allow-Headers: Content-Type");
        header('Content-Type: application/json');

        $model = $this->model("InternationalModel");

        $sectionResult = $model->getInternationalSection();
        $partnersResult = $model->getInternationalPartners();

        $sectionData = mysqli_fetch_assoc($sectionResult);

        $partners = [];
        while ($row = mysqli_fetch_assoc($partnersResult)) {
            $partners[] = [
                "id" => $row["id"],
                "region" => $row["region"],
                "country_name" => $row["country_name"],
                "flag_url" => $row["flag_url"],
                "count" => $row["count"]
            ];
        }

        echo json_encode([
            "international_section" => $sectionData,
            "international_partners" => $partners
        ]);
    }

    public function getAdminAuthor()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: GET");
        header("Access-Control-Allow-Headers: Content-Type");
        header('Content-Type: application/json');

        $model = $this->model("AuthorModel");

        $mainResult = $model->getAuthorMain();
        $paragraphResult = $model->getAuthorParagraphs();
        $activityResult = $model->getAuthorActivities();

        $authorMain = mysqli_fetch_assoc($mainResult);

        $paragraphs = [];
        while ($row = mysqli_fetch_assoc($paragraphResult)) {
            $paragraphs[] = [
                "id" => $row["id"],
                "content" => $row["content"]
            ];
        }

        $activities = [];
        while ($row = mysqli_fetch_assoc($activityResult)) {
            $activities[] = [
                "id" => $row["id"],
                "year_from" => $row["year_from"],
                "year_to" => $row["year_to"],
                "description" => $row["description"]
            ];
        }

        echo json_encode([
            "author_section" => $authorMain,
            "author_paragraphs" => $paragraphs,
            "author_activities" => $activities
        ]);
    }

    // Update for Admin main Section 
    public function updateIntroSection()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: POST, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        if ($data === null) {
            echo json_encode(["success" => false, "message" => "Thiếu dữ liệu đầu vào.", "debug_raw" => $raw, "json_error" => json_last_error_msg()]);
            return;
        }

        $model = $this->model("IntroModel");
        $result = $model->updateIntroSection($data['title'], $data['subtitle'], $data['highlight'], $data['image_url']);

        if ($result) {
            echo json_encode(["success" => true, "message" => "Cập nhật Intro Section thành công."]);
        } else {
            http_response_code(500);
            echo json_encode(["success" => false, "message" => "Lỗi khi cập nhật Intro Section."]);
        }
    }

    public function updateSocialSection()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: POST, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        if ($data === null) {
            echo json_encode(["success" => false, "message" => "Thiếu dữ liệu đầu vào.", "debug_raw" => $raw, "json_error" => json_last_error_msg()]);
            return;
        }

        $model = $this->model("SocialModel");
        $result = $model->updateSocialSection($data['title'], $data['image_url']);

        if ($result) {
            echo json_encode(["success" => true, "message" => "Cập nhật Social Section thành công."]);
        } else {
            http_response_code(500);
            echo json_encode(["success" => false, "message" => "Lỗi khi cập nhật Social Section."]);
        }
    }

    public function updateInternationalSection()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: POST, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        if ($data === null) {
            echo json_encode(["success" => false, "message" => "Thiếu dữ liệu đầu vào.", "debug_raw" => $raw, "json_error" => json_last_error_msg()]);
            return;
        }

        $model = $this->model("InternationalModel");
        $result = $model->updateInternationalSection($data['title']);

        if ($result) {
            echo json_encode(["success" => true, "message" => "Cập nhật International Section thành công."]);
        } else {
            http_response_code(500);
            echo json_encode(["success" => false, "message" => "Lỗi khi cập nhật International Section."]);
        }
    }

    public function updateAuthorSection()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: POST, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        if ($data === null) {
            echo json_encode(["success" => false, "message" => "Thiếu dữ liệu đầu vào.", "debug_raw" => $raw, "json_error" => json_last_error_msg()]);
            return;
        }

        $model = $this->model("AuthorModel");
        $result = $model->updateAuthorSection($data['title'], $data['subtitle']);

        if ($result) {
            echo json_encode(["success" => true, "message" => "Cập nhật Author Section thành công."]);
        } else {
            http_response_code(500);
            echo json_encode(["success" => false, "message" => "Lỗi khi cập nhật Author Section."]);
        }
    }

    // Delete for Admin
    public function deleteIntroParagraph()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: POST, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        if ($data === null) {
            echo json_encode(["success" => false, "message" => "Thiếu dữ liệu đầu vào.", "debug_raw" => $raw, "json_error" => json_last_error_msg()]);
            return;
        }

        $model = $this->model("IntroModel");
        $result = $model->deleteIntroParagraph($data['id']);

        echo json_encode(["success" => $result]);
    }
    public function deleteSocialSchool()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: POST, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        if ($data === null) {
            echo json_encode(["success" => false, "message" => "Thiếu dữ liệu đầu vào.", "debug_raw" => $raw, "json_error" => json_last_error_msg()]);
            return;
        }

        $model = $this->model("SocialModel");
        $result = $model->deleteSocialSchool($data['id']);

        echo json_encode(["success" => $result]);
    }
    public function deleteInternationalPartner()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: POST, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        if ($data === null) {
            echo json_encode(["success" => false, "message" => "Thiếu dữ liệu đầu vào.", "debug_raw" => $raw, "json_error" => json_last_error_msg()]);
            return;
        }

        $model = $this->model("InternationalModel");
        $result = $model->deleteInternationalPartner($data['id']);

        echo json_encode(["success" => $result]);
    }
    public function deleteAuthorParagraph()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: POST, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        if ($data === null) {
            echo json_encode(["success" => false, "message" => "Thiếu dữ liệu đầu vào.", "debug_raw" => $raw, "json_error" => json_last_error_msg()]);
            return;
        }

        $model = $this->model("AuthorModel");
        $result = $model->deleteAuthorParagraph($data['id']);

        echo json_encode(["success" => $result]);
    }
    public function deleteAuthorActivity()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: POST, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        if ($data === null) {
            echo json_encode(["success" => false, "message" => "Thiếu dữ liệu đầu vào.", "debug_raw" => $raw, "json_error" => json_last_error_msg()]);
            return;
        }

        $model = $this->model("AuthorModel");
        $result = $model->deleteAuthorActivity($data['id']);

        echo json_encode(["success" => $result]);
    }

    // Add for Admin
    public function addIntroParagraph()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: POST, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        if ($data === null) {
            echo json_encode([
                "success" => false,
                "message" => "Thiếu dữ liệu đầu vào.",
                "debug_raw" => $raw,
                "json_error" => json_last_error_msg()
            ]);
            return;
        }

        if (!isset($data['content'])) {
            echo json_encode(["success" => false, "message" => "Thiếu nội dung đoạn văn."]);
            return;
        }

        $model = $this->model("IntroModel");
        $result = $model->addIntroParagraph($data['content']);

        echo json_encode(["success" => $result]);
    }

    public function addSocialSchool()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: POST, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        if ($data === null) {
            echo json_encode([
                "success" => false,
                "message" => "Thiếu dữ liệu đầu vào.",
                "debug_raw" => $raw,
                "json_error" => json_last_error_msg()
            ]);
            return;
        }

        if (!isset($data['year'], $data['location'])) {
            echo json_encode(["success" => false, "message" => "Thiếu năm hoặc địa điểm."]);
            return;
        }

        $model = $this->model("SocialModel");
        $result = $model->addSocialSchool($data['year'], $data['location']);

        echo json_encode(["success" => $result]);
    }
    public function addInternationalPartner()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: POST, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        if ($data === null) {
            echo json_encode([
                "success" => false,
                "message" => "Thiếu dữ liệu đầu vào.",
                "debug_raw" => $raw,
                "json_error" => json_last_error_msg()
            ]);
            return;
        }

        if (!isset($data['region'], $data['country_name'], $data['flag_url'], $data['count'])) {
            echo json_encode(["success" => false, "message" => "Thiếu trường dữ liệu đối tác quốc tế."]);
            return;
        }

        $model = $this->model("InternationalModel");
        $result = $model->addInternationalPartner(
            $data['region'],
            $data['country_name'],
            $data['flag_url'],
            $data['count']
        );

        echo json_encode(["success" => $result]);
    }
    public function addAuthorParagraph()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: POST, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        if ($data === null) {
            echo json_encode([
                "success" => false,
                "message" => "Thiếu dữ liệu đầu vào.",
                "debug_raw" => $raw,
                "json_error" => json_last_error_msg()
            ]);
            return;
        }

        if (!isset($data['content'])) {
            echo json_encode(["success" => false, "message" => "Thiếu nội dung đoạn văn tác giả."]);
            return;
        }

        $model = $this->model("AuthorModel");
        $result = $model->addAuthorParagraph($data['content']);

        echo json_encode(["success" => $result]);
    }
    public function addAuthorActivity()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: POST, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        if ($data === null) {
            echo json_encode([
                "success" => false,
                "message" => "Thiếu dữ liệu đầu vào.",
                "debug_raw" => $raw,
                "json_error" => json_last_error_msg()
            ]);
            return;
        }

        if (!isset($data['year_from'], $data['year_to'], $data['description'])) {
            echo json_encode(["success" => false, "message" => "Thiếu thông tin hoạt động tác giả."]);
            return;
        }

        $model = $this->model("AuthorModel");
        $result = $model->addAuthorActivity(
            $data['year_from'],
            $data['year_to'],
            $data['description']
        );

        echo json_encode(["success" => $result]);
    }

    // Update for Admin
    public function updateIntroParagraph()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: POST, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        if ($data === null) {
            echo json_encode([
                "success" => false,
                "message" => "Thiếu dữ liệu đầu vào.",
                "debug_raw" => $raw,
                "json_error" => json_last_error_msg()
            ]);
            return;
        }

        $model = $this->model("IntroModel");
        $result = $model->updateIntroParagraph($data['id'], $data['content']);
        echo json_encode(["success" => $result]);
    }
    public function updateSocialSchool()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: POST, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        if ($data === null) {
            echo json_encode([
                "success" => false,
                "message" => "Thiếu dữ liệu đầu vào.",
                "debug_raw" => $raw,
                "json_error" => json_last_error_msg()
            ]);
            return;
        }

        $model = $this->model("SocialModel");
        $result = $model->updateSocialSchool($data['id'], $data['year'], $data['location']);
        echo json_encode(["success" => $result]);
    }
    public function updateInternationalPartner()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: POST, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        if ($data === null) {
            echo json_encode([
                "success" => false,
                "message" => "Thiếu dữ liệu đầu vào.",
                "debug_raw" => $raw,
                "json_error" => json_last_error_msg()
            ]);
            return;
        }

        $model = $this->model("InternationalModel");
        $result = $model->updateInternationalPartner($data['id'], $data['region'], $data['country_name'], $data['flag_url'], $data['count']);
        echo json_encode(["success" => $result]);
    }
    public function updateAuthorParagraph()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: POST, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        if ($data === null) {
            echo json_encode([
                "success" => false,
                "message" => "Thiếu dữ liệu đầu vào.",
                "debug_raw" => $raw,
                "json_error" => json_last_error_msg()
            ]);
            return;
        }

        $model = $this->model("AuthorModel");
        $result = $model->updateAuthorParagraph($data['id'], $data['content']);
        echo json_encode(["success" => $result]);
    }
    public function updateAuthorActivity()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Methods: POST, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        header('Content-Type: application/json');

        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        if ($data === null) {
            echo json_encode([
                "success" => false,
                "message" => "Thiếu dữ liệu đầu vào.",
                "debug_raw" => $raw,
                "json_error" => json_last_error_msg()
            ]);
            return;
        }

        $model = $this->model("AuthorModel");
        $result = $model->updateAuthorActivity($data['id'], $data['year_from'], $data['year_to'], $data['description']);
        echo json_encode(["success" => $result]);
    }
}
