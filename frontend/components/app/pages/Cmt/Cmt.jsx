import React, { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";

const Cmt = () => {
    const navigate = useNavigate();
    const { id } = useParams();
    const [searchTerm, setSearchTerm] = useState("");
    const [newQuestion, setNewQuestion] = useState("");
    const [questionInfo, setQuestionInfo] = useState(null);
    const [faq, setFaq] = useState(null);
    const [replyBoxes, setReplyBoxes] = useState({});
    const [replyTexts, setReplyTexts] = useState({});
    const [questionReply, setQuestionReply] = useState("");
    const [showQuestionReplyBox, setShowQuestionReplyBox] = useState(false);
    const [currentPage, setCurrentPage] = useState(1);
    const answersPerPage = 5;
    const avt = "/avt_1.png";

    useEffect(() => {
        if (!id) return;

        fetch(`http://localhost/kimdong_bookstore/api/index.php?url=FAQforCmt/getFAQById/${id}`)
            .then(res => res.json())
            .then(data => setFaq(data))
            .catch(err => console.error("Lỗi khi fetch FAQ:", err));

        fetch(`http://localhost/kimdong_bookstore/api/index.php?url=FAQ/getQuestionById/${id}`)
            .then(res => res.json())
            .then(data => setQuestionInfo(data[0]))
            .catch(err => console.error("Lỗi khi fetch question:", err));
    }, [id]);

    const handleSearch = () => {
        if (searchTerm.trim()) {
            navigate(`/faq/question?search=${encodeURIComponent(searchTerm)}`);
        }
    };

    const toggleReplyBox = (answerId) => {
        setReplyBoxes(prev => ({ ...prev, [answerId]: !prev[answerId] }));
    };


    const handleChangeReplyText = (id, text) => {
        setReplyTexts(prev => ({ ...prev, [id]: text }));
    };

    const handleSubmitReply = async ({ questionId, answerId = null, replyToUserId = null, level = 1 }) => {
        const answer = answerId ? replyTexts[answerId] : questionReply;
        const created_at = new Date().toISOString();
        const user_id = 1; // hoặc lấy từ login context nếu có

        const payload = {
            question_id: questionId,
            user_id,
            answer,
            created_at,
            reply_to_answer_id: answerId,
            reply_to_user_id: replyToUserId
        };

        // Xoá 2 field nếu là level 1
        if (level === 1) {
            delete payload.reply_to_answer_id;
            delete payload.reply_to_user_id;
        }

        try {
            const res = await fetch("http://localhost/kimdong_bookstore/api/index.php?url=FAQforCmt/addAnswer", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(payload)
            });

            const data = await res.json();
            if (data.status === "success") {
                alert("✅ Gửi bình luận thành công");
                window.location.reload(); // hoặc bạn fetch lại dữ liệu mới
            } else {
                alert("❌ Gửi bình luận thất bại");
            }
        } catch (error) {
            console.error("Lỗi gửi API:", error);
            alert("❌ Có lỗi xảy ra khi gửi bình luận");
        }
    };
    const handleSendQuestion = async () => {
        const content = newQuestion.trim();
        if(!content) {
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
            const res = await fetch("http://localhost/kimdong_bookstore/api/index.php?url=FAQforCmt/addQuestion", {
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


    const renderReplies = (replies, level = 2) =>
        replies.map((r) => (
            <div key={r.id} className={`ml-${level * 6} mt-3`}>
                <div className="flex space-x-2">
                    <img src={r.user.avatar_url} className="w-10 h-10 rounded-full" />
                    <div className="bg-gray-100 p-2 rounded-lg w-full">
                        <p className="font-semibold text-sm text-blue-600">{r.user.name}</p>
                        <p className="mb-0">{r.answer}</p>
                        <div className="flex text-sm space-x-3">
                            <span onClick={() => toggleReplyBox(r.id)} className="cursor-pointer">💬</span>
                        </div>

                        {replyBoxes[r.id] && (
                            <div className="mt-2 flex space-x-2">
                                <img src={avt} className="w-10 h-10 rounded-full" />
                                <div className="w-full">
                                    <textarea
                                        className="border border-gray-300 px-3 py-2 w-full"
                                        placeholder="Trả lời..."
                                        value={replyTexts[r.id] || ""}
                                        onChange={(e) => handleChangeReplyText(r.id, e.target.value)}
                                    />
                                    <div className="flex justify-end space-x-2 mt-2">
                                        <button className="px-3 py-1 border rounded hover:bg-gray-200" onClick={() => toggleReplyBox(r.id)}>Hủy</button>
                                        <button
                                            className="mx-2 px-3 py-1 bg-amber-500 text-white rounded hover:bg-amber-600"
                                            onClick={() =>
                                                handleSubmitReply({
                                                    questionId: id,
                                                    answerId: r.id,
                                                    replyToUserId: r.user_id,
                                                    level
                                                })
                                            }
                                        >
                                            Trả lời
                                        </button>
                                    </div>
                                </div>
                            </div>
                        )}

                        {r.replies && r.replies.length > 0 && renderReplies(r.replies, level + 1)}
                    </div>
                </div>
            </div>
        ));

    const paginatedAnswers = faq?.answers.slice(
        (currentPage - 1) * answersPerPage,
        currentPage * answersPerPage
    );

    const totalPages = faq ? Math.ceil(faq.answers.length / answersPerPage) : 0;

    return (
        <div>
            {/* Search bar */}
            <div className="bg-amber-50 flex flex-col w-full items-center pb-4">
                <div className="font-extrabold text-gray-700 my-5 text-[20px] lg:text-4xl">
                    Tôi có thể giúp gì cho bạn?
                </div>
                <div className="flex items-center w-[60%] relative mb-4">
                    <input
                        type="text"
                        value={searchTerm}
                        onChange={(e) => setSearchTerm(e.target.value)}
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

            {/* Content */}
            <div className="grid lg:grid-cols-3 gap-6 p-5">
                <div className="col-span-2">
                    {questionInfo && (
                        <>
                            <h1 className="text-blue-600! text-2xl font-semibold">
                                {questionInfo.title}
                            </h1>
                            <div className="flex space-x-4 text-sm text-gray-600 mt-2 mb-5">
                                <span>🕓 {questionInfo.time}</span>
                                <span
                                    onClick={() => setShowQuestionReplyBox(!showQuestionReplyBox)}
                                    className="cursor-pointer mt-0"
                                >
                                    💬 {questionInfo.comment}
                                </span>
                                <span>👤 {questionInfo.user}</span>
                            </div>

                            {showQuestionReplyBox && (
                                <div className="mt-3 flex space-x-2">
                                    <img src={avt} className="w-10 h-10 rounded-full" />
                                    <div className="w-full">
                                        <textarea
                                            className="border px-3 py-2 w-full"
                                            value={questionReply}
                                            onChange={(e) => setQuestionReply(e.target.value)}
                                            placeholder="Trả lời câu hỏi này"
                                        />
                                        <div className="flex justify-end mt-2 space-x-2">
                                            <button className="px-3 py-1 border rounded" onClick={() => setShowQuestionReplyBox(false)}>Hủy</button>
                                            <button
                                                className="mx-2 px-3 py-1 bg-amber-500 text-white rounded hover:bg-amber-600"
                                                onClick={() =>
                                                    handleSubmitReply({ questionId: id, level: 1 })
                                                }
                                            >
                                                Trả lời
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            )}
                        </>
                    )}

                    {/* Answers */}
                    {paginatedAnswers?.map((a) => (
                        <div key={a.id} className="mt-6">
                            <div className="flex space-x-3">
                                <img src={a.user.avatar_url} className="w-10 h-10 rounded-full" />
                                <div className="w-full">
                                    <p className="font-semibold text-sm text-blue-600">{a.user.name}</p>
                                    <p className="mb-0">{a.answer}</p>
                                    <div className="flex space-x-3 text-sm ">
                                        <span onClick={() => toggleReplyBox(a.id)} className="cursor-pointer">💬</span>
                                    </div>

                                    {/* Reply box cấp 2 */}
                                    {replyBoxes[a.id] && (
                                        <div className="mt-2 flex space-x-2">
                                            <img src={avt} className="w-10 h-10 rounded-full" />
                                            <div className="w-full">
                                                <textarea
                                                    className="border px-3 py-2 w-full"
                                                    value={replyTexts[a.id] || ""}
                                                    onChange={(e) => handleChangeReplyText(a.id, e.target.value)}
                                                    placeholder="Trả lời..."
                                                />
                                                <div className="flex justify-end mt-2 space-x-2">
                                                    <button className="px-3 py-1 border rounded" onClick={() => toggleReplyBox(a.id)}>Hủy</button>
                                                    <button
                                                        className="mx-2 px-3 py-1 bg-amber-500 text-white rounded hover:bg-amber-600"
                                                        onClick={() =>
                                                            handleSubmitReply({
                                                                questionId: id,
                                                                answerId: a.id,
                                                                replyToUserId: a.user_id,
                                                                level: 2
                                                            })
                                                        }
                                                    >
                                                        Trả lời
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    )}

                                    {/* Cấp 3+ */}
                                    {renderReplies(a.replies || [])}
                                </div>
                            </div>
                        </div>
                    ))}

                    {/* Pagination */}
                    {totalPages > 1 && (
                        <div className="flex justify-center mt-6 space-x-2">
                            {Array.from({ length: totalPages }, (_, i) => (
                                <button
                                    key={i}
                                    onClick={() => setCurrentPage(i + 1)}
                                    className={`px-3 py-1 border rounded ${currentPage === i + 1 ? 'bg-amber-500 text-white' : 'bg-white'}`}
                                >
                                    {i + 1}
                                </button>
                            ))}
                        </div>
                    )}
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

export default Cmt;
