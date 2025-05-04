import Header from "../header/header";
import React, { useRef, useState, useEffect } from "react";
import { useLocation } from "react-router-dom";

const News = () => {
  const [newsCategories, setNewsCategories] = useState([]);
  const [newsItems, setNewsItems] = useState([]);
  const parentRef = useRef(null);
  const [childWidth, setChildWidth] = useState(0);
  const [categoryID, setCategoryID] = useState(0);
  const location = useLocation();
  const [offset, setOffset] = useState(0);
  const [limit, setLimit] = useState(2);
  const [total, setTotal] = useState(0);
  const updateChildWidth = () => {
    if (parentRef.current) {
      const parentWidth = parentRef.current.offsetWidth;
      setChildWidth(parentWidth);
    }
  };
  const fetchCategory = async () => {
    try {
      const res = await fetch(
        "http://localhost/BTL_WEB_1/api/Category/getCategory"
      );
      const data = await res.json();
      setNewsCategories(data);
    } catch (error) {
      console.error("Error fetching category:", error);
    }
  };
  const fetchNews = async (categoryID, offset, limit) => {
    try {
      const url =
        categoryID == 0
          ? `http://localhost/BTL_WEB_1/api/News/getNews?offset=${offset}&limit=${limit}`
          : `http://localhost/BTL_WEB_1/api/News/getNewsByCategoryID?categoryID=${categoryID}&offset=${offset}&limit=${limit}`;

      const res = await fetch(url);
      const newsData = await res.json();
      console.log("newsData", newsData);
      const newsWithComments = await Promise.all(
        newsData.data.map(async (item) => {
          try {
            const commentRes = await fetch(
              `http://localhost/BTL_WEB_1/api/comment/getTotalCommentsByNewID?newid=${item.ID}`
            );
            const commentData = await commentRes.json();
            return {
              ...item,
              comments:
                commentData && commentData.TOTAL
                  ? Number(commentData.TOTAL)
                  : 0,
            };
          } catch (err) {
            console.error(
              `Error fetching number of comments of newID ${item.ID}:`,
              err
            );
            return { ...item, comments: 0 };
          }
        })
      );
      // console.log("newsWithComments", newsWithComments);
      setNewsItems(newsWithComments);
      setTotal(newsData.total);
    } catch (error) {
      console.error("Error fetching news:", error);
    }
  };
  useEffect(() => {
    updateChildWidth();
    window.addEventListener("resize", updateChildWidth);

    fetchCategory();
    const queryParams = new URLSearchParams(location.search);
    const currentCategoryID = Number(queryParams.get("categoryID")) || 0;
    const currentOffset = Number(queryParams.get("offset")) || 0;
    const currentLimit = Number(queryParams.get("limit")) || 2;

    setCategoryID(currentCategoryID);
    setOffset(currentOffset);
    setLimit(currentLimit);
    fetchNews(currentCategoryID, currentOffset, currentLimit);
    return () => {
      window.removeEventListener("resize", updateChildWidth);
    };
  }, [location.search]);
  const totalPages = Math.ceil(total / limit);
  const currentPage = offset / limit + 1;
  const createPageLink = (page) => {
    const newOffset = (page - 1) * limit;
    return `/news?categoryID=${categoryID}&offset=${newOffset}&limit=${limit}`;
  };
  return (
    <div className="h-screen bg-cover w-[100%] bg-center" ref={parentRef}>
      <Header childWidth={childWidth} />
      <div className="lg:px-12 lg:py-8 lg:grid lg:grid-cols-4 lg:gap-4 flex flex-col h-screen w-[100%] max-lg:pt-[160px] lg:pt-[160px]">
        <div className="lg:col-span-1 mb-10">
          <div className="border-opacity-50 rounded-t-lg border border-gray-300 h-auto">
            {/* News */}
            <div className="bg-red-700 lg:text-2xl text-[16px] md:text-lg flex justify-center font-medium lg:p-4 text-white">
              {" "}
              DANH MỤC TIN TỨC
            </div>
            <div className="bg-white lg:p-4 md:p-3 p-2">
              <ul className="lg:space-y-2 space-y-1">
                {newsCategories.map((category) => (
                  <li key={category.ID}>
                    <a
                      href={`/news?categoryID=${category.ID}&offset=0&limit=${limit}`}
                      className=""
                    >
                      <span className="lg:font-normal font-light text-gray-700 hover:text-red-700">
                        {category.Name}
                      </span>
                    </a>
                  </li>
                ))}
              </ul>
            </div>
          </div>
        </div>
        {/* Activity */}
        <div className="lg:col-span-3 bg-white">
          <h2 className="lg:text-2xl  md:text-lg text-[16px] font-bold lg:mb-8 md:mb-6 mb-4 lg:p-4 md:p-3 p-2">
            {categoryID == 0
              ? "TẤT CẢ TIN TỨC"
              : newsCategories.find((item) => item.ID == categoryID)?.Name}
          </h2>
          <div>
            <div className="lg:grid lg:grid-cols-2 lg:gap-4 flex flex-col">
              {newsItems.length === 0 ? (
                <div className="col-span-2 text-center text-red-600 text-xl py-10">
                  Không có bài viết nào trong danh mục này
                </div>
              ) : (
                newsItems.map((item) => (
                  <div
                    key={item.ID}
                    className="mx-2 lg:mx-0 group col-span-1 bg-white shadow-[0_3px_10px_rgb(0,0,0,0.4)] overflow-hidden p-2.5 mb-10"
                  >
                    {item.Thumbnail && (
                      <div className="overflow-hidden mb-2.5">
                        <a href={`/new/?newid=${item.ID}`}>
                          <img
                            src={item.Thumbnail}
                            alt="Thông báo"
                            className="object-cover h-70 mx-auto transform transition-transform duration-300 hover:scale-110 group-hover:scale-110"
                          />
                        </a>
                      </div>
                    )}
                    <div className="">
                      <div className="flex space-x-4 overflow-hidden">
                        <span className="flex items-center space-x-1">
                          <svg
                            xmlns="http://www.w3.org/2000/svg"
                            fill="none"
                            viewBox="0 0 24 24"
                            strokeWidth="1.5"
                            stroke="currentColor"
                            className="size-4"
                          >
                            <path
                              strokeLinecap="round"
                              strokeLinejoin="round"
                              d="M6.75 2.994v2.25m10.5-2.25v2.25m-14.252 13.5V7.491a2.25 2.25 0 0 1 2.25-2.25h13.5a2.25 2.25 0 0 1 2.25 2.25v11.251m-18 0a2.25 2.25 0 0 0 2.25 2.25h13.5a2.25 2.25 0 0 0 2.25-2.25m-18 0v-7.5a2.25 2.25 0 0 1 2.25-2.25h13.5a2.25 2.25 0 0 1 2.25 2.25v7.5m-6.75-6h2.25m-9 2.25h4.5m.002-2.25h.005v.006H12v-.006Zm-.001 4.5h.006v.006h-.006v-.005Zm-2.25.001h.005v.006H9.75v-.006Zm-2.25 0h.005v.005h-.006v-.005Zm6.75-2.247h.005v.005h-.005v-.005Zm0 2.247h.006v.006h-.006v-.006Zm2.25-2.248h.006V15H16.5v-.005Z"
                            />
                          </svg>
                          <span className="text-sm text-gray-500">
                            {item.ScheduledAt}
                          </span>
                        </span>
                        <span className="flex items-center space-x-1">
                          <svg
                            xmlns="http://www.w3.org/2000/svg"
                            fill="none"
                            viewBox="0 0 24 24"
                            strokeWidth="1.5"
                            stroke="currentColor"
                            className="size-4"
                          >
                            <path
                              strokeLinecap="round"
                              strokeLinejoin="round"
                              d="M7.5 8.25h9m-9 3H12m-9.75 1.51c0 1.6 1.123 2.994 2.707 3.227 1.129.166 2.27.293 3.423.379.35.026.67.21.865.501L12 21l2.755-4.133a1.14 1.14 0 0 1 .865-.501 48.172 48.172 0 0 0 3.423-.379c1.584-.233 2.707-1.626 2.707-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0 0 12 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018Z"
                            />
                          </svg>
                          <p className="text-sm text-gray-500">
                            {item.comments}
                          </p>
                        </span>
                        <span className="flex items-center  space-x-1">
                          <svg
                            xmlns="http://www.w3.org/2000/svg"
                            fill="none"
                            viewBox="0 0 24 24"
                            strokeWidth="1.5"
                            stroke="currentColor"
                            className="size-4"
                          >
                            <path
                              strokeLinecap="round"
                              strokeLinejoin="round"
                              d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z"
                            />
                          </svg>
                          <p className="text-gray-600">
                            {item.WrittenByAdminID}
                          </p>
                        </span>
                      </div>
                      <a href="/new/master_classe">
                        <h3 className="text-lg mb-2 text-gray-700 font-semibold hover:text-red-700 group-hover:text-red-700">
                          {item.Title}
                        </h3>
                      </a>
                      <div className="bg-red-700 w-[75%] h-0.5 "></div>
                      <p className="mt-2 text-gray-700">
                        {item.Text.slice(0, 150) + "..."}
                      </p>
                    </div>
                  </div>
                ))
              )}
            </div>
            {/* Note page number */}
            <div className="flex justify-center w-full">
              <ul className="flex space-x-3 my-9 ">
                {currentPage > 1 && (
                  <li>
                    <a href={createPageLink(currentPage - 1)}>
                      <div className="text-black border-opacity-50 rounded-sm border border-gray-600 lg:h-10 lg:w-10 md:h-10 md:w-10 h-8 w-8 flex text-[20px] justify-center items-center hover:text-white hover:bg-red-600">
                        <svg
                          xmlns="http://www.w3.org/2000/svg"
                          fill="none"
                          viewBox="0 0 24 24"
                          strokeWidth="1.5"
                          stroke="currentColor"
                          className="size-6"
                        >
                          <path
                            strokeLinecap="round"
                            strokeLinejoin="round"
                            d="M21 16.811c0 .864-.933 1.406-1.683.977l-7.108-4.061a1.125 1.125 0 0 1 0-1.954l7.108-4.061A1.125 1.125 0 0 1 21 8.689v8.122ZM11.25 16.811c0 .864-.933 1.406-1.683.977l-7.108-4.061a1.125 1.125 0 0 1 0-1.954l7.108-4.061a1.125 1.125 0 0 1 1.683.977v8.122Z"
                          />
                        </svg>
                      </div>
                    </a>
                  </li>
                )}
                {Array.from({ length: totalPages }, (_, i) => i + 1)
                  .filter(
                    (page) =>
                      page === 1 ||
                      page === totalPages ||
                      (page >= currentPage - 2 && page <= currentPage + 2)
                  )
                  .map((page, index, array) => (
                    <li key={page}>
                      <a href={createPageLink(page)}>
                        <div
                          className={`text-black border-opacity-50 rounded-sm border border-gray-600 lg:h-10 lg:w-10 md:h-10 md:w-10 h-8 w-8 flex text-[20px] justify-center items-center hover:text-white hover:bg-red-600 ${
                            page === currentPage
                              ? "bg-red-600 text-white font-semibold"
                              : ""
                          }`}
                        >
                          {page}
                        </div>
                      </a>
                    </li>
                  ))}
                {currentPage < totalPages && (
                  <li>
                    <a href={createPageLink(currentPage + 1)}>
                      <div className="text-black border-opacity-50 rounded-sm border border-gray-600 lg:h-10 lg:w-10 md:h-10 md:w-10 h-8 w-8 flex text-[20px] justify-center items-center hover:text-white hover:bg-red-600">
                        <svg
                          xmlns="http://www.w3.org/2000/svg"
                          fill="none"
                          viewBox="0 0 24 24"
                          strokeWidth="1.5"
                          stroke="currentColor"
                          className="size-6"
                        >
                          <path
                            strokeLinecap="round"
                            strokeLinejoin="round"
                            d="M3 8.689c0-.864.933-1.406 1.683-.977l7.108 4.061a1.125 1.125 0 0 1 0 1.954l-7.108 4.061A1.125 1.125 0 0 1 3 16.811V8.69ZM12.75 8.689c0-.864.933-1.406 1.683-.977l7.108 4.061a1.125 1.125 0 0 1 0 1.954l-7.108 4.061a1.125 1.125 0 0 1-1.683-.977V8.69Z"
                          />
                        </svg>
                      </div>
                    </a>
                  </li>
                )}
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default News;
