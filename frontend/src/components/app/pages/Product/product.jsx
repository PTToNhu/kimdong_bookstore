import Header from "../header/header";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faHeart as faHeartSolid } from '@fortawesome/free-solid-svg-icons';
import { faHeart as faHeartRegular } from '@fortawesome/free-regular-svg-icons';
import { faStar } from '@fortawesome/free-solid-svg-icons';
import 'swiper/css';
import 'swiper/css/pagination';
import { Swiper, SwiperSlide } from 'swiper/react';
import 'swiper/swiper-bundle.css';
import { Navigation, Pagination, Scrollbar, A11y } from 'swiper/modules';
import { faPlus } from '@fortawesome/free-solid-svg-icons';
import { faMinus } from '@fortawesome/free-solid-svg-icons';
import React, { useState, useRef, useEffect } from 'react';
import bg from './mau-background-dep-3.jpg';
import { useLocation } from 'react-router-dom';
import { useData } from './getData';
import { faChevronDown } from '@fortawesome/free-solid-svg-icons';
import { faChevronUp } from '@fortawesome/free-solid-svg-icons';
import { ChevronUp } from "react-feather";
import { faSquareXmark } from '@fortawesome/free-solid-svg-icons';
import Search from './../header/search'
import Favorite from "../total/Favorite";

