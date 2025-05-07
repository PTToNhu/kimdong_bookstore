import React from "react";
import Header from "./header";
import logo from "./../images/logo.webp";
import { useState, useRef } from "react";
import "./css/style.css";
import $ from "jquery";

const SignupForm = () => {
  const [files, setFiles] = useState([]);
  const inputRef = useRef(null);

  const handleSubmit = (e) => {
    e.preventDefault();
  
    const form = $(e.target);
    const formData = new FormData(form[0]);
    if (files && files.length > 0) {
      for (let i = 0; i < files.length; i++) {
        console.log(files[i]);
        formData.append("file[]", files[i].title);
      }
    } else {
      console.log("No files selected.");
    }

    $.ajax({
      type: "POST",
      url: form.attr("action"),
      data: formData,
      processData: false, 
      contentType: false, 
      success: (data) => {
        if (data.success) {
          alert("Dữ liệu đã được thêm thành công!");
        } else {
          alert(data.message || "Có lỗi xảy ra.");
        }
      },
      error: (jqXHR, textStatus, errorThrown) => {
        console.error("AJAX Error:", textStatus, errorThrown);
        alert("Có lỗi xảy ra khi gửi yêu cầu.");
      }
    });
  };
  
  const handleDrop = (event) => {
    event.preventDefault();
    const droppedFiles = event.dataTransfer.files;
    const fileTemp = Array.from(droppedFiles);

    if (fileTemp.length > 0) {
      const image = [];
      if (fileTemp.length > 0) {
        fileTemp.map((element, index) => {
          setFiles((prevFiles) => [
            ...prevFiles,
            { id: index, title: element },
          ]);
        });
      }
    }
  };

  const handleDragOver = (e) => {
    e.preventDefault();
  };

  const handleBrowseClick = () => {
    inputRef.current.click();
  };

  const handleFileChange = (e) => {
    const selectedFiles = Array.from(e.target.files);
    if (selectedFiles.length > 0) {
      const image = [];
      if (selectedFiles.length > 0) {
        selectedFiles.map((element, index) => {
          setFiles((prevFiles) => [
            ...prevFiles,
            { id: index, title: element },
          ]);
        });
      }
    }
  };

  return (
    <div>
      <Header></Header>
      <div className="bg-white flex items-center justify-center min-h-screen">
        <div className="bg-white p-8 rounded-lg border border-gray-200 shadow-2xl w-[700px]">
          <div className="text-center mb-6">
            <img src={logo} alt="Logo" className="max-sm:hidden mx-auto mb-4" />
          </div>
          <form
            action="http://localhost:8000/sign_up.php"
            method="post"
            onSubmit={handleSubmit}
            enctype="multipart/form-data"
          >
            <div className="relative">
              <input
                type="text"
                name="name"
                className="peer py-4 px-2 block w-full bg-transparent border-t-transparent border-b-2 border-x-transparent border-b-gray-200 sm:text-sm placeholder:text-transparent focus:border-t-transparent focus:border-x-transparent focus:border-b-blue-500 focus:ring-0 disabled:opacity-50 disabled:pointer-events-none
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
                htmlFor="name"
                className="absolute top-0 start-0 py-4 px-0 h-full sm:text-sm truncate pointer-events-none transition ease-in-out duration-100 border border-transparent origin-[0_0] peer-disabled:opacity-50 peer-disabled:pointer-events-none
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

            <div className="relative">
              <input
                type="text"
                name="phone"
                className="peer py-4 px-2 block w-full bg-transparent border-t-transparent border-b-2 border-x-transparent border-b-gray-200 sm:text-sm placeholder:text-transparent focus:border-t-transparent focus:border-x-transparent focus:border-b-blue-500 focus:ring-0 disabled:opacity-50 disabled:pointer-events-none
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
                htmlFor="phone"
                className="absolute top-0 start-0 py-4 px-0 h-full sm:text-sm truncate pointer-events-none transition ease-in-out duration-100 border border-transparent origin-[0_0] peer-disabled:opacity-50 peer-disabled:pointer-events-none
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

            <div className="relative">
              <input
                type="email"
                name="email"
                className="peer py-4 px-2 block w-full bg-transparent border-t-transparent border-b-2 border-x-transparent border-b-gray-200 sm:text-sm placeholder:text-transparent focus:border-t-transparent focus:border-x-transparent focus:border-b-blue-500 focus:ring-0 disabled:opacity-50 disabled:pointer-events-none
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
                htmlFor="email"
                className="absolute top-0 start-0 py-4 px-0 h-full sm:text-sm truncate pointer-events-none transition ease-in-out duration-100 border border-transparent origin-[0_0] peer-disabled:opacity-50 peer-disabled:pointer-events-none
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

            <div className="relative">
              <input
                type="date"
                name="birthdate"
                className="peer py-4 px-2 block w-full bg-transparent border-t-transparent border-b-2 border-x-transparent border-b-gray-200 sm:text-sm placeholder:text-transparent focus:border-t-transparent focus:border-x-transparent focus:border-b-blue-500 focus:ring-0 disabled:opacity-50 disabled:pointer-events-none
                  focus:pt-6
                  focus:pb-2
                  not-placeholder-shown:pt-6
                  not-placeholder-shown:pb-2
                  autofill:pt-6
                  autofill:pb-2"
                placeholder="Ngày sinh"
              />
              <label
                htmlFor="birthdate"
                className="absolute top-0 start-0 py-4 px-0 h-full sm:text-sm truncate pointer-events-none transition ease-in-out duration-100 border border-transparent origin-[0_0] peer-disabled:opacity-50 peer-disabled:pointer-events-none
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

            <div className="relative">
              <input
                type="password"
                name="password"
                className="peer py-4 px-2 block w-full bg-transparent border-t-transparent border-b-2 border-x-transparent border-b-gray-200 sm:text-sm placeholder:text-transparent focus:border-t-transparent focus:border-x-transparent focus:border-b-blue-500 focus:ring-0 disabled:opacity-50 disabled:pointer-events-none
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
                htmlFor="password"
                className="absolute top-0 start-0 py-4 px-0 h-full sm:text-sm truncate pointer-events-none transition ease-in-out duration-100 border border-transparent origin-[0_0] peer-disabled:opacity-50 peer-disabled:pointer-events-none
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

            <div className="relative">
              <input
                type="password"
                name="confirmPassword"
                className="peer py-4 px-2 block w-full bg-transparent border-t-transparent border-b-2 border-x-transparent border-b-gray-200 sm:text-sm placeholder:text-transparent focus:border-t-transparent focus:border-x-transparent focus:border-b-blue-500 focus:ring-0 disabled:opacity-50 disabled:pointer-events-none
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
                htmlFor="confirmPassword"
                className="absolute top-0 start-0 py-4 px-0 h-full sm:text-sm truncate pointer-events-none transition ease-in-out duration-100 border border-transparent origin-[0_0] peer-disabled:opacity-50 peer-disabled:pointer-events-none
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

            <div
              className=" z-0 text-[12px] w-[150px] transition duration-300 ease-in-out hover:-translate-y-1 hover:scale-102 hover:text-white hover:bg-white"
              onDrop={handleDrop}
              onDragOver={handleDragOver}
            >
              <div
                className="button m-[10px] w-full text-center text-[white] text-[15px]"
                onClick={() => inputRef.current.click()}
              >
                  Chọn Avatar
              </div>
              <input
                type="file"
                name="file"
                ref={inputRef}
                onChange={handleFileChange}
                hidden
              />
              {files && files.length > 0 && (
                <p>File: {files.map((file) => file.title.name).join(", ")}</p>
              )}
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
              className="w-full cursor-pointer bg-red-500 hover:bg-red-600 font-bold text-white px-4 py-2 rounded-lg flex items-center justify-center"
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
