import Header from "./header/header";
import Images from "./review/image";
import Tat_ca_san_pham from "./total/Tat_ca_san_pham";
import Kien_thuc_khoa_hoc from "./total/Kien_thuc_khoa_hoc";
import Lich_su_truyen_thong from "./total/Lich_su_truyen_thong";
import Truyen_tranh from "./total/Truyen_tranh";
import Van_hoc_nuoc_ngoai from "./total/Van_hoc_nuoc_ngoai";
import Van_hoc_Viet_Nam from "./total/Van_hoc_Viet_Nam";
import Wings_book from "./total/Wings_book";
import Favorite from "./total/Favorite";
import SearchPage from "./total/SearchPage";
import { Routes, Route, useLocation } from "react-router-dom";
import React, { useEffect, useRef, useState } from "react";
import bg from "./images/nen2.jpg";
import { faSquareXmark } from "@fortawesome/free-solid-svg-icons";
import Search from "./header/search";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faTags } from "@fortawesome/free-solid-svg-icons";
import { faGift } from "@fortawesome/free-solid-svg-icons";
import { faUser } from "@fortawesome/free-solid-svg-icons";
import { faCartShopping } from "@fortawesome/free-solid-svg-icons";
import { faPhone } from "@fortawesome/free-solid-svg-icons";
import Modal from "./helper/modal";
import logo from "./images/logo.webp";

let category = [
  "Tất cả sản phẩm",
  "Lịch sử truyền thống",
  "Văn học Việt Nam",
  "Văn học nước ngoài",
  "Kiến thức, khoa học",
  "Truyện tranh",
  "Wings Books",
];

let linkCategory = [
  "/main/Tat_ca_san_pham",
  "/main/Lich_su_truyen_thong",
  "/main/Van_hoc_Viet_Nam",
  "/main/Van_hoc_nuoc_ngoai",
  "/main/Kien_thuc_khoa_hoc",
  "/main/Truyen_tranh",
  "/main/Wings_book",
];

