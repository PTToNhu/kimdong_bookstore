import React from 'react'

const Question = () => {
    const faqs = [
        {
            title: "1. Làm thế nào để tôi có thể tạo tài khoản?",
            time: "10/02/25",
            comment: "Đau cột sống quá đi",
            user: "User1"
        },
        {
            title: "2. Tôi có thể thay đổi thông tin tài khoản của mình không?",
            time: "10/02/25",
            comment: "Hong muốn code",
            user: "User2"
        },
        {
            title: "3. Làm thế nào để đặt câu hỏi?",
            time: "10/02/25",
            comment: "Bảo bảo muốn đi ngủ",
            user: "User3"
        }
    ];
    return (
        <div>
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
                    <a href="/FAQ">
                        <p class="lg:px-5  px-3 font-bold text-sm text-gray-700 hover:text-amber-600 transition duration-300">Tính năng</p>
                    </a>
                </div>
                <div>
                    <a href="/FAQ/question">
                        <p class="lg:px-5  px-3 font-bold text-sm text-gray-700 hover:text-amber-600 transition duration-300">Câu hỏi thường gặp</p>
                    </a>
                </div>
            </div>
            <div className="grid lg:grid-cols-3 md:grid-cols-3 grid-cols-1 gap-6 lg:my-15 md:my-10 my-5 lg:p-5 p-3">
                <div className="col-span-2 w-full lg:mb-8 mb-4">
                    <h2 className="lg:text-3xl text-[16px] md:text-xl font-bold lg:mb-4 mb-2">Câu hỏi thường gặp</h2>
                    <div className="bg-amber-600 opacity-50 lg:h-1.5 h-0.5 md:h-1 lg:mb-12 md:mb-8 mb-4"></div>
                    <div className="lg:mb-4 max-w-sm  min-w-[200px] mb-2 flex items-center">
                        <label className="mr-2 lg:text-md text-[16px] font-semibold">Sắp xếp theo:</label>
                        <select className="appearance-none cursor-pointer p-2 border border-gray-300  block w-full rounded lg:text-md text-[16px] flex-grow">
                            <option class="" selected>Chọn:</option>
                            <option class="" value="Top Questions">Câu hỏi hay nhất</option>
                            <option class="" value="Latest Posts">Câu hỏi mới nhất</option>
                            <option class="" value="Most Recent Activity">Câu hỏi thường gặp</option>
                        </select>
                    </div>
                    <div className="lg:p-4">
                        {faqs.map((faq, index) => (
                            <div key={index} className="border border-gray-300 rounded-lg p-4 lg:mb-4 mb-2">
                                <a href="./">
                                    <div className="font-semibold lg:text-2xl text-[16px] md:text-lg">{faq.title}</div>
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
                            </div>
                        ))}
                    </div>
                </div>

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

        </div>
    )
}

export default Question