import React, { useState, useEffect, useRef, use } from "react";
import Avatar from "./Avatar/Avatar.png";
import Header from "../header/header";
import { User } from "react-feather";
import axios from "axios";
import $ from "jquery";

export default function Detail_infor(item) {
  const [Action, setAction] = useState("EDIT PROFILE");
  const [user, setUser] = useState("");
  const [OldPassword, setOldPassword] = useState("EDIT PROFILE");
  const [newPassword, setNewPassword] = useState("EDIT PROFILE");
  const [name, setName] = useState("");
  const [birthday, setBirthday] = useState("");
  const [email, setEmail] = useState("");
  const [phone, setPhone] = useState("");
  const [img, setImages] = useState([]);
  const [avatar, setAvatar] = useState([]);
  const inputRef = useRef(null);
  const [first, setFirst] = useState(true);
  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch(
          `http://localhost/kimdong_bookstore/api/BackEnd/php/getDataUser.php?id=${encodeURIComponent(
            item.ID
          )}`
        );

        if (!response.ok) {
          const errorData = await response.json();
          throw new Error(`Error: ${errorData.message || response.statusText}`);
        }

        const data = await response.json();

        if (data.length > 0) {
          setUser(data[0]);
          setName(data[0].name);
          setEmail(data[0].email);
          setPhone(data[0].phone);
          setBirthday(data[0].birthdate);
        }
      } catch (error) {
        console.error("Error fetching data: ", error);
      }
    };

    async function loadImages() {
      try {
        const imagePaths = import.meta.glob(
          "../../../../../../api/BackEnd/images/User/**/*.{jpg,jpeg,png,gif,svg,webp}"
        );

        const imagePromises = Object.values(imagePaths).map((importer) =>
          importer()
        );
        const loadedImages = await Promise.all(imagePromises);

        setImages(loadedImages.map((module) => module.default));


      } catch (error) {
        console.error("Error loading images:", error);
      }
    }
    loadImages();
    fetchData();
  }, [item.ID]);

  useEffect(() => {
    const filteredAvatars = img.filter(element => {
      let parts = element.split("/");

      console.log("parts", parts);
      return parts[parts.length - 2] === item.ID; 
    });

    setAvatar(filteredAvatars); 
  }, [img, item.ID]); 

  const handleClick = async (e) => {
    e.preventDefault();

    if (Action === "SAVE CHANGE") {
      const formData = new FormData();
      formData.append("id", item.ID);
      formData.append("name", name);
      formData.append("birthdate", birthday);
      formData.append("email", email);
      formData.append("phone", phone);

      if (avatar && avatar.length > 0 && avatar[0] instanceof File) {
        formData.append("file", avatar[0]); 
      } else {
        console.log("No files selected or invalid file.");
      }

      try {
        const response = await axios.post(
          "http://localhost/kimdong_bookstore/api/BackEnd/php/EditUser.php",
          formData,
          {
            headers: {
              "Content-Type": "multipart/form-data",
            },
          }
        );

        if (response.data.success) {
          alert("Dữ liệu đã được thêm thành công!");
        } else {
          alert(response.data.message || "Có lỗi xảy ra.");
        }
      } catch (error) {
        console.error("Error:", error);
        alert("Có lỗi xảy ra khi gửi yêu cầu.");
      }
    } else {
      setAction("SAVE CHANGE");
    }
  };

  const handleFileChange = (e) => {
    const selectedFile = e.target.files[0];
    if (selectedFile) {
      setAvatar(URL.createObjectURL(selectedFile));
    }
  };

  return (
    <form
      method="post"
      onSubmit={handleClick}
      enctype="multipart/form-data"
      className="p-4 md:p-6 lg:p-8 flex flex-col mt-[200px] items-center "
    >
      <Header ID={item.ID}></Header>
      <div className="relative w-full max-w-[1126px] border border-black h-[200px] rounded-2xl">
        <div className="flex items-center h-full p-4 md:p-6">
          {avatar ? (
            <img
              className="m-4 w-[150px] h-[150px] md:max-w-[200px] md:max-h-[200px] rounded-full object-cover"
              src={avatar}
              alt="User Avatar"
            />
          ) : (
            <div className="m-4 md:m-[40px] bg-gray-300 w-[100px] h-[100px] rounded-full flex items-center justify-center">
              <span className="text-gray-600">No Avatar</span>
            </div>
          )}
          <div>
            <p className="text-[20px] md:text-[25px] font-bold">
              {user.name} {user.name}
            </p>
            <p className="text-[16px] md:text-[18px]">{user.email}</p>
            <p className="text-[16px] md:text-[18px]">{user.phone}</p>
          </div>
        </div>
        <p
          onClick={() => inputRef.current.click()}
          className="absolute bottom-[20px] right-[20px] text-[16px] md:text-[18px] px-[20px] py-[6px] border border-black rounded-4xl bg-[#F5F3F3] hover:bg-[#848585] hover:text-white cursor-pointer font-bold"
        >
          Change avatar
        </p>
        <input
          type="file"
          name="file"
          ref={inputRef}
          onChange={handleFileChange}
          hidden
        />
      </div>
      <div
        className={`relative w-full max-w-[1126px] ${
          Action === "SAVE CHANGE"
            ? "md:h-[580px] max-md:h-[800px]"
            : "md:h-[450px] max-md:h-[540px]"
        }`}
      >
        <p className="font-bold text-lg md:text-xl py-5">Detail information</p>
        <div className="w-full flex justify-center">
          <div className="flex flex-col w-full max-w-[880px] gap-6">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <label className="w-full">
                <p className="font-bold">Tên</p>
                <input
                  onChange={(e) => setName(e.target.value)}
                  defaultValue={user.name}
                  className="w-full px-3 py-2 mt-3 rounded-md border border-black"
                  type="text"
                  placeholder="First name is available"
                />
              </label>
              <label className="w-full">
                <p className="font-bold">Ngày sinh</p>
                <input
                  onChange={(e) => setBirthday(e.target.value)}
                  defaultValue={user["birthdate"]}
                  className="w-full px-3 py-2 mt-3 rounded-md border border-black"
                  type="text"
                  placeholder="Birthday is available"
                />
              </label>
            </div>
            <div>
              <p className="font-bold">Email</p>
              <input
                onChange={(e) => setEmail(e.target.value)}
                defaultValue={user["email"]}
                className="w-full px-3 py-2 mt-3 rounded-md border border-black"
                type="text"
                placeholder="Email is available"
              />
            </div>
            <div>
              <p className="font-bold">Số điện thoại</p>
              <input
                onChange={(e) => setPhone(e.target.value)}
                defaultValue={user["phone"]}
                className="w-full px-3 py-2 mt-3 rounded-md border border-black"
                type="text"
                placeholder="Phone is available"
              />
            </div>
          </div>
        </div>

        {Action === "SAVE CHANGE" && (
          <div>
            <p className="font-bold text-xl py-6">Change password</p>
            <div className="w-full flex justify-center">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6 w-full max-w-[880px]">
                <label className="w-full">
                  <p className="font-bold">Mật khẩu</p>
                  <input
                    onChange={(e) => setOldPassword(e.target.value)}
                    className="w-full px-3 py-2 mt-3 rounded-md border border-black"
                    type="password"
                  />
                </label>
                <label className="w-full">
                  <p className="font-bold">Xác nhận mật khẩu</p>
                  <input
                    onChange={(e) => setNewPassword(e.target.value)}
                    className="w-full px-3 py-2 mt-3 rounded-md border border-black"
                    type="password"
                  />
                </label>
              </div>
            </div>
          </div>
        )}

        <div
          onClick={handleClick}
          className="flex items-center justify-center absolute rounded-xl right-0 bottom-4 border border-black bg-gray-100 hover:bg-gray-500 hover:text-white cursor-pointer w-40 h-12 font-bold"
        >
          {Action}
        </div>
      </div>
    </form>
  );
}
