<?php
require_once __DIR__ . '/../models/LocationModel.php';
require_once __DIR__ . '/../models/ContactModel.php';

class ContactUs extends Controller
{
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
