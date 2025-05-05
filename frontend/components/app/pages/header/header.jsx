import logoDark from "./../images/logo.webp";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faList } from '@fortawesome/free-solid-svg-icons';
import { faHeart } from '@fortawesome/free-regular-svg-icons';
import { faBagShopping } from '@fortawesome/free-solid-svg-icons';
import { faBook } from '@fortawesome/free-solid-svg-icons';
import Search from './search'
import React, { useRef, useEffect, useState } from 'react';
import { faUser } from '@fortawesome/free-solid-svg-icons';
import { faChevronDown } from '@fortawesome/free-solid-svg-icons';
import { faBars } from '@fortawesome/free-solid-svg-icons';
import { Navigation, Pagination, Scrollbar, A11y } from 'swiper/modules';
import { Swiper, SwiperSlide } from 'swiper/react';
import './css/style.css';
import 'swiper/css';
import 'swiper/css/navigation';
import 'swiper/css/pagination';
import 'swiper/css/scrollbar';
import { faSquareXmark } from '@fortawesome/free-solid-svg-icons';
import Modal from "./../helper/modal";
import logo from "./../images/logo.webp";
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

const listCategory = category.map((element, index) => {
    if (index !== category.length - 1) {
        return (
            <li key={index} className="border-b  border-black pt-[5px] bg-white hover:text-[red]">
                <FontAwesomeIcon icon={faBook} />
                <a className="pl-[5px] ml-[10px]" href={linkCategory[index] + "?page=1"}>{element}</a>
            </li>
        );
    } else {
        return (
            <li key={index} className="rounded-b-lg border-b border-black pt-[5px] bg-white hover:text-[red]">
                <FontAwesomeIcon icon={faBook} />
                <a className="pl-[5px] ml-[10px]" href={linkCategory[index] + "?page=1"}>{element}</a>
            </li>
        );
    }
});

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



