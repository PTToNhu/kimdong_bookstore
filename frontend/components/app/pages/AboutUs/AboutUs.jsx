import React from "react";
import Header from "../header/header";
import { useRef, useState, useEffect } from "react";

const AboutUs = () => {
  const parentRef = useRef(null);
  const headerRef = useRef(null);
  const [childWidth, setChildWidth] = useState(0);
  const [headerHeight, setHeaderHeight] = useState(152);
  const [introSection, setIntroSection] = useState(null);
  const [authorSection, setAuthorSection] = useState(null);
  const [socialSection, setSocialSection] = useState(null);
  const [internationalSection, setInternationalSection] = useState(null);
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
    fetch("http://localhost/kim_dong/kimdong_bookstore/api/index.php?url=AboutUs/getIntro")
      .then(res => res.json())
      .then(data => setIntroSection(data));

    fetch("http://localhost/kim_dong/kimdong_bookstore/api/index.php?url=AboutUs/getAuthor")
      .then(res => res.json())
      .then(data => setAuthorSection(data));

    fetch("http://localhost/kim_dong/kimdong_bookstore/api/index.php?url=AboutUs/getSocial")
      .then(res => res.json())
      .then(data => setSocialSection(data));

    fetch("http://localhost/kim_dong/kimdong_bookstore/api/index.php?url=AboutUs/getInternational")
      .then(res => res.json())
      .then(data => setInternationalSection(data));
  }, []);

  // const introSection = {
  //   title: "Về chúng tôi",
  //   image_url: "/65-year_ani.png",
  //   subtitle: "Bạn đồng hành của tuổi thơ Việt Nam",
  //   highlight: "2 bộ sách đặc biệt trong loạt ấn phẩm kỷ niệm 65 năm thành lập NXB Kim Đồng.",
  //   content: [
  //     `Nhà xuất bản Kim Đồng (NXB) trực thuộc Trung ương Đoàn TNCS Hồ Chí Minh là nhà xuất bản đầu tiên và lớn nhất dành cho thiếu nhi tại Việt Nam. Trong suốt 65 năm đồng hành với nhiều thế hệ tuổi thơ Việt Nam, NXB Kim Đồng luôn có vị trí đặc biệt quan trọng trong đời sống tinh thần của bạn đọc nhỏ tuổi.`,
  //     `Ngày 17/6/1957, tại trụ sở của Hội Văn học nghệ thuật Việt Nam, một cuộc họp liên tịch đã được tổ chức đi đến quyết định thành lập nhà xuất bản sách thiếu nhi, theo đề xuất của nhà văn Tô Hoài, tên của nhà xuất bản được kế thừa tên của Tủ sách Kim Đồng ra đời ở chiến khu Việt Bắc (1948). Sự ra đời một nhà xuất bản mang tên người thiếu niên anh hùng nhỏ tuổi Kim Đồng có ý nghĩa đặc biệt, trở thành dấu mốc lịch sử trên chặng đường phát triển nền văn học thiếu nhi Việt Nam và cả nền xuất bản nước nhà.`
  //   ]
  // };

  // const authorSection = {
  //   title: "Công tác đầu tư cho tác giả, tác phẩm",
  //   content: [
  //     `Để có được sự cộng tác, giúp đỡ, đóng góp quý báu của các tác giả, dịch giả, công tác cộng tác viên luôn được Nhà xuất bản đặc biệt coi trọng.`,
  //     `Ngay từ những tác giả đầu tiên là những nhà văn, họa sĩ, nhạc sĩ hàng đầu của đất nước, trải qua từng giai đoạn phát triển, Nhà xuất bản Kim Đồng luôn thu hút được những cây bút tâm huyết sáng tác cho thiếu nhi.`,
  //     `Về phần mình, Nhà xuất bản cũng luôn nỗ lực hết mình để xứng đáng với niềm tin yêu đó, đồng thời tạo điều kiện tốt nhất để các cộng tác viên có cơ hội đến với mình: tổ chức các cuộc thi viết, các đợt vận động sáng tác,…`,
  //     `Tất cả đã làm nên một thứ "văn hóa Kim Đồng" để nhiều cộng tác viên coi việc đến với Nhà xuất bản như trở về ngôi nhà chung Kim Đồng.`
  //   ],
  //   subtitle: "Các hoạt động tiêu biểu",
  //   activities: [
  //     { year_from: 1976, year_to: 1979, description: "Vì mầm non Xã hội Chủ nghĩa" },
  //     { year_from: 1979, year_to: 1979, description: "Trại sáng tác văn học cho thiếu nhi tại Nha Trang (Khánh Hòa)" },
  //     { year_from: 1980, year_to: 1980, description: "Hội nghị văn học thiếu nhi lần thứ nhất" },
  //     { year_from: 1980, year_to: 1982, description: "Chào mừng 40 năm ngày thành lập Đội Thiếu niên Tiền phong Hồ Chí Minh" },
  //     { year_from: 1982, year_to: 1982, description: "Tổ chức trao tặng phẩm cho gần 100 cộng tác viên có đóng góp xuất sắc cho sự phát triển của Nhà xuất bản" }
  //   ]
  // };

  // const socialSection = {
  //   title: "Công tác xã hội",
  //   image_url: "/socialwork.png",
  //   schools: [
  //     { year: 1996, location: "Trường tiểu học Kim Đồng, thôn Nà Mạ, Cao Bằng" },
  //     { year: 1998, location: "Phòng học trường Phong Phú, Quận 9, TP.HCM" },
  //     { year: 1999, location: "Phòng học trường tiểu học Tân Quy, Quận 7, TP.HCM" },
  //     { year: 2000, location: "Phòng học trường tiểu học Mèo Vạc, Hà Giang" },
  //     { year: 2000, location: "Phòng học cho trẻ em tật nguyền, Sơn Lạc, Tuyên Quang" }
  //   ]
  // };

  // const internationalSection = {
  //   title: "Hợp tác quốc tế",
  //   partners: [
  //     { region: "Khu vực châu Á", country_name: "Nhật Bản", flag_url: "/japan.png", count: 12 },
  //     { region: "Khu vực châu Âu", country_name: "Nhật Bản", flag_url: "/japan.png", count: 4 },
  //     { region: "Khu vực châu Mỹ", country_name: "Nhật Bản", flag_url: "/japan.png", count: 4 }
  //   ]
  // };

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
  if (!introSection || !authorSection || !socialSection || !internationalSection) {
    return null;
  }
  
  return (
    <div className="h-screen bg-cover w-[100%] bg-center" ref={parentRef}>
      <Header className="" childWidth={childWidth} />
      <div
        style={{ paddingTop: `${headerHeight}px` }}
        className="w-8/10 mx-auto"
      >
        <div className="mt-5 lg:text-4xl md:text-2xl text-lg font-bold text-center">
          {introSection.title}
        </div>
        <div className="border-2 w-1/12 mx-auto my-5 text-red-700"></div>
        <div className="lg:grid lg:grid-cols-2 gap-20">
          <div className="flex flex-col justify-center items-center my-4">
            <img src={introSection.image_url} alt="" />
            <span className="text-gray-500 text-center text-pretty my-2">
              {introSection.highlight}
            </span>
          </div>
          <div className="flex flex-col items-center">
            <div className="font-semibold text-xl text-center italic">
              <p>{introSection.subtitle}</p>
            </div>
            <div className="mt-5 text-justify">
              {introSection.content.map((para, idx) => (
                <p key={idx} className={idx !== 0 ? "mt-2" : undefined}>{para}</p>
              ))}
            </div>
            <button className="bg-amber-600 rounded-lg text-white px-4 py-2 cursor-pointer hover:!bg-red-900 mt-2 w-fit">
              Xem thêm
            </button>
          </div>
        </div>
      </div>
      {/* authorSection */}
      <div className=" mt-15 bg-gray-100 p-4">
        <div className="w-8/10 mx-auto">
          <div className="lg:text-3xl md:text-xl text-lg font-bold self-start">
            {authorSection.title}
          </div>
          <div className="border-2 w-1/4 my-5 text-red-700 self-start"></div>
          <div className="grid lg:grid-cols-2 gap-20 ">
            <div className="items-center order-2">
              <div className="text-xl font-semibold">
                {authorSection.subtitle}
              </div>
              <div className="border-2 w-1/4 my-3 text-red-700"></div>
              {authorSection.activities.map((act, idx) => (
                <div key={idx} className="grid grid-cols-4 gap-5 mb-5">
                  <div className="font-semibold">
                    <p>{act.year_from} - {act.year_to}</p>
                  </div>
                  <p className="col-span-3">{act.description}</p>
                </div>
              ))}
            </div>
            <div className="text-justify">
              {authorSection.content.map((para, idx) => (
                <p key={idx} className={idx !== 0 ? "mt-2" : undefined}>{para}</p>
              ))}
            </div>
          </div>
          <button className="bg-amber-600 rounded-lg text-white px-4 py-2 cursor-pointer hover:!bg-red-900 mt-2 w-fit mx-auto lg:mx-0">
            Xem thêm
          </button>
        </div>
      </div>

      {/* Social part */}
      <div className="mt-15 bg-gray-100 p-4">
        <div className="w-8/10 mx-auto">
          <div className="grid lg:grid-cols-2 gap-20">
            <div className="flex flex-col justify-center items-center order-2">
              <img src={socialSection.image_url} alt="Công tác xã hội" />
              <span className="text-gray-500 text-center text-pretty lg:my-1 my-3">
                Thực hiện trách nhiệm với xã hội
              </span>
            </div>
            <div className="flex flex-col order-1">
              <div className="mt-5 lg:text-4xl  md:text-2xl text-lg font-bold text-center lg:text-left">
                {socialSection.title}
              </div>
              <div className="border-2 w-1/4 my-5 text-red-700"></div>
              <div className="items-center">
                <div className="text-lg font-semibold flex gap-1">
                  <p className="text-red-500">*</p>
                  <p>Các điểm trường được xây dựng</p>
                </div>
                {socialSection.schools.map((school, idx) => (
                  <div key={idx} className="grid grid-cols-4 gap-5 mb-5">
                    <div className="font-semibold">
                      <p>{school.year}</p>
                    </div>
                    <p className="col-span-3">{school.location}</p>
                  </div>
                ))}
              </div>
              <button className="bg-amber-600 rounded-lg text-white px-4 py-2 cursor-pointer hover:!bg-red-900 mt-2 w-fit mx-auto lg:mx-0">
                Xem thêm
              </button>
            </div>
          </div>
        </div>
      </div>

      {/* International part */}
      <div className="mt-15 bg-gray-100 p-4">
        <div className="w-8/10 mx-auto">
          <div className="mt-5 lg:text-4xl md:text-2xl text-lg text-center font-bold">
            {internationalSection.title}
          </div>
          <div className="border-2 w-1/10 my-5 text-red-700 hidden lg:block "></div>
          <div className="grid lg:grid-cols-3 gap-20">
            {internationalSection.partners.map((group, index) => (
              <div key={index}>
                <p className="font-semibold text-lg text-center mb-5 mt-6 lg:mt-0">
                  {group.region}
                </p>
                <div className="grid grid-cols-4 gap-4">
                  {Array.from({ length: group.count }).map((_, idx) => (
                    <div key={idx} className="flex flex-col justify-center items-center">
                      <img src={group.flag_url} alt={group.country_name} />
                      <span className="text-gray-500 text-xs text-center">
                        {group.country_name}
                      </span>
                    </div>
                  ))}
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
      );
    </div>
  );
};

export default AboutUs;
