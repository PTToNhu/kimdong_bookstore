<?php
require_once __DIR__ . '/../core/Database.php';

class ContactModel extends Database {
    public $conn;

    public function __construct() {
        parent::__construct();  
        $this->conn = $this->getConnection();  
    }

    public function changeStatus($id) {
        try {
            $query = $this->conn->prepare("SELECT ct_is_read FROM tiem_sach.contact WHERE ct_id = ?");
            $query->bind_param("i", $id);
            $query->execute();
            $result = $query->get_result();
            $current = $result->fetch_assoc();

            if ($current) {
                $newStatus = $current['ct_is_read'] ? 0 : 1;
                $update = $this->conn->prepare("UPDATE tiem_sach.contact SET ct_is_read = ? WHERE ct_id = ?");
                $update->bind_param("ii", $newStatus, $id);
                $update->execute();
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
        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => 'Lỗi: ' . $e->getMessage()
            ];
        }
    }

    public function isResponse($id) {
        try {
            $query = $this->conn->prepare("SELECT * FROM tiem_sach.contact WHERE ct_id = ?");
            $query->bind_param("i", $id);
            $query->execute();
            $result = $query->get_result();
            $current = $result->fetch_assoc();

            if ($current) {
                $newStatus = 1;
                $update = $this->conn->prepare("UPDATE tiem_sach.contact SET ct_is_responsed = ? WHERE ct_id = ?");
                $update->bind_param("ii", $newStatus, $id);
                $update->execute();
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
        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => 'Lỗi: ' . $e->getMessage()
            ];
        }
    }

    public function deleteById($id) {
        try {
            $query = $this->conn->prepare("SELECT * FROM tiem_sach.contact WHERE ct_id = ?");
            $query->bind_param("i", $id);
            $query->execute();
            $result = $query->get_result();
            $current = $result->fetch_assoc();

            if ($current) {
                $delete = $this->conn->prepare("DELETE FROM tiem_sach.contact WHERE ct_id = ?");
                $delete->bind_param("i", $id);
                $delete->execute();
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
        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => 'Lỗi: ' . $e->getMessage()
            ];
        }
    }

    public function getContacts($num, $page) {
        try {
            $countQuery = $this->conn->prepare("SELECT COUNT(*) AS total FROM tiem_sach.contact");
            $countQuery->execute();
            $result = $countQuery->get_result();
            $totalRecords = $result->fetch_assoc()['total'];

            $totalPages = ceil($totalRecords / $num);
            $offset = ($page - 1) * $num;

            $query = $this->conn->prepare("SELECT * FROM tiem_sach.contact ORDER BY ct_id DESC LIMIT ? OFFSET ?");
            $query->bind_param("ii", $num, $offset);
            $query->execute();
            $result = $query->get_result();
            $contacts = [];

            while ($row = $result->fetch_assoc()) {
                $contacts[] = $row;
            }

            if (count($contacts) > 0) {
                return [
                    'contacts' => $contacts,
                    'total_pages' => $totalPages
                ];
            } else {
                return [];
            }
        } catch (Exception $e) {
            return "Lỗi: " . $e->getMessage();
        }
    }

    public function getAll() {
        try {
            $query = $this->conn->prepare("SELECT * FROM tiem_sach.contact");
            $query->execute();
            $result = $query->get_result();
            $contacts = [];

            while ($row = $result->fetch_assoc()) {
                $contacts[] = $row;
            }

            return $contacts;
        } catch (Exception $e) {
            return "Lỗi: " . $e->getMessage();
        }
    }

    public function InsertNewContact($name, $email, $title, $content) {
        try {
            $query = $this->conn->prepare("
                INSERT INTO tiem_sach.contact (ct_name, ct_email, ct_title, ct_content, ct_time, ct_is_read, ct_is_responsed)
                VALUES (?, ?, ?, ?, NOW(), ?, ?)
            ");
            $zero = 0;
            $query->bind_param("ssssii", $name, $email, $title, $content, $zero, $zero);
            $result = $query->execute();

            if ($result) {
                return "success";
            } else {
                return "Có lỗi khi ghi dữ liệu vào cơ sở dữ liệu!";
            }
        } catch (Exception $e) {
            return "Lỗi: " . $e->getMessage();
        }
    }
}
?>
