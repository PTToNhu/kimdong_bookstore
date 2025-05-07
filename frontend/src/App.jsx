import { BrowserRouter, Routes, Route } from "react-router-dom";
import Admin from "./components/app/pages/Admin/index";
import Product from "./components/app/pages/Product/product";
import Main from "./components/app/pages/main";
import React from "react";
import Master_Classe from "./components/app/pages/Master_Classe/Master_Classe.jsx";
import FAQ from "./components/app/pages/FAQ/FAQ.jsx";
import Question from "./components/app/pages/Question/Question.jsx";
import News from "./components/app/pages/News/News.jsx";
import PostNew from "./components/app/pages/PostNew/PostNew.jsx";
import AboutUs from "./components/app/pages/AboutUs/AboutUs.jsx";
import Test from "./components/app/pages/Test/Test.jsx";
import "./App.css";
import SelectMethodPage from "./components/app/pages/payment/page";
import SignupForm from "./components/app/pages/header/sign_up";
import SigninForm from "./components/app/pages/header/sign_in";
import { verifyToken } from "./components/app/BackEnd/verifyToken";
import Detail_infor from "./components/app/pages/User/Detail_infor";
import { useState, useEffect } from "react";

function App() {
  const [ID, setID] = useState("");

  useEffect(() => {
    const storedToken =
      sessionStorage.getItem("jwt") || localStorage.getItem("jwt");
    const storedID =
      sessionStorage.getItem("user_id") || localStorage.getItem("user_id");

    if (verifyToken(storedToken) && storedID) {
      verifyToken(storedToken)
        .then((data) => {
          if (data.success) {
            setID(storedID);
          } else {
            console.log("Lỗi:", data.message);
          }
        })
        .catch((error) => {
          console.error("Đã xảy ra lỗi trong quá trình xác thực:", error);
        });
    } else {
      console.log("Người dùng chưa đăng nhập.");
    }
  }, []);

  console.log(ID);

  return (
    <BrowserRouter>
      <Routes>
        <Route index element={<Main ID={ID} />} />
        <Route path="/admin/mazer" element={<Test />} />
        <Route path="/admin*" element={<Admin />} />
        <Route path="/main*" element={<Main ID={ID} />} />
        <Route path="/Product/:page?/:name?" element={<Product ID={ID} />} />
        <Route path="/Products/:name?" element={<Product ID={ID} />} />
        <Route path="/Payment/:value?" element={<SelectMethodPage ID={ID} />} />
        <Route path="/sign_up" element={<SignupForm ID={ID} />} />
        <Route path="/sign_in" element={<SigninForm ID={ID} />} />
        {ID && <Route path="/User" element={<Detail_infor ID={ID} />} />}
        <Route path="/news" element={<News />}></Route>
        <Route path="/about_us" element={<AboutUs />} />
        <Route path="/new" element={<Master_Classe />} />
        <Route path="/faq" element={<FAQ />} />
        <Route path="/faq/question" element={<Question />} />
        <Route path="/postnew" element={<PostNew />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
