import React from 'react';
import './Footer.css'; // Gợi ý tách riêng CSS ra file

const Footer = () => {
    return (
        <div className="footer-container">
            <div className="footer-section">
                <p>DỊCH VỤ</p>
                <span>Điều khoản sử dụng</span>
                <span>Chính sách bảo mật</span>
                <span>Liên hệ</span>
                <span>Hệ thống nhà sách</span>
                <span>Tra cứu đơn hàng</span>
            </div>
            <div className="footer-section">
                <p>HỖ TRỢ</p>
                <span>Hướng dẫn đặt hàng</span>
                <span>Chính sách đổi trả</span>
                <span>Phương thức vận chuyển</span>
                <span>Phương thức thanh toán</span>
                <span>Chính sách mua hàng sỉ</span>
                <span>Chính sách mua cho</span>
                <span>Thư viện - trường học</span>
            </div>
            <div className="footer-section">
                <p>NHÀ XUẤT BẢN KIM ĐỒNG</p>
                <span>Giám đốc: Bùi Tuấn Nghĩa</span>
                <span>Địa chỉ: Số 55 Quang Trung, Nguyễn Du, Hai Bà Trưng, Hà Nội</span>
                <span>Số điện thoại: 1900 1111</span>
                <span>Email: abc@gmail.com</span>
            </div>
            <div className="footer-section">
                <p>GIẤY PHÉP THÀNH LẬP NHÀ XUẤT BẢN</p>
                <span>Giấy phép số: 517/GP-BTTTT ngày 6/10/2015 của Bộ Thông tin và Truyền thông</span>
            </div>
            <div className="footer-section">
                <p>ĐĂNG KÝ NHẬN TIN</p>
                <span>
                    Hãy nhập địa chỉ email của bạn vào ô dưới đây để có thể nhận được tất cả các tin tức mới nhất của NXB Kim Đồng về các sản phẩm mới, các chương trình khuyến mãi mới. NXB Kim Đồng xin đảm bảo sẽ không gửi mail rác, mail spam tới bạn.
                </span>
                <div className="email-subscribe">
                    <input placeholder='Nhập email của bạn' />
                    <button>Đăng ký</button>
                </div>
            </div>
        </div>
    )
}

export default Footer;
