

import React, { useEffect, useState } from 'react';

import {useNavigate } from 'react-router-dom'
import './contact.css'
import Footer from '../footer/footer'
import OSMMap from "./os.jsx";

const Contact = () => {
    const [locations, setLocations] = useState([]);
    const [selectedBranch, setSelectedBranch] = useState(null);

  const navigate = useNavigate();
  const [ct_name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [title, setTitle] = useState('');
    const [content, setContent] = useState('');
    const [message, setMessage] = useState("");
    const handleSubmit = (e) => {
        e.preventDefault();
    
        if (!ct_name || !email || !title || !content) {
            setMessage("Bạn chưa điền hết các cột!");
            return;
        }
    
        const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (!emailRegex.test(email)) {
            setMessage("Địa chỉ email không hợp lệ!");
            return;
        }
    
        if (ct_name.length > 100 || title.length > 100) {
            setMessage("Tên và tiêu đề phải dưới 100 ký tự!");
            return;
        }
    
        if (content.length < 100 || content.length > 2000) {
            setMessage("Nội dung phải có ít nhất 100 và tối đa 2000 ký tự!");
            return;
        }
    
        const formData = {
            ct_name: ct_name,
            ct_email: email,
            ct_title: title,
            ct_content: content,
        };
    
        fetch('http://localhost/Ass/kimdong_bookstore/api/newcontact', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData),
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                setMessage("Gửi liên hệ thành công!");
                setName('');
                setEmail('');
                setTitle('');
                setContent('');
            } else {
                setMessage("Có lỗi xảy ra, vui lòng thử lại!");
            }
        })
        .catch((error) => {
            console.error('Lỗi khi gửi dữ liệu:', error);
            setMessage("Lỗi kết nối với server!");
        });
    };
    
  useEffect(() => {
    fetch('http://localhost/Ass/kimdong_bookstore/api/location')
      .then(res => res.json())
      .then(data => {
        const locations = data.data.location; 
        setLocations(locations);
  
        const main = locations.find(loc => loc.main_branch === 1); 
        setSelectedBranch(main || locations[0]);
      })
      .catch(err => console.error("Lỗi fetch:", err));
  }, []);
  
  const handleSelectChange = (e) => {
    const branch = locations.find(loc => loc.branch_name === e.target.value);
    setSelectedBranch(branch);
  };

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
          <p className="title25">Chi nhánh chính</p>
          <select onChange={handleSelectChange} value={selectedBranch?.branch_name || ''}>
            {locations.map((loc, index) => (
              <option key={index} value={loc.branch_name}>{loc.branch_name}</option>
            ))}
          </select>

          {selectedBranch && (
            <>
              <p>Địa chỉ: {selectedBranch.branch_address}</p>
              <p>Điện thoại: {selectedBranch.phone}</p>
              <p>Giờ hoạt động: {selectedBranch.time_open} - {selectedBranch.time_close}</p>
              <p>Email: <span className="highlight1">info@nxbkimdong.com.vn</span></p>
              <p>Website: <span className="highlight1">www.nxbkimdong.com.vn</span></p>
            </>
          )}
        </div>
                </div>
                <div className="Location-col2">
                {selectedBranch && (
          <OSMMap address={selectedBranch.branch_address} />
        )}
                </div>
            </div>
            <div className="FormContact">
            <p className="title20">Liên hệ với chúng tôi</p>
            {message && <div className="message">{message}</div>}
            <div className="inputInfo-box">
                <div className="FormContact-col1">
                    <input 
                        type="text" 
                        placeholder="Họ và tên" 
                        value={ct_name} 
                        onChange={(e) => setName(e.target.value)} 
                    />
                    <input 
                        type="text" 
                        placeholder="Email" 
                        value={email} 
                        onChange={(e) => setEmail(e.target.value)} 
                    />
                    <input 
                        type="text" 
                        placeholder="Tiêu đề" 
                        value={title} 
                        onChange={(e) => setTitle(e.target.value)} 
                    />
                </div>
                <div className="FormContact-col2">
                <textarea 
                    placeholder="Nội dung" 
                    value={content} 
                    onChange={(e) => setContent(e.target.value)} 
                    rows="4" 
                    style={{resize: 'vertical'}} 
                />
                </div>
            </div>
            <button type="submit" onClick={handleSubmit}>Gửi liên hệ</button>
        </div>
            <Footer/>
        </div>
    )
}
export default Contact