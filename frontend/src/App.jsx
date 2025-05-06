import { BrowserRouter, Routes, Route } from "react-router-dom";
// import Home from '../components/Home'
// import Category from '../components/Category'
import Admin from "./components/app/pages/Admin/index";
import Product from "./components/app/pages/Product/product";
import Main from "./components/app/pages/main";
import React from "react";
// import Home from '../components/Home'
// import Category from '../components/Category'
import "./App.css";
import SelectMethodPage from "./components/app/pages/payment/page";
import SignupForm from "./components/app/pages/header/sign_up";
import SigninForm from "./components/app/pages/header/sign_in";
import { verifyToken } from "./components/app/BackEnd/verifyToken";

// import { GlobalProvider } from './GlobalContext';
import { useState, useEffect } from "react";

function App() {
  const [ID, setID] = useState("");
  console.log(sessionStorage);
  useEffect(() => {
      const storedToken = sessionStorage.getItem("jwt") || localStorage.getItem("jwt");
      const storedID = sessionStorage.getItem("user_id") || localStorage.getItem("user_id");

      if (verifyToken(storedToken)  && storedID) {
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
        <Route index element={<Main ID={ID}/>} />
        <Route path="/admin*" element={<Admin />} />
        <Route path="/main*" element={<Main ID={ID}/>} />
        <Route path="/Product/:page?/:name?" element={<Product ID={ID}/>} />
        <Route path="/Products/:name?" element={<Product ID={ID}/>} />
        <Route path="/Payment/:value?" element={<SelectMethodPage ID={ID}/>} />
        <Route path="/sign_up" element={<SignupForm ID={ID}/>} />
        <Route path="/sign_in" element={<SigninForm ID={ID}/>} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
