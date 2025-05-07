import React from "react";
import Header from "../../../../../components/app/pages/header/header";
import { useRef, useState, useEffect } from "react";

const AboutUs = () => {
  const parentRef = useRef(null);
  const headerRef = useRef(null);
  const [childWidth, setChildWidth] = useState(0);
  const [headerHeight, setHeaderHeight] = useState(152);

  const updateChildWidth = () => {
    if (parentRef.current) {
      const parentWidth = parentRef.current.offsetWidth;
      setChildWidth(parentWidth);
    }
  };
  const updateHeaderHeight = () => {
    if (headerRef.current) {
      setHeaderHeight(headerRef.current.offsetHeight);
      document.documentElement.style.setProperty(
        "--header-height",
        `${headerRef.current.offsetHeight}px`
      );
    }
  };

  useEffect(() => {
    updateChildWidth();
    updateHeaderHeight();
    window.addEventListener("resize", updateChildWidth);
    window.addEventListener("resize", updateHeaderHeight);
    return () => {
      window.removeEventListener("resize", updateChildWidth);
      window.removeEventListener("resize", updateHeaderHeight);
    };
  }, []);
  const newsCategories = [
    { title: "Hoạt động", link: "./activities" },
    { title: "Sự kiện", link: "./events" },
    { title: "Sách giả - sách lậu", link: "./fakebook" },
    { title: "Lịch phát hành sách - định kì", link: "./release" },
  ];
  const newsItems = [
    {
      title:
        "Chương trình Master-Classe sáng tác truyện tranh dành cho các họa sĩ trẻ Việt Nam",
      link: "/news/master_classe",
      img: "/no_img.jpg",
      date: "10/02/25",
      comments: 0,
      publisher: "Nhà xuất bản Kim Đồng",
      description:
        "Chương trình Master-Classe truyện tranh do Viện Pháp tại Việt Nam và Nhà xuất bản Kim Đồng phối hợp tổ chức diễn ra từ ngày 23/9 đến ngày 27/9/2024 tại trụ sở Nhà xuất bản Kim Đ...",
    },
    {
      title: "THÔNG BÁO: Lịch nghỉ Tết Nguyên đán 2025",
      link: "./",
      img: "/no_img.jpg",
      date: "10/02/25",
      comments: 0,
      publisher: "Nhà xuất bản Kim Đồng",
      description:
        "Lịch nghỉ Tết Nguyên đán 2025 tại hệ thống nhà sách Kim Đồng...",
    },
  ];
  return (
    <div className="h-screen bg-cover w-[100%] bg-center" ref={parentRef}>
      <Header className="" childWidth={childWidth} />
      <div
        style={{ paddingTop: `${headerHeight}px` }}
        className="w-8/10 mx-auto"
      >
        <div className="mt-5 text-4xl font-bold text-center">Về chúng tôi</div>
        <div className="border-2 w-1/12 mx-auto my-5 text-red-700"></div>
        <div className="grid grid-cols-2 gap-20">
          <div className="flex flex-col justify-center items-center">
            <img src="/65-year_ani.png" alt="" />
            <span className="text-gray-500 text-center text-pretty">
              2 bộ sách đặc biệt trong loạt ấn phẩm kỷ niệm 65 năm thành lập NXB
              Kim Đồng.
            </span>
          </div>
          <div className="flex flex-col items-center">
            <div className="font-semibold text-xl text-center italic">
              <p>Nhà xuất bản Kim Đồng</p>
              <p>Bạn đồng hành của tuổi thơ Việt Nam</p>
            </div>
            <div className="mt-5 text-justify">
              <p>
                Nhà xuất bản Kim Đồng (NXB) trực thuộc Trung ương Đoàn TNCS Hồ
                Chí Minh là nhà xuất bản đầu tiên và lớn nhất dành cho thiếu nhi
                tại Việt Nam. Trong suốt 65 năm đồng hành với nhiều thế hệ tuổi
                thơ Việt Nam, NXB Kim Đồng luôn có vị trí đặc biệt quan trọng
                trong đời sống tinh thần của bạn đọc nhỏ tuổi.
              </p>
              <p className="mt-2">
                Ngày 17/6/1957, tại trụ sở của Hội Văn học nghệ thuật Việt Nam,
                một cuộc họp liên tịch đã được tổ chức đi đến quyết định thành
                lập nhà xuất bản sách thiếu nhi, theo đề xuất của nhà văn Tô
                Hoài, tên của nhà xuất bản được kế thừa tên của Tủ sách Kim Đồng
                ra đời ở chiến khu Việt Bắc (1948). Sự ra đời một nhà xuất bản
                mang tên người thiếu niên anh hùng nhỏ tuổi Kim Đồng có ý nghĩa
                đặc biệt, trở thành dấu mốc lịch sử trên chặng đường phát triển
                nền văn học thiếu nhi Việt Nam và cả nền xuất bản nước nhà.
              </p>
            </div>
            <button className="bg-red-500 rounded-lg text-white px-4 py-2 hover:!bg-red-700 mt-2 w-fit">
              Xem thêm
            </button>
          </div>
        </div>
      </div>
      <div className=" mt-15 bg-gray-100 p-4">
        <div className="w-8/10 mx-auto">
          <div className="text-3xl font-bold self-start">
            Công tác đầu tư cho tác giả, tác phẩm
          </div>
          <div className="border-2 w-1/4 my-5 text-red-700 self-start"></div>
          <div className="grid grid-cols-2 gap-20 ">
            <div className="items-center order-2">
              <div className="text-xl font-semibold">
                Các hoạt động tiêu biểu
              </div>
              <div className="border-2 w-1/4 my-3 text-red-700"></div>
              <div className="grid grid-cols-4 gap-5 mb-5">
                <div className="font-semibold">
                  <p>1976 - 1979</p>
                </div>
                <p className="col-span-3">Vì mầm non Xã hội Chủ nghĩa</p>
              </div>
              <div className="grid grid-cols-4 gap-5 mb-5 text-pretty">
                <div className="font-semibold">
                  <p>1979</p>
                </div>
                <p className="col-span-3">
                  Trại sáng tác văn học cho thiếu nhi tại Nha Trang (Khánh Hòa)
                </p>
              </div>
              <div className="grid grid-cols-4 gap-5 mb-5">
                <div className="font-semibold">
                  <p>1980</p>
                </div>
                <p className="col-span-3">
                  Hội nghị văn học thiếu nhi lần thứ nhất
                </p>
              </div>
              <div className="grid grid-cols-4 gap-5 mb-5">
                <div className="font-semibold">
                  <p>1980 - 1982</p>
                </div>
                <p className="col-span-3">
                  Chào mừng 40 năm ngày thành lập Đội Thiếu niên Tiền phong Hồ
                  Chí Minh
                </p>
              </div>
              <div className="grid grid-cols-4 gap-5 mb-5">
                <div className="font-semibold">
                  <p>1982</p>
                </div>
                <p className="col-span-3">
                  Tổ chức trao tặng phẩm cho gần 100 cộng tác viên có đóng góp
                  xuất sắc cho sự phát triển của Nhà xuất bản
                </p>
              </div>
            </div>
            <div className="flex flex-col items-center order-1">
              <div className="text-justify">
                <p>
                  Để có được sự cộng tác, giúp đỡ, đóng góp quý báu của các tác
                  giả, dịch giả, công tác cộng tác viên luôn được Nhà xuất bản
                  đặc biệt coi trọng. Ngay từ những tác giả đầu tiên là những
                  nhà văn, họa sĩ, nhạc sĩ hàng đầu của đất nước, trải qua từng
                  giai đoạn phát triển, Nhà xuất bản Kim Đồng luôn thu hút được
                  những cây bút tâm huyết sáng tác cho thiếu nhi. Về phần mình,
                  Nhà xuất bản cũng luôn nỗ lực hết mình để xứng đáng với niềm
                  tin yêu đó, đồng thời tạo điều kiện tốt nhất để các cộng tác
                  viên có cơ hội đến với mình: tổ chức các cuộc thi viết, các
                  đợt vận động sáng tác, các chuyến đi thực tế, mở các lớp tập
                  huấn, đào tạo kĩ năng viết, vẽ cho thiếu nhi… Không chỉ những
                  cuốn sách được in ra, những giải thưởng được trao tặng, những
                  khoản hỗ trợ kinh phí hết sức thiết thực đối với những người
                  làm công tác sáng tạo, mà chính những lời mời gọi chân thành,
                  ý thức "cầu hiền" tha thiết, những lời tra đổi đầy trách nhiệm
                  về bản thảo, những nụ cười tỏa rạng chia vui với tác giả, dịch
                  giả khi đứa con tinh thần của họ ra đời,.. - tất cả đã làm nên
                  một thứ "văn hóa Kim Đồng" để nhiều cộng tác viên coi việc đến
                  với Nhà xuất bản như trở về ngôi nhà chung Kim Đồng.
                </p>
              </div>
            </div>
          </div>
          <button className="bg-red-500 rounded-lg text-white px-4 py-2 hover:!bg-red-700 mt-2 w-fit mt-5">
            Xem thêm
          </button>
        </div>
      </div>
      <div className="mt-15 bg-gray-100 p-4">
        <div className="w-8/10 mx-auto">
          <div className="grid grid-cols-2 gap-20">
            <div className="flex flex-col justify-center items-center order-2">
              <img src="/socialwork.png" alt="Công tác xã hội" />
              <span className="text-gray-500 text-center text-pretty">
                Thực hiện trách nhiệm với xã hội
              </span>
            </div>
            <div className="flex flex-col order-1">
              <div className="mt-5 text-4xl font-bold">Công tác xã hội</div>
              <div className="border-2 w-1/4 my-5 text-red-700"></div>
              <div className="items-center">
                <div className="text-lg font-semibold flex gap-1">
                  <p className="text-red-500">*</p>
                  <p>Các điểm trường được xây dựng</p>
                </div>
                <div className="grid grid-cols-4 gap-5 mb-5">
                  <div className="font-semibold">
                    <p>1996</p>
                  </div>
                  <p className="col-span-3">
                    Trường tiểu học Kim Đồng, thôn Nà Mạ, Cao Bằng
                  </p>
                </div>
                <div className="grid grid-cols-4 gap-5 mb-5 text-pretty">
                  <div className="font-semibold">
                    <p>1998</p>
                  </div>
                  <p className="col-span-3">
                    Phòng học trường Phong Phú, Quận 9, TP.HCM
                  </p>
                </div>
                <div className="grid grid-cols-4 gap-5 mb-5">
                  <div className="font-semibold">
                    <p>1999</p>
                  </div>
                  <p className="col-span-3">
                    Phòng học trường tiểu học Tân Quy, Quận 7, TP.HCM
                  </p>
                </div>
                <div className="grid grid-cols-4 gap-5 mb-5">
                  <div className="font-semibold">
                    <p>2000</p>
                  </div>
                  <p className="col-span-3">
                    Phòng học trường tiểu học Mèo Vạc, Hà Giang
                  </p>
                </div>
                <div className="grid grid-cols-4 gap-5 mb-5">
                  <div className="font-semibold">
                    <p>2000</p>
                  </div>
                  <p className="col-span-3">
                    Phòng học cho trẻ em tật nguyền, Sơn Lạc, Tuyên Quang
                  </p>
                </div>
              </div>
              <button className="bg-red-500 rounded-lg text-white px-4 py-2 hover:!bg-red-700 mt-2 w-fit">
                Xem thêm
              </button>
            </div>
          </div>
        </div>
      </div>
      <div className="mt-15 bg-gray-100 p-4">
        <div className="w-8/10 mx-auto">
          <div className="mt-5 text-4xl font-bold">Hợp tác quốc tế</div>
          <div className="border-2 w-1/10 my-5 text-red-700"></div>
          <div className="grid grid-cols-3 gap-20">
            <div>
              <p className="font-semibold text-lg text-center mb-5">
                Khu vực châu Á
              </p>
              <div className="grid grid-cols-4 gap-4">
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
              </div>
            </div>
            <div>
              <p className="font-semibold text-lg text-center mb-5">
                Khu vực châu Âu
              </p>
              <div className="grid grid-cols-4 gap-4">
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
              </div>
            </div>
            <div>
              <p className="font-semibold text-lg text-center mb-5">
                Khu vực châu Mỹ
              </p>
              <div className="grid grid-cols-4 gap-4">
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
                <div className="flex flex-col justify-center items-center">
                  <img src="/japan.png" alt="Công tác xã hội" />
                  <span className="text-gray-500 text-xs text-center">
                    Nhật Bản
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default AboutUs;
