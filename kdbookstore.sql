CREATE TABLE kdbookstore.customer(
cus_id INT PRIMARY KEY auto_increment,
cus_name VARCHAR(50) NOT NULL,
cus_password VARCHAR(64) NOT NULL,
cus_email VARCHAR(200) ,
UNIQUE(cus_email)
);
CREATE TABLE kdbookstore.author(
aut_id INT PRIMARY KEY auto_increment,
aut_name VARCHAR(50) NOT NULL,
aut_birthday DATE ,
aut_img MEDIUMBLOB,
aut_desc VARCHAR(1000),
dead DATE
);
ALTER TABLE kdbookstore.author 
MODIFY COLUMN aut_img VARCHAR(255);

CREATE TABLE kdbookstore.book(
b_id INT primary KEY auto_increment,
b_name VARCHAR (100) NOT NULL,
pubdate DATE,
b_img mediumblob,
b_desc VARCHAR (1000),
quantity INT NOT NULL,
i_quantity INT NOT NULL,
iprice INT NOT NULL,
sprice INT NOT NULL
);
CREATE table kdbookstore.category(
cate_name VARCHAR(50) primary key,
age INT default 0
);
CREATE TABLE kdbookstore.bookofAut(
  aut_id INT NOT NULL,
  b_id INT NOT NULL,
  primary key(aut_id, b_id),
  foreign key (b_id) references kdbookstore.book(b_id), 
  foreign key (aut_id) references kdbookstore.author(aut_id)
);
CREATE TABLE kdbookstore.bookclass(
b_id INT not null,
cate_name VARCHAR (50) not null,
primary key (b_id, cate_name),
foreign key (b_id) references kdbookstore.book(b_id), 
foreign key (cate_name) references kdbookstore.category(cate_name)
);
CREATE TABLE kdbookstore.posts(
p_title VARCHAR (200) NOT NULL,
p_id INT primary key auto_increment,
p_content VARCHAR (5000) NOT NULL,
p_img mediumblob,
p_writter VARCHAR (100) NOT NULL,
p_date DATE
);
ALTER TABLE kdbookstore.posts 
MODIFY COLUMN p_date VARCHAR(255);



CREATE TABLE kdbookstore.locations(
time_open time NOT NULL,
time_close time not null,
phone VARCHAR (20) NOT null,
branch_name VARCHAR (50) NOT NULL,
branch_address VARCHAR (100) NOT NULL,
main_branch boolean not null,
location_id INT PRIMARY KEY AUTO_INCREMENT
);
INSERT INTO kdbookstore.locations (time_open, time_close, phone, branch_name, branch_address, main_branch) VALUES
('08:00:00', '21:00:00', '0909000111', 'Chi nhánh Nguyễn Văn Bình', 'Đường sách Nguyễn Văn Bình, Quận 1, TP.HCM', true),
('08:30:00', '21:00:00', '0909123456', 'Chi nhánh Phan Văn Trị', '104 Phan Văn Trị, Phường 10, Gò Vấp, TP.HCM', false),
('09:00:00', '18:00:00', '0911222333', 'Chi nhánh Cộng Hòa', '415 Cộng Hòa, Phường 15, Tân Bình, TP.HCM', false),
('08:00:00', '20:00:00', '0988111222', 'Chi nhánh Vincom Bà Triệu', '191 Bà Triệu, Hai Bà Trưng, Hà Nội', false),
('09:00:00', '19:30:00', '0977666555', 'Chi nhánh Trần Thái Tông', '139 Trần Thái Tông, Cầu Giấy, Hà Nội', false);


ALTER TABLE kdbookstore.book 
MODIFY COLUMN pubdate VARCHAR(255);
insert into kdbookstore.customer (cus_name, cus_password, 
cus_email) values 
('tranhuyen', 'a9993e364706816aba3e25717850c26c9cd0d89d', 
'tranthingochuyen1772004@gmail.com');
INSERT INTO kdbookstore.book (
  b_name,
  pubdate,
  b_img,
  b_desc,
  quantity,
  i_quantity,
  iprice,
  sprice
)
VALUES 
('Doraemon: Chú mèo máy đến từ tương lai', '2021-06-10', 'img/books/d1.webp', 'Một bộ truyện kinh điển với chú mèo máy đến từ thế kỷ 22.', 120, 100, 25000, 30000),
('Doraemon: Truyền kì về bóng chày siêu cấp', '2020-08-15', 'img/books/d2.webp', 'Doraemon và những trận bóng chày huyền thoại!', 90, 80, 28000, 32000),
('Doraemon: Truyện ngắn dành cho thiếu nhi', '2022-01-25', 'img/books/d3.webp', 'Tuyển tập những câu chuyện ngắn hài hước và ý nghĩa.', 150, 130, 22000, 27000),
('Thiên sứ nhà bên', '2023-02-12', 'img/books/d4.webp', 'Một câu chuyện tình nhẹ nhàng và lãng mạn.', 110, 95, 32000, 38000),
('Kujima hót cả nhà véo von', '2022-04-07', 'img/books/d5.webp', 'Chuyện kể về ngôi làng nơi những chú chim biết hát.', 85, 70, 26000, 31000),
('Thị trấn mèo', '2019-11-03', 'img/books/d6.webp', 'Một thị trấn yên bình với những cư dân mèo kỳ lạ.', 100, 90, 24000, 29000),
('Chúa tể bóng tối', '2023-07-19', 'img/books/d7.webp', 'Cuộc phiêu lưu kỳ bí chống lại thế lực hắc ám.', 95, 85, 35000, 41000);

INSERT INTO kdbookstore.author (aut_name, aut_birthday, aut_img, dead)
VALUES 
('Miyazaki Hayao', '1950-08-17', 'img/authors/vdlh.jpg', NULL),
('Eiichiro Oda','1975-01-01', 'img/authors/oda.jpg', NULL),
('Masashi Kishimoto', '1974-11-08', 'img/authors/naruto.jpg', NULL),
('Horikoshi Kohei', '1980-08-12', 'img/authors/myhero.jpg', NULL),
('Fujiko F. Fujio', '1934-03-10', 'img/authors/dorae.jpg', '2022-04-07'),
('Isayama Hajime', '1986-08-29', 'img/authors/attackontitan.jpg', NULL);
INSERT INTO kdbookstore.posts (p_title, p_content, p_img, p_writter, p_date)
VALUES 
(
  'Chào mừng ngày sách và văn hóa đọc Việt Nam',
  'Ngày sách và văn hóa đọc Việt Nam là dịp để tôn vinh giá trị của sách, khuyến khích thói quen đọc và phát triển văn hóa đọc trong cộng đồng. Hãy cùng nhau chia sẻ những cuốn sách yêu thích và lan tỏa tình yêu với tri thức.',
  'img/posts/ms_banner_img1.webp',
  'NXB Kim Đồng',
  '2024-04-21'
),
(
  'Cậu bé Bi Đất: Bụng tròn chứa đầy niềm tin',
  '“Cậu bé Bi Đất” là câu chuyện cảm động về hành trình trưởng thành của một cậu bé nhỏ nhắn nhưng đầy ắp niềm tin và dũng cảm. Tác phẩm là món quà quý giá dành cho trẻ nhỏ và những ai yêu mến truyện thiếu nhi.',
  'img/posts/ms_banner_img2.webp',
  'Nguyễn Ngọc Thạch',
  '2024-04-15'
),
(
  'Bầy cừu bay ngang thành phố',
  'Tựa truyện mang màu sắc kỳ ảo, đầy chất thơ và suy tưởng về tuổi thơ, sự ngây ngô và trí tưởng tượng bay xa. “Bầy cừu bay ngang thành phố” gợi lên hình ảnh trong trẻo và cảm xúc yên bình giữa cuộc sống hiện đại.',
  'img/posts/ms_banner_img3.webp',
  'Nguyễn Nhật Ánh',
  '2024-04-10'
),
(
  'Không thể bỏ lỡ: Spy x Family',
  'Một gia đình bất thường với điệp viên, sát thủ và nhà ngoại cảm đã tạo nên sức hút khổng lồ cho “Spy x Family”. Bộ truyện là sự kết hợp hài hòa giữa hành động, hài hước và tình cảm gia đình, đáng để đọc trong mùa hè này.',
  'img/posts/ms_banner_img4.webp',
  'Trần Bảo Trân',
  '2024-04-12'
),
(
  'Cẩm nang về tâm tình và mối quan hệ cho mọi người',
  'Cuốn sách là lời thủ thỉ nhẹ nhàng nhưng sâu sắc về cảm xúc cá nhân, mối quan hệ xã hội và cách yêu thương bản thân. Một cẩm nang đáng quý dành cho người trẻ hiện đại đang tìm kiếm sự thấu hiểu và cân bằng trong cuộc sống.',
  'img/posts/ms_banner_img5.webp',
  'Lê Hồng Nhung',
  '2024-04-18'
);
CREATE TABLE kdbookstore.admin(
  ad_id INT primary key auto_increment,
  ad_name VARCHAR(100) NOT NULL,
  ad_password VARCHAR(50) NOT NULL,
  ad_email VARCHAR (100) NOT NULL,
  UNIQUE (ad_email)
);
INSERT INTO kdbookstore.admin (ad_name, ad_password, ad_email) VALUES
('Nguyen Van A', SHA1('password'), 'admin_a@kdbookstore.com'),
('Le Thi B', SHA1('password'), 'admin_b@kdbookstore.com'),
('Tran Van C', SHA1('password'), 'admin_c@kdbookstore.com'),
('Pham Thi D', SHA1('password'), 'admin_d@kdbookstore.com'),
('Hoang Van E', SHA1('password'), 'admin_e@kdbookstore.com');