let category = [
    "Tất cả sản phẩm",
    "Lịch sử truyền thống",
    "Văn học Việt Nam",
    "Văn học nước ngoài",
    "Kiến thức, khoa học",
    "Truyện tranh",
    "Wings Books"
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

const listCategoryMenu = category.map((element, index) => {
    if (index !== category.length - 1) {
        return (
            <li key={index} className="text-white font-mono pt-[5px] hover:text-[red]">
                <a className="pl-[5px] ml-[10px]" href={linkCategory[index]}>{element}</a>
            </li>
        );
    } else {
        return (
            <li key={index} className="text-white font-mono pt-[5px] hover:text-[red]">
                <a className="pl-[5px] ml-[10px]" href={linkCategory[index]}>{element}</a>
            </li>
        );
    }
});

export default function Product(item) {
    const location = useLocation();
    const [soLuong, setSoLuong] = useState(1);
    const pathParts = location.pathname.split("/").filter(part => part);
    const result = pathParts[pathParts.length - 1];
    const link = pathParts[pathParts.length - 2];
    const importAll = (r) => r.keys().map(r);
    const [index, setIndex] = useState(0);
    const swiperRef = useRef(null);
    const chillSwiperRef = useRef(null);
    const [from, setFrom] = useState(0);
    const [to, setTo] = useState(3);
    const [menu, setMenu] = useState(false);
    const [img, setImages] = useState([]);
    let image = [];
    const [clickStore, setClickStore] = useState(false);

    async function loadAndProcessImages() {
        try {
            let imagePaths = [];
            if (link === "tat_ca_san_pham") {
                imagePaths = import.meta.glob('./../../BackEnd/php/images/tat_ca_san_pham/**/*.{jpg,jpeg,png,gif,svg,webp}');
            } else if (link === "Kien_thuc_khoa_hoc") {
                imagePaths = import.meta.glob('./../../BackEnd/php/images/kien_thuc_khoa_hoc/**/*.{jpg,jpeg,png,gif,svg,webp}');
            } else if (link === "Lich_su_truyen_thong") {
                imagePaths = import.meta.glob('./../../BackEnd/php/images/lich_su_truyen_thong/**/*.{jpg,jpeg,png,gif,svg,webp}');
            } else if (link === "Truyen_tranh") {
                imagePaths = import.meta.glob('./../../BackEnd/php/images/truyen_tranh/**/*.{jpg,jpeg,png,gif,svg,webp}');
            } else if (link === "Van_hoc_nuoc_ngoai") {
                imagePaths = import.meta.glob('./../../BackEnd/php/images/van_hoc_nuoc_ngoai/**/*.{jpg,jpeg,png,gif,svg,webp}');
            } else if (link === "Van_hoc_Viet_Nam") {
                imagePaths = import.meta.glob('./../../BackEnd/php/images/van_hoc_Viet_Nam/**/*.{jpg,jpeg,png,gif,svg,webp}');
            } else if (link === "Wings_book") {
                imagePaths = import.meta.glob('./../../BackEnd/php/images/wings_book/**/*.{jpg,jpeg,png,gif,svg,webp}');
            }
            const imagePromises = Object.values(imagePaths).map(importer => importer());
            const loadedImages = await Promise.all(imagePromises);
            setImages(loadedImages.map(module => module.default));
        } catch (error) {
        }
    }
    
    useEffect(() => {
        loadAndProcessImages();
    }, []);

    img.forEach((element, index) => {
        let parts = element.split("/");
        if (parts.length > 3) {
            let subParts = parts[parts.length - 1].split("_");
            if (subParts.length > 0) {
                if (subParts[0] === result) {
                    if (subParts[0] === result) {
                        image.push(element);
                    }
                }
            }
        }
    });

    const data = useData(image, link, result);
    const element = data[0] || {
        name: 'N/A',
        tap: 'N/A',
        gia: 0,
        gia_goc: 0,
        tac_gia: 'N/A',
        doi_tuong: 'N/A',
        khuon_kho: 'N/A',
        so_trang: 'N/A',
        trong_luong: 0,
    };

    const [favourite, setFavourite] = useState(false);

    function getCookie(name) {
        const value = `; ${document.cookie}`;
        const parts = value.split(`; ${name}=`);
        if (parts.length === 2) return parts.pop().split(';').shift();
    }

    useEffect(() => {
        const fetchData = async () => {
            if(item.ID){
                try {
                    const response = await fetch(`http://localhost/kimdong_bookstore/frontend/src/components/app/BackEnd/php/php/getFavorite.php?id=${encodeURIComponent(element.id)}&phone=${encodeURIComponent(item.ID)}`);
                    const data = await response.json();
                    setFavourite(data.length > 0);
                  } catch (error) {
        
                  }
            }else {
                const currentFavorites = getCookie("Favorite");
                const favoritesArray = currentFavorites ? currentFavorites.split(',') : [];
                const isFavorite = favoritesArray.includes(element.id.toString());
                setFavourite(isFavorite);
            }
        };
        fetchData();
    }, [data]);



    function formatPrice(price) {
        return price;
    }

    function formatGram(price) {
        return price;
    }

    function HandlePlus() {
        setSoLuong(soLuong + 1);
    }

    function HandleMinus() {
        if (soLuong - 1 > 0)
            setSoLuong(soLuong - 1);
    }

    function handleClick(index) {
        setIndex(index);
        if (swiperRef.current) {
            swiperRef.current.slideTo(index);
        }
    }

    function handleUp() {
        if (image.length > 0 && from + to < image.length) {
            if (chillSwiperRef.current) {
                chillSwiperRef.current.slideTo(from + 1);
            }
            setFrom(from + 1);
        }
    }

    function handleDown() {
        if (from > 0) {
            if (chillSwiperRef.current) {
                chillSwiperRef.current.slideTo(from - 1);
            }
            setFrom(from - 1);
        }
    }

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
        window.addEventListener('resize', updateChildWidth);
        return () => {
            window.removeEventListener('resize', updateChildWidth);
        };
    }, []);

    function addFavorite() {
        const currentFavorites = getCookie("Favorite");
        const favoritesArray = currentFavorites ? currentFavorites.split(',') : [];
    
        if (!favoritesArray.includes(element.id)) {
            favoritesArray.push(element.id);
        }else{
            return;
        }
    
        document.cookie = "Favorite=" + favoritesArray.join(',') + "; path=/;";
    }

    function deleteFavorite() {
        const currentFavorites = getCookie("Favorite");
        const favoritesArray = currentFavorites ? currentFavorites.split(',') : [];
        
        const idString = String(element.id);
        
        const updatedFavorites = favoritesArray.filter(id => id !== idString);  
        
        document.cookie = "Favorite=" + updatedFavorites.join(',') + "; path=/;";
    }

    function addStore() {
        const currentStore = getCookie("Store");
        const StoreArray = currentStore ? currentStore.split(',') : [];

        const existingIndex = StoreArray.findIndex(item => item.startsWith(element.id));
    
        if (existingIndex !== -1) {
            StoreArray[existingIndex] = `${element.id}sl(${soLuong})`;
        } else {
            StoreArray.push(`${element.id}sl(${soLuong})`);
        }
        document.cookie = `Store=${decodeURIComponent(StoreArray.join(','))}; path=/;`;
    }

    function handleFavorite(){
        if(item.ID){
            if (favourite) {
                fetch(`http://localhost/kimdong_bookstore/frontend/src/components/app/BackEnd/php/php/deleteFavorite.php?id=${encodeURIComponent(element.id)}&phone=${encodeURIComponent(item.ID)}`)
                setFavourite(false);
            } else {
                fetch(`http://localhost/kimdong_bookstore/frontend/src/components/app/BackEnd/php/php/favorite.php?id=${encodeURIComponent(element.id)}&phone=${encodeURIComponent(item.ID)}`)
                setFavourite(true);
            }
        }else{
            if (favourite) {
                deleteFavorite();
                setFavourite(false);
            } else {
                addFavorite();
                setFavourite(true);
            }
        }
    }

    function addToStore(){
        setClickStore(!clickStore);
        if(item.ID){
            fetch(`http://localhost/kimdong_bookstore/frontend/src/components/app/BackEnd/php/php/store.php?&id=${encodeURIComponent(element.id)}&sl=${soLuong}&phone=${encodeURIComponent(item.ID)}`);
        }else{
            addStore();
        }
    }

    function formatPrice(price) {
        return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + 'đ';
    }

    function formatGram(price) {
        return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    }

    function handleClickX() {
        setMenu(false);
    }

    function handleClickMenu() {
        setMenu(true);
    }

    return (
        <div className="h-[2000px] bg-cover w-[100%] bg-center"
            ref={parentRef}
            style={{
                backgroundImage: window.innerWidth >= 1024 ? `url(${bg})` : 'none',
                backgroundAttachment: 'fixed ',
            }}
        >
            <Header childWidth={childWidth} clickFavorite={favourite} clickStore={clickStore}  ID={item.ID} menu={menu} handleClickMenu={handleClickMenu}/>
            <div className={`fixed bg-black md:hidden z-150 h-screen opacity-80 w-[300px] top-0 transition-transform duration-700 delay-150 right-0 ${menu ? 'translate-x-0' : 'translate-x-[500px]'}`}>
                <p className="absolute right-[10px] top-[10px]">
                    <FontAwesomeIcon 
                        className="text-[30px] text-red-500" 
                        onClick={handleClickX} 
                        icon={faSquareXmark} 
                    />
                </p>
                <div className="mt-[70px] md:hidden">
                    <Search></Search>
                    <ul className="text-[20px]">
                        {listCategoryMenu}
                    </ul>
                </div>
            </div>
            <div className="bg-cover max-sm:mt-[0px] mt-[70px] bg-center h-screen w-[100%] max-lg:pt-[100px] lg:px-[30px] container mx-auto flex justify-center bg-[white]">
                <div className="w-[100%] flex justify-center lg:mt-[110px] content-center max-lg:block">
                    {window.innerWidth < 1024 && (
                        <div className="flex"> 
                            <div className="w-[10%] max-lg:w-[20%] h-[715px] relative max-sm:hidden">
                            <Swiper
                                modules={[A11y]}
                                spaceBetween={30}
                                slidesPerView={3}
                                onSwiper={(swiper) => (chillSwiperRef.current = swiper)}
                                direction="vertical"
                                className="max-xl:h-[715px]"
                            >
                                <div className="flex w-full absolute top-0 z-20 cursor-pointer justify-center" onClick={handleDown}>
                                    <FontAwesomeIcon className="flex justify-center items-center text-white bottom-0 h-[30px] w-[30px] cursor-pointer bg-opacity-50 bg-[red]" icon={faChevronUp} />
                                </div>
                                {image.map((img, index) => {
                                    return (
                                        <SwiperSlide>
                                            <div className={`relative transition-transform duration-500 ${index === 0 ? 'slide-up' : ''}`}>
                                                <img
                                                    className="w-full object-contain mb-[20px] cursor-pointer"
                                                    onClick={() => handleClick(index)}
                                                    src={img}
                                                    alt={`Image ${index}`}
                                                />
                                                <p className="absolute top-0 text-white h-[30px] w-[30px] bg-[#77CBDE] font-bold flex items-center justify-center">{index + 1}</p>
                                            </div>
                                        </SwiperSlide>
                                    );
                                })}
                                <div className="flex w-full z-50 absolute bottom-0 justify-center" onClick={handleUp}>
                                    <FontAwesomeIcon className="flex justify-center items-center text-white bottom-0 h-[30px] w-[30px] cursor-pointer bg-opacity-50 bg-[red]" icon={faChevronDown} />
                                </div>
                            </Swiper>
                            <p className="w-full flex justify-center items-center font-bold text-[red]">từ {from + 1} đến {from + to}</p>
                        </div>
                        <Swiper
                            spaceBetween={30}
                            centeredSlides={true}
                            navigation={true}
                            modules={[Navigation, Pagination]}
                            className="lg:w-[39%] sm:w-[70%] lg:h-[715px] max-lg:h-[600px] max-sm:w-[90%] max-sm:h-[400px]"
                            onSwiper={(swiper) => (swiperRef.current = swiper)}
                            pagination={{ clickable: true }}
                        >
                            {image.map((img, ind) => (
                                <SwiperSlide key={ind} className="flex content-center relative items-center justify-center">
                                    <img className="w-full object-contain size-full" src={img} />
                                </SwiperSlide>
                            ))}
                        </Swiper>
                    </div>
                    )}
                    {window.innerWidth >= 1024 && (
                        <div className="w-[10%] max-lg:w-[20%] h-[715px] relative">
                            <Swiper
                                modules={[Scrollbar, A11y]}
                                spaceBetween={30}
                                slidesPerView={3}
                                onSwiper={(swiper) => (chillSwiperRef.current = swiper)}
                                direction="vertical"
                                className="xl:h-[715px] max-xl:h-[500px]"
                            >
                                <div className="flex w-full absolute top-0 z-20 cursor-pointer justify-center" onClick={handleDown}>
                                    <FontAwesomeIcon className="flex justify-center items-center text-white bottom-0 h-[30px] w-[30px] cursor-pointer bg-opacity-50 bg-[red]" icon={faChevronUp} />
                                </div>
                                {image.map((img, index) => {
                                    return (
                                        <SwiperSlide>
                                            <div className={`relative transition-transform duration-500 ${index === 0 ? 'slide-up' : ''}`}>
                                                <img
                                                    className="w-full object-contain mb-[20px] cursor-pointer"
                                                    onClick={() => handleClick(index)}
                                                    src={img}
                                                    alt={`Image ${index}`}
                                                />
                                                <p className="absolute top-0 text-white h-[30px] w-[30px] bg-[#77CBDE] font-bold flex items-center justify-center">{index + 1}</p>
                                            </div>
                                        </SwiperSlide>
                                    );
                                })}
                                <div className="flex w-full z-50 absolute bottom-0 justify-center" onClick={handleUp}>
                                    <FontAwesomeIcon className="flex justify-center items-center text-white bottom-0 h-[30px] w-[30px] cursor-pointer bg-opacity-50 bg-[red]" icon={faChevronDown} />
                                </div>
                            </Swiper>
                            <p className="w-full flex justify-center items-center font-bold text-[red]">từ {from + 1} đến {from + to}</p>
                        </div>
                         )}
                        {window.innerWidth >= 1024 && (
                        <Swiper
                            spaceBetween={30}
                            centeredSlides={true}
                            navigation={true}
                            modules={[Navigation, Pagination]}
                            className="lg:w-[39%] sm:w-[70%] 2xl:h-[715px] xl:h-[600px] max-xl:h-[500px] max-sm:w-[90%] max-sm:mt-[5%]"
                            onSwiper={(swiper) => (swiperRef.current = swiper)}
                            pagination={{ clickable: true }}
                        >
                            {image.map((img, ind) => (
                                <SwiperSlide key={ind} className="flex content-center relative items-center justify-center">
                                    <img className="w-full object-contain size-full" src={img} />
                                </SwiperSlide>
                            ))}
                        </Swiper>
                    )}
                    <div className="lg:w-[50%] max-lg:mt-[30px] max-lg:w-[100%] font-mono h-[715px] lg:pl-[20px] max-lg:px-[20px] rounded-3xl block relative max-lg:text-[14px]">
                        <div className="items-center break-words">
                            <div className="break-words font-sans-serif">
                                <label className="sm:text-[30px] max-sm:text-[20px] block break-words">
                                    {element.name}
                                </label>

                                <label className="mt-0 sm:text-[30px] max-sm:text-[20px]  block">
                                    Tập: {element.tap}
                                </label>
                                <div className="flex items-center">
                                    <div>
                                        <label className="sm:text-[25px] max-sm:text-[14px]">Rating: </label>
                                        <span className={"text-yellow-500"}>
                                            <FontAwesomeIcon icon={faStar} />
                                        </span>
                                        <label className="sm:text-[25px] max-sm:text-[14px]">{" | " + 10 + " đánh giá"} </label>
                                        <p className="sm:text-[25px] max-sm:text-[14px]">Đã bán: 100</p>
                                    </div>
                                    <p onClick={handleFavorite} className="cursor-pointer sm:text-[30px] max-sm:text-[20px] pr-[50px] absolute right-0"><FontAwesomeIcon icon={favourite ? faHeartSolid : faHeartRegular} /></p>
                                </div>
                            </div>
                        </div>
                        
                        <div className="relative">
                            <div>
                                <div className="border-t-2 border-black w-full my-2"></div>
                                <div className="2xl:flex ">
                                    <div className="flex">
                                        <div >
                                            <label className="text-[red] sm:text-[25px] max-sm:text-[14px] mr-[30px]"><strong>{formatPrice((parseInt(element.gia)))}</strong></label>
                                        </div>
                                        <div >
                                            <label className="text-gray-400 max-2xl:absolute max-2xl:right-0 sm:text-[25px] max-sm:text-[14px] line-through" id="original-price"><strong>{formatPrice(parseInt(element.gia_goc))}</strong></label>
                                        </div>
                                    </div>
                                    <div >
                                        <label className="sm:text-[25px] max-sm:text-[14px] right-0 2xl:absolute xl:block lg:block" id="original-price"><strong>Bạn đã tiết kiệm được {formatPrice(parseInt(element.gia_goc) - (parseInt(element.gia)))}</strong></label>
                                    </div>
                                </div>
                                <div>
                                </div>
                                <div className="border-t-2 border-black w-full mt-2"></div>
                                <li>
                                    <label className="sm:text-[30px] max-sm:text-[20px]">Tác giả: <strong className="text-[red]">{element.tac_gia}</strong></label>
                                </li>
                                <li>
                                    <label className="sm:text-[30px] max-sm:text-[20px]">Đối tượng: <strong className="text-[red]">{element.doi_tuong}</strong></label>
                                </li>
                                <li>
                                    <label className="sm:text-[30px] max-sm:text-[20px]">Khuôn khổ: <strong className="text-[red]">{element.khuon_kho}</strong></label>
                                </li>
                                <li>
                                    <label className="sm:text-[30px] max-sm:text-[20px]">Số trang: <strong className="text-[red]">{element.so_trang}</strong></label>
                                </li>
                                <li>
                                    <label className="sm:text-[30px] max-sm:text-[20px]">Trọng lượng: <strong className="text-[red]">{formatGram(element.trong_luong)} gram</strong></label>
                                </li>
                            </div>
                            <div className="left-[72%] xl:translate-y-[40px] xl:-translate-x-[20px] transform- top-[130px] xl:absolute lg:block lg:mt-[20px] max-lg:block max-lg:w-[100%] ">
                                <p className="sm:text-[30px] max-sm:text-[20px]">Số lượng</p>
                                <ul className="flex border border-[#8A8C91] xl:w-[200px] lg:w-[100%] h-[50px] mt-[20px] max-lg:w-[100%]">
                                    <li className="w-[25%] flex items-center justify-center border border-[#8A8C91] cursor-pointer" onClick={HandleMinus}>
                                        <FontAwesomeIcon icon={faMinus} />
                                    </li>
                                    <li className="w-[50%] flex items-center justify-center border border-[#8A8C91]">
                                        <input
                                            value={soLuong}
                                            onChange={(e) => setSoLuong(Number(e.target.value) || 0)}
                                            className="w-[100%] text-[30px] text-center border bg-[#F4F4F4] h-full border-[#8A8C91] form-control outline-none flex items-center justify-center"
                                            style={{ border: 'none' }}
                                        />
                                    </li>
                                    <li className="w-[25%] flex items-center justify-center border border-[#8A8C91] cursor-pointer" onClick={HandlePlus}>
                                        <FontAwesomeIcon icon={faPlus} />
                                    </li>
                                </ul>
                                <p onClick={addToStore} className="bg-[#FF4086] rounded-lg text-white mt-[20px] py-4 flex text-center justify-center items-center cursor-pointer transition duration-300 ease-in-out hover:-translate-y-1 hover:scale-110 hover:bg-[#FF0000]">THÊM VÀO GIỎ HÀNG</p>
                                <a href={`/Payment/${element.id}_${soLuong}` } className="bg-[#28DD3B] rounded-lg text-white mt-[20px] py-4 flex text-center justify-center items-center cursor-pointer transition duration-300 ease-in-out hover:-translate-y-1 hover:scale-110 hover:bg-[#007F00]">MUA NGAY</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}



