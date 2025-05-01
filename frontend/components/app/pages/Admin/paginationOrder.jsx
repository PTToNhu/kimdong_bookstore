import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faBook } from "@fortawesome/free-solid-svg-icons";
import { faList } from "@fortawesome/free-solid-svg-icons";
import { faBars } from "@fortawesome/free-solid-svg-icons";
import Modal from "../helper/modal";
import React, { useState } from "react";
import "./style/style.css";
const PaginationHelper = ({
  data = [],
  checkedItems,
  handleCheckboxChange,
  formatPrice,
  handleStatusChange,
  toggleModal,
  open,
  edit,
  setID,
  results,
  handleCheckAll,
}) => {
  const [currentPage, setCurrentPage] = useState(1);
  const pagination = {
    totalItems: data.length,
    totalItemsPerPage: 10,
    pageRanges: 30,
  };

  const totalItems = pagination.totalItems;
  const totalItemsPerPage = pagination.totalItemsPerPage;
  const totalPages = Math.ceil(totalItems / totalItemsPerPage);
  const pageRange = pagination.pageRanges;

  let xhtmlStart = [],
    xhtmlNext = [],
    xhtmlPrevious = [],
    xhtmlEnd = [],
    xhtmlPages = [];

  const countI = Math.ceil(pageRange / 2);
  let min = currentPage - countI + 1,
    max = totalPages;

  if (min <= 1) {
    min = 1;
  }
  max = min + pageRange;
  if (max > totalPages) {
    max = totalPages;
  }

  if (min > 1) {
    xhtmlPages.push(
      <li
        key="start-ellipsis"
        className="flex items-center justify-center px-3 h-8 leading-tight text-gray-500 bg-white border rounded-e-lg border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white"
      >
        ...
      </li>
    );
  }

  let i = 1;

  if (min + countI >= totalPages) {
    i = totalPages - pageRange + 1;
  } else {
    i = min;
  }

  if (i <= 0) i = 1;

  function handleClickStart() {
    setCurrentPage(1);
  }

  function handleClickPrev() {
    if (currentPage > 1) {
      setCurrentPage(currentPage - 1);
    }
  }
  function handleClickEnd() {
    setCurrentPage(totalPages);
  }

  function handleClickNext() {
    if (currentPage < totalPages) {
      setCurrentPage(currentPage + 1);
    }
  }

  function handleClickI(page) {
    setCurrentPage(page);
  }

  for (let i = 1; i <= max && i <= totalPages; i++) {
    if (i !== currentPage) {
      xhtmlPages.push(
        <li key={i}>
          <div
            onClick={() => handleClickI(i)}
            className="flex items-center justify-center px-3 m-1 h-8 leading-tight text-gray-500 bg-white border rounded-lg border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white"
          >
            {i}
          </div>
        </li>
      );
    } else {
      xhtmlPages.push(
        <li key={i}>
          <div
            onClick={() => handleClickI(i)}
            aria-current="page"
            className="flex items-center justify-center px-3 m-1 h-8 text-blue-600 border border-gray-300 rounded-lg bg-blue-50 hover:bg-blue-100 hover:text-blue-700 dark:border-gray-700 dark:bg-gray-700 dark:text-white"
          >
            {i}
          </div>
        </li>
      );
    }
  }

  xhtmlStart.push(
    <li onClick={handleClickStart}>
      <div className="flex items-center max-sm:hidden justify-center px-3 m-1 h-8  leading-tight text-gray-500 bg-white border border-e-0 rounded-lg border-gray-300 rounded-s-lg hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">
        Start
      </div>
    </li>
  );
  xhtmlPrevious.push(
    <li onClick={handleClickPrev}>
      <div className="flex items-center justify-center px-3 m-1 h-8  leading-tight text-gray-500 bg-white rounded-lg border border-e-0 border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">
        &#60;
      </div>
    </li>
  );

  xhtmlNext.push(
    <li onClick={handleClickNext}>
      <div className="flex items-center justify-center px-3 m-1 h-8 leading-tight text-white bg-black border rounded-lg border-gray-300hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">
        &#62;
      </div>
    </li>
  );
  xhtmlEnd.push(
    <li onClick={handleClickEnd}>
      <div className="flex max-sm:hidden items-center max-sm:hiden justify-center px-3 m-1 h-8 leading-tight text-white bg-white border border-gray-300 rounded-lg hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">
        End
      </div>
    </li>
  );

  if (max < totalPages) {
    xhtmlPages.push(
      <li
        key="end-ellipsis"
        className="flex items-center justify-center px-3 m-1 h-8 leading-tight text-white bg-white border border-gray-300 rounded-e-lg hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white"
      >
        ...
      </li>
    );
  }

  let index = (currentPage - 1) * totalItemsPerPage;
  let max_index = totalItemsPerPage;

  if (edit) {
    checkedItems = [];
  }

  let type;

  edit ? (type = "radio") : (type = "checkbox");

  const options = [
    { label: "Chưa giao", color: "bg-[red]" },
    { label: "Đang giao", color: "bg-orange-500" },
    { label: "Đã giao", color: "bg-green-500" },
  ];

  const [isOpen, setIsOpen] = useState(null);
  
  const toggleDropdown = (index) => {
    setIsOpen(isOpen === index ? null : index); 
  };

  const selectOption = (option, id) => {
    fetch(`http://localhost/kimdong_bookstore/frontend/components/app/BackEnd/php/uploads/updateStatusOrder.php?id=${encodeURIComponent(id)}&status=${encodeURIComponent(option)}`)
    setIsOpen(null);
  };

  function getData() {
    let temp = Array(max_index);
    for (let i = 0; i < max_index; i++) {
      temp[i] = data[index + i];
    }

    let result = [];
    temp.map((element, index) => {
      if (element) {
        result.push(
          <tr
            className={`${index % 2 === 0 ? "bg-gray-100" : ""} text-2xl`}
            key={element.id}
          >
            <th className="px-2 size-4 py-2  w-[50px]">
              <input
                type={type}
                className="size-4 rounded-[50%] cursor-pointer"
                checked={checkedItems[index]}
                onChange={() => {
                  handleCheckboxChange(index, results);
                }}
                name="isRadio"
              />
            </th>
            <th className="px-2 text-center font-normal">{element.id}</th>
            <th className="px-2 text-start font-normal">{element.ho_va_ten}</th>
            <th className="px-2 text-start font-normal">
              {formatPrice(element.email)}
            </th>
            <th className="px-2 text-center font-normal">
              {formatPrice(element.phone)}
            </th>
            <th className="px-2 text-center font-normal">
              {formatPrice(element.total)}
            </th>
            <th key={index} className="px-2 font-normal">
              <div
                className={`border ${options.find(item => element.Status === item.label)?.color || 'bg-gray-500'} text-white rounded-2xl border-gray-300 w-[200px] z-0 p-2 cursor-pointer`}
                onClick={() => toggleDropdown(index)}
              >
                {element.Status}
              </div>
              {isOpen === index && (
                <div className="absolute mt-1 w-[200px] z-50 border border-gray-300 rounded shadow-lg text-black">
                  {options.map((item) => (
                    <div
                      key={item.label}
                      className={`p-2 cursor-pointer w-[200px] z-50 hover:bg-blue-100 hover:text-black text-white ${item.color}`}
                      onClick={() => selectOption(item.label, element.id)}
                    >
                      {item.label}
                    </div>
                  ))}
                </div>
              )}
            </th>
            <th
              className="cursor-pointer text-center"
              onClick={() => toggleModal(index)}
            >
              <FontAwesomeIcon className="size-7" icon={faBars} />
            </th>
            {open[index] && (
              <Modal open={open[index]} onClose={() => toggleModal(index)}>
                <ul className="w-[500px] text-[30px] text-white">
                  <li className="px-[2%]">
                    sách: <label className="text-white">{element.book}</label>
                  </li>
                  <li className="px-[2%] bg-[#2D2F39]">
                    Địa chỉ:{" "}
                    <label className="text-white">{element.dia_chi}</label>
                  </li>
                  <li className="px-[2%]">
                    Thành phố:{" "}
                    <label className="text-white">{element.thanh_pho}</label>
                  </li>
                  <li className="px-[2%] bg-[#2D2F39]">
                    Huyện: <label className="text-white">{element.huyen}</label>
                  </li>
                  <li className="px-[2%]">
                    Xã: <label className="text-white">{element.xa}</label>
                  </li>
                </ul>
              </Modal>
            )}
          </tr>
        );
      } else {
        result.push(
          <tr className={`${index % 2 === 0 ? "bg-gray-100" : ""} text-2xl`}>
            <td className="px-2 py-2">Na/N</td>
            <td className="px-2  py-2"></td>
            <td className="px-2  py-2"></td>
            <td className="px-2  py-2"></td>
            <td className="px-2  py-2"></td>
            <td className="px-2  py-2"></td>
            <td className="px-2  py-2"></td>
            <td className="px-2  py-5"></td>
          </tr>
        );
      }
    });
    return result;
  }

  const countStatus = results.reduce(
    (accumulator, item) => {
      if (item.Status === "Active") {
        accumulator.active += 1;
      } else if (item.Status === "Inactive") {
        accumulator.inactive += 1;
      }
      return accumulator;
    },
    { active: 0, inactive: 0 }
  );

  return (
    <div className="shadow-lg rounded-lg">
      <table className="min-w-full border-collapse">
        <thead>
          <tr className="bg-gray-200">
            <th className="py-2">
              <input
                type="checkbox"
                disabled={edit}
                className="size-4 cursor-pointer"
                onClick={() => handleCheckAll()}
              />
            </th>
            <th className="py-2 w-[1%]">ID</th>
            <th className="py-2 w-[25%]">Họ và tên</th>
            <th className="py-2 w-[25%]">Email</th>
            <th className="py-2">Phone</th>
            <th className="py-2">Giá</th>
            <th className="py-2 w-[200px]">Status</th>
            <th className="py-2">Actions</th>
          </tr>
        </thead>
        <tbody>{getData()}</tbody>
      </table>

      <div className="flex items-center relative h-[70px] w-full border-t border-[#D0D1D3]">
        <div className="flex  relative text-[20px] ">
          <p className="ml-[10px]"> Tổng sản phẩm: {results.length}</p>
          <p className="ml-[50px]"> Active: {countStatus.active}</p>
          <p className="ml-[50px]"> Inactive: {countStatus.inactive}</p>
        </div>
        <nav className="absolute right-0">
          <ul className="inline-flex text-[15px] max-sm:text-[15px] max-sm:w-[30]">
            {xhtmlStart}
            {xhtmlPrevious}
            {xhtmlPages}
            {xhtmlNext}
            {xhtmlEnd}
          </ul>
        </nav>
      </div>
    </div>
  );
};

export default PaginationHelper;
