import React from 'react'
import {useNavigate } from 'react-router-dom'
import './contact.css'
const Contact = () => {
    return(
        <div className="pageContact">
            <div className="Location-banner">
                <p className="title0">LIÊN HỆ NHÀ XUẤT BẢN KIM ĐỒNG</p>
                
                <p className="title20"><a href='/Home' >Trang chủ</a> / <span>Liên hệ</span></p>
            </div>
            <div className="Location">
                <div className="Location-col1">
                    <div className="genInfo">
                        <p className="title20">Thông tin chung</p>
                        <p>Tên giao dịch: Nhà xuất bản Kim Đồng</p>
                        <p>Tên giao dịch quốc tế: Kim Dong Publishing House</p>
                        <p>Ngày thành lập: 17 tháng 6 năm 1957</p>
                        <p>Cơ quan chủ quản: Trung ương Đoàn TNCS Hồ Chí Minh</p>
                    </div>
                    <div className="address">
                        <p className="title25">Trụ sở chính</p>
                        <p>Địa chỉ: 55 Quang Trung, Hà Nội, Việt Nam</p>
                        <p>Điện thoại: (024) 39434730 – (024)3 9428653</p>
                        <p>Fax: (024) 38229085</p>
                        <p>Email: <span className="highlight1">info@nxbkimdong.com.vn</span></p>
                        <p>Website: <span className="highlight1">www.nxbkimdong.com.vn</span></p>
                    </div>
                </div>
                <div className="Location-col2">

                </div>
            </div>
            <div className="FormContact">
                <p className="title20">Liên hệ với chúng tôi</p>

                <div className="inputInfo-box">
                    <div className="FormContact-col1">
                        <input type="text" placeholder="Họ và tên" />
                        <input type="text" placeholder="Email" />
                    </div>
                    <div className="FormContact-col2">
                        <input type="text" placeholder="Nội dung" />
                    </div>
                </div>
                <button type="submit">Gửi liên hệ</button>
            </div>

        </div>
    )
}
export default Contact