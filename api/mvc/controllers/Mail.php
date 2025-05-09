<?php
require_once __DIR__ . '/../../../../PHPMailer-master/PHPMailer-master/src/Exception.php';
require_once __DIR__ . '/../../../../PHPMailer-master/PHPMailer-master/src/PHPMailer.php';
require_once __DIR__ . '/../../../../PHPMailer-master/PHPMailer-master/src/SMTP.php';
require_once __DIR__ . '/../models/ContactModel.php';
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

class Mail {
    private $mail;

    public function __construct() {
        $this->mail = new PHPMailer(true);

        // Cấu hình SMTP Gmail
        $this->mail->isSMTP();
        $this->mail->Host = 'smtp.gmail.com';
        $this->mail->SMTPAuth = true;
        $this->mail->Username = 'huyen.tran170704@hcmut.edu.vn';           
        $this->mail->Password = 'fjig wjja tewv fzgm';              
        $this->mail->SMTPSecure = 'tls';
        $this->mail->Port = 587;
        $this->mail->CharSet = 'UTF-8';
    }

    public function send() {
        try {
            $isJson = stripos($_SERVER['CONTENT_TYPE'] ?? '', 'application/json') !== false;
            if ($isJson) {
                $data = json_decode(file_get_contents("php://input"), true);
            } else {
                $data = $_POST;
            }
            $id = $data['id'] ?? '';
            $from = $data['from'] ?? '';
            $to = $data['to'] ?? '';
            $subject = $data['subject'] ?? '';
            $cc = $data['cc'] ?? '';
            $bcc = $data['bcc'] ?? '';
            $content = $data['content'] ?? '';
    
            if (!$from || !$to || !$subject || !$content) {
                echo json_encode(['success' => false, 'message' => 'Thiếu dữ liệu bắt buộc.']);
                exit;
            }
    
            $this->mail->setFrom($from);
            $this->mail->addAddress($to);
            if (!empty($cc)) $this->mail->addCC($cc);
            if (!empty($bcc)) $this->mail->addBCC($bcc);
    
            if (isset($_FILES['attachment']) && file_exists($_FILES['attachment']['tmp_name'])) {
                $this->mail->addAttachment($_FILES['attachment']['tmp_name'], $_FILES['attachment']['name']);
            }
    
            $this->mail->isHTML(true);
            $this->mail->Subject = $subject;
            $this->mail->Body = $content;
    
            $this->mail->send();
            if ($id){
                $contact = new ContactModel ();
                $contact -> isResponse ($id);
            }
            
            echo json_encode(['success' => true, 'message' => 'Email đã được gửi thành công.']);

            exit;
    
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => "Không gửi được email. Lỗi: {$this->mail->ErrorInfo}"]);
            exit;
        }
    }
    
}