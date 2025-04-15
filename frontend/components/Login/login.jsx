import {React, useState} from 'react'
import {useNavigate } from 'react-router-dom'
import './login.css'
import Footer from '../footer/footer'
const Login = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const navigate = useNavigate(); 

  const handleLogin = async (e) => {
    e.preventDefault();
    try {
      const response = await fetch("http://localhost/Ass/kimdong_bookstore/api/login", {
        method: "POST",
        body: JSON.stringify({ email, password }),
      });
      
      const data = await response.json();
      
      if (data.success ==  true) {
          console.log(data.success);
         console.log("Response Ok");
        localStorage.setItem("token", data.token); 
        alert("Đăng nhập thành công!");
         window.location.href = "/"; 
      } else {
        setError(data.message);
      }
    } catch (error) {
      setError("Có lỗi xảy ra, vui lòng thử lại!");
    }
  };
  return (
    <div className='pageLogin'>
      <div className="login">
        <p className="title20">Xin chào</p>
        <p><span className="highlight1">Đăng nhập</span> hoặc <span className="highlight1">Tạo tài khoản</span></p>
        <div className="input_box">
          <input type="text" placeholder="Email"  value={email} onChange={(e) => setEmail(e.target.value)} required />
          <input type="password" placeholder="Mật khẩu" value={password} onChange={(e) => setPassword(e.target.value)} required />
        </div>
        <div className="buttonLogin" onClick={handleLogin} ><p className="title25">Đăng nhập</p></div>
        {error && <p>{error}</p>}
        <div className="difLogin">
          <div className="col1">Đăng nhập qua Google</div>
          <div className="col2">Đăng nhập qua Facebook</div>
        </div>
        <div className="img-container">
          <img src="/login/logo_KD.png" alt="Logo Kim Đồng" />
        </div>

      </div>
      <Footer/>
    </div>

  )
}

export default Login