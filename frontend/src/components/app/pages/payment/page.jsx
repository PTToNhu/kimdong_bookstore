"use client";
import React, { useRef, useEffect, useState } from "react";
import { Check } from "lucide-react";
import momoIcon from "./icons/momo_square_pinkbg.svg";
import zalopayIcon from "./icons/zalopay.svg";
import vnpayIcon from "./icons/vnpay.svg";
import { CreditCard, CircleCheck } from "lucide-react";
import paypalIcon from "./icons/paypal.svg";
import { CustomButton } from "../components/common/CustomButton";
import Header from "../header/header";
import Modal from "../helper/modal";
import { Navigation, Pagination, Scrollbar, A11y } from "swiper/modules";
import { Swiper, SwiperSlide } from "swiper/react";
import "swiper/css";
import "swiper/css/navigation";
import "swiper/css/pagination";
import "swiper/css/scrollbar";
import axios from "axios";
import { data, useLocation } from "react-router-dom";

const SelectMethodPage = (item) => {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [address, setAddress] = useState("");
  const [phone, setPhone] = useState("");
  const [paymentMethod, setPaymentMethod] = useState("Cash");
  const totalAmount = 115500;
  const [store, setStore] = useState([]);
  let imageStore = useState([]);
  const [images, setImages] = useState([]);
  const [clickStore, setClickStore] = useState(Array(store.length).fill(false));
  const [selectedCommune, setSelectedCommune] = useState("");
  const [cities, setCities] = useState([]);
  const [districts, setDistricts] = useState([]);
  const [wards, setWards] = useState([]);
  const [selectedCity, setSelectedCity] = useState("");
  const [selectedDistrict, setSelectedDistrict] = useState("");
  const [selectedWard, setSelectedWard] = useState("");
  const [selectedMethod, setSelectedMethod] = useState("momo");
  const [open, setOpen] = useState(false);
  const location = useLocation();
  const pathParts = location.pathname.split("/").filter((part) => part);
  const id = pathParts[pathParts.length - 1].split("_")[0];
  const so_luong = pathParts[pathParts.length - 1].split("_")[1];

  const paymentMethods = [
    {
      id: "momo",
      label: "MoMo",
      icon: <img src={momoIcon} width={32} height={32} alt="momo" />,
    },
    {
      id: "vnpay",
      label: "VNPAY",
      icon: <img src={vnpayIcon} className="w-8 h-8" alt="vnpay" />,
    },
    {
      id: "zalopay",
      label: "ZaloPay",
      icon: <img src={zalopayIcon} className="w-8 h-8" alt="zalopay" />,
    },
    {
      id: "card",
      label: "Credit Card",
      icon: <CreditCard className="w-8 h-8 text-blue-500" />,
    },
    {
      id: "paypal",
      label: "PayPal",
      icon: <img src={paypalIcon} className="w-8 h-8" alt="paypal" />,
    },
  ];
  // console.log(item.ID);
  useEffect(() => {
    const fetchData = async () => {
      const response = await axios.get(
        "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json"
      );
      setCities(response.data);
    };
    fetchData();
  }, []);

  const handleCityChange = (e) => {
    const cityId = e.target.value;
    setSelectedCity(cityId);
    setDistricts(
      cityId ? cities.find((city) => city.Id === cityId).Districts : []
    );
    setWards([]);
    setSelectedDistrict("");
  };

  const handleDistrictChange = (e) => {
    const districtId = e.target.value;
    setSelectedDistrict(districtId);
    if (districtId) {
      const selectedDistrictData = districts.find(
        (district) => district.Id === districtId
      );
      setWards(selectedDistrictData.Wards);
    } else {
      setWards([]);
    }
  };

  const handleWardChange = (e) => {
    const wardId = e.target.value;
    setSelectedWard(wardId);
  };

  function getCookie(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) return parts.pop().split(";").shift();
  }

  useEffect(() => {
    async function loadImages() {
      const imagePaths = import.meta.glob(
        "../../BackEnd/php/images/tat_ca_san_pham/**/*.{jpg,jpeg,png,gif,svg,webp}"
      );
      const imagePromises = Object.values(imagePaths).map((importer) =>
        importer()
      );
      const loadedImages = await Promise.all(imagePromises);
      setImages(loadedImages.map((module) => module.default));
    }
    loadImages();
  }, []);

  const getImgStore = (img) => {
    let result = [];
    if (store.length > 0)
      store.forEach((element) => {
        const filteredImages = img.filter((ele) => {
          const fileName = ele.split("/");
          const pathParts = fileName[fileName.length - 1].split("_");
          return (
            pathParts.includes("0") && pathParts.includes(element.id.toString())
          );
        });
        result.push(filteredImages);
      });
    return result;
  };

  imageStore = getImgStore(images);

  //   useEffect(() => {
  //     const fetchData = async () => {
  //       try {
  //         let response;
  //         if (!isNaN(parseFloat(id))) {
  //           const url = `http://localhost/kimdong_bookstore/frontend/src/components/app/BackEnd/php/php/Data.php?&url=tat_ca_san_pham&variable=${encodeURIComponent(
  //             id
  //           )}`;
  //           response = await fetch(url);
  //         } else {
  //           const url = `http://localhost/kimdong_bookstore/frontend/src/components/app/BackEnd/php/php/getAllStore.php?phone=${encodeURIComponent(
  //             item.ID
  //           )}`;
  //           response = await fetch(url);
  //         }

  //         if (!response.ok) {
  //           throw new Error(`HTTP error! status: ${response.status}`);
  //         }

  //         const data = await response.json();
  //         setStore(data);
  //       } catch (error) {
  //         console.error("Error fetching data:", error);
  //       }
  //     };

  //     fetchData();
  //   });

  const fetchDataStore = async () => {
    try {
      const response = await fetch(
        `http://localhost/kimdong_bookstore/frontend/src/components/app/BackEnd/php/php/getAllStore.php?phone=${encodeURIComponent(
          item.ID
        )}`
      );
      const data = await response.json();
      setStore(data);
    } catch (error) {}
  };

  const fetchDataStoreCookie = async () => {
    const currentStore = getCookie("Store");
    const storeArray = currentStore ? currentStore.split(",") : [];
    const store = [];
    const regex = /(\d+)sl\((\d+)\)/;
    if (storeArray.length > 0) {
      const promises = storeArray.map(async (element) => {
        const match = element.match(regex);
        if (match) {
          const id = match[1];
          const response = await fetch(
            `http://localhost/kimdong_bookstore/frontend/src/components/app/BackEnd/php/php/getdataFromID.php?variable=${encodeURIComponent(
              id
            )}`
          );
          if (!response.ok) {
            throw new Error(`Error fetching data for ID ${id}`);
          }
          const data = await response.json();
          data[0].so_luong = match[2];
          store.push(data[0]);
        } else {
          console.warn(`Không tìm thấy dữ liệu cho phần tử: ${element}`);
        }
      });

      await Promise.all(promises);
    }

    setStore(store);
    return store;
  };

  const fetchDataID = async () => {
    try {
      const url = `http://localhost/kimdong_bookstore/frontend/src/components/app/BackEnd/php/php/Data.php?&url=tat_ca_san_pham&variable=${encodeURIComponent(
        id
      )}`;
      let response = await fetch(url);

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      const data = await response.json();
      setStore(data);
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  };

  useEffect(() => {
    if (!isNaN(parseFloat(id))) {
      fetchDataID();
    } else if (!item.ID) {
      fetchDataStoreCookie();
    } else {
      fetchDataStore();
    }
  }, [getCookie("Store"), item.ID]);

  function formatPrice(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "đ";
  }

  useEffect(() => {
    const indexStore = clickStore.findIndex((value) => value === true);
    if (indexStore !== -1) {
      fetch(
        `http://localhost/kimdong_bookstore/frontend/src/components/app/BackEnd/php/php/deleteStore.php?id=${encodeURIComponent(
          indexStore
        )}`
      )
        .then((response) => response.json())
        .catch((error) => console.error("Error fetching data:", error));
      setClickStore((prevCheckedItems) => {
        const newCheckedItems = [...prevCheckedItems];
        newCheckedItems[indexStore] = false;
        return newCheckedItems;
      });
    }
  }, [clickStore]);

  function handleClickStore(id) {
    setClickStore((prevCheckedItems) => {
      const newCheckedItems = [...prevCheckedItems];
      newCheckedItems[id] = true;
      return newCheckedItems;
    });
  }

  let price =
    store.length > 0 &&
    store.reduce((accumulator, item) => {
      if (!isNaN(parseFloat(id))) {
        return accumulator + Number(item.gia * so_luong);
      } else {
        return accumulator + Number(item.gia * item.so_luong);
      }
    }, 0);

  function HandleClick() {
    const city = cities.find((city) => city.Id === selectedCity).Name;
    const district = districts.find(
      (district) => district.Id === selectedDistrict
    ).Name;
    const ward = wards.find((ward) => ward.Id === selectedWard).Name;

    if (
      !name ||
      !email ||
      !address ||
      !phone ||
      !selectedCity ||
      !selectedDistrict ||
      !selectedWard
    ) {
      alert("Vui lòng điền đầy đủ thông tin!");
      return;
    }

    let book = "{";
    const bookEntries = store.map(
      (item) =>
        `id: ${item.id}(số lượng: ${item.so_luong ? item.so_luong : so_luong})`
    );
    book += bookEntries.join(",") + "}";

    let price =
      store.length > 0
        ? store.reduce((accumulator, item) => {
            return (
              accumulator +
              Number(item.gia) * (item.so_luong ? item.so_luong : so_luong)
            );
          }, 0)
        : 0;

    const url = `http://localhost/kimdong_bookstore/frontend/src/components/app/BackEnd/php/php/order.php?ho_va_ten=${encodeURIComponent(
      name
    )}&email=${encodeURIComponent(email)}&phone=${encodeURIComponent(
      phone
    )}&dia_chi=${encodeURIComponent(address)}&thanh_pho=${encodeURIComponent(
      city
    )}&huyen=${encodeURIComponent(district)}&xa=${encodeURIComponent(
      ward
    )}&total=${price}&book=${encodeURIComponent(book)}`;
    fetch(url)
      .then((response) => {
        if (!response.ok) {
          throw new Error("Network response was not ok");
        }
        return response.json();
      })
      .then((data) => {
        console.log("Order submitted successfully:", data);
        alert("Đặt hàng thành công!");
      })
      .catch((error) => {
        console.error("There was a problem with the fetch operation:", error);
        alert("Có lỗi xảy ra, vui lòng thử lại!");
      });
  }

  return (
    <div className="z-0">
      <Header ID={item.ID}></Header>
      <div className="md:h-screen w-full md:flex max-md:mt-[150px] max-sm:mt-[100px] items-center justify-center z-0">
        <div className="xl:pr-[50px] max-md:hidden xl:w-[50%] max-xl:w-full">
          <div className="flex flex-col md:flex-row p-6 justify-end">
            <div className="w-full xl:w-3/4 p-4 border rounded-lg">
              <h2 className="text-xl font-bold mb-4">Nhà xuất bản Kim Đồng</h2>
              <h3 className="text-lg mb-2">Thông tin thanh toán</h3>
              <form>
                <div className="mb-4">
                  <label className="block text-sm font-medium mb-1">
                    Họ và tên
                  </label>
                  <input
                    type="text"
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                    className="border rounded-lg w-full p-2"
                    placeholder="Nhập họ và tên"
                  />
                </div>

                <div className="mb-4 flex">
                  <div className="w-[60%]">
                    <label className="block text-sm font-medium mb-1">
                      Email
                    </label>
                    <input
                      type="email"
                      value={email}
                      onChange={(e) => setEmail(e.target.value)}
                      className="border rounded-lg w-full p-2"
                      placeholder="Nhập email"
                    />
                  </div>
                  <div className="w-[40%] ml-[30px]">
                    <label className="block text-sm font-medium mb-1">
                      Điện thoại
                    </label>
                    <input
                      type="email"
                      value={phone}
                      onChange={(e) => setPhone(e.target.value)}
                      className="border rounded-lg w-full p-2"
                      placeholder="Nhập điện thoại"
                    />
                  </div>
                </div>

                <div className="mb-4">
                  <label className="block text-sm font-medium mb-1">
                    Địa chỉ
                  </label>
                  <input
                    type="text"
                    value={address}
                    onChange={(e) => setAddress(e.target.value)}
                    className="border rounded-lg w-full p-2"
                    placeholder="Nhập địa chỉ"
                  />
                </div>
                <div>
                  <select
                    className="form-select w-[30%] mb-3 px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring focus:ring-blue-500"
                    id="city"
                    value={selectedCity}
                    onChange={handleCityChange}
                  >
                    <option value="">Chọn tỉnh thành</option>
                    {cities.map((city) => (
                      <option key={city.Id} value={city.Id}>
                        {city.Name}
                      </option>
                    ))}
                  </select>

                  <select
                    className="form-select w-[30%] mx-[5%] mb-3 px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring focus:ring-blue-500"
                    id="district"
                    value={selectedDistrict}
                    onChange={handleDistrictChange}
                  >
                    <option value="">Chọn quận huyện</option>
                    {districts.map((district) => (
                      <option key={district.Id} value={district.Id}>
                        {district.Name}
                      </option>
                    ))}
                  </select>

                  <select
                    className="form-select w-[30%] mb-3 px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring focus:ring-blue-500"
                    id="ward"
                    value={selectedWard}
                    onChange={handleWardChange}
                  >
                    <option value="">Chọn phường xã</option>
                    {wards.map((ward) => (
                      <option key={ward.Id} value={ward.Id}>
                        {ward.Name}
                      </option>
                    ))}
                  </select>
                </div>
                <div className="flex w-full justify-end">
                  <div
                    onClick={() => {
                      setOpen(true);
                    }}
                    className="bg-blue-500 text-white rounded-lg py-2 px-4 cursor-pointer"
                  >
                    Phương thức thanh toán
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
        <div className="border-r-2 max-md:hidden md:h-full"></div>
        <div className="lg:pl-[50px] md:pl-[20px] max-md:pl-[20px] md:h-full flex items-center ">
          <div className="max-md:flex max-sm:hidden">
            <Swiper
              modules={[Navigation, Pagination, Scrollbar, A11y]}
              spaceBetween={0}
              slidesPerView={3}
              scrollbar={{ draggable: store.length > 3 ? true : false }}
              direction="vertical"
              className={`${
                store.length >= 3
                  ? "h-[450px]"
                  : store.length === 2
                  ? "h-[300px]"
                  : "h-[150px]"
              } m-0 md:w-[350px] lg:w-[550px] xl:600px max-md:w-[470px] max-sm:hidden`}
            >
              {store.length > 0 &&
                store.map((element, index) => (
                  <SwiperSlide className="m-0" key={index}>
                    <div
                      className="w-[300px] flex items-center"
                      href={`/Product/tat_ca_san_pham/${element.id}`}
                    >
                      <img className="h-[130px]" src={imageStore[index]}></img>
                      <div className="ml-2 w-[160px]">
                        <p className="text-[20px] w-[300px]">{element.name}</p>
                        <p className="text-[14px] w-[300px]">
                          Tập: {element.tap}
                        </p>
                        <p className="text-[14px] w-[300px]">
                          Giá sản phẩm: {formatPrice(element.gia)}
                        </p>
                        <p className="text-[14px] w-[300px]">
                          Số lượng: {element.so_luong}
                        </p>
                      </div>
                      <div
                        className="text-[red] text-4xl cursor-pointer absolute right-5"
                        onClick={() => {
                          handleClickStore(element.id);
                        }}
                      >
                        x
                      </div>
                    </div>
                  </SwiperSlide>
                ))}
            </Swiper>
            <div className="max-md:absolute right-10">
              <p>Phí ship: 30.000</p>
              <p className="text-[20px]">
                Tạm tính:{" "}
                <label className="font-bold text-[red]">
                  {" "}
                  {formatPrice(price)}
                </label>
                <p className="w-full border-t-2 border-black">
                  Tổng tiền:
                  <label className="font-bold text-[red]">
                    {formatPrice(price)}
                  </label>
                </p>
              </p>
            </div>
          </div>
        </div>
      </div>
      <div className="px-6 md:hidden">
        <p>Phí ship: 30.000</p>
        <p className="text-[20px]">
          Tạm tính:{" "}
          <label className="font-bold text-[red]"> {formatPrice(price)}</label>
          <p className="w-full border-t-2 border-black">
            Tổng tiền:
            <label className="font-bold text-[red]">{formatPrice(price)}</label>
          </p>
        </p>
      </div>
      <div className="xl:pr-[50px] md:hidden xl:w-[50%] max-xl:w-full">
        <div className="flex flex-col md:flex-row p-6 justify-end">
          <div className="w-full xl:w-3/4 p-4 border rounded-lg">
            <h2 className="text-xl font-bold mb-4">Nhà xuất bản Kim Đồng</h2>
            <h3 className="text-lg mb-2">Thông tin thanh toán</h3>
            <form>
              <div className="mb-4">
                <label className="block text-sm font-medium mb-1">
                  Họ và tên
                </label>
                <input
                  type="text"
                  value={name}
                  onChange={(e) => setName(e.target.value)}
                  className="border rounded-lg w-full p-2"
                  placeholder="Nhập họ và tên"
                />
              </div>

              <div className="mb-4 sm:flex">
                <div className="sm:w-[60%] max-sm:w-full">
                  <label className="block text-sm font-medium mb-1">
                    Email
                  </label>
                  <input
                    type="email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    className="border rounded-lg w-full p-2"
                    placeholder="Nhập email"
                  />
                </div>
                <div className="w-[40%] max-sm:mt-4 max-sm:w-full sm:ml-[30px]">
                  <label className="block text-sm font-medium mb-1">
                    Điện thoại
                  </label>
                  <input
                    type="email"
                    value={phone}
                    onChange={(e) => setPhone(e.target.value)}
                    className="border rounded-lg w-full p-2"
                    placeholder="Nhập điện thoại"
                  />
                </div>
              </div>

              <div className="mb-4">
                <label className="block text-sm font-medium mb-1">
                  Địa chỉ
                </label>
                <input
                  type="text"
                  value={address}
                  onChange={(e) => setAddress(e.target.value)}
                  className="border rounded-lg w-full p-2"
                  placeholder="Nhập địa chỉ"
                />
              </div>
              <div>
                <select
                  className="form-select w-[30%] max-sm:w-full mb-3 px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring focus:ring-blue-500"
                  id="city"
                  value={selectedCity}
                  onChange={handleCityChange}
                >
                  <option value="">Chọn tỉnh thành</option>
                  {cities.map((city) => (
                    <option key={city.Id} value={city.Id}>
                      {city.Name}
                    </option>
                  ))}
                </select>

                <select
                  className="form-select w-[30%] max-sm:w-full sm:mx-[5%] mb-3 px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring focus:ring-blue-500"
                  id="district"
                  value={selectedDistrict}
                  onChange={handleDistrictChange}
                >
                  <option value="">Chọn quận huyện</option>
                  {districts.map((district) => (
                    <option key={district.Id} value={district.Id}>
                      {district.Name}
                    </option>
                  ))}
                </select>

                <select
                  className="form-select w-[30%] max-sm:w-full mb-3 px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring focus:ring-blue-500"
                  id="ward"
                  value={selectedWard}
                  onChange={handleWardChange}
                >
                  <option value="">Chọn phường xã</option>
                  {wards.map((ward) => (
                    <option key={ward.Id} value={ward.Id}>
                      {ward.Name}
                    </option>
                  ))}
                </select>
              </div>
              <div className="flex w-full justify-end">
                <div
                  onClick={() => {
                    setOpen(true);
                  }}
                  className="bg-blue-500 text-white rounded-lg py-2 px-4 cursor-pointer"
                >
                  Phương thức thanh toán
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
      <Modal open={open} onClose={() => setOpen(false)}>
        <div className="p-6 flex items-center justify-center bg-gray-100">
          <div className="max-w-4xl rounded-xl shadow-md p-4 bg-white flex flex-col md:flex-row items-start gap-4">
            <div className="w-full md:w-1/2 rounded-md space-y-3 max-h-[50vh] overflow-y-auto relative">
              <h2 className="text-center text-xl font-semibold mb-3 bg-white text-gray-900 sticky top-0 z-10">
                Choose your payment method
              </h2>
              {paymentMethods.map((method) => (
                <div key={method.id} className="space-y-2">
                  <label
                    key={method.id}
                    htmlFor={method.id}
                    className={`w-full flex items-center gap-3 p-3 border rounded-md cursor-pointer transition-all ${
                      selectedMethod === method.id
                        ? "border-red-500 bg-red-50"
                        : "border-gray-300 hover:border-gray-400"
                    }`}
                  >
                    <input
                      type="radio"
                      id={method.id}
                      name="payment"
                      value={method.id}
                      checked={selectedMethod === method.id}
                      onChange={() => setSelectedMethod(method.id)}
                      className="w-4 h-4 accent-red bg-gray-100 border-gray-300 rounded-full"
                    />
                    <div className="flex items-center gap-2 text-sm">
                      {method.icon}
                      {method.label}
                    </div>
                  </label>

                  {selectedMethod === "card" && method.id === "card" && (
                    <div className="w-full rounded-md p-3 border border-gray-200">
                      <form>
                        <div className="flex flex-col w-full">
                          <label
                            htmlFor="cardNumber"
                            className="text-sm font-bold mb-3"
                          >
                            Card Number
                          </label>
                          <input
                            id="cardNumber"
                            type="text"
                            placeholder="0000 0000 0000 0000"
                            className="w-full border border-gray-400 rounded-sm p-3"
                          />
                        </div>
                        <div className="gap-2 mt-4 flex flex-row">
                          <div className="flex flex-col w-full">
                            <label
                              htmlFor="date"
                              className="text-sm font-bold mb-3"
                            >
                              Expiry date
                            </label>
                            <input
                              id="date"
                              type="text"
                              placeholder="MM/YY"
                              className="w-full border border-gray-400 p-2 rounded-sm"
                            />
                          </div>
                          <div className="flex flex-col w-full">
                            <label
                              htmlFor="cvv"
                              className="text-sm font-bold mb-3"
                            >
                              Security code
                            </label>
                            <input
                              id="cvv"
                              type="text"
                              placeholder="CVV"
                              className="w-full border border-gray-400 p-2 rounded-sm"
                            />
                          </div>
                        </div>
                      </form>
                    </div>
                  )}
                </div>
              ))}
            </div>

            <div className="max-w-full md:w-1/2 sticky space-y-3 md:pl-6">
              <h2 className="text-xl text-center font-semibold mb-3 text-gray-900">
                Order Summary
              </h2>
              <div className="text-sm text-gray-700">
                <div className="flex justify-between py-1">
                  <span>6-months Plan</span>
                  <span>{formatPrice(price)}</span>
                </div>
                <div className="flex justify-between font-bold text-xl border-t border-gray-200 pt-2">
                  <span>Total</span>
                  <span>{formatPrice(price)}</span>
                </div>
              </div>

              <CustomButton
                variant="default"
                rounded="2xl"
                fullWidth
                onClick={HandleClick}
              >
                Pay now
              </CustomButton>
            </div>
          </div>
        </div>
      </Modal>
    </div>
  );
};

export default SelectMethodPage;
