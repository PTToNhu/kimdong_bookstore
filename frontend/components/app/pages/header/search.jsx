import React, { useRef, useEffect, useState } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faMagnifyingGlass,
  faBook,
  faAnglesDown,
} from "@fortawesome/free-solid-svg-icons";
import { Data } from "./getData";
import "swiper/css";
import "swiper/css/pagination";
import { Swiper, SwiperSlide } from "swiper/react";
import "swiper/swiper-bundle.css";
import { Navigation, Pagination, Scrollbar, A11y } from "swiper/modules";

export default function Search(item) {
  const [searchTerm, setSearchTerm] = useState("");
  const [results, setResults] = useState([]);
  const [currentCategory, setCurrentCategory] = useState("Tất cả sản phẩm");
  const [open, setOpen] = useState(false);
  const [index, setIndex] = useState(0);
  const resultsRef = useRef();
  const resultsRef1 = useRef();
  const [data, setData] = useState([]);
  const categories = [
    "Tất cả sản phẩm",
    "Lịch sử truyền thống",
    "Văn học Việt Nam",
    "Văn học nước ngoài",
    "Kiến thức, khoa học",
    "Truyện tranh",
    "Wings Books",
  ];

  let linkCategory = [
    "tat_ca_san_pham",
    "lich_su_truyen_thong",
    "van_hoc_Viet_Nam",
    "van_hoc_nuoc_ngoai",
    "kien_thuc_khoa_hoc",
    "truyen_tranh",
    "wings_book",
  ];

  useEffect(() => {
    fetch(`http://localhost/kimdong_bookstore/frontend/components/app/BackEnd/php/uploads/getSearch.php?&url=${encodeURIComponent(linkCategory[index])}&variable=${encodeURIComponent(searchTerm)}`)
      .then((response) => response.json())
      .then((data) => {
        setResults(data);
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
      });
  }, [searchTerm]);

  const listCategory = categories.map((element, index) => (
    <li
      key={index}
      className={`border-b border-black pt-[5px] p-[10px] bg-white hover:bg-[#F5ECD5] hover:text-[red]`}
      onClick={() => {
        setCurrentCategory(element);
        handleClick(index);
      }}
    >
      <FontAwesomeIcon icon={faBook} />
      <span className="pl-[5px] ml-[10px]">{element}</span>
    </li>
  ));

  const test = (event) => {
    const { value } = event.target;
    setSearchTerm(value);
  };

  const handleClickOutside = (event) => {
    if (resultsRef.current && !resultsRef.current.contains(event.target)) {
      setResults([]);
    }
    if (resultsRef1.current && !resultsRef1.current.contains(event.target)) {
      setOpen(false);
    }
  };

  useEffect(() => {
    document.addEventListener("mousedown", handleClickOutside);
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, []);

  const handleClick = (index) => {
    setOpen(!open);
    setIndex(index);
  };

  return (
    <div
      className={`xl:w-[700px]  lg:w-[600px] lg:ml-[100px] md:ml-[200px] md:w-[400px] z-50`}
    >
      <div className="flex items-center z-50 bg-[#F8F8F8] w-[100%] relative">
        <input
          onKeyUp={test}
          type="text"
          className="form-control bg-[#F8F8F8] outline-none rounded-[10px] w-[90%] pl-[20px] text-[20px] mr-[10px]"
          name="name"
          placeholder="Tìm kiếm sản phẩm"
          aria-label="Tìm kiếm sản phẩm"
        />
        <ul
          ref={resultsRef1}
          className="items-center text-[15px] bold-900 cursor-pointer max-lg:w-[50px] w-[300px]"
        >
          <li
            className="px-[15px] py-[10px] flex items-center border-l-2 border-[#8A8C91] relative"
            onClick={handleClick}
          >
            <p className="max-lg:hidden"> {currentCategory}</p>
            <FontAwesomeIcon
              className={`absolute right-[10px]`}
              icon={faAnglesDown}
            />
          </li>
          {open && (
            <ul className="bold w-[200px] md:rounded-lg max-lg:right-[50px] text-[15px] items-center absolute top-[50px] mt-[10px]">
              {listCategory}
            </ul>
          )}
        </ul>
        <a href={`/main/Search?url=${linkCategory[index]}&value=${searchTerm}&page=1`} className="flex justify-center cursor-pointer w-[50px] p-4 md:rounded-r-lg border-l-2 border-collapse bg-[#17AF91] hover:bg-[#15A78A]">
          <FontAwesomeIcon className="text-[20px]" icon={faMagnifyingGlass} />
        </a>
      </div>
      <div
        ref={resultsRef}
        className="flex absolute z-20 xl:w-[700px]  lg:w-[600px] md:w-[400px] bg-white mt-[10px] sm:rounded-lg"
      >
        {results.length > 0 && (
          <ul className="results-list text-[20px] xl:w-[700px]  lg:w-[600px]   md:w-[400px]">
            <div className="flex w-full text-[16px] bg-[#B1B1B1] py-[10px] px-[20px]">
                <p className="font-bold">Sản phẩm</p>
                <p className="absolute right-[20px] text-[red]">Xem thêm({results.length})</p>
            </div>
            <Swiper
              modules={[Scrollbar, A11y]}
              spaceBetween={0}
              slidesPerView={10}
              direction="vertical"
              className="h-[500px] xl:w-[700px] lg:w-[600px]  md:w-[400px]"
            >
              {results.map((result, index) => {
                return (
                  <SwiperSlide>
                    <li className="xl:w-[700px]  lg:w-[600px]  md:w-[400px] h-full overflow-hidden" key={index}>
                      <a
                        className="block max-h-[200px] mx-4 py-2 md:rounded-lg hover:bg-gray-100 overflow-hidden whitespace-nowrap"
                        href={`/Product/${result.Page}/${result.id}`}
                      >
                        {result.name}
                      </a>
                      {index !== results.length - 1 && (
                        <div className="w-[100%] flex contain-content items-center justify-center">
                          <div className="w-[95%] border-b border-b-black px-4"></div>
                        </div>
                      )}
                    </li>
                  </SwiperSlide>
                );
              })}
            </Swiper>
          </ul>
        )}
      </div>
    </div>
  );
}
