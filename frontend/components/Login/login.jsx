import { React, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import './login.css'
import Footer from '../footer/footer'
const Login = () => {
  const [email, setEmail] = useState("");
  const [userName, setUserName] = useState("");
  const [prepassword, setprePassword] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [showLogin, setShowLogin] = useState(true);

  const navigate = useNavigate();
  const handleRegister = async (e) => {
    e.preventDefault();
  
    // Loại bỏ khoảng trắng đầu/cuối
    const trimmedEmail = email.trim();
    const trimmedUserName = userName.trim();
    const trimmedPassword = password.trim();
    const trimmedPrePassword = prepassword.trim();
  
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  
    if (!emailRegex.test(trimmedEmail)) {
      setError("Email không hợp lệ!");
      return;
    }
  
    if (trimmedUserName.length < 8) {
      setError("Tên người dùng phải có tối thiểu 8 ký tự!");
      return;
    }
  
    if (trimmedPassword.length < 8) {
      setError("Mật khẩu phải có tối thiểu 8 ký tự!");
      return;
    }
  
    if (trimmedPassword !== trimmedPrePassword) {
      setError("Mật khẩu chưa khớp!");
      return;
    }
  
    try {
      const response = await fetch("http://localhost/Ass/kimdong_bookstore/api/register", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ 
          email: trimmedEmail, 
          userName: trimmedUserName, 
          password: trimmedPassword
        }),
      });
  
      const data = await response.json();
  
      if (data.success === true) {
        localStorage.setItem("token", data.token);
        alert("Tạo tài khoản thành công!");
        window.location.href = "/";
      } else {
        setError(data.message || "Đăng ký không thành công.");
      }
    } catch (error) {
      setError("Có lỗi xảy ra, vui lòng thử lại!");
      console.error("Lỗi khi đăng ký:", error);
    }
  };
  
  const handleLogin = async (e) => {
    e.preventDefault();
    try {
      const response = await fetch("http://localhost/Ass/kimdong_bookstore/api/login", {
        method: "POST",
        body: JSON.stringify({ email, password }),
      });

      const data = await response.json();

      if (data.success == true) {
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
    <div className='pageBody'>
      <div className='pageLogin'>
        {
          showLogin && (
            <div className="login">
          <p className="title20">Xin chào</p>
          <p>
  <span className="highlight1">Đăng nhập</span> hoặc{" "}
  <span className="highlight1" onClick={() => setShowLogin(false)} style={{ cursor: "pointer" }}>
    Tạo tài khoản
  </span>
</p>          <div className="input_box">
            <input type="text" placeholder="Email" value={email} onChange={(e) => setEmail(e.target.value)} required />
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
          )
        }
        {
          !showLogin && (
            <div className="register">
          <p className="title20">Xin chào</p>
          <p>
  <span className="highlight1" onClick={() => setShowLogin(true)} style={{ cursor: "pointer" }}>Đăng nhập</span> hoặc{" "}
  <span className="highlight1" >
    Tạo tài khoản
  </span>
</p>          <div className="input_box">
            <input type="text" placeholder="Email" value={email} onChange={(e) => setEmail(e.target.value)} required />
            <input type="text" placeholder="Tên đăng nhập" value={userName} onChange={(e) => setUserName(e.target.value)} required />
            <input type="password" placeholder="Mật Khẩu" value={prepassword} onChange={(e) => setprePassword(e.target.value)} required />
            <input type="password" placeholder="Mật khẩu" value={password} onChange={(e) => setPassword(e.target.value)} required />
          </div>
          <div className="buttonLogin" onClick={handleRegister} ><p className="title25">Đăng ký</p></div>
          {error && <p>{error}</p>}
          <div className="difLogin">
            <div className="col1">Đăng nhập qua Google</div>
            <div className="col2">Đăng nhập qua Facebook</div>
          </div>
          <div className="img-container">
            <img src="/login/logo_KD.png" alt="Logo Kim Đồng" />
          </div>

        </div>
          )
        }
        

        

      </div>
      <Footer />
    </div>


  )
}

export default Login