<?php
require_once __DIR__ . '/../models/ContactModel.php';
require_once __DIR__ . '/../models/GeneralInfoModel.php';
require_once __DIR__ . '/../models/OverviewModel.php';
require_once __DIR__ . '/../models/LocationModel.php';


class Contact extends Controller
{

    public function deleteContact(){
        $data = json_decode(file_get_contents("php://input"), true);
    
        if (isset($data['id'])) {
            $id = $data['id'];
            $ContactModel = new ContactModel();
            $result = $ContactModel->deleteById($id);
            header('Content-Type: application/json');
            echo json_encode([
                "success" => $result['success'],
                "message" => $result['message']
            ]);
        }
        else {
            header('Content-Type: application/json');
            echo json_encode([
                "success" => false,
                "message" => "Không nhận được id!"
            ]);
        }
        
    }
    public function getGeneralInfo(){
        // echo json_encode([
        //         "success" => true,
                
        //     ]);
        // return;
        $ContactModel = new GeneralInfoModel();
                            
    
        $result = $ContactModel->getGeneralInfo();
    
        if (count($result) > 0) {
            header('Content-Type: application/json');
            echo json_encode([
                "success" => true,
                "data" => $result
            ]);
        } else {
            header('Content-Type: application/json');
            echo json_encode([
                "success" => false,
                "message" => "Không tìm thấy dữ liệu."
            ]);
        }
    }
    public function getOverview() {
        $OverviewModel = new OverviewModel();
    
        $result = $OverviewModel->get();
    
        header('Content-Type: application/json');
        
        if (!empty($result)) {
            echo json_encode([
                "success" => true,
                "data" => $result
            ]);
        } else {
            echo json_encode([
                "success" => false,
                "message" => "Không tìm thấy dữ liệu."
            ]);
        }
    }
    public function updateOverview() {
        // Nhận dữ liệu JSON từ frontend
        $data = json_decode(file_get_contents("php://input"), true);
    
        if (!$data) {
            echo json_encode([
                "success" => false,
                "message" => "Không có dữ liệu đầu vào."
            ]);
            return;
        }
    
        // Trích xuất dữ liệu từ mảng $data
        $title = $data['title'] ?? '';
        $header = $data['header'] ?? '';
        $content = $data['content'] ?? '';
        $img = $data['img'] ?? '';
    
        // Gọi model
        $model = new OverviewModel();
        $success = $model->Update($title, $header, $content, $img);
    
        if ($success) {
            echo json_encode([
                "success" => true,
                "message" => "Cập nhật thành công!"
            ]);
        } else {
            echo json_encode([
                "success" => false,
                "message" => "Cập nhật thất bại."
            ]);
        }
    }
    
    
    public function updateInfo() {
        // Nhận dữ liệu JSON gửi lên từ frontend
        $data = json_decode(file_get_contents("php://input"), true);
    
        if (!$data) {
            echo json_encode([
                "success" => false,
                "message" => "Không có dữ liệu đầu vào."
            ]);
            return;
        }
    
        // Trích xuất dữ liệu từ mảng $data
        $main_address = $data['main_address'] ?? '';
        $email = $data['email'] ?? '';
        $company_name = $data['company_name'] ?? '';
        $company_inter_name = $data['company_inter_name'] ?? '';
        $agency = $data['agency'] ?? '';
        $established_date = $data['established_date'] ?? '';
        $phone = $data['phone'] ?? '';
        $director = $data['director'] ?? '';
        $license = $data['license'] ?? '';
        $pass = $data['pass'] ?? '';
        $key = $data['key'] ?? '';
    
        // Gọi model
        $model = new GeneralInfoModel();
        $success = $model->UpdateInfo(
            $main_address,
            $email,
            $company_name,
            $company_inter_name,
            $agency,
            $established_date,
            $phone,
            $director,
            $license,
            $pass,
            $key
        );
    
        if ($success) {
            echo json_encode([
                "success" => true,
                "message" => "Cập nhật thành công!"
            ]);
        } else {
            echo json_encode([
                "success" => false,
                "message" => "Cập nhật thất bại."
            ]);
        }
    }
    
    public function getContacts(){
        $data = json_decode(file_get_contents("php://input"), true);
    
        if (isset($data['page']) && isset ($data['num'])) {
                $ContactModel = new ContactModel();
            
                $result = $ContactModel->getContacts($data['num'], $data['page']);
            
                if (count($result) <=0) {
                    header('Content-Type: application/json');
                    echo json_encode([
                        "success" => false,
                        "message" => $result
                    ]);
                } else {
                    header('Content-Type: application/json');
                    echo json_encode([
                        "success" => true,
                        "data" => $result['contacts'],
                        "total_page" => $result['total_pages']
                    ]);
                }
        }
        else {
            header('Content-Type: application/json');
            echo json_encode([
                "success" => false,
                "message" => "Không nhận được page và num!"
            ]);
        }
    }
    public function getAll(){
        $ContactModel = new ContactModel();
    
        $result = $ContactModel->getAll();
    
        if (is_string($result)) {
            header('Content-Type: application/json');
            echo json_encode([
                "success" => false,
                "message" => $result
            ]);
        } else {
            header('Content-Type: application/json');
            echo json_encode([
                "success" => true,
                "data" => $result
            ]);
        }
    }
    
    public function changeStatus($id = null){
        $data = json_decode(file_get_contents("php://input"), true);
    
        if (isset($data['id'])) {
            $id = $data['id']; 
    
            $ContactModel = new ContactModel();
            $res = $ContactModel->changeStatus($id);
    
            header('Content-Type: application/json');
            echo json_encode([
                "success" => $res['success'],
                "message" => $res['message']
            ]);
        } else {
            header('Content-Type: application/json');
            echo json_encode([
                "success" => false,
                "message" => "Không nhận được id!"
            ]);
        }
    }
    public function addNewContact(){
        $data = json_decode(file_get_contents("php://input"), true);
    
        if (isset($data['ct_name'], $data['ct_email'], $data['ct_title'], $data['ct_content'])) {
            $ContactModel = new ContactModel();
    
            $result = $ContactModel->InsertNewContact(
                $data['ct_name'],
                $data['ct_email'],
                $data['ct_title'],
                $data['ct_content']
            );
    
            if ($result === "success") {
                echo json_encode(['success' => true, 'message' => 'Liên hệ đã được gửi thành công!']);
            } else {
                echo json_encode(['success' => false, 'message' => $result]);
            }
        } else {
            echo json_encode(['success' => false, 'message' => 'Dữ liệu không đầy đủ.']);
        }
    }
    
    
    public function getLocations() {
        $LocationModel = new LocationModel();
        $locations = $LocationModel->GetLocations(); 
    
        if (count($locations) > 0) {
            echo json_encode([
                "success" => true,
                "data" => [
                    "location" => $locations
                ],
                "message" => "Location retrieved successfully.",
                "error" => null
            ]);
        } else {
            http_response_code(404);
            echo json_encode([
                "success" => false,
                "data" => null,
                "message" => "No address found.",
                "error" => [
                    "code" => 404,
                    "details" => "The system couldn't find any address matching your request."
                ]
            ]);
        }
        
    }
    
    
    
    
    
    
}
