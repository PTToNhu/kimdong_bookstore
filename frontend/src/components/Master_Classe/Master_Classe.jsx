import React, { useState } from "react";
import { toggleCommentBox, toggleButton } from "./Master_Classe";

const Master_Classe = () => {
  const newsCategories = [
    { title: "Hoạt động", link: "./" },
    { title: "Sự kiện", link: "./" },
    { title: "Sách giả - sách lậu", link: "./" },
    { title: "Lịch phát hành sách - định kì", link: "./" },
  ];
  const paper = {
    title:
      "Chương trình Master-Classe sáng tác truyện tranh dành cho các họa sĩ trẻ Việt Nam",
    date: "10/02/25",
    commentCount: 0,
    publisher: "Nhà xuất bản Kim Đồng",
    likes: 0,
    share: 0,
    sub_title:
      "Chương trình Master-Classe truyện tranh do Viện Pháp tại Việt Nam và Nhà xuất bản Kim Đồng phối hợp tổ chức diễn ra từ ngày 23/9 đến ngày 27/9/2024 tại trụ sở Nhà xuất bản Kim Đồng (55 Quang Trung, Nguyễn Du, Q. Hai Bà Trưng, Hà Nội). Chương trình nằm trong khuôn khổ dự án FEF - sáng tạo và dự án Công nghiệp Văn hóa và Sáng tạo khu vực “Ngành truyện tranh ở Việt Nam và Campuchia: kết nối kinh nghiệm chuyên môn của Pháp.",
    content: [
      {
        type: "paragraph",
        text: "Trong số 58 ứng viên dự tuyển, 12 tài năng trẻ trên cả nước đã được hội đồng giám khảo Pháp-Việt lựa chọn tham dự chương trình. Với sự hướng dẫn của các họa sĩ tên tuổi đến từ Pháp và Việt Nam, các học viên tham dự các buổi workshop thông qua hình thức trực tiếp và trực tuyến xuyên suốt 5 ngày.",
      },
      {
        type: "image",
        src: "/no_img.jpg",
        text: "Buổi khai mạc chuỗi workshop Master-classe truyện tranh",
      },
      {
        type: "paragraph",
        text: "Là học viên tham gia chuỗi workshop, chị Phạm Hồng Thanh – giảng viên trường ĐH Mỹ thuật Việt Nam chia sẻ: “Tôi mới chỉ có kinh nghiệm ở mảng vẽ minh họa và bắt đầu thử sức ở mảng truyện tranh. Kiến thức được học ở workshop rất bổ ích với tôi trong việc giảng dạy cũng như sáng tác. Còn các bạn học, dù có bạn đã từng có tác phẩm được xuất bản nhưng mỗi người đều thu nhận được những kiến thức cần thiết trong khâu thể hiện nội dung và vẽ minh họa. Kiến thức được học lần này sẽ giúp chúng tôi có thêm những kỹ năng cao hơn để xây dựng nội dung tốt và truyền tải bằng hình ảnh.”",
      },
    ],
  };

  const relatedPosts = [
    {
      title:
        "THÔNG BÁO : Lịch nghỉ Tết Nguyên Đán 2025 tại hệ thống nhà sách Kim Đồng",
      link: "./",
    },
    {
      title:
        "NXB Kim Đồng tham gia lễ hội 'Xuân yêu thương' tại trường PTCS Xã Đàn, Hà Nội",
      link: "./",
    },
  ];
  const [liked, setLiked] = useState(false);
  const avt = "/avt_1.png";
  const comments = [
    {
      avt: "/avt_2.png",
      name: "Nguyễn Đặng Quang Minh",
      content: "2 tháng rồi chưa thấy ghost hunt kim ơi!",
      likes: 2,
      date: 35,
    },
    {
      avt: "/avt_3.png",
      name: "Nguyễn Quang Bảo",
      content: "Có chú thuật hồi chiến tập 24 kìa",
      likes: 7,
      date: 10,
    },
    {
      avt: "/avt_4.png",
      name: "Đặng Gia Hưng",
      content: "ko có ngôn ngữ yêu thương hả",
      likes: 0,
      date: 15,
    },
  ];
  return (
    <div class="lg:px-12 lg:py-8 lg:grid lg:grid-cols-4 lg:gap-4 flex flex-col">
      <div class="lg:col-span-1 mb-10">
        <div class="border-opacity-50 rounded-t-lg border border-gray-300 h-auto">
          {/* News */}
          <div class="bg-red-700 lg:text-2xl text-[16px] md:text-lg flex justify-center font-medium lg:p-4 text-white">
            {" "}
            DANH MỤC TIN TỨC
          </div>
          <div class="bg-white lg:p-4 md:p-3 p-2">
            <ul class="lg:space-y-2 space-y-1">
              {newsCategories.map((category) => (
                <li>
                  <a href={category.link} class="">
                    <span class="lg:font-normal font-light text-gray-700 hover:text-red-700">
                      {category.title}
                    </span>
                  </a>
                </li>
              ))}
            </ul>
          </div>
        </div>
      </div>
      {/* News */}
      <div class="col-span-3 bg-white p-2 lg:p-0">
        <h3 class="lg:text-2xl md:text-lg text-[16px] mb-2 text-gray-700 font-semibold uppercase">
          {paper.title}
        </h3>
        <div class="">
          <div class="flex justify-between lg:flex-row flex-col my-4 lg:my-0">
            <div class="flex space-x-4 overflow-hidden justify-between md:justify-center my-3 lg:my-0">
              <span class="flex items-center space-x-1">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                  class="lg:size-4 size-3"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M6.75 2.994v2.25m10.5-2.25v2.25m-14.252 13.5V7.491a2.25 2.25 0 0 1 2.25-2.25h13.5a2.25 2.25 0 0 1 2.25 2.25v11.251m-18 0a2.25 2.25 0 0 0 2.25 2.25h13.5a2.25 2.25 0 0 0 2.25-2.25m-18 0v-7.5a2.25 2.25 0 0 1 2.25-2.25h13.5a2.25 2.25 0 0 1 2.25 2.25v7.5m-6.75-6h2.25m-9 2.25h4.5m.002-2.25h.005v.006H12v-.006Zm-.001 4.5h.006v.006h-.006v-.005Zm-2.25.001h.005v.006H9.75v-.006Zm-2.25 0h.005v.005h-.006v-.005Zm6.75-2.247h.005v.005h-.005v-.005Zm0 2.247h.006v.006h-.006v-.006Zm2.25-2.248h.006V15H16.5v-.005Z"
                  />
                </svg>
                <span class="text-sm text-gray-500">{paper.date}</span>
              </span>
              <span class="flex items-center space-x-1">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                  class="lg:size-4 size-3"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M7.5 8.25h9m-9 3H12m-9.75 1.51c0 1.6 1.123 2.994 2.707 3.227 1.129.166 2.27.293 3.423.379.35.026.67.21.865.501L12 21l2.755-4.133a1.14 1.14 0 0 1 .865-.501 48.172 48.172 0 0 0 3.423-.379c1.584-.233 2.707-1.626 2.707-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0 0 12 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018Z"
                  />
                </svg>
                <p class="text-sm text-gray-500">{paper.commentCount}</p>
              </span>
              <span class="flex items-center  space-x-1">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                  class="lg:size-4 size-3"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z"
                  />
                </svg>
                <p class="text-gray-600">{paper.publisher}</p>
              </span>
            </div>
            <div>
              <div class="flex space-x-4 overflow-hidden justify-center">
                <button class="flex space-x-1.5">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke-width="1.5"
                    stroke="currentColor"
                    class="lg:size-5 md:size-4 size-3 my-auto"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      d="M6.633 10.25c.806 0 1.533-.446 2.031-1.08a9.041 9.041 0 0 1 2.861-2.4c.723-.384 1.35-.956 1.653-1.715a4.498 4.498 0 0 0 .322-1.672V2.75a.75.75 0 0 1 .75-.75 2.25 2.25 0 0 1 2.25 2.25c0 1.152-.26 2.243-.723 3.218-.266.558.107 1.282.725 1.282m0 0h3.126c1.026 0 1.945.694 2.054 1.715.045.422.068.85.068 1.285a11.95 11.95 0 0 1-2.649 7.521c-.388.482-.987.729-1.605.729H13.48c-.483 0-.964-.078-1.423-.23l-3.114-1.04a4.501 4.501 0 0 0-1.423-.23H5.904m10.598-9.75H14.25M5.904 18.5c.083.205.173.405.27.602.197.4-.078.898-.523.898h-.908c-.889 0-1.713-.518-1.972-1.368a12 12 0 0 1-.521-3.507c0-1.553.295-3.036.831-4.398C3.387 9.953 4.167 9.5 5 9.5h1.053c.472 0 .745.556.5.96a8.958 8.958 0 0 0-1.302 4.665c0 1.194.232 2.333.654 3.375Z"
                    />
                  </svg>
                  <span>Thích</span>
                  <span>{paper.likes}</span>
                </button>
                <button class="flex space-x-1.5">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke-width="1.5"
                    stroke="currentColor"
                    class="lg:size-5 md:size-4 size-3 my-auto"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      d="M7.217 10.907a2.25 2.25 0 1 0 0 2.186m0-2.186c.18.324.283.696.283 1.093s-.103.77-.283 1.093m0-2.186 9.566-5.314m-9.566 7.5 9.566 5.314m0 0a2.25 2.25 0 1 0 3.935 2.186 2.25 2.25 0 0 0-3.935-2.186Zm0-12.814a2.25 2.25 0 1 0 3.933-2.185 2.25 2.25 0 0 0-3.933 2.185Z"
                    />
                  </svg>
                  <span>Share</span>
                  <span>{paper.share}</span>
                </button>
              </div>
            </div>
          </div>
          <div class="bg-gray-300 lg:h-4 h-2 my-8 "></div>
          <div class="space-y-6 text-gray-700 text-justify">
            <div class="font-bold">{paper.sub_title}</div>
            {paper.content.map((item, index) => {
              if (item.type === "paragraph") {
                return <p key={index}>{item.text}</p>;
              } else if (item.type === "image") {
                return (
                  <div key={index} className="lg:px-12 md:px-10 px-6">
                    <img
                      src={item.src}
                      alt={item.text}
                      className="object-cover w-full h-full"
                    />
                    <div className="text-blue-600 text-[16px] italic flex justify-center my-4 ">
                      {item.text}
                    </div>
                  </div>
                );
              }
              return null;
            })}
          </div>
          {/* Phần bình luận */}
          {/* Sắp xếp theo */}
          <div class="w-full mt-5 text-base">
            <div class="flex justify-between items-center">
              <span class="text-md font-semibold">
                {comments.length} bình luận
              </span>
              <div class="flex items-center space-x-2">
                <label htmlFor="commentsOrder" class="text-sm">
                  Sắp xếp theo
                </label>
                <select id="commentsOrder" class="border px-2 py-1 text-sm">
                  <option value="Oldest">Cũ nhất</option>
                  <option value="Latest">Mới nhất</option>
                </select>
              </div>
            </div>
          </div>
          <div class="bg-gray-300 h-0.5 my-5 mx-2"></div>
          {/* Nội dung bình luận */}
          <div className="flex space-x-3 mb-5 text-base">
            <img
              src={avt}
              alt="ảnh đại diện của tôi"
              className="lg:w-16 lg:h-16 w-12 h-12"
            />
            <div className="w-full">
              <textarea
                placeholder="Bình luận"
                onClick={toggleButton}
                className="text-left w-full border border-gray-300 px-3 py-2 focus:outline-none focus:ring-2 focus:ring-gray-500"
              ></textarea>
              <div className="btn hidden flex justify-end">
                <button color="red" onClick={toggleButton}>
                  Hủy
                </button>
                <button>Bình luận</button>
              </div>
            </div>
          </div>
          {/* Phần bình luận của người khác */}
          {comments.map((comment, index) => {
            return (
              <div className="flex justify-start space-x-3 text-base mb-5">
                <img
                  src={comment.avt}
                  alt="ảnh đại diện của tôi"
                  className="lg:w-16 lg:h-16 w-12 h-12"
                />
                <div className="w-full">
                  <p className="font-semibold text-sm text-blue-600">
                    {comment.name}
                  </p>
                  <p>{comment.content}</p>
                  <div className="flex items-center space-x-3">
                    <div onClick={() => setLiked(!liked)}>
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        height="16"
                        width="16"
                        viewBox="0 0 512 512"
                        className={`cursor-pointer transition-colors duration-200 ${
                          liked ? "fill-blue-700" : "fill-gray-700"
                        }`}
                      >
                        <path d="M313.4 32.9c26 5.2 42.9 30.5 37.7 56.5l-2.3 11.4c-5.3 26.7-15.1 52.1-28.8 75.2l144 0c26.5 0 48 21.5 48 48c0 18.5-10.5 34.6-25.9 42.6C497 275.4 504 288.9 504 304c0 23.4-16.8 42.9-38.9 47.1c4.4 7.3 6.9 15.8 6.9 24.9c0 21.3-13.9 39.4-33.1 45.6c.7 3.3 1.1 6.8 1.1 10.4c0 26.5-21.5 48-48 48l-97.5 0c-19 0-37.5-5.6-53.3-16.1l-38.5-25.7C176 420.4 160 390.4 160 358.3l0-38.3 0-48 0-24.9c0-29.2 13.3-56.7 36-75l7.4-5.9c26.5-21.2 44.6-51 51.2-84.2l2.3-11.4c5.2-26 30.5-42.9 56.5-37.7zM32 192l64 0c17.7 0 32 14.3 32 32l0 224c0 17.7-14.3 32-32 32l-64 0c-17.7 0-32-14.3-32-32L0 224c0-17.7 14.3-32 32-32z" />
                      </svg>
                    </div>
                    <div>|</div>
                    <div onClick={() => toggleCommentBox(index)}>
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        height="16"
                        width="16"
                        viewBox="0 0 512 512"
                        className="fill-gray-700"
                      >
                        <path d="M512 240c0 114.9-114.6 208-256 208c-37.1 0-72.3-6.4-104.1-17.9c-11.9 8.7-31.3 20.6-54.3 30.6C73.6 471.1 44.7 480 16 480c-6.5 0-12.3-3.9-14.8-9.9c-2.5-6-1.1-12.8 3.4-17.4c0 0 0 0 0 0s0 0 0 0s0 0 0 0c0 0 0 0 0 0l.3-.3c.3-.3 .7-.7 1.3-1.4c1.1-1.2 2.8-3.1 4.9-5.7c4.1-5 9.6-12.4 15.2-21.6c10-16.6 19.5-38.4 21.4-62.9C17.7 326.8 0 285.1 0 240C0 125.1 114.6 32 256 32s256 93.1 256 208z" />
                      </svg>
                    </div>
                    {comment.likes > 0 && (
                      <div className="flex items-center space-x-3">
                        <div>|</div>
                        <div className="flex items-center space-x-0.25">
                          <div>
                            <svg
                              xmlns="http://www.w3.org/2000/svg"
                              height="16"
                              width="16"
                              viewBox="0 0 512 512"
                              className="fill-blue-700"
                            >
                              <path d="M313.4 32.9c26 5.2 42.9 30.5 37.7 56.5l-2.3 11.4c-5.3 26.7-15.1 52.1-28.8 75.2l144 0c26.5 0 48 21.5 48 48c0 18.5-10.5 34.6-25.9 42.6C497 275.4 504 288.9 504 304c0 23.4-16.8 42.9-38.9 47.1c4.4 7.3 6.9 15.8 6.9 24.9c0 21.3-13.9 39.4-33.1 45.6c.7 3.3 1.1 6.8 1.1 10.4c0 26.5-21.5 48-48 48l-97.5 0c-19 0-37.5-5.6-53.3-16.1l-38.5-25.7C176 420.4 160 390.4 160 358.3l0-38.3 0-48 0-24.9c0-29.2 13.3-56.7 36-75l7.4-5.9c26.5-21.2 44.6-51 51.2-84.2l2.3-11.4c5.2-26 30.5-42.9 56.5-37.7zM32 192l64 0c17.7 0 32 14.3 32 32l0 224c0 17.7-14.3 32-32 32l-64 0c-17.7 0-32-14.3-32-32L0 224c0-17.7 14.3-32 32-32z" />
                            </svg>
                          </div>
                          <div>{comment.likes}</div>
                        </div>
                      </div>
                    )}
                    <div>|</div>
                    <p>{comment.date} tuần</p>
                  </div>
                  <div
                    id={`comment-box-${index}`}
                    className="comment-box flex mt-5 flex-row space-x-3 items-start hidden"
                  >
                    <img
                      src={avt}
                      alt="ảnh đại diện của tôi"
                      className="lg:w-16 lg:h-16 w-12 h-12"
                    />
                    <div className="flex flex-col w-full">
                      <textarea
                        placeholder="Trả lời"
                        className="border border-gray-300 px-3 py-2 w-full"
                      ></textarea>
                      <div className="flex justify-end space-x-3 mt-2">
                        <button
                          color="red"
                          onClick={() => toggleCommentBox(index)}
                        >
                          Hủy
                        </button>
                        <button>Trả lời</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            );
          })}
          {/* Phần này chờ có database rồi chỉnh sửa sau */}
          <button className="w-full text-center text-black py-3 text-lg font-semibold">
            Tải thêm 10 bình luận
          </button>
        </div>
        {/* New-relative */}
        <div class="my-10">
          <div class="bg-gray-300 h-1"></div>
          <div class="lg:p-6 p-3">
            <h2 class="lg:text-2xl md:text-lg text-[16px] font-bold mb-4 mt-6">
              CÁC BÀI VIẾT LIÊN QUAN
            </h2>
            <ul class="list-disc pl-5 space-y-2">
              {relatedPosts.map((post) => (
                <li class="">
                  <a href={post.link} class="">
                    <span class="text-[16px] text-gray-700 hover:text-red-700">
                      {post.title}
                    </span>
                  </a>
                </li>
              ))}
            </ul>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Master_Classe;
