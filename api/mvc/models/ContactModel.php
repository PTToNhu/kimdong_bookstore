<?php
require_once __DIR__ . '/../core/Database.php';
class ContactModel extends Database {
    // private $conn;

    public function __construct() {
        parent::__construct();  
        $this->conn = $this->getConnection();  
    }
    public function changeStatus($id){
        try {
            $query = $this->conn->prepare("SELECT ct_is_read FROM tiem_sach.contact WHERE ct_id = ?");
            $query->execute([$id]);
            $current = $query->fetch(PDO::FETCH_ASSOC);
    
            if ($current) {
                $newStatus = $current['ct_is_read'] ? 0 : 1;
                $update = $this->conn->prepare("UPDATE tiem_sach.contact SET ct_is_read = ? WHERE ct_id = ?");
                $update->execute([$newStatus, $id]);
                return [
                    'success' => true,
                    'message' => 'Đã cập nhật trạng thái ct_is_read.',
                    'new_status' => $newStatus
                ];
            } else {
                return [
                    'success' => false,
                    'message' => 'Không tìm thấy liên hệ với ID đã cho.'
                ];
            }
        } catch (PDOException $e) {
            return [
                'success' => false,
                'message' => 'Lỗi: ' . $e->getMessage()
            ];
        }
    }
    public function isResponse($id){
        try {
            $query = $this->conn->prepare("SELECT * FROM tiem_sach.contact WHERE ct_id = ?");
            $query->execute([$id]);
            $current = $query->fetch(PDO::FETCH_ASSOC);
    
            if ($current) {
                $newStatus = 1;
                $update = $this->conn->prepare("UPDATE tiem_sach.contact SET ct_is_responsed = ? WHERE ct_id = ?");
                $update->execute([$newStatus, $id]);
                return [
                    'success' => true,
                    'message' => 'Đã cập nhật trạng thái ct_is_responsed.',
                    'new_status' => $newStatus
                ];
            } else {
                return [
                    'success' => false,
                    'message' => 'Không tìm thấy liên hệ với ID đã cho.'
                ];
            }
        } catch (PDOException $e) {
            return [
                'success' => false,
                'message' => 'Lỗi: ' . $e->getMessage()
            ];
        }
    }
    public function deleteById($id){
        try {
            $query = $this->conn->prepare("SELECT * FROM tiem_sach.contact WHERE ct_id = ?");
            $query->execute([$id]);
            $current = $query->fetch(PDO::FETCH_ASSOC);
    
            if ($current) {
                $delete = $this->conn->prepare("DELETE FROM tiem_sach.contact WHERE ct_id = ?");
                $delete->execute([$id]);
                return [
                    'success' => true,
                    'message' => 'Xóa liên hệ thành công.'
                ];
            } else {
                return [
                    'success' => false,
                    'message' => 'Không tìm thấy liên hệ với ID đã cho.'
                ];
            }
        } catch (PDOException $e) {
            return [
                'success' => false,
                'message' => 'Lỗi: ' . $e->getMessage()
            ];
        }
    }
    
    public function getContacts($num, $page) {
        try {
            // Tính tổng số bản ghi
            $countQuery = $this->conn->prepare("SELECT COUNT(*) AS total FROM tiem_sach.contact");
            $countQuery->execute();
            $totalRecords = $countQuery->fetch(PDO::FETCH_ASSOC)['total'];
    
            // Tính tổng số trang
            $totalPages = ceil($totalRecords / $num);
    
            // Tính offset
            $offset = ($page - 1) * $num;
    
            // Lấy dữ liệu theo trang, sắp xếp giảm dần
            $query = $this->conn->prepare("SELECT * FROM tiem_sach.contact ORDER BY ct_id DESC LIMIT :limit OFFSET :offset");
            $query->bindValue(':limit', (int)$num, PDO::PARAM_INT);
            $query->bindValue(':offset', (int)$offset, PDO::PARAM_INT);
            $query->execute();
    
            $contacts = $query->fetchAll(PDO::FETCH_ASSOC);
            if ($query->rowCount() > 0) {
                return [
                    'contacts' => $contacts,
                    'total_pages' => $totalPages
                ];
            } else {
                return []; 
            }            
        } catch (PDOException $e) {
            return "Lỗi: " . $e->getMessage();
        }
    }
    
    public function getAll() {
        try {
            $query = $this->conn->prepare("SELECT * FROM tiem_sach.contact");
            $query->execute(); // chỉ gọi execute, không gán lại
    
            $contacts = $query->fetchAll(PDO::FETCH_ASSOC);
    
            if ($query->rowCount() > 0) {
                return $contacts;
            } else {
                return []; 
            }
        } catch (PDOException $e) {
            return "Lỗi: " . $e->getMessage();
        }
    }
    
    public function InsertNewContact($name, $email, $title, $content) {
        try {
            $query = $this->conn->prepare("
                INSERT INTO tiem_sach.contact (ct_name, ct_email, ct_title, ct_content, ct_time, ct_is_read, ct_is_responsed)
                VALUES (?, ?, ?, ?, NOW(), ?, ?)
            ");
    
            $result = $query->execute([$name, $email, $title, $content, 0, 0]);
    
            if ($result) {
                return "success";
            } else {
                return "Có lỗi khi ghi dữ liệu vào cơ sở dữ liệu!";
            }
    
        } catch (PDOException $e) {
            return "Lỗi: " . $e->getMessage();
        }
    }
    
    
}
?>