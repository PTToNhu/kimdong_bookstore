import React, { useState } from "react";
import { toggleCommentBox, toggleButton } from "./cmt"
const Cmt = () => {
    const faq = {
        title: "1. Làm thế nào để tôi có thể tạo tài khoản?",
        time: "10/02/25",
        comment: "Đau cột sống quá đi",
        user: "User1"
    };

    const comments = [
        {
            avt: "/avt_2.png",
            name: "Nguyễn Đặng Quang Minh",
            content: "Bạn vào trang đăng ký, điền đầy đủ thông tin rồi xác nhận email nhé!",
            likes: 2,
            date: 35,
        },
        {
            avt: "/avt_3.png",
            name: "Nguyễn Quang Bảo",
            content: "Dùng tài khoản Google hoặc Facebook để đăng ký nhanh hơn nè!",
            likes: 7,
            date: 10,
        },
        {
            avt: "/avt_4.png",
            name: "Đặng Gia Hưng",
            content: "Nếu không nhận được email xác nhận, bạn thử kiểm tra hộp thư rác nhé!",
            likes: 0,
            date: 15,
        },
    ];
    const [liked, setLiked] = useState(new Array(comments.length).fill(false));
    const handleLike = (index) => {
        const newLiked = [...liked];
        newLiked[index] = !newLiked[index];
        setLiked(newLiked);
    };
    const avt = "/avt_1.png";

    return (
        <div>
            {/* Form faq */}
            <div class="bg-amber-50  flex flex-col w-full items-center lg:pb-14 md:pb-8 pb-4">
                <div class="font-extrabold text-gray-700 lg:my-10 my-5 md:my-8 md:text-xl text-[20px] lg:text-4xl">Tôi có thể giúp gì cho bạn?</div>
                <div class="flex items-center w-[60%] relative mb-8 lg:mb-4">
                    <input type="text" placeholder="Tìm kiếm câu hỏi..."
                        class="flex-grow p-3 rounded-full w-full  shadow-inner focus:outline-none text-gray-700 lg:h-xl md:h-10 h-8 " />
                    <button class="absolute inset-y-0 right-0 !bg-amber-900 text-white !rounded-r-full flex items-center justify-center">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="lg:size-6 md:size-4 size-3 md:text-lg text-[16px] lg:text-3xl">
                            <path stroke-linecap="round" stroke-linejoin="round" d="m21 21-5.197-5.197m0 0A7.5 7.5 0 1 0 5.196 5.196a7.5 7.5 0 0 0 10.607 10.607Z" />
                        </svg>
                    </button>
                </div>
            </div>
            <div class="flex justify-center space-x-4 bg-gray-100 lg:p-4 p-2 rounded-lg shadow-md">
                <div>
                    <a href="/faq">
                        <p class="lg:px-5  px-3 font-bold text-sm text-gray-700 hover:text-amber-600 transition duration-300">Tính năng</p>
                    </a>
                </div>
                <div>
                    <a href="/faq/question">
                        <p class="lg:px-5  px-3 font-bold text-sm text-gray-700 hover:text-amber-600 transition duration-300">Câu hỏi thường gặp</p>
                    </a>
                </div>
            </div>
            <div className="grid lg:grid-cols-3 md:grid-cols-3 grid-cols-1 gap-6 lg:my-15 md:my-10 my-5 lg:p-5 p-3">
                <div className="col-span-2 w-full lg:mb-8 mb-4">
                    {/* Title câu hỏi */}
                    <a href="/faq/question/comment">
                        <div className="fontfont-semibold lg:text-2xl text-[16px] md:text-lg">{faq.title}</div>
                    </a>
                    <div className="flex space-x-4 overflow-hidden lg:mt-2 mt-1">
                        <span className="flex items-center space-x-1">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth="1.5" stroke="currentColor" className="size-4">
                                <path strokeLinecap="round" strokeLinejoin="round" d="M6.75 2.994v2.25m10.5-2.25v2.25m-14.252 13.5V7.491a2.25 2.25 0 0 1 2.25-2.25h13.5a2.25 2.25 0 0 1 2.25 2.25v11.251m-18 0a2.25 2.25 0 0 0 2.25 2.25h13.5a2.25 2.25 0 0 0 2.25-2.25m-18 0v-7.5a2.25 2.25 0 0 1 2.25-2.25h13.5a2.25 2.25 0 0 1 2.25 2.25v7.5m-6.75-6h2.25m-9 2.25h4.5m.002-2.25h.005v.006H12v-.006Zm-.001 4.5h.006v.006h-.006v-.005Zm-2.25.001h.005v.006H9.75v-.006Zm-2.25 0h.005v.005h-.006v-.005Zm6.75-2.247h.005v.005h-.005v-.005Zm0 2.247h.006v.006h-.006v-.006Zm2.25-2.248h.006V15H16.5v-.005Z" />
                            </svg>
                            <span className="text-sm text-gray-500">{faq.time}</span>
                        </span>
                        <span className="flex items-center space-x-1">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth="1.5" stroke="currentColor" className="size-4">
                                <path strokeLinecap="round" strokeLinejoin="round" d="M7.5 8.25h9m-9 3H12m-9.75 1.51c0 1.6 1.123 2.994 2.707 3.227 1.129.166 2.27.293 3.423.379.35.026.67.21.865.501L12 21l2.755-4.133a1.14 1.14 0 0 1 .865-.501 48.172 48.172 0 0 0 3.423-.379c1.584-.233 2.707-1.626 2.707-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0 0 12 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018Z" />
                            </svg>
                            <p className="text-sm text-gray-500">{faq.comment}</p>
                        </span>
                        <span className="flex items-center space-x-1">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth="1.5" stroke="currentColor" className="size-4">
                                <path strokeLinecap="round" strokeLinejoin="round" d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z" />
                            </svg>
                            <p className="text-gray-600">{faq.user}</p>
                        </span>
                    </div>
                    {/* Nội dung bình luận */}
                    <div className="flex space-x-3 mb-5 text-base mt-8">
                        <img
                            src={avt}
                            alt="ảnh đại diện của tôi"
                            className="lg:w-16 lg:h-16 w-12 h-12"
                        />
                        <div className="w-full">
                            <textarea
                                placeholder="Trả lời"
                                onClick={toggleButton}
                                className="text-left w-full border border-gray-300 px-3 py-2 focus:outline-none focus:ring-2 focus:ring-gray-500"
                            ></textarea>
                            <div className="btn hidden flex justify-end mt-2">
                                <button className="mr-3 " color="red" onClick={toggleButton}>
                                    Hủy
                                </button>
                                <button>Bình luận</button>
                            </div>
                        </div>
                    </div>
                    {/* Bình luận giải đáp */}
                    <div className="mt-5">
                        <h3 className="text-md font-semibold mb-2">{comments.length} giải đáp</h3>
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
                                            {comment.likes >= 0 && (
                                                <div className="flex items-center space-x-3" onClick={() => handleLike(index)}>
                                                    <div>|</div>
                                                    <div className="flex items-center space-x-0.25">
                                                        <div>
                                                            <svg
                                                                xmlns="http://www.w3.org/2000/svg"
                                                                height="16"
                                                                width="16"
                                                                viewBox="0 0 512 512"
                                                                className={`cursor-pointer ${liked[index] ? "fill-blue-700" : "fill-gray-700"
                                                                    } mr-0.5`}
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
                                                        className="mr-3"
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
                    </div>
                </div>

                {/* Phần đặt câu hỏi */}
                <div className="col-span-1 lg:p-3 p-1 bg-white">
                    <input
                        type="text"
                        placeholder='Hãy đặt câu hỏi ở đây'
                        className="w-full lg:p-3 h-xl lg:h-auto p-1 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500"
                    />
                    <button className="lg:mt-3 w-full lg:p-3 p-1 h-xl lg:h-auto mt-8  text-gray-700 rounded-lg ">
                        Gửi câu hỏi
                    </button>
                </div>
            </div>
        </div >
    );
};

export default Cmt;
