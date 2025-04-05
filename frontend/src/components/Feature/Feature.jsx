import React from "react";
import { useState } from "react";
import { ChevronDown } from "lucide-react";

const Feature = () => {
    const faqs = [
        {
            question: "Làm thế nào để tạo tài khoản?",
            answer: "Bạn có thể tạo tài khoản bằng cách nhấp vào nút 'Đăng ký' trên trang chủ. Sau đó, điền thông tin cá nhân như họ tên, email và mật khẩu. Hệ thống sẽ gửi email xác nhận để kích hoạt tài khoản. Nếu không nhận được email xác nhận, hãy kiểm tra thư mục spam hoặc thử yêu cầu gửi lại.",
        },
        {
            question: "Có những phương thức đăng nhập nào?",
            answer: "Bạn có thể đăng nhập bằng cách sử dụng email và mật khẩu đã đăng ký. Ngoài ra, hệ thống còn hỗ trợ đăng nhập nhanh thông qua tài khoản Google hoặc Facebook, giúp bạn tiết kiệm thời gian mà không cần tạo tài khoản mới.",
        },
        {
            question: "Tôi quên mật khẩu, làm sao để khôi phục?",
            answer: "Nếu bạn quên mật khẩu, hãy nhấp vào nút 'Quên mật khẩu' trên trang đăng nhập. Nhập địa chỉ email đã đăng ký, hệ thống sẽ gửi đường dẫn để đặt lại mật khẩu mới. Nếu không nhận được email, hãy kiểm tra thư mục spam hoặc liên hệ với bộ phận hỗ trợ khách hàng.",
        },
        {
            question: "Làm sao để cập nhật thông tin tài khoản?",
            answer: "Để cập nhật thông tin tài khoản, bạn hãy đăng nhập, vào phần 'Tài khoản của tôi', sau đó chỉnh sửa các thông tin như tên, số điện thoại, địa chỉ. Đối với thay đổi email hoặc mật khẩu, hệ thống có thể yêu cầu bạn xác minh danh tính qua email hoặc số điện thoại.",
        },
        {
            question: "Tài khoản của tôi bị khóa, làm sao để mở lại?",
            answer: "Nếu tài khoản của bạn bị khóa do nhập sai mật khẩu quá nhiều lần hoặc vi phạm chính sách, hãy liên hệ với bộ phận hỗ trợ khách hàng để được hướng dẫn cách mở khóa. Bạn có thể cần cung cấp một số thông tin xác minh danh tính để đảm bảo an toàn cho tài khoản.",
        },
        {
            question: "Tôi có thể xóa tài khoản của mình không?",
            answer: "Có, bạn có thể yêu cầu xóa tài khoản bằng cách liên hệ với bộ phận hỗ trợ. Lưu ý rằng khi tài khoản bị xóa, tất cả dữ liệu liên quan như lịch sử đơn hàng, danh sách yêu thích sẽ bị mất và không thể khôi phục.",
        },
    ];

    const [openIndex, setOpenIndex] = useState(null);

    const toggleFAQ = (index) => {
        setOpenIndex(openIndex === index ? null : index);
    };

    return (
        <div class = "lg:mb-10 mb-5">
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
            <div className="max-w-2xl mx-auto p-4">
                <h2 className="md:text-2xl lg:text-4xl text-lg font-bold text-center lg:my-8 my-4 text-amber-600">Câu hỏi thường gặp về Tài khoản</h2>
                <div className="lg:space-y-8 space-y-4">
                    {faqs.map((faq, index) => (
                        <div
                            key={index}
                            className="border rounded-lg shadow-sm overflow-hidden"
                        >
                            <button
                                className="w-full flex justify-between items-center p-4 text-left bg-gray-100 hover:bg-gray-200"
                                onClick={() => toggleFAQ(index)}
                            >
                                <span className="font-medium">{faq.question}</span>
                                <ChevronDown
                                    className={`transform transition-transform duration-200 ${openIndex === index ? "rotate-180" : "rotate-0"}`}
                                />
                            </button>
                            {openIndex === index && (
                                <div className="p-4 bg-white border-t">{faq.answer}</div>
                            )}
                        </div>
                    ))}
                </div>
            </div>
        </div>
    )
};

export default Feature;
