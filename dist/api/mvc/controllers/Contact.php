<?php
require_once __DIR__ . '/../models/ContactModel.php';
require_once __DIR__ . '/../models/GeneralInfoModel.php';
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
    public function getContacts(){
        $data = json_decode(file_get_contents("php://input"), true);
    
        if (isset($data['page']) && isset ($data['num'])) {
                $ContactModel = new ContactModel();
            
                $result = $ContactModel->getContacts($data['num'], $data['page']);
            
                if (count($result) < 0) {
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
    
    
    
    
    
    
}
