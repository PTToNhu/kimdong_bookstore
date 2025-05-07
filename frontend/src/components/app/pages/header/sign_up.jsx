import React from "react";
import Header from "./header";
import logo from "./../images/logo.webp";
const SignupForm = () => {
  const handleSubmit = (e) => {
    e.preventDefault();
  
    const formData = new FormData(e.target);
    
    const data = {
      name: formData.get("name"),
      phone: formData.get("phone"),
      email: formData.get("email"),
      birthdate: formData.get("birthdate"),
      password: formData.get("password"),
      confirmPassword: formData.get("confirmPassword"),
      termsAccepted: formData.get("termsAccepted") === "on",
      studentStatus: formData.get("studentStatus") === "on",
    };
  
    if (!data.name || !data.phone || !data.email || !data.password || !data.confirmPassword) {
      alert("Please fill in all required fields.");
      return;
    }
  
    if (data.password !== data.confirmPassword) {
      alert("Passwords do not match.");
      return;
    }
  
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "http://localhost:8000/sign_up.php", true);
  
    xhr.onreadystatechange = () => {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          const responseData = JSON.parse(xhr.responseText);
          if (responseData.success) {
            alert("Registration successful!");
          } else {
            alert(`Error: ${responseData.message}`);
          }
        } else {
          alert("An error occurred while processing the request.");
        }
      }
    };
  
    xhr.send(formData);
  };

  return (
    <div>
      <Header></Header>
      <div className="bg-white flex items-center justify-center min-h-screen">
        <div className="bg-white p-8 rounded-lg border border-gray-200 shadow-2xl w-[700px]">
          <div className="text-center mb-6">
            <img src={logo} alt="Logo" className="max-sm:hidden mx-auto mb-4" />
          </div>
          <form action="http://localhost:8000/sign_up.php" method="post" onSubmit={handleSubmit}>
            <div class="relative">
              <input
                type="text"
                name="name"
                class="peer py-4 px-[10px] block w-full bg-transparent border-t-transparent border-b-2 border-x-transparent border-b-gray-200 sm:text-sm placeholder:text-transparent focus:border-t-transparent focus:border-x-transparent focus:border-b-blue-500 focus:ring-0 disabled:opacity-50 disabled:pointer-events-none
                                focus:pt-6
                                focus:pb-2
                                not-placeholder-shown:pt-6
                                not-placeholder-shown:pb-2
                                autofill:pt-6
                                autofill:pb-2"
                placeholder="Nhập họ và tên"
                required
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
                Nhập họ và tên
              </label>
            </div>
            <div class="relative">
              <input
                type="text"
                name="phone"
                class="peer py-4 px-[10px] block w-full bg-transparent border-t-transparent border-b-2 border-x-transparent border-b-gray-200 sm:text-sm placeholder:text-transparent focus:border-t-transparent focus:border-x-transparent focus:border-b-blue-500 focus:ring-0 disabled:opacity-50 disabled:pointer-events-none
                                focus:pt-6
                                focus:pb-2
                                not-placeholder-shown:pt-6
                                not-placeholder-shown:pb-2
                                autofill:pt-6
                                autofill:pb-2"
                placeholder="Nhập số điện thoại"
                required
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
                type="email"
                name="email"
                class="peer py-4 px-[10px] block w-full bg-transparent border-t-transparent border-b-2 border-x-transparent border-b-gray-200 sm:text-sm placeholder:text-transparent focus:border-t-transparent focus:border-x-transparent focus:border-b-blue-500 focus:ring-0 disabled:opacity-50 disabled:pointer-events-none
                                focus:pt-6
                                focus:pb-2
                                not-placeholder-shown:pt-6
                                not-placeholder-shown:pb-2
                                autofill:pt-6
                                autofill:pb-2"
                placeholder="Nhập email"
                required
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
                Nhập email
              </label>
            </div>
            <div class="relative">
              <input
                type="date"
                name="birthdate"
                class="peer py-4 px-[10px] block w-full bg-transparent border-t-transparent border-b-2 border-x-transparent border-b-gray-200 sm:text-sm placeholder:text-transparent focus:border-t-transparent focus:border-x-transparent focus:border-b-blue-500 focus:ring-0 disabled:opacity-50 disabled:pointer-events-none
                                focus:pt-6
                                focus:pb-2
                                not-placeholder-shown:pt-6
                                not-placeholder-shown:pb-2
                                autofill:pt-6
                                autofill:pb-2"
                placeholder="Ngày sinh"
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
                Ngày sinh
              </label>
            </div>
            <div class="relative">
              <input
                type="text"
                name="password"
                class="peer py-4 px-[10px] block w-full bg-transparent border-t-transparent border-b-2 border-x-transparent border-b-gray-200 sm:text-sm placeholder:text-transparent focus:border-t-transparent focus:border-x-transparent focus:border-b-blue-500 focus:ring-0 disabled:opacity-50 disabled:pointer-events-none
                                focus:pt-6
                                focus:pb-2
                                not-placeholder-shown:pt-6
                                not-placeholder-shown:pb-2
                                autofill:pt-6
                                autofill:pb-2"
                placeholder="Nhập mật khẩu"
                required
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
            <div class="relative">
              <input
                type="text"
                name="confirmPassword"
                class="peer py-4 px-[10px] block w-full bg-transparent border-t-transparent border-b-2 border-x-transparent border-b-gray-200 sm:text-sm placeholder:text-transparent focus:border-t-transparent focus:border-x-transparent focus:border-b-blue-500 focus:ring-0 disabled:opacity-50 disabled:pointer-events-none
                                focus:pt-6
                                focus:pb-2
                                not-placeholder-shown:pt-6
                                not-placeholder-shown:pb-2
                                autofill:pt-6
                                autofill:pb-2"
                placeholder="Nhập lại mật khẩu"
                required
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
                Nhập lại mật khẩu
              </label>
            </div>
            <label className="flex mt-[20px] items-center mb-4">
              <input type="checkbox" name="termsAccepted" className="mr-2" />
              <span className="text-gray-600">
                Tôi đồng ý các điều khoản và điều kiện của Cellphones
              </span>
            </label>
            <label className="flex items-center mb-4">
              <input type="checkbox" name="studentStatus" className="mr-2" />
              <span className="text-gray-600">
                Tôi là Học sinh / Sinh viên / Giảng viên
              </span>
            </label>
            <button
              type="submit"
              class="w-full cursor-pointer bg-red-500 hover:bg-red-600 font-bold text-white px-4 py-2 rounded-lg flex items-center justify-center"
            >
              Đăng ký
            </button>
          </form>
          <p className="mt-4 text-center">
            Bạn đã có tài khoản?{" "}
            <a href="/sign_in" className="text-red-500">
              Đăng nhập ngay
            </a>
          </p>
        </div>
      </div>
    </div>
  );
};

export default SignupForm;
