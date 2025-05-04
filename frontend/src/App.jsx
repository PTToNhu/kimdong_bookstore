import { BrowserRouter, Routes, Route } from "react-router-dom";
import Admin from "./../components/app/pages/Admin/index";
import Product from "./../components/app/pages/Product/product";
import Main from "./../components/app/pages/main";
import React from "react";
import Master_Classe from "../components/app/pages/Master_Classe/Master_Classe.jsx";
import FAQ from "../components/app/pages/FAQ/FAQ.jsx";
import Question from "../components/app/pages/Question/Question.jsx";
import News from "../components/app/pages/News/News.jsx";
import PostNew from "../components/app/pages/PostNew/PostNew.jsx";
import "./App.css";
import AboutUs from "../components/app/pages/AboutUs/AboutUs.jsx";

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route index element={<Main />} />
        <Route path="/admin*" element={<Admin />} />
        <Route path="/main*" element={<Main />} />
        <Route path="/Product/:page?/:name?" element={<Product />} />
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