CREATE TABLE kdbookstore.contact (
  ct_id INT AUTO_INCREMENT PRIMARY KEY,
  ct_name VARCHAR(100) NOT NULL,
  ct_email VARCHAR(100) NOT NULL,
  ct_title VARCHAR(100) NOT NULL,
  ct_content VARCHAR(2000) NOT NULL,
  ct_time DATETIME NOT NULL,
  ct_is_read BOOLEAN NOT NULL,
  ct_is_responsed BOOLEAN NOT NULL,
  CHECK (CHAR_LENGTH(ct_content) BETWEEN 100 AND 2000)
);
CREATE TABLE kdbookstore.generalInfo(
   id int auto_increment primary key,
   main_address VARCHAR (100) not null,
   email VARCHAR (100) not null,
   company_name VARCHAR (200) not null,
   company_inter_name  VARCHAR (200) not null,
   agency VARCHAR(200) not null,
   established_date DATE not null,
   phone VARCHAR(50) not null,
   director VARCHAR (100) not null,
   license varchar (255) not null
);
INSERT INTO kdbookstore.generalInfo (
    main_address,
    email,
    company_name,
    company_inter_name,
    agency,
    established_date,
    phone,
    director,
    license
) VALUES (
    'Đường sách Nguyễn Văn Bình, Quận 1, TP.HCM',
    'huyen.tran170704@hcmut.edu.vn',
    'Nhà xuất bản Kim Đồng',
    'Kim Dong Publishing House',
    'Trung ương Đoàn TNCS Hồ Chí Minh',
    '1957-06-17',
    '028-3829-3180',
    'Bùi Tuấn Nghĩa',
    '517/GP-BTTTT ngày 6/10/2015 của Bộ Thông tin và Truyền thông'
);


