
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faBook } from '@fortawesome/free-solid-svg-icons';
import { faList } from '@fortawesome/free-solid-svg-icons';
import { faBars } from '@fortawesome/free-solid-svg-icons';
import Modal from "../helper/modal";
import React, { useState } from 'react';
import "./style/style.css"
const PaginationHelper = ({ data = [], checkedItems, handleCheckboxChange, formatPrice, handleStatusChange, toggleModal, open, edit, setID, results, handleCheckAll, allChecked }) => {
    const [currentPage, setCurrentPage] = useState(1);
    const pagination = {
        totalItems: data.length,
        totalItemsPerPage: 10,
        pageRanges: 5
    };

    const totalItems = pagination.totalItems;
    const totalItemsPerPage = pagination.totalItemsPerPage;
    const totalPages = Math.ceil(totalItems / totalItemsPerPage);
    const pageRange = pagination.pageRanges;

    let xhtmlStart = [], xhtmlNext = [], xhtmlPrevious = [], xhtmlEnd = [], xhtmlPages = [];

    let min = Math.max(1, currentPage - Math.floor(pageRange / 2));
    let max = Math.min(totalPages, min + pageRange - 1);
    if (max - min < pageRange - 1) {
        min = Math.max(1, max - (pageRange - 1));
    }

    if (min > 1) {
        xhtmlPages.push(
            <li key="start-ellipsis" className='flex items-center justify-center p-5 m-3 h-8 leading-tight text-gray-500 bg-white border border-gray-300 rounded-lg hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white'>...</li>
        );
    }

    function handleClickStart(){
        setCurrentPage(1);
    }

    function handleClickPrev(){
        if(currentPage > 1){
            setCurrentPage(currentPage - 1);
        }
    }
    function handleClickEnd(){
        setCurrentPage(totalPages);
    }

    function handleClickNext(){
        if(currentPage < totalPages){
            setCurrentPage(currentPage + 1);
        }
    }

    function handleClickI(page) {
        setCurrentPage(page);
    }
    
    for (let i = min; i <= max; i++) {
        xhtmlPages.push(
            <li key={i}>
                <div 
                    onClick={() => handleClickI(i)} 
                    className={`flex items-center justify-center p-5 m-3 h-8 leading-tight ${i === currentPage ? 'text-blue-600 border border-gray-300 rounded-lg bg-[#E9EFFF]' : 'text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800'}  dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white`}
                    aria-current={i === currentPage ? 'page' : undefined}
                >
                    {i}
                </div>
            </li>
        );
    }

    xhtmlStart.push(
        <li onClick={handleClickStart}>
            <div className="flex items-center max-sm:hidden justify-center p-5 m-3 h-8  leading-tight text-gray-500 bg-white border border-e-0 rounded-lg border-gray-300 rounded-s-lg hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">
                Start
            </div>
        </li>
    );
    xhtmlPrevious.push(
        <li onClick={handleClickPrev}>
            <div className="flex items-center justify-center p-5 m-3 h-8  leading-tight text-gray-500 bg-white rounded-lg border border-e-0 border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">
                &#60;
            </div>
        </li>
    );

    xhtmlNext.push(
        <li onClick={handleClickNext}>
            <div className="flex items-center justify-center p-5 m-3 h-8 leading-tight text-white bg-black border rounded-lg border-gray-300hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">
                &#62;
            </div>
        </li>
    );
    xhtmlEnd.push(
        <li onClick={handleClickEnd}>
            <div className="flex max-sm:hidden items-center max-sm:hiden justify-center p-5 m-3 h-8 leading-tight text-white bg-white border border-gray-300 rounded-lg hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">
                End
            </div>
        </li>
    )


    if (max < totalPages) {
        xhtmlPages.push(<li key="end-ellipsis" className='flex items-center justify-center p-5 m-3 h-8 leading-tight text-white bg-white border border-gray-300 rounded-lg hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white'>...</li>);
    }

    let index = (currentPage - 1) * totalItemsPerPage;
    let max_index = totalItemsPerPage;

    let type;

    edit ? type = "radio" : type = "checkbox";

    function getData() {
        let temp = Array(max_index);
        for(let i = 0; i < max_index; i++){
            temp[i] = data[index + i];
        }

        let result = [];
        temp.map((element, index) => {
            if(element){
                result.push(<tr className={`${index % 2 === 0 ? "bg-gray-100" : ""} text-2xl`} key={element.id}>
                    <td className="px-2 size-4 py-2">
                    <input 
                        type="checkbox" 
                        className="size-4 rounded-[50%] cursor-pointer"
                        onChange={() => handleCheckboxChange(index, results, element.id)}
                        checked={checkedItems.includes(element.id)}
                    />
                    </td>
                    <td className="px-2 text-center">{element.id}</td>
                    <td className="px-2">{element.name}</td>
                    <td className="px-2 text-center">{formatPrice(element.gia_goc)}</td>
                    <td className="px-2 text-center">{formatPrice(element.gia)}</td>
                    <td className="px-2 text-center">{element.giam_gia}</td>
                    <td className="checkbox-wrapper-8 flex items-center justify-center">
                        <input className="tgl tgl-skewed" onClick={() => handleStatusChange(element.id)} id={index} checked={element.Status === "Active"} type="checkbox" />
                        <label className="tgl-btn" data-tg-off="InActive" data-tg-on="Active" htmlFor={index}></label>
                    </td>
                    <td className="cursor-pointer text-center" onClick={() => toggleModal(index)}>
                        <FontAwesomeIcon className="size-7" icon={faBars} />
                    </td>
                    {open[index] && (
                        <Modal open={open[index]} onClose={() => toggleModal(index)}>
                            <ul className="w-[500px] text-[30px] text-white">
                                <li className="px-[2%]">Tập: <label className="text-[red]">{element.tap}</label></li>
                                <li className="px-[2%] bg-[#2D2F39]">Tác giả: <label className="text-[red]">{element.tac_gia}</label></li>
                                <li className="px-[2%]">Đối tượng: <label className="text-[red]">{element.doi_tuong}</label></li>
                                <li className="px-[2%] bg-[#2D2F39]">Khuôn khổ: <label className="text-[red]">{element.khuon_kho}</label></li>
                                <li className="px-[2%]">Số trang: <label className="text-[red]">{element.Page}</label></li>
                                <li className="px-[2%] bg-[#2D2F39]">Trọng lượng: <label className="text-[red]">{element.trong_luong}</label></li>
                            </ul>
                        </Modal>
                    )}
                </tr>)
            }else{
                result.push(
                    <tr>
                        <td className="px-2 size-4 py-2">
                            <input type={type} className="size-4 rounded-[50%] cursor-pointer"
                                name="isRadio"
                            />
                        </td>
                        <td className="px-2 py-3">Na/N</td>
                        <td className="px-2 "></td>
                        <td className="px-2 "></td>
                        <td className="px-2 "></td>
                        <td className="px-2 "></td>
                        <td className="px-2 "></td>
                        <td className="px-2 "></td>
                    </tr>
                );
            }
        });
        return result;
    }

    const countStatus = results.reduce((accumulator, item) => {
        if (item.Status === "Active") {
            accumulator.active += 1;
        } else if (item.Status === "Inactive") {
            accumulator.inactive += 1;
        }
        return accumulator;
    }, { active: 0, inactive: 0 });

    return (
        <div className='shadow-lg rounded-lg'>
            <table className="min-w-full border-collapse">
                <thead>
                    <tr className="bg-gray-200">
                        <th className="py-2">
                            <input 
                                type="checkbox" 
                                disabled={edit} 
                                className="size-4 cursor-pointer" 
                                checked={allChecked[currentPage - 1] === true   } 
                                onChange={() => handleCheckAll(index, currentPage - 1, data)} 
                            />
                        </th>                        
                        <th className="py-2">ID</th>
                        <th className="py-2">Name</th>
                        <th className="py-2">Original Price</th>
                        <th className="py-2">Current Price</th>
                        <th className="py-2">Discount</th>
                        <th className="py-2">Status</th>
                        <th className="py-2">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    {getData()}
                </tbody>
            </table>
            
            <div className='flex items-center relative h-[70px] w-full border-t border-[#D0D1D3]'>
                <div className='flex  relative text-[20px] '>
                    <p className='ml-[10px]'> Tổng sản phẩm: {results.length}</p>
                    <p className='ml-[50px]'> Active: {countStatus.active}</p>
                    <p className='ml-[50px]'> Inactive: {countStatus.inactive}</p>
                </div>
                <nav className='absolute right-0'>
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
}

export default PaginationHelper;
