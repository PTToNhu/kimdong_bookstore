<?php
class Home extends Controller {
    function Sayhi() {
        $conn = (new Database())->connection;
        $query = "SELECT * FROM questions";  // <-- có thể sai tên bảng
        $result = mysqli_query($conn, $query);

        if (!$result) {
            echo "Lỗi SQL: " . mysqli_error($conn); // In lỗi rõ ràng để debug
            return;
        }

        while ($row = $result->fetch_assoc()) {
            print_r($row);
        }
    }
}