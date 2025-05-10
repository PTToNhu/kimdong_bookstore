import Modal from "./../helper/modal";
import { useState, useEffect, use } from "react";
import { Data } from "./../../BackEnd/getDataOrder";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faBars } from '@fortawesome/free-solid-svg-icons';
import $ from "jquery";
import { useLocation } from 'react-router-dom';
import { faBook } from '@fortawesome/free-solid-svg-icons';
import { faList } from '@fortawesome/free-solid-svg-icons';
import PaginationHelper from "./paginationUser";
import Search from "./search";
import 'swiper/css';
import 'swiper/css/navigation';
import 'swiper/css/pagination';
import 'swiper/css/scrollbar';

export default function Order() {
    const [submittedName, setSubmittedName] = useState('');
    const [submittedGia_goc, setSubmittedGia_goc] = useState('');
    const [submittedGiam_gia, setSubmittedGiam_gia] = useState('');
    const [submittedTap, setSubmittedTap] = useState('');
    const [submittedTac_gia, setSubmittedTac_gia] = useState('');
    const [submittedDoi_tuong, setSubmittedDoi_tuong] = useState('');
    const [submittedKhuon_kho, setSubmittedKhuon_kho] = useState('');
    const [submittedSo_trang, setSubmittedSo_trang] = useState('');
    const [submittedTrong_luong, setSubmittedTrong_luong] = useState('');
    const [action, setAction] = useState(false);
    const [active, setActive] = useState(false);
    const [edit, setEdit] = useState(false);
    const [Delete, setDelete] = useState(false);
    const [InActive, setInActive] = useState(false);
    const [All, setAll] = useState(false);
    const [Use, setUse] = useState("Bulk Action");
    const [status, setStatus] = useState(false);
    const [data, setData] = useState([]);
    let fetchedData = null;
    const [Link, setLink] = useState("/admin/order/All");
    const [checkedItems, setCheckedItems] = useState([]);
    const [allChecked, setAllChecked] = useState([]);
    const [Category, setCategory] = useState(false);
    const [currentCategory, setCurrentCategory] = useState("Tất cả sản phẩm");
    const [index, setIndex] = useState(0);
    const [ID, setID] = useState(0);
    let category = [
        "Tất cả sản phẩm",
        "Lịch sử truyền thống",
        "Văn học Việt Nam",
        "Văn học nước ngoài",
        "Kiến thức, khoa học",
        "Truyện tranh",
        "Wings Books"
    ];

    const [linkCategory, setLinkCategory] = useState(new Array(category.length).fill(false));

    let linkcategory = [
        "tat_ca_san_pham",
        "lich_su_truyen_thong",
        "van_hoc_Viet_Nam",
        "van_hoc_nuoc_ngoai",
        "kien_thuc_khoa_hoc",
        "truyen_tranh",
        "wings_book",
    ];

    const location = useLocation();
    let pathParts = location.pathname;
    pathParts = pathParts.split("/");
    pathParts = pathParts[pathParts.length - 1];

    if (pathParts === "order" || pathParts === "All") {
        fetchedData = Data("All");
    } else if (pathParts === "Active") {
        fetchedData = Data("Active");
    } else if (pathParts === "InActive") {
        fetchedData = Data("InActive");
    }
    const [open, setOpen] = useState(Array(data.length).fill(false));
    useEffect(() => {
        if (fetchedData) {
            setData(fetchedData);
        }
    }, );

    useEffect(() => {
      fetch(`http://localhost/kimdong_bookstore/api/BackEnd/php/getAllUser.php`)
        .then((response) => response.json())
        .then((data) => {
          setData(data);
        })
        .catch((error) => {
          console.error("Error fetching data:", error);
        });
    }, ); 

    console.log(data);

    function getHTML() {
        if (Array.isArray(data) && data.length > 0) {
            return <PaginationHelper data={data}></PaginationHelper>
        } else {
            return <p>No data available</p>;
        }
    }
    const result = getHTML();

    return (
        <div className="container mx-auto">
            <div>
                <p className="bg-[#D9EDF7] py-[15px] pl-[15px] rounded-t-lg flex">List Items</p>
                <div className="border-x-4 border-b-4 pb-[20px] px-[20px] rounded-b-lg border-[#D9EDF7]">
                    <div className="flex h-[80px] items-center relative ">
                        
                    </div>

                    {result}
                </div>
            </div>
        </div>
    );
}