import React, { useRef, useEffect, useState } from 'react';
import {useNavigate } from 'react-router-dom'
import './home.css';

const IMG = 200;
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
    setScrollPosition(newScrollPositionB);
    containerRefB.current.scrollLeft = newScrollPositionB;
  };
  const newsData = [
    {
      id: 1,
      title: "Quyền lực của đất đai",
      linkadr: "https://nhanam.vn/",
      date: "Chủ Nhật, 03/03/2024",
      img: "https://scontent.fhan14-3.fna.fbcdn.net/v/t39.30808-6/480203269_1042894241211643_9180551152830458713_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=833d8c&_nc_ohc=km4jnMAsEG0Q7kNvgGuogyJ&_nc_oc=AdiYxOifphGQhg4dhbZ67v7ZhtDPFKL-WscxXH4xfuCpxImDBhrWU4RTX5y26D8F-Ac&_nc_zt=23&_nc_ht=scontent.fhan14-3.fna&_nc_gid=ACelN-4fLXS991V7UmtSN0W&oh=00_AYD83bcdfp2Tij-zEUC_hUPgCpX70xQ-Y_KjvJh5gRFu2A&oe=67CB362E"
    }
  ];
  const listWriters = [
    {
      id: 1,
      name: "Parmy Oison",
      img: "https://scontent.fhan14-3.fna.fbcdn.net/v/t39.30808-6/480203269_1042894241211643_9180551152830458713_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=833d8c&_nc_ohc=km4jnMAsEG0Q7kNvgGuogyJ&_nc_oc=AdiYxOifphGQhg4dhbZ67v7ZhtDPFKL-WscxXH4xfuCpxImDBhrWU4RTX5y26D8F-Ac&_nc_zt=23&_nc_ht=scontent.fhan14-3.fna&_nc_gid=ACelN-4fLXS991V7UmtSN0W&oh=00_AYD83bcdfp2Tij-zEUC_hUPgCpX70xQ-Y_KjvJh5gRFu2A&oe=67CB362E"
    }
    ,
    {
      id: 2,
      name: "Nguyen Ngoc Tu",
      img: "https://bizweb.dktcdn.net/100/363/455/articles/ta-c-gia-3.png?v=1724228914707"
    },
    {
      id: 3,
      name: "Nguyen Ngoc Tu",
      img: "https://bizweb.dktcdn.net/100/363/455/articles/ta-c-gia-3.png?v=1724228914707"
    },
    {
      id: 4,
      name: "Nguyen Ngoc",
      img: "https://bizweb.dktcdn.net/100/363/455/articles/ta-c-gia-3.png?v=1724228914707"
    },
    {
      id: 5,
      name: "Nguyen Ngoc",
      img: "https://bizweb.dktcdn.net/100/363/455/articles/ta-c-gia-3.png?v=1724228914707"
    },
    {
      id: 6,
      name: "Nguyen Ngoc",
      img: "https://bizweb.dktcdn.net/100/363/455/articles/ta-c-gia-3.png?v=1724228914707"
    },
    {
      id: 7,
      name: "Nguyen Ngoc",
      img: "https://bizweb.dktcdn.net/100/363/455/articles/ta-c-gia-3.png?v=1724228914707"
    },
    {
      id: 8,
      name: "Nguyen Ngoc",
      img: "https://bizweb.dktcdn.net/100/363/455/articles/ta-c-gia-3.png?v=1724228914707"
    }
  ]
  const incgBooks = [
    {
      id: 1,
      name: "Điều kỳ diệu của tiệm tạp hóa namiya",
      img: "https://bizweb.dktcdn.net/100/363/455/products/dieukydieucuatiemtaphoanamiya0.jpg?v=1705552561163"
    },
    {
      id: 2,
      name: "Anne dưới chái nhà xanh",
      img: "https://bizweb.dktcdn.net/100/363/455/products/anne-toc-do-duoi-chai-nha-xanh-dbb1a1fd-9ed9-4431-9266-d64995d9ba15.jpg?v=1733393474277"
    },
    {
      id: 3,
      name: "Anne dưới chái nhà xanh",
      img: "https://bizweb.dktcdn.net/100/363/455/products/anne-toc-do-duoi-chai-nha-xanh-dbb1a1fd-9ed9-4431-9266-d64995d9ba15.jpg?v=1733393474277"
    },
    {
      id: 4,
      name: "Venonika quyết chết",
      img: "https://bizweb.dktcdn.net/100/363/455/products/vetkhachantrencat01.jpg?v=1705552569337"
    },
    {
      id: 5,
      name: "Không ai qua sông",
      img: "https://bizweb.dktcdn.net/100/363/455/products/dieukydieucuatiemtaphoanamiya0.jpg?v=1705552561163"
    },
    {
      id: 6,
      name: "Anne dưới chái nhà xanh",
      img: "https://bizweb.dktcdn.net/100/363/455/products/anne-toc-do-duoi-chai-nha-xanh-dbb1a1fd-9ed9-4431-9266-d64995d9ba15.jpg?v=1733393474277"
    },
    {
      id: 7,
      name: "Venonika quyết chết",
      img: "https://bizweb.dktcdn.net/100/363/455/products/vetkhachantrencat01.jpg?v=1705552569337"
    },
    {
      id: 8,
      name: "Gửi lời chào",
      img: "https://bizweb.dktcdn.net/100/363/455/products/dieukydieucuatiemtaphoanamiya0.jpg?v=1705552561163"
    }
  ]
  
  

  return (
    <div className="homepage">

      <div className="news-slider">
        <div className="news-wrapper" >
          {newsData.map((news) => (
            <div key={news.id} className="news-card">
              <a href={news.linkadr} target="_blank" rel="noopener noreferrer">
                <img src={news.img} alt={news.title} />
                <p className="title20">{news.title}</p>
                <p>{news.date}</p>
              </a>
            </div>
          ))}
        </div>
      </div>
      <div className="authors-container">
        <div className="row1">
          <div classNamw="col1"><p className="title20">Các tác giả</p></div>
          <div className="col2">
            <a className="highlight1" href='./Home'>Xem thêm {">"}</a>
          </div>
        </div>
        <div className="row2">
          <button onClick={() => handleScroll(-IMG)}>{"<"}</button>
          <div className="container" ref={containerRef}>
            {listWriters.map((writer) => (
              <div class="card">
                <div className="writer-img-container">
                  <img src={writer.img} alt={writer.name}></img>
                </div>
                <p className="highlight2">{writer.name}</p>
              </div>

            ))}
          </div>
          <button onClick={() => handleScroll(IMG)}>{">"}</button>
        </div>
      </div>
      <div className="about-KD">
        <p class="title20">Kim Đồng</p>
        <p class="highlight3">Từ cuốn sách nhỏ đến thế giới lớn</p>
        <p>Nhà xuất bản Kim Đồng trực thuộc Trung ương Đoàn TNCS Hồ Chí Minh là Nhà xuất bản tổng hợp có chức năng xuất bản sách và văn hóa phẩm phục vụ thiếu nhi và các bậc phụ huynh trong cả nước, quảng bá và giới thiệu văn hóa Việt Nam ra thế giới.<br/>
        Nhà xuất bản có nhiệm vụ tổ chức bản thảo, biên soạn, biên dịch, xuất bản và phát hành các xuất bản phẩm có nội dung: giáo dục truyền thống dân tộc, giáo dục về tri thức, kiến thức… trên các lĩnh vực văn học, nghệ thuật, khoa học kỹ thuật nhằm 
        cung cấp cho các em thiếu nhi cũng như các bậc phụ huynh các kiến thức cần thiết trong cuộc sống, những tinh hoa của tri thức nhân loại nhằm góp phần giáo dục và hình thành nhân cách thế hệ trẻ.</p>
        <button onClick={handlePre}>Xem thêm</button>
      </div>
      <div className="incg-book-container">
        <div className="row1">
          <div classNamw="col1"><p className="title20">Sắp xuất bản</p></div>
          <div className="col2">
            <a className="highlight1" href='./category'>Xem thêm {">"}</a>
          </div>
        </div>
        <div className="row2">
          <button onClick={() => handleScrollB(-IMG)}>{"<"}</button>
          <div className="container" ref={containerRefB}>
            {incgBooks.map((book) => (
              <div class="card">
                <div className="writer-img-container">
                  <img src={book.img} alt={"img"}></img>
                </div>
                <p className="highlight2">{book.name}</p>
              </div>

            ))}
          </div>
          <button onClick={() => handleScrollB(IMG)}>{">"}</button>
        </div>
      </div>
      <div className="partner"></div>
    </div>
  );
};

export default Home;
