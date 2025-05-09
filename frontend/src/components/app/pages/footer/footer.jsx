import React, { useEffect, useState } from 'react';
import './Footer.css';

const Footer = () => {
    const [info, setInfo] = useState(null);

    useEffect(() => {
        fetch('http://localhost/Ass2/kimdong_bookstore/api/contact/getGeneralInfo')
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    setInfo(data.data);
                } else {
                    console.error('Không thể lấy thông tin công ty');
                }
            })
            .catch(error => {
                console.error('Lỗi khi gọi API:', error);
            });
    }, []);

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
                {info ? (
                    <>
                        <span>Giám đốc: {info.director}</span>
                        <span>Địa chỉ: {info.main_address}</span>
                        <span>Số điện thoại: {info.phone}</span>
                        <span>Email: {info.email}</span>
                    </>
                ) : (
                    <span>Đang tải thông tin...</span>
                )}
            </div>

            <div className="footer-section">
                <p>GIẤY PHÉP THÀNH LẬP NHÀ XUẤT BẢN</p>
                {info ? (
                    <span>Giấy phép số: {info.license}</span>
                ) : (
                    <span>Đang tải thông tin...</span>
                )}
            </div>

            <div className="footer-section">
                <p>ĐĂNG KÝ NHẬN TIN</p>
                <span>
                    Hãy nhập địa chỉ email của bạn vào ô dưới đây để nhận những tin tức mới nhất về sản phẩm và chương trình khuyến mãi của {info ? info.company_name : 'NXB Kim Đồng'}.
                </span>
                <div className="email-subscribe">
                    <input placeholder='Nhập email của bạn' />
                    <button>Đăng ký</button>
                </div>
            </div>
        </div>
    );
};

export default Footer;