export default function Header(item) {
    const [isVisible, setIsVisible] = useState(true);
    const lastScrollY = useRef(0);
    const [favourite, setFavourite] = useState([]);
    const [listFavourite, setListFavourite] = useState(false);
    const [store, setStore] = useState([]);
    const [listStore, setListStore] = useState(false);
    const resultsRef1 = useRef();
    const resultsRef2 = useRef();
    const resultsRef3 = useRef();
    const [images, setImages] = useState([]);
    const [category, setCategory] = useState(false);
    const [ID, setID] = useState("");
    const [open, setOpen] = useState(false);

    useEffect(() => {
        const storedData = sessionStorage.getItem('user_id');
        if (storedData) {
            setID(storedData);
        }
    }, [ID]);
    
    useEffect(() => {
      async function loadImages() {
        const imagePaths = import.meta.glob('../../BackEnd/php/images/tat_ca_san_pham/**/*.{jpg,jpeg,png,gif,svg,webp}');
        const imagePromises = Object.values(imagePaths).map(importer => importer());
        const loadedImages = await Promise.all(imagePromises);
        setImages(loadedImages.map(module => module.default));
      }
      
      loadImages();
    }, [ID]);

    let imageFavorite = useState([]);
    let imageStore = useState([]);
    const [clickFavorite, setClickFavorite] = useState(Array(favourite.length).fill(false));
    const [clickStore, setClickStore] = useState(Array(store.length).fill(false));
    const getImgFavourite = (img) => {
        let result = [];
        if(favourite.length > 0){
            favourite.forEach(element => {
                const filteredImages = img.filter(ele => {
                    const fileName = ele.split('/');
                    const pathParts = fileName[fileName.length - 1].split("_");
                    return pathParts.includes("0") && pathParts.includes(element.id.toString());
                });
                result.push(filteredImages);
            });
        }
        return result;
    };

    const getImgStore = (img) => {
        let result = [];
        if(store.length > 0)
            store.forEach(element => {
                const filteredImages = img.filter(ele => {
                    const fileName = ele.split('/');
                    const pathParts = fileName[fileName.length - 1].split("_");
                    return pathParts.includes("0") && pathParts.includes(element.id.toString());
                });
                result.push(filteredImages);
            });
        return result;
    };

    function getCookie(name) {
        const value = `; ${document.cookie}`;
        const parts = value.split(`; ${name}=`);
        if (parts.length === 2) return parts.pop().split(';').shift();
    }

    imageFavorite = getImgFavourite(images);
    imageStore = getImgStore(images);


    const fetchDataID = async () => {
        try {
            const response = await fetch(`https://localhost/kimdong_bookstore/frontend/components/app/BackEnd/php/uploads/getAllFavorite.php?phone=${encodeURIComponent(ID)}`);
            const data = await response.json();
            setFavourite(data);
        } catch (error) {
            // console.error("Error fetching favorite status:", error);
        }
    };

    const fetchData = async () => {
        const currentFavorites = getCookie("Favorite");
        const favoritesArray = currentFavorites ? currentFavorites.split(',') : [];
        const temp = [];
        if (favoritesArray.length > 0) {
            const promises = favoritesArray.map(async (element_id) => {
                const response = await fetch(`https://localhost/kimdong_bookstore/frontend/components/app/BackEnd/php/uploads/getdataFromID.php?variable=${encodeURIComponent(element_id)}`);
                const data = await response.json();
                favourite.push(data[0]);
            });
        }
    };
    
    useEffect(() => {
        if(!ID){
            fetchData();
        }else{
            fetchDataID();
        }
    }, [getCookie("Favorite"), ID]);

    useEffect(() => {
        const fetchData = async () => {
          try {
            const response = await fetch(`https://localhost/kimdong_bookstore/frontend/components/app/BackEnd/php/uploads/getAllStore.php?phone=${encodeURIComponent(ID)}`);
            const data = await response.json();
            setStore(data);
          } catch (error) {
            // console.error("Error fetching favorite status:", error);
          }
        };
        fetchData();
    }, );

    useEffect(() => {
        const handleScroll = () => {
            if (window.scrollY > 700) {
                setIsVisible(false);
            } else {
                setIsVisible(true);
            }
            lastScrollY.current = window.scrollY;
        };

        window.addEventListener('scroll', handleScroll);

        return () => {
            window.removeEventListener('scroll', handleScroll);
        };
    }, []);

    

    useEffect(() => {
        const indexFavorite = clickFavorite.findIndex(value => value === true);
        if (indexFavorite !== -1) {
            fetch(`https://localhost/kimdong_bookstore/frontend/components/app/BackEnd/php/uploads/deleteFavorite.php?id=${encodeURIComponent(indexFavorite)}&phone=${encodeURIComponent(ID)}`)
                .then(response => response.json()) 
                .catch(error => console.error('Error fetching data:', error));
                setClickFavorite(prevCheckedItems => {
                    const newCheckedItems = [...prevCheckedItems];
                    newCheckedItems[indexFavorite] = false; 
                    return newCheckedItems;
            });
        }
        const indexStore = clickStore.findIndex(value => value === true);
        if (indexStore !== -1) {
            fetch(`https://localhost/kimdong_bookstore/frontend/components/app/BackEnd/php/uploads/deleteStore.php?id=${encodeURIComponent(indexStore)}&phone=${encodeURIComponent(ID)}`)
                .then(response => response.json()) 
                .catch(error => console.error('Error fetching data:', error));
                setClickStore(prevCheckedItems => {
                    const newCheckedItems = [...prevCheckedItems];
                    newCheckedItems[indexStore] = false; 
                    return newCheckedItems;
            });
        }
    }, [clickFavorite, clickStore]);

    function handleClickFavorite(id) {
        setClickFavorite(prevCheckedItems => {
            const newCheckedItems = [...prevCheckedItems];
            newCheckedItems[id] = true; 
            return newCheckedItems;
        });
    }

    function handleClickStore(id) {
        setClickStore(prevCheckedItems => {
            const newCheckedItems = [...prevCheckedItems];
            newCheckedItems[id] = true; 
            return newCheckedItems;
        });
    }

    function formatPrice(price) {
        return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + 'đ';
    }

    const ListFavourite = () => {
        return (
            <div ref={resultsRef1} className="w-[350px] absolute shadow-2xl p-[4px] mt-[20px] border-2 font-mono border-[#C2C2D9] rounded-sm bg-white text-black right-0 z-150">
            <p className="text-[17px] py-[5px] mb-[5px] flex justify-center items-center bg-[#D51C24] text-white rounded-md"> Danh sách yêu thích của tôi</p>
            <Swiper
                modules={[Navigation, Pagination, Scrollbar, A11y]}
                spaceBetween={0}
                slidesPerView={favourite.length >= 3 ? 3 : favourite.length}
                scrollbar={{ draggable: true }}
                direction="vertical"
                className={`${favourite.length >= 3 ? "h-[450px]" : favourite.length === 2 ? "h-[300px]" : "h-[150px]"} m-0`}
            >
                {favourite.length > 0 && favourite.map((element, index) => (
                    <SwiperSlide className="m-0" key={index}> 
                        <div className="flex">
                            <a className="fit object-cover flex items-center" href={`/Product/tat_ca_san_pham/${element.id}`}>
                                <img className="h-[120px]" src={imageFavorite[index]}></img>
                                <div className="ml-2 w-[210px]">
                                    <p className="text-[14px]">{element.name}</p>
                                    <p className="text-[14px]">Tập: {element.tap}</p>
                                    <p className="text-[14px]">Giá sản phẩm: {formatPrice(element.gia)}</p>
                                </div>
                            </a>
                            <div className="text-[red] cursor-pointer flex items-center" onClick={() => {handleClickFavorite(element.id)}}>x</div>
                        </div>
                    </SwiperSlide>
                ))}
            </Swiper>
            <a className="text-[17px] py-[5px] mb-[5px] flex justify-center items-center bg-[#17AF91] text-white font-bold rounded-sm" href="/main/Favorite?page=1"> Xem thêm</a>
        </div>
        );
    };

    const ListStore = () => {
        return (
            <div ref={resultsRef2} className="w-[350px] absolute shadow-2xl p-[4px] mt-[20px] border-2 font-mono border-[#C2C2D9] rounded-sm bg-white text-black right-0 z-150">
            <p className="text-[14px] py-[5px] mb-[5px] flex bg-[#D51C24] text-white rounded-md p-3"> Giỏ hàng của tôi ({store.length || 0} Sản phẩm)</p>
            <Swiper
                modules={[Navigation, Pagination, Scrollbar, A11y]}
                spaceBetween={0}
                slidesPerView={store.length >= 3 ? 3 : store.length}
                scrollbar={{ draggable: true }}
                direction="vertical"
                className={`${store.length >= 3 ? "h-[450px]" : store.length === 2 ? "h-[300px]" : "h-[150px]"} m-0`}
            >
                {store.length > 0 && store.map((element, index) => (
                    <SwiperSlide className="m-0" key={index}> 
                        <div className="fit object-cover flex items-center" href={`/Product/tat_ca_san_pham/${element.id}`}>
                            <img className="h-[120px]" src={imageStore[index]}></img>
                            <div className="ml-2 w-[210px]">
                                <p className="text-[14px]">{element.name}</p>
                                <p className="text-[14px]">Tập: {element.tap}</p>
                                <p className="text-[14px]">Giá sản phẩm: {formatPrice(element.gia)}</p>
                                <p className="text-[14px]">Số lượng: {element.so_luong}</p>
                            </div>
                            <div className="text-[red] cursor-pointer absolute right-1" onClick={() => {handleClickStore(element.id)}}>x</div>
                        </div>
                    </SwiperSlide>
                ))}
            </Swiper>
            <p className="text-[20px]">Tạm tính: <label className="font-bold text-[red]">{formatPrice(store.length > 0 && store.reduce((accumulator, item) => {
                    return accumulator + Number(item.gia * item.so_luong);
                }, 0))}</label> 
            </p>
            <div className="flex w-full">
                <a className="text-[17px] w-[50%] m-[5px] py-[5px] mb-[5px] flex justify-center items-center bg-[white] text-[red] border border-[red] rounded-sm"> Xem giỏ hàng</a>
                <a
                    className="text-[17px] w-[50%] m-[5px] py-[5px] mb-[5px] flex justify-center items-center font-bold bg-red-500 text-white rounded-sm"
                    href={`/Payment`}
                >
                    Thanh toán
                </a>
            </div>
        </div>
        );
    };

    const handleClickOutside = (event) => {
        if (resultsRef1.current && !resultsRef1.current.contains(event.target)) {
            setListFavourite(false);
        }
        if (resultsRef2.current && !resultsRef2.current.contains(event.target)) {
            setListStore(false);
        }
        if (resultsRef3.current && !resultsRef3.current.contains(event.target)) {
            setCategory(false);
        }
    };
    
    useEffect(() => {
        document.addEventListener('mousedown', handleClickOutside);
        return () => {
            document.removeEventListener('mousedown', handleClickOutside);
        };
    }, []);

    function ClickFavorite(){
        setListFavourite(!listFavourite);
    }

    function ClickStore(){
        setListStore(!listStore);
    }

    function clickCategory(){
        setCategory(!category);
    }

    function deletecookie(name) {
        document.cookie = name + '=; Max-Age=0; path=/'; 
    }
    
    return (
        <div className="z-150">
            <Modal open={open} onClose={() => setOpen(false)}>
                <div className="h-[300px]  z-150 w-[330px] bg-white shadow-lg rounded-2xl">
                    <p className="w-full flex items-center justify-center text-[red] font-bold text-[40px]">Smember</p>
                    <div className="w-full flex items-center justify-center">
                        <img src={logo} alt="" />
                    </div>
                    {!ID && 
                        <div >
                            <p className="text-black text-center">Vui lòng đăng nhập tài khoản Smember để xem ưu đãi và thanh toán dễ dàng hơn.</p>
                            <div className="flex h-[102px] w-full items-center justify-center">
                                <a href="/sign_up" className="cursor-pointer transition-transform transform hover:scale-105 w-[44%] mx-[3%] text-[20px] font-bold text-[red] flex items-center justify-center py-[10px] border-3 rounded-lg border-[red]">Đăng ký</a>
                                <a href="/sign_in" className="cursor-pointer transition-transform transform hover:scale-105 w-[44%] mx-[3%] text-[20px] font-bold text-[white] flex items-center justify-center py-[10px] border-3 bg-[red] rounded-lg border-[red]">Đăng nhập</a>
                            </div>
                        </div>
                    }
                    {ID && 
                        <div>
                            <p className="text-black text-center ">Bạn có muốn đăng xuất ?</p>
                            <div className="flex h-[102px] w-full items-center justify-center">
                                <div onClick={()=>{
                                    sessionStorage.clear();
                                    setID("");
                                    deletecookie("user");
                                    window.location.reload();
                                }} className="cursor-pointer bg-[red] transition-transform transform hover:scale-105 w-full mx-[3%] text-[20px] font-bold text-[white] flex items-center justify-center py-[10px] border-3 rounded-lg border-[red] mt-[50px]">Đăng xuất</div>
                            </div>
                        </div>
                    }
                </div>
            </Modal>
            <header id="yourElementId" className={`fixed z-50 w-full top-0 left-0 transition-transform duration-700 ${isVisible ? 'translate-y-0' : '-translate-y-full'}`}>
                <div className="flex z-50 sm:pl-[100px] max-sm:pl-[30px] bg-[white] items-center">
                    <div className="logo flex items-center">
                        <img src={logoDark} className="h-[50px] my-[10px] mr-[50px]" alt="Logo" />
                    </div>
                    <ul className={`absolute z-100 max-md:hidden block w-[45%] right-[500px]`}>
                        <form className="mr-10 w-full">
                            <Search childWidth={item.childWidth}/>
                        </form>
                    </ul>

                    <ul className="absolute flex p-[30px] pt-[10px] pb-[10px] text-[#009981] text-[20px] right-[3%]">
                        <li className="text-[30px] sm:px-[20px] max-sm:mr-[10px] hover:text-[red] cursor-pointer mx-[5px] sm:relative rounded-lg transition delay-150 duration-300 ease-in-out hover:bg-[#EEFFF7]">
                            <FontAwesomeIcon onClick={ClickFavorite} icon={faHeart} />
                            <div className="max-sm:relative">
                                <p className="absolute top-[0px] max-sm:top-[-50px] h-[25px] w-[25px] flex items-center justify-center rounded-[50%] bg-[red] max-sm:-right-3  right-0 text-white text-[15px]">{favourite.length || 0}</p>
                            </div>
                            {listFavourite && ListFavourite()}
                        </li>
                        <li className="text-[30px] px-[20px] max-sm:mr-[20px] hover:text-[red] cursor-pointer mx-[5px] sm:relative rounded-lg hover:bg-[#EEFFF7]">
                            <FontAwesomeIcon onClick={ClickStore} icon={faBagShopping} />
                            <div className="max-sm:relative">
                                <p className="absolute top-[0px] max-sm:top-[-50px] h-[25px] w-[25px] flex items-center justify-center rounded-[50%] bg-[red] max-sm:-right-3 right-0 text-white text-[15px]">{store.length || 0}</p>
                            </div>
                            {listStore && ListStore()}
                        </li>
                        <li onClick={() => {setOpen(!open);}} className="text-[30px] max-sm:hidden px-[20px] hover:text-[red] cursor-pointer mx-[5px] rounded-lg hover:bg-[#EEFFF7]">
                            <FontAwesomeIcon icon={faUser} />
                        </li>
                    </ul>
                    <ul className="absolute sm:hidden right-[20px] pl-2" onClick={item.handleClickMenu}>
                        <FontAwesomeIcon icon={faBars} />
                    </ul>
                </div>
                
                <div className={`h-[51px] max-sm:hidden w-full bg-[black] flex items-center justify-center transition-transform duration-700 ${isVisible ? 'translate-y-0' : 'translate-y-[50px]'}`}>
                    <div className="flex items-center text-[20px] h-full relative w-[1400px] justify-center">
                        <div ref={resultsRef3} className="flex  items-center w-[300px] absolute left-0 h-full group bg-[#15A78A] ">
                            <i className="px-[15px] rounded-lg " onClick={clickCategory}>
                                <FontAwesomeIcon className="text-[white] font-bold" icon={faList} />
                                <label className="text-white font-normal px-[10px]" style={{ fontStyle: 'normal' }}>Danh mục sản phẩm</label>
                            </i>
                            <ul className="absolute bg-white left-0 w-[300px] text-[23px] top-[50px] px-[15px] items-center hidden group-hover:block">
                                {listCategory}
                            </ul>
                            {category && 
                                <ul className="absolute bg-white left-0 w-[300px] text-[23px] top-[50px] px-[15px] items-center">
                                    {listCategory}
                                </ul>
                            }
                        </div>
                        <ul className="text-white flex text-[20px] max-lg:hidden">
                            <li className="px-[10px] hover:text-[#15A78A] cursor-pointer">HOME <FontAwesomeIcon icon={faChevronDown} /></li>
                            <li className="px-[10px] hover:text-[#15A78A] cursor-pointer">SHOP <FontAwesomeIcon icon={faChevronDown} /></li>
                            <li className="px-[10px] hover:text-[#15A78A] cursor-pointer">PRODUCT <FontAwesomeIcon icon={faChevronDown} /></li>
                            <li className="px-[10px] hover:text-[#15A78A] cursor-pointer">BLOG <FontAwesomeIcon icon={faChevronDown} /></li>
                        </ul>
                        <p className="absolute right-0 text-white font-bold pl-[30px] border-l-2 border-white">Clearance Up to 30% Off</p>
                    </div>
                </div>
            </header>
        </div>
    );
}