const Main = (item) => {
  const location = useLocation();
  const pathParts = location.pathname;
  const headerRef = useRef(null);
  const [menu, setMenu] = useState(false);
  const [open, setOpen] = useState(false);
  const [ID, setID] = useState("");

  useEffect(() => {
    const storedData = sessionStorage.getItem("user_id");
    if (storedData) {
      setID(storedData);
    }
  }, []);

  const listCategoryMenu = category.map((element, index) => {
    if (index !== category.length - 1) {
      return (
        <li
          key={index}
          className="text-white font-mono pt-[5px] hover:text-[red]"
        >
          <a className="pl-[5px] ml-[10px]" href={linkCategory[index]}>
            {element}
          </a>
        </li>
      );
    } else {
      return (
        <li
          key={index}
          className="text-white font-mono pt-[5px] hover:text-[red]"
        >
          <a className="pl-[5px] ml-[10px]" href={linkCategory[index]}>
            {element}
          </a>
        </li>
      );
    }
  });

  let resultLocation = "";

  if (location.pathname !== "/") {
    resultLocation = location.pathname;
  } else {
    resultLocation = "/Tat_ca_san_pham";
  }
  const [scrollPosition, setScrollPosition] = useState(0);

  const handleScroll = () => {
    setScrollPosition(window.scrollY);
  };

  useEffect(() => {
    window.addEventListener("scroll", handleScroll);
    return () => {
      window.removeEventListener("scroll", handleScroll);
    };
  }, []);

  const parentRef = useRef(null);
  const [childWidth, setChildWidth] = useState(0);

  const updateChildWidth = () => {
    if (parentRef.current) {
      const parentWidth = parentRef.current.offsetWidth;
      setChildWidth(parentWidth);
    }
  };

  useEffect(() => {
    updateChildWidth();

    window.addEventListener("resize", updateChildWidth);

    return () => {
      window.removeEventListener("resize", updateChildWidth);
    };
  }, []);

  function handleClickX() {
    setMenu(false);
  }

  function handleClickMenu() {
    setMenu(true);
  }

  return (
    <div
      ref={parentRef}
      className=""
      style={{
        backgroundImage: `url(${bg})`,
        backgroundAttachment: "fixed",
      }}
    >
      <Header
        className="z-10"
        childWidth={childWidth}
        menu={menu}
        handleClickMenu={handleClickMenu}
        ID={item.ID}
      />
      <div
        className={`fixed bg-black md:hidden z-160 h-screen opacity-80 w-[300px] top-0 transition-transform duration-700 delay-150 right-0 ${
          menu ? "translate-x-0" : "translate-x-[500px]"
        }`}
      >
        <p className="absolute right-[10px] top-[10px]">
          <FontAwesomeIcon
            className="text-[30px] text-red-500"
            onClick={handleClickX}
            icon={faSquareXmark}
          />
        </p>
        <div className="mt-[70px] md:hidden">
          <Search></Search>
          <ul className="text-[20px]">{listCategoryMenu}</ul>
        </div>
      </div>
      <div className="flex mt-[120px] max-sm:mt-[70px]">
        <Images />
      </div>
      <div
        className={`main flex w-[100%] justify-center sm:mt-[50px] max-sm:mb-[67px]`}
      >
        <div className="w-[1200px] flex">
          <div className="w-[100%] container mx-auto">
            <Routes>
              <Route
                path="/"
                element={<Tat_ca_san_pham Width={childWidth} />}
              />
              <Route
                path="/Tat_ca_san_pham/:pageNumber?"
                element={
                  <Tat_ca_san_pham
                    resultLocation="/main/Tat_ca_san_pham"
                    Width={childWidth}
                  />
                }
              />
              <Route
                path="/Kien_thuc_khoa_hoc/:pageNumber?"
                element={
                  <Kien_thuc_khoa_hoc
                    resultLocation="/main/Kien_thuc_khoa_hoc"
                    Width={childWidth}
                  />
                }
              />
              <Route
                path="/Lich_su_truyen_thong/:pageNumber?"
                element={
                  <Lich_su_truyen_thong
                    resultLocation="/main/Lich_su_truyen_thong"
                    Width={childWidth}
                  />
                }
              />
              <Route
                path="/Truyen_tranh/:pageNumber?"
                element={
                  <Truyen_tranh
                    resultLocation="/main/Truyen_tranh"
                    Width={childWidth}
                  />
                }
              />
              <Route
                path="/Van_hoc_nuoc_ngoai/:pageNumber?"
                element={
                  <Van_hoc_nuoc_ngoai
                    resultLocation="/main/Van_hoc_nuoc_ngoai"
                    Width={childWidth}
                  />
                }
              />
              <Route
                path="/Van_hoc_Viet_Nam/:pageNumber?"
                element={
                  <Van_hoc_Viet_Nam
                    resultLocation="/main/Van_hoc_Viet_Nam"
                    Width={childWidth}
                  />
                }
              />
              <Route
                path="/Favorite/:pageNumber?"
                element={
                  <Favorite
                    resultLocation="/main/Favorite"
                    Width={childWidth}
                  />
                }
              />
              <Route
                path="/Search"
                element={
                  <SearchPage
                    resultLocation="/main/SearchPage"
                    Width={childWidth}
                  />
                }
              />
              ${childWidth >= 1024 ? "block" : "hidden"}{" "}
              <Route
                path="/Wings_book/:pageNumber?"
                element={<Wings_book Width={childWidth} />}
              />
            </Routes>
          </div>
        </div>
      </div>
      <div className="fixed bottom-0 left-0 w-full sm:hidden h-[67px] bg-[red] shadow-lg">
        <ul className="w-full flex">
          <li className="w-[20%] flex items-center justify-center h-[67px] text-3xl text-white relative">
            <FontAwesomeIcon className="absolute top-3" icon={faTags} />
            <p className="text-[13px] absolute bottom-1 font-bold text-center">
              Hàng mới
            </p>
          </li>
          <li className="w-[20%] flex items-center justify-center h-[67px] text-3xl text-white relative">
            <FontAwesomeIcon className="absolute top-3" icon={faGift} />
            <p className="text-[13px] absolute bottom-1 font-bold text-center">
              Khuyến mãi
            </p>
          </li>
          <li
            onClick={() => {
              setOpen(!open);
            }}
            className="w-[20%] flex items-center justify-center h-[67px] text-3xl text-white relative"
          >
            <FontAwesomeIcon className="absolute top-3" icon={faUser} />
            <p className="text-[13px] absolute bottom-1 font-bold text-center">
              Tài khoản
            </p>
          </li>
          <li className="w-[20%] flex items-center justify-center h-[67px] text-3xl text-white relative">
            <FontAwesomeIcon className="absolute top-3" icon={faPhone} />
            <p className="text-[13px] absolute bottom-1 font-bold text-center">
              Liên hệ
            </p>
          </li>
          <a
            href={`/Payment`}
            className="w-[20%] flex items-center justify-center h-[67px] text-3xl text-white relative"
          >
            <FontAwesomeIcon className="absolute top-3" icon={faCartShopping} />
            <p className="text-[13px] absolute bottom-1 font-bold text-center">
              Giỏ hảng
            </p>
          </a>
        </ul>
      </div>
      <Modal open={open} onClose={() => setOpen(false)}>
        <div className="h-[300px]  z-150 w-[330px] bg-white shadow-lg rounded-2xl">
          <p className="w-full flex items-center justify-center text-[red] font-bold text-[40px]">
            Smember
          </p>
          <div className="w-full flex items-center justify-center">
            <img src={logo} alt="" />
          </div>
          {!ID && (
            <div>
              <p className="text-black text-center">
                Vui lòng đăng nhập tài khoản Smember để xem ưu đãi và thanh toán
                dễ dàng hơn.
              </p>
              <div className="flex h-[102px] w-full items-center justify-center">
                <a
                  href="/sign_up"
                  className="cursor-pointer transition-transform transform hover:scale-105 w-[44%] mx-[3%] text-[20px] font-bold text-[red] flex items-center justify-center py-[10px] border-3 rounded-lg border-[red]"
                >
                  Đăng ký
                </a>
                <a
                  href="/sign_in"
                  className="cursor-pointer transition-transform transform hover:scale-105 w-[44%] mx-[3%] text-[20px] font-bold text-[white] flex items-center justify-center py-[10px] border-3 bg-[red] rounded-lg border-[red]"
                >
                  Đăng nhập
                </a>
              </div>
            </div>
          )}
          {ID && (
            <div>
              <p className="text-black text-center ">Bạn có muốn đăng xuất ?</p>
              <div className="flex h-[102px] w-full items-center justify-center">
                <div
                  onClick={() => {
                    sessionStorage.clear(), setID(""), window.location.reload();
                  }}
                  className="cursor-pointer bg-[red] transition-transform transform hover:scale-105 w-full mx-[3%] text-[20px] font-bold text-[white] flex items-center justify-center py-[10px] border-3 rounded-lg border-[red] mt-[50px]"
                >
                  Đăng xuất
                </div>
              </div>
            </div>
          )}
        </div>
      </Modal>
    </div>
  );
};

export default Main;
