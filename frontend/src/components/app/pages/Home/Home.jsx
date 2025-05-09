import React, { useRef, useEffect, useState } from 'react';
import {useNavigate } from 'react-router-dom'
import './home.css';
import Footer from '../footer/footer';
import Header from '../header/header'
const IMG = 200;
const BanerM= 800;
const Home = () => {
  const navigate = useNavigate(); 
  const handlePre = () => {
    navigate('/about_us'); 
  };
  const handleCat=()=>{
    navigate('/category');
  }
  
  const [scrollPosition, setScrollPosition] = useState(0);
  const containerRef = useRef(null);
  const handleScroll = (scrollAmount) => {
    const newScrollPosition = scrollPosition + scrollAmount;
    setScrollPosition(newScrollPosition);
    containerRef.current.scrollLeft = newScrollPosition;
  };
  const [scrollPositionB, setScrollPositionB] = useState(0);
  const containerRefB = useRef(null);
  const handleScrollB = (scrollAmount) => {
    const newScrollPositionB = scrollPositionB + scrollAmount;
    setScrollPositionB(newScrollPositionB);
    containerRefB.current.scrollLeft = newScrollPositionB;
  };
  const [scrollPositionN, setScrollPositionN] = useState(0);
  const containerRefN = useRef(null);
  const handleScrollN = (scrollAmount) => {
    if (containerRefN.current) {
      const newScrollPositionN = scrollPositionN + scrollAmount;
      setScrollPositionN(newScrollPositionN);
      containerRefN.current.scrollLeft = newScrollPositionN;
    }
     
  };
  useEffect (()=>{
    // console.log(containerRefN.current.scrollLeft);
    const container = containerRefN.current;
    const maxScroll = container.scrollWidth - container.clientWidth;

    const interval = setInterval(()=>{
      if (!containerRefN.current) return;
      if (scrollPositionN >= maxScroll) {
        // Nếu đến cuối slider, dừng 2s rồi quay lại đầu
        setTimeout(() => {
          setScrollPositionN(0);
          container.scrollLeft = 0;
        }, 2000);
      } else {
        handleScrollN(BanerM);
      }
    }, 2000);
  
    
    // console.log("if it works, this line should be shown");
    return ()=> {clearInterval(interval)};
    
  }, [scrollPositionN]);
  const [listWriters, setListWriters] = useState([]);

  useEffect(() => {
    fetch("http://localhost/Ass2/kimdong_bookstore/api/home/getlistAuthor")
      .then((response) => response.json())
      .then((data) => {
        if (data.success) {
          const formattedAuthors = data.data.authors.map((author) => ({
            id: author.aut_id,
            name: author.aut_name,
            img: author.aut_img 
          }));
          setListWriters(formattedAuthors);
        }
      })
      .catch((error) => {
        console.error("Error fetching authors:", error);
      });
  }, []);

  const [newsData, setnewsData] = useState([]);

  useEffect(() => {
    fetch("http://localhost/Ass2/kimdong_bookstore/api/home/getListPost")
      .then((response) => response.json())
      .then((data) => {
        if (data.success) {
          const formattedPosts = data.data.posts.map((posts) => ({
            id: posts.p_id,
            title: posts.p_title,
            date: posts.p_date,
            img: posts.p_img 
          }));
          setnewsData(formattedPosts);
        }
      })
      .catch((error) => {
        console.error("Error fetching posts:", error);
      });
  }, []);
  const [incgBooks, setincgBooks] = useState([]);

  useEffect(() => {
    fetch("http://localhost/Ass2/kimdong_bookstore/api/home/getListBook")
      .then((response) => response.json())
      .then((data) => {
        if (data.success) {
          const formattedBooks = data.data.books.map((books) => ({
            id: books.b_id,
            name: books.b_name,
            img: books.b_img 
          }));
          setincgBooks(formattedBooks);
        }
      })
      .catch((error) => {
        console.error("Error fetching posts:", error);
      });
  }, []);


  return (
    <div className="homepage">
      <Header/>
      <div className="homepage-row1">
      <div className="news-slider">
        <div className="news-wrapper" ref={containerRefN}>
          {newsData.map((news) => (
            <div className="news-card" key={news.id}>
              <div className="baner-img-container"><img src={`http://localhost/Ass2/kimdong_bookstore/${news.img}`} alt={news.title} /></div>
                 <p>                 <br/>
                 <br/>
                 </p>
                 <p style={{ fontSize: '36px', fontWeight: 'bold' }}>{news.title} <br/></p>
                 <p>{news.date}</p>
              
            </div>
          ))}
        </div>
        <div className="baner-button">
        <button onClick={() => handleScrollN(-BanerM)}>{"<"}</button>
        <button onClick={() => handleScrollN(BanerM)}>{">"}</button>
        </div>
        
      </div>
      <div className="posts">
          {newsData.map((post) => (
            <div className="post-card" key = {post.id}>
              <div className="post-img-container"><img src={`http://localhost/Ass2/kimdong_bookstore/${post.img}`} alt={post.title} /></div>
              <div className="postTitle">
                <p className="title25">{post.title}</p>
                <p>{post.date}</p>
               </div> 
            </div>
          ))}
      </div>
      </div>
      
      <div className="authors-container">
        <div className="row1">
          <div className="col1"><p className="title20">Các tác giả</p></div>
          <div className="col2">
            <a className="highlight1" href='./Home'>Xem thêm {">"}</a>
          </div>
        </div>
        <div className="row2">
          <button onClick={() => handleScroll(-IMG)}>{"<"}</button>
          <div className="container" ref={containerRef}>
            {listWriters.map((writer) => (
              <div className="card" key={writer.id}>
                <div className="writer-img-container">
                  <img src={`http://localhost/Ass2/kimdong_bookstore/${writer.img}`} alt={writer.name}></img>
                </div>
                <p className="highlight2">{writer.name}</p>
              </div>

            ))}
          </div>
          <button onClick={() => handleScroll(IMG)}>{">"}</button>
        </div>
      </div>
      <div className="about-KD">
        <p className="title20">Kim Đồng</p>
        <p className="highlight3">Từ cuốn sách nhỏ đến thế giới lớn</p>
        <p>Nhà xuất bản Kim Đồng trực thuộc Trung ương Đoàn TNCS Hồ Chí Minh là Nhà xuất bản tổng hợp có chức năng xuất bản sách và văn hóa phẩm phục vụ thiếu nhi và các bậc phụ huynh trong cả nước, quảng bá và giới thiệu văn hóa Việt Nam ra thế giới.<br/>
        Nhà xuất bản có nhiệm vụ tổ chức bản thảo, biên soạn, biên dịch, xuất bản và phát hành các xuất bản phẩm có nội dung: giáo dục truyền thống dân tộc, giáo dục về tri thức, kiến thức… trên các lĩnh vực văn học, nghệ thuật, khoa học kỹ thuật nhằm 
        cung cấp cho các em thiếu nhi cũng như các bậc phụ huynh các kiến thức cần thiết trong cuộc sống, những tinh hoa của tri thức nhân loại nhằm góp phần giáo dục và hình thành nhân cách thế hệ trẻ.</p>
        <button onClick={handlePre}>Xem thêm</button>
      </div>
      <div className="incg-book-container">
        <div className="row1">
          <div className="col1"><p className="title20">Sắp xuất bản</p></div>
          <div className="col2">
            <a className="highlight1" href='./category'>Xem thêm {">"}</a>
          </div>
        </div>
        <div className="row2">
          <button onClick={() => handleScrollB(-IMG)}>{"<"}</button>
          <div className="container" ref={containerRefB}>
            {incgBooks.map((book) => (
              <div className="card" key ={book.id}>
                <div className="writer-img-container">
                  <img src={`http://localhost/Ass2/kimdong_bookstore/${book.img}`} alt={"img"}></img>
                </div>
                <p className="highlight2">{book.name}</p>
              </div>

            ))}
          </div>
          <button onClick={() => handleScrollB(IMG)}>{">"}</button>
        </div>
      </div>
      <Footer/>
    </div>
  );
};

export default Home;