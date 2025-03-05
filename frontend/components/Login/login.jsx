import React from 'react'
import {useNavigate } from 'react-router-dom'
import './login.css'

const Login = () => {
  const navigate = useNavigate(); 

  const handleLogin = () => {
    navigate('/'); 
  };
  return (
    <div className='pageLogin'>
      <div className="login">
        <p className="title20">Xin chào</p>
        <p><span className="highlight1">Đăng nhập</span> hoặc <span className="highlight1">Tạo tài khoản</span></p>
        <div className="input_box">
          <input type="text" placeholder="Email" />
          <input type="password" placeholder="Mật khẩu" />
        </div>
        <div className="buttonLogin" onClick={handleLogin} ><p className="title25">Đăng nhập</p></div>
        <div className="difLogin">
          <div className="col1">Đăng nhập qua Google</div>
          <div className="col2">Đăng nhập qua Facebook</div>
        </div>
        <div className="img-container">
          <img src="/login/logo_KD.png" alt="Logo Kim Đồng" />
        </div>

      </div>
    </div>

  )
}

export default Login