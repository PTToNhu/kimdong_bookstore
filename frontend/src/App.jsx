import { BrowserRouter, Routes, Route } from "react-router-dom";
// import Home from '../components/Home'
// import Category from '../components/Category'
import Admin from "./../components/app/pages/Admin/index";
import Product from "./../components/app/pages/Product/product";
import Main from "./../components/app/pages/main";
import React from "react";
// import Home from '../components/Home'
// import Category from '../components/Category'
import "./App.css";
import SelectMethodPage from "./../components/app/pages/payment/page";
import SignupForm from "./../components/app/pages/header/sign_up";
import SigninForm from "./../components/app/pages/header/sign_in";
import { verifyToken } from "./../components/app/BackEnd/verifyToken";

// import { GlobalProvider } from './GlobalContext';
import { useState, useEffect } from "react";

function App() {
  const [ID, setID] = useState("");

  useEffect(() => {
      const storedToken = sessionStorage.getItem("jwt");
      const storedID = sessionStorage.getItem("user_id");

      if (storedToken && storedID) {
          verifyToken(storedToken).then((data) => {
              if (data.success) {
                  setID(storedID);
              } else {
                  console.log("Lỗi:", data.message);
              }
          }).catch(error => {
              console.error("Đã xảy ra lỗi trong quá trình xác thực:", error);
          });
      } else {
          console.log("Người dùng chưa đăng nhập.");
      }
  }, []); 

  return (
    <BrowserRouter>
      <Routes>
        <Route index element={<Main />} />
        <Route path="/admin*" element={<Admin />} />
        <Route path="/main*" element={<Main />} />
        <Route path="/Product/:page?/:name?" element={<Product />} />
        <Route path="/Products/:name?" element={<Product />} />
        <Route path="/Payment/:value?" element={<SelectMethodPage />} />
        <Route path="/sign_up" element={<SignupForm />} />
        <Route path="/sign_in" element={<SigninForm />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
