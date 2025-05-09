import { useState, useEffect } from "react";
import { useParams, useNavigate } from 'react-router-dom';
import { ChevronDown } from "lucide-react";

const Feature = () => {
    const { id } = useParams(); // Lấy feature_id từ URL
    const [faqs, setQuestions] = useState([]);
    const [openIndex, setOpenIndex] = useState(null);
    const [keyword, setKeyword] = useState("");
    const navigate = useNavigate();

    useEffect(() => {
        fetch(`http://localhost/kimdong_bookstore/api/index.php?url=FAQ/getQuestionsByFeature/${id}`)
            .then(res => res.json())
            .then(data => setQuestions(data))
            .catch(err => console.error("Lỗi khi fetch questions:", err));
    }, [id]);

    const toggleFAQ = (index) => {
        setOpenIndex(openIndex === index ? null : index);
    };

    const handleSearch = () => {
        if (keyword.trim()) {
            navigate(`/faq/question?search=${encodeURIComponent(keyword)}`);
        }
    };

    const handleKeyDown = (e) => {
        if (e.key === "Enter") handleSearch();
    };

    return (
        <div className="lg:mb-10 mb-5">
            <div className="bg-amber-50 flex flex-col w-full items-center lg:pb-14 md:pb-8 pb-4">
                <button
                    onClick={() => navigate('/')}
                    className="bg-green-600 hover:bg-green-700 text-white font-semibold py-2 px-4 rounded-lg shadow-md transition"
                >
                    🏠 Trở về trang chủ
                </button>
                <div className="font-extrabold text-gray-700 lg:my-10 my-5 md:my-8 md:text-xl text-[20px] lg:text-4xl">
                    Tôi có thể giúp gì cho bạn?
                </div>
                <div className="flex items-center w-[60%] relative mb-8 lg:mb-4">
                    <input
                        type="text"
                        value={keyword}
                        onChange={(e) => setKeyword(e.target.value)}
                        onKeyDown={handleKeyDown}
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

            <div className="max-w-2xl mx-auto p-4">
                <h2 className="md:text-2xl lg:text-4xl text-lg font-bold text-center lg:my-8 my-4 text-amber-600">
                    Câu hỏi thường gặp về Tính năng
                </h2>
                <div className="lg:space-y-8 space-y-4">
                    {faqs.map((faq, index) => (
                        <div
                            key={index}
                            className="border rounded-lg shadow-sm overflow-hidden"
                        >
                            <button
                                className="w-full flex justify-between items-center p-4 text-left !bg-gray-100 !hover:bg-gray-200 cursor-pointer"
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
    );
};

export default Feature;
