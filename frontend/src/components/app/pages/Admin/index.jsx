import React from "react";
import Input from "./input";
import Navbar from "./navbar";
import Post from "./post";
import { Routes, Route } from "react-router-dom";
import Edit from "./edit";
import Order from "./order";
import { LoginAdmin } from "./loginAdmin";
import { useState, useEffect } from "react";
import { verifyToken } from "../../BackEnd/verifyAdmin";
import { SignupForm } from "./sign_upAdmin";
export default function Admin() {
  const [Token, setToken] = useState("");

  useEffect(() => {
    const storedToken = sessionStorage.getItem("jwt");

    if (verifyToken(storedToken) && storedToken) {
      verifyToken(storedToken)
        .then((data) => {
          if (data.success) {
            setToken(storedToken);
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

  return (
    <div>
      {!Token && 
        <div className="flex w-full justify-center">
            <Routes>
              <Route index element={<LoginAdmin />} />
              <Route path="/Login" element={<LoginAdmin />} />
              <Route path="/sign_up" element={<SignupForm />} />
            </Routes>     
        </div>
        }
      {Token && (
        <div className="flex w-[100%] relative">
          <Navbar />
            <span onClick={() => {
                    sessionStorage.clear();
                    window.location.reload();
                }           
            } className="absolute right-10 top-10 px-6 py-2 bg-red-600 text-white rounded-lg shadow hover:bg-red-700 transform hover:scale-105 transition duration-300 cursor-pointer">
                Đăng xuất
            </span>        
            <div className="w-full px-[30px] flex justify-center items-center">
            <Routes>
              <Route index element={<Post />} />
              <Route path="/input" element={<Input />} />
              <Route path="/post/:Status?" element={<Post />} />
              <Route path="/post/edit/:number?" element={<Edit />} />
              <Route path="/order/" element={<Order />} />
            </Routes>
          </div>
        </div>
      )}
    </div>
  );
}
