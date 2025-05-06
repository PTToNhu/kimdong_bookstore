import React from "react";
import logo from "./images/img-01.png";
import { useState, useRef, useEffect } from "react";

export function LoginAdmin() {
  const [identifier, setIdentifier] = useState("");
  const [password, setPassword] = useState("");
  const [remember, setRemember] = useState(false);

  function addCookie() {
    if (identifier) {
      document.cookie = "user=" + identifier;
    }
  }

  const handleSubmit = async (e) => {
    e.preventDefault();

    if (!identifier || !password) {
      alert("Vui lòng nhập tên người dùng và mật khẩu.");
      return;
    }

    try {
      const response = await fetch(
        `http://localhost/kimdong_bookstore/frontend/src/components/app/BackEnd/php/php/loginAdmin.php?username=${encodeURIComponent(
          identifier
        )}&password=${encodeURIComponent(password)}`,
        { method: "GET" }
      );
      console.log(`http://localhost/kimdong_bookstore/frontend/src/components/app/BackEnd/php/php/loginAdmin.php?username=${encodeURIComponent(
          identifier
        )}&password=${encodeURIComponent(password)}`);
      if (!response.ok) {
        throw new Error("Network response was not ok");
      }

      const data = await response.json();
      alert(data.message);

      if (data.success && data.jwt) {
        sessionStorage.setItem("jwt", data.jwt);
        window.location.href = "/admin";
      } else {
        alert("Đăng nhập không thành công. Vui lòng kiểm tra lại thông tin.");
      }
    } catch (error) {
      console.error("Đã xảy ra lỗi trong quá trình gửi yêu cầu:", error);
      alert("Đã xảy ra lỗi. Vui lòng thử lại.");
    }
  };

  return (
    <div>
      <div className="bg-white flex items-center justify-center min-h-screen">
        <div className="bg-white p-8 rounded-lg border border-gray-200 shadow-2xl w-[700px]">
          <div className="text-center mb-6">
            <img src={logo} alt="Logo" className="mx-auto mb-5" />
          </div>
          <form onSubmit={handleSubmit}>
            <div class="relative">
              <input
                type="text"
                value={identifier}
                onChange={(e) => setIdentifier(e.target.value)}
                class="peer py-4 px-[10px] block w-full bg-transparent border-t-transparent border-b-2 border-x-transparent border-b-gray-200 sm:text-sm placeholder:text-transparent focus:border-t-transparent focus:border-x-transparent focus:border-b-blue-500 focus:ring-0 disabled:opacity-50 disabled:pointer-events-none
                                focus:pt-6
                                focus:pb-2
                                not-placeholder-shown:pt-6
                                not-placeholder-shown:pb-2
                                autofill:pt-6
                                autofill:pb-2"
                placeholder="Nhập số điện thoại"
              />
              <label
                for="hs-floating-underline-input-email"
                class="absolute top-0 start-0 py-4 px-0 h-full sm:text-sm truncate pointer-events-none transition ease-in-out duration-100 border border-transparent  origin-[0_0] peer-disabled:opacity-50 peer-disabled:pointer-events-none
                                peer-focus:scale-90
                                peer-focus:translate-x-0.5
                                peer-focus:-translate-y-1.5
                                peer-focus:text-[red]
                                peer-not-placeholder-shown:scale-90
                                peer-not-placeholder-shown:translate-x-0.5
                                peer-not-placeholder-shown:-translate-y-1.5
                                peer-not-placeholder-shown:text-[red]"
              >
                Nhập số điện thoại
              </label>
            </div>
            <div class="relative">
              <input
                type="text"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                class="peer py-4 px-[10px] block w-full bg-transparent border-t-transparent border-b-2 border-x-transparent border-b-gray-200 sm:text-sm placeholder:text-transparent focus:border-t-transparent focus:border-x-transparent focus:border-b-blue-500 focus:ring-0 disabled:opacity-50 disabled:pointer-events-none
                                focus:pt-6
                                focus:pb-2
                                not-placeholder-shown:pt-6
                                not-placeholder-shown:pb-2
                                autofill:pt-6
                                autofill:pb-2"
                placeholder="Nhập mật khẩu"
              />
              <label
                for="hs-floating-underline-input-email"
                class="absolute top-0 start-0 py-4 px-0 h-full sm:text-sm truncate pointer-events-none transition ease-in-out duration-100 border border-transparent  origin-[0_0] peer-disabled:opacity-50 peer-disabled:pointer-events-none
                                peer-focus:scale-90
                                peer-focus:translate-x-0.5
                                peer-focus:-translate-y-1.5
                                peer-focus:text-[red]
                                peer-not-placeholder-shown:scale-90
                                peer-not-placeholder-shown:translate-x-0.5
                                peer-not-placeholder-shown:-translate-y-1.5
                                peer-not-placeholder-shown:text-[red]"
              >
                Nhập mật khẩu
              </label>
            </div>

            <div className="h-[40px] w-full flex justify-end items-center relative">
              <div className="absolute left-0">
              </div>
              <a href="">Quên mật khẩu?</a>
            </div>
            <button
              type="submit"
              class="w-full cursor-pointer bg-red-500 hover:bg-red-600 font-bold text-white px-4 py-2 rounded-lg flex items-center justify-center"
            >
              Đăng Nhập
            </button>
          </form>
          <p className="mt-4 text-center">
            Bạn chưa có tài khoản?{" "}
            <a href="/admin/sign_up" className="text-red-500">
              Đăng ký ngay
            </a>
          </p>
        </div>
      </div>
    </div>
  );
}
