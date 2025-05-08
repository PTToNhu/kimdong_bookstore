import React, { useEffect, useState } from 'react';
import { useLocation } from "react-router-dom";

const Question = () => {
    const location = useLocation();
    const [faqs, setFaqs] = useState([]);
    const [filteredFaqs, setFilteredFaqs] = useState([]);
    const [newQuestion, setNewQuestion] = useState("");
    const [keyword, setKeyword] = useState("");

    useEffect(() => {
        fetch("http://localhost/kim_dong/kimdong_bookstore/api/index.php?url=FAQ/getQuestions")
            .then((res) => res.json())
            .then((data) => {
                setFaqs(data);

                // Lấy keyword từ URL nếu có
                const params = new URLSearchParams(location.search);
                const keywordFromURL = params.get("search") || "";

                setKeyword(keywordFromURL);

                if (keywordFromURL) {
                    const lowerKeyword = keywordFromURL.toLowerCase();
                    const result = data.filter(faq =>
                        faq.title.toLowerCase().includes(lowerKeyword)
                    );
                    setFilteredFaqs(result);
                } else {
                    setFilteredFaqs(data);
                }
            })
            .catch((err) => console.error("Error fetching questions:", err));
    }, [location.search]);

    const handleSearch = () => {
        const lowerKeyword = keyword.toLowerCase();
        const result = faqs.filter(faq =>
            faq.title.toLowerCase().includes(lowerKeyword)
        );
        setFilteredFaqs(result);
    };
    const handleSendQuestion = async () => {
        const content = newQuestion.trim();
        if (!content) {
            alert("❗ Vui lòng nhập câu hỏi.");
            return;
        }

        const created_at = new Date().toISOString();
        const user_id = 1; // Hoặc lấy từ context đăng nhập nếu có

        const payload = {
            question: content,
            user_id,
            created_at,
        };

        try {
            const res = await fetch("http://localhost/kim_dong/kimdong_bookstore/api/index.php?url=FAQforCmt/addQuestion", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(payload),
            });

            const data = await res.json();

            if (data.status === "success") {
                alert("✅ Câu hỏi đã được gửi thành công!");
                window.location.reload(); // hoặc redirect
            } else {
                alert("❌ Gửi câu hỏi thất bại.");
            }
        } catch (err) {
            console.error("Lỗi khi gửi câu hỏi:", err);
            alert("❌ Đã có lỗi xảy ra khi gửi câu hỏi.");
        }
    };

    return (
        <div>
            <div className="bg-amber-50 flex flex-col w-full items-center lg:pb-14 md:pb-8 pb-4">
                <div className="font-extrabold text-gray-700 lg:my-10 my-5 md:my-8 md:text-xl text-[20px] lg:text-4xl">
                    Tôi có thể giúp gì cho bạn?
                </div>
                <div className="flex items-center w-[60%] relative mb-8 lg:mb-4">
                    <input
                        type="text"
                        value={keyword}
                        onChange={(e) => setKeyword(e.target.value)}
                        onKeyDown={(e) => e.key === "Enter" && handleSearch()}
                        placeholder="Tìm kiếm câu hỏi..."
                        className="flex-grow p-3 rounded-full w-full shadow-inner focus:outline-none text-gray-700 lg:h-xl md:h-10 h-8"
                    />
                    <button
                        onClick={handleSearch}
                        className="cursor-pointer absolute inset-y-0 right-0 lg:w-16 md:w-12 w-10 !bg-amber-900 text-white !rounded-r-full flex items-center justify-center"
                    >
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                            strokeWidth="1.5" stroke="currentColor"
                            className="lg:size-6 md:size-4 size-3 md:text-lg text-[16px] lg:text-3xl">
                            <path strokeLinecap="round" strokeLinejoin="round"
                                d="m21 21-5.197-5.197m0 0A7.5 7.5 0 1 0 5.196 5.196a7.5 7.5 0 0 0 10.607 10.607Z" />
                        </svg>
                    </button>
                </div>
            </div>

            <div className="flex justify-center lg:space-x-4 space-x-2 bg-gray-100 lg:p-4 p-2 rounded-b-lg shadow-md  no-underline!">
                <div>
                    <a href="/faq" className=' no-underline! text'>
                        <p className="lg:px-5 px-3 font-bold lg:text-sm text-[18px] text-gray-700 hover:text-amber-600! no-underline! transition duration-300">
                            Tính năng
                        </p>
                    </a>
                </div>
                <div>
                    <a href="/faq/question" className=' no-underline!'>
                        <p className="lg:px-5 px-3 font-bold lg:text-sm text-[18px] text-gray-700 hover:text-amber-600 transition duration-300">
                            Câu hỏi thường gặp
                        </p>
                    </a>
                </div>
            </div>

            <div className="grid lg:grid-cols-3 md:grid-cols-3 grid-cols-1 gap-6 lg:my-15 md:my-10 my-5 lg:p-5 p-3">
                <div className="col-span-2 w-full lg:mb-8 mb-4">
                    <h2 className="lg:text-3xl text-[16px] md:text-xl font-bold lg:mb-4 mb-2">Câu hỏi thường gặp</h2>
                    <div className="bg-amber-600 opacity-50 lg:h-1.5 h-0.5 md:h-1 lg:mb-12 md:mb-8 mb-4"></div>

                    <div className="lg:p-4">
                        {filteredFaqs.map((faq, index) => (
                            <div key={index} className="border border-gray-300 rounded-lg p-4 lg:mb-4 mb-2">
                                <a href={`/faq/question/comment/${faq.id}`} className="text-blue-600">
                                    <div className="font-semibold lg:text-2xl text-[16px] md:text-lg">{faq.title}</div>
                                </a>
                                <div className="flex space-x-4 overflow-hidden lg:mt-2 mt-1 text-sm text-gray-500">
                                    <span>🕓 {faq.time}</span>
                                    <span>💬 {faq.comment}</span>
                                    <span>👤 {faq.user}</span>
                                </div>
                            </div>
                        ))}
                        {filteredFaqs.length === 0 && (
                            <p className="text-center text-gray-500">Không tìm thấy câu hỏi phù hợp.</p>
                        )}
                    </div>
                </div>

                <div className="col-span-2 lg:col-span-1 lg:p-3 p-1 bg-white">
                    <textarea
                        rows="4"
                        placeholder="Hãy đặt câu hỏi ở đây"
                        value={newQuestion}
                        onChange={(e) => setNewQuestion(e.target.value)}
                        required
                        className="w-full lg:p-3 p-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500"
                    />
                    <button
                        className="lg:mt-3 w-full lg:p-3 p-2 text-gray-700 hover:bg-gray-100 hover:border-gray-800 rounded-lg cursor-pointer mt-4"
                        onClick={handleSendQuestion}
                    >
                        Gửi câu hỏi
                    </button>
                </div>
            </div>
        </div>
    );
};

export default Question;
