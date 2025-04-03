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
CREATE TABLE kdbookstore.post(
p_title VARCHAR (200) NOT NULL,
p_id INT primary key auto_increment,
p_content VARCHAR (5000) NOT NULL,
p_img mediumblob,
p_writter VARCHAR (100) NOT NULL,
p_date DATE
);
CREATE TABLE kdbookstore.address(
time_open time NOT NULL,
time_close time not null,
phone VARCHAR (20) NOT null,
branch_name VARCHAR (50) NOT NULL,
address VARCHAR (100) NOT NULL,
a_id INT PRIMARY KEY AUTO_INCREMENT
);

insert into kdbookstore.customer (cus_name, cus_password, 
cus_email) values 
('tranhuyen', 'a9993e364706816aba3e25717850c26c9cd0d89d', 
'tranthingochuyen1772004@gmail.com');

