USE [master]
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'BookShop')
	DROP DATABASE BookShop
GO
CREATE DATABASE BookShop
GO

use BookShop
GO
-- create tables
CREATE TABLE Categories (
  category_id INT IDENTITY (1, 1) PRIMARY KEY,
  category_name VARCHAR (255) NOT NULL
);
GO


CREATE TABLE Books (
  book_id INT IDENTITY (1, 1) PRIMARY KEY,
  title VARCHAR (50) NOT NULL,
  price INT NOT NULL,
  [image] nvarchar(500) not null,
  author varchar(100),
  book_name varchar(100),
 category_id INT FOREIGN KEY REFERENCES Categories(category_id)
);


Create Table Users (
  user_id INT IDENTITY (1,1) PRIMARY KEY,
  username nvarchar(50) not null unique,
  password nvarchar(50) not null,
  role int
)
GO

CREATE TABLE Orders (
  order_id INT IDENTITY (1, 1) PRIMARY KEY,
  [status] tinyint NOT NULL,
  -- Order status: 1 = Pending; 2 = Processing; 3 = Rejected; 4 = Completed
  date DATE not null,

);
CREATE TABLE CART(
	book_id INT FOREIGN KEY REFERENCES  Books(book_id) ON DELETE CASCADE ON UPDATE CASCADE,
	user_id INT FOREIGN KEY REFERENCES Users (user_id) ON DELETE CASCADE ON UPDATE CASCADE,
	[status] INT check (status between 0 and 1),
	cart_quantity INT,
	cart_id INT PRIMARY KEY IDENTITY(1,1),
	order_id INT FOREIGN KEY REFERENCES  Orders(order_id) ON DELETE CASCADE ON UPDATE CASCADE
)
-- Categories table
INSERT INTO Categories (category_name) VALUES ('Children')
INSERT INTO Categories (category_name) VALUES ('Literature')
INSERT INTO Categories (category_name) VALUES ('Life psychology')
INSERT INTO Categories (category_name) VALUES ('Science')
INSERT INTO Categories (category_name) VALUES ('Historical politics')
INSERT INTO Categories (category_name) VALUES ('Foreign Language')
INSERT INTO Categories (category_name) VALUES ('Medicine')
INSERT INTO Categories (category_name) VALUES ('Economy')
INSERT INTO Categories (category_name) VALUES ('Cuisine')
GO

-- Books table
SET IDENTITY_INSERT Books ON
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (1,'children science' ,2,'https://product.hstatic.net/1000219449/product/upload_d2c1d7e9ca3f43ac8028b42b950bb745_master.jpg','NXB My Thuat','Childrens Encyclopedia - Practice Perseverance (Set of 10 Books)',1)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (2,'children science' ,1.5,'https://product.hstatic.net/1000219449/product/upload_15b86a7b0d504336a977edea215f2ca1_master.jpg','NXB My Thuat','Ten Thousand Questions Why - Why Rabbits Jump on Four Legs',1)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (3,'Fairy book' ,1.7,'https://product.hstatic.net/1000219449/product/upload_23c4b91ec774446d98d2b6f2aed9a946_master.jpg','NXB Van Hoc','101 Fairy Tales of Vietnam-the World - Bao Tien',1)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (4,'Fairy book' ,1.7,'https://product.hstatic.net/1000219449/product/upload_ea1b836bccaa473bb667c5a366106ac2_master.jpg','NXB Van Hoc','360 Selected Fairy Tales',1)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (5,'Fairy book' ,2.1,'https://product.hstatic.net/1000219449/product/upload_3b6503ef25d84477aafd96f63bac2b18_master.jpg','NXB Van Hoc','50 Best Vietnamese Fairy Tales - Duy Khanh Selection',1)

INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (6,'Classic literature ' ,1.2,'https://product.hstatic.net/1000219449/product/canh_buom_do_tham_master.jpg','NXB Van Hoc','Scarlet Sails',2)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (7,' Classic literature ' ,2.3,' https://product.hstatic.net/1000219449/product/nhung_cuoc_phieu_luu_cua_tom_sawyer_master.jpg ',' NXB My Thuat','Tom Sawyer Adventure Story',2)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (8,' Children literature ' ,4.8,' https://product.hstatic.net/1000219449/product/bia_1_khu_vuon_bi_mat-01_7405aea8ba1c409b86d2de8d4581cdda_master.jpg','NXB Dan Tri','Secretsgarden',2)

INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (9,' Childrens literature ' ,32,' https://product.hstatic.net/1000219449/product/bia_1_nghe_o_hai_xoay-01_9d6b66bd27894b54be16ba101fae1c03_master.jpg','NXB My Thuat','Listens-Two-Vortex',2)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (10,' Childrens literature ',12,' https://product.hstatic.net/1000219449/product/upload_c1858f7088ae48b680f18e15879e0288_master.jpg','NXB Dan Tri','Good Poetry For Children Golden Words For Children',2)

INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (11,'Bookcase life skills training' ,16, 'https://product.hstatic.net/1000219449/product/upload_7235540396c1476c9a92299d528df34a_master.jpg','NXB My Thuat','Nurturing Children Personality Sweet Sharing',3)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (12,'Bookcase life skills training' ,11,' https://product.hstatic.net/1000219449/product/upload_40fa75d57a9743a891618ec30bd60537_master.jpg',' NXB Van Hoa Thong Tin',' Small Story With Big Meaning ',3)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (13,'Uncle Ho bookcase' ,18,' https://product.hstatic.net/1000219449/product/upload_0d62be88a3d94f889a45af8bf843e4a8_master.jpg','NXB Dan Tri',' Uncle Ho Bookcase Uncle Ho With Students',3)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (14,'Uncle Ho bookcase' ,21,' https://product.hstatic.net/1000219449/product/upload_0b72e33d604f4f9b880ad69436d63184_master.jpg',' NXB Van Hoa Thong Tin',' Uncle Ho Bookcase - Tell Uncle Ho Story',3)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (15,'Beautiful living bookcase ',20,' https://product.hstatic.net/1000219449/product/upload_867252ac799f4f7582b2014b22c3c0e2_master.jpg','NXB Dan Tri',' Small Story With Big Meaning (Episode 2)',3)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (16,'Uncover the mysteries' ,6,' https://product.hstatic.net/1000219449/product/hinh_vuong_cuon_kham_pha_nhung_bi_an-01-01_master.jpg',' NXB Ha Noi',' Combo Discover Mysteries 2018 (4 Books)',4)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (17,'Uncover the mysteries ' ,2,' https://product.hstatic.net/1000219449/product/b_a_1_d_ng_v_t_master.jpg','NXB Dan Tri',' Discover the Mysteries of Animals 2018',4)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (18,'How and why ' ,8,' https://product.hstatic.net/1000219449/product/31820677_2091840664164229_3485601973451882496_n_master.jpg','NXB Dan Tri',' Combo How And Why ',4)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (19,'How and why ' ,3,' https://product.hstatic.net/1000219449/product/bia_dong_vat_hoang_da_5b1754ceed9e4bc29af7ef05ab9e5b4c_master.jpg',' NXB Ha Noi',' How and Why - Wild animals - Need to be protected from extinction',4)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (20,'Interesting Polytechnic Week ' ,2,' https://product.hstatic.net/1000219449/product/upload_aff209145ba04415a660c748fb6b0f61_master.jpg','NXB Dan Tri',' Interesting Encyclopedia Week - Curious Monday, Why Eat More Vegetables',4)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (21,'Historical comics ' ,9,' https://product.hstatic.net/1000219449/product/be_van_dan_master.jpg',' NXB Ha Noi',' Be Van Dan - The Soldier Who Uses His Body as a Gun Stand',5)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (22,'Historical comics  ' ,22,' https://product.hstatic.net/1000219449/product/31775987_2091840684164227_6977822371247816704_n_72d1254ac4054bfda647900092ffb2c1_master.jpg','NXB Dan Tri',' Historical Comics Combo (55 Books)',5)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (23,' Historical comics ' ,16,' https://product.hstatic.net/1000219449/product/hai_ba_trung_master.jpg','  NXB Ha Noi national university',' The Two Trung Sisters And The Uprising Against The Han Dynasty Dominion Army',5)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (24,'Uncle Ho bookcase ' ,14,' https://product.hstatic.net/1000219449/product/upload_70b582f80b3444c0a04d37a40a80a04a_master.jpg','NXB Dan Tri',' Uncle Ho Bookcase - Vietnam Most Beautiful Names',5)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (25,'Uncle Ho bookcase ' ,19,' https://product.hstatic.net/1000219449/product/upload_6c140717568243699e8a3db8eca4de47_master.jpg','  NXB Ha Noi national university',' Uncle Ho Bookcase - Mid-Autumn Festival I Miss Uncle Ho',5)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (26,' English book' ,25,' https://product.hstatic.net/1000219449/product/upload_c9d51c18b32e41b28e1fd76e33457913_master.jpg',' NXB Van Hoc',' 100 sample essays in modern English',6)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (27,'Korean book ' ,5,' https://product.hstatic.net/1000219449/product/hoc_tieng_han_cho_nguoi_ban_ron_master.jpg','NXB Dan Tri',' Learn Korean for Busy People (with Audio file)',6)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (28,'Japanese book ' ,5.5,' https://product.hstatic.net/1000219449/product/tap_viet_tieng_nhat_512_chu_kanji_thong_dung_master.jpg',' NXB Van Hoc',' Learn to Write Japanese 512 Common Kanji',6)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (29,'Japanese book ' ,11,' https://product.hstatic.net/1000219449/product/huong_dan_tap_viet_tieng_nhat_cho_nguoi_moi_bat_dau_master.jpg','NXB Dan Tri',' A Beginner Guide to Writing Japanese',6)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (30,'English book ' ,19,' https://product.hstatic.net/1000219449/product/upload_a24724ed251e43e9bede3d163e52b6b3_master.jpg',' NXB Van Hoc',' 145 lessons of common English grammar (English grammar in use)',6)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (31,'General medicine bookcase ' ,32,' https://product.hstatic.net/1000219449/product/upload_55a3a05fbaf5492ba2a31fa8557b9df3_master.jpg','NXB Dan Tri',' Diabetic Family Doctor',7)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (32,'General medicine bookcase ' ,32,' https://product.hstatic.net/1000219449/product/upload_acedc7bcfb694a5ba223898025ea091e_master.jpg','NXB Dan Tri',' Infertility - Prevention And Treatment',7)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (33,'General medicine bookcase ' ,37,' https://product.hstatic.net/1000219449/product/upload_55b8d88a71ee468f90fc7c9f08b7af63_master.jpg',' NXB Van Hoc',' The Art of Acting In Love',7)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (34,'Mental health bookcase ' ,16,' https://product.hstatic.net/1000219449/product/b_con_se_tu_hoc_crop_0d03fe7ef2ec4df4b12e860f5e84be47_master.jpg','NXB Dan Tri',' CHILDREN WILL LEARN ONLY WITHOUT REMINDING',7)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (35,'Mental health bookcase ' ,18,' https://product.hstatic.net/1000219449/product/upload_9d25c794f81a4198a10d0c346b0e25a0_master.jpg','NXB Dan Tri',' Things Girlfriends Should Avoid',7)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (36,'Heads of State ' ,13,' https://product.hstatic.net/1000219449/product/bill_-_hillary_clinton_ok__1_master.jpg',' NXB Van Hoc',' Bill - Harry Clinton Power Couple',8)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (37,'Heads of State ' ,16,' https://product.hstatic.net/1000219449/product/bia_sach_ly_quang_dieu_________-01_master.jpg',' NXB My Thuat',' LY QUANG DIEU - The Founding Father',8)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (38,'Business bookcase ' ,11,' https://product.hstatic.net/1000219449/product/bia_1_chuyen_bay_cuoc_doi_master.jpg','NXB Dan Tri',' Flight of Life - The Real Secret to Success',8)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (39,'Business bookcase ' ,12,' https://product.hstatic.net/1000219449/product/hinh_anh_cua_ban_dang_gia_trieu_do_1-01_master.jpg','NXB Dan Tri',' Your Pictures Are Worth Millions of Dollars',8)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (40,' Business bookcase' ,21,' https://product.hstatic.net/1000219449/product/thoi_quen_thien_tai__00b0b1693ede41b195d35e1b2720dec8_master.jpg',' NXB My Thuat',' Habits of Geniuses You Can Learn',8)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (41,'Popular food ' ,9,' https://product.hstatic.net/1000219449/product/upload_3199745ee72c42ffa2839eb783101980_master.jpg','NXB Dan Tri',' 100 Party Treats',9)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (42,' Popular food' ,6,' https://product.hstatic.net/1000219449/product/upload_21b66664d4e14ab18e6f4c7d7b23e9a4_master.jpg','NXB Dan Tri',' 100 Great Recipes for Cooking Delicious Noodles',9)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (43,' Popular food' ,7,' https://product.hstatic.net/1000219449/product/upload_cb928ca23ae94fb88acfa7f2390dc05a_master.jpg',' NXB My Thuat',' 125 Delicious Grilled Dishes',9)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (44,' Popular food' ,5,' https://product.hstatic.net/1000219449/product/upload_774c27f358ca47b5a397b08420f8afe9_master.jpg','NXB Dan Tri',' 130 Easy-to-Make Drink Hot Pot Dishes',9)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (45,'Popular food ' ,6,' https://product.hstatic.net/1000219449/product/upload_dbf405508bc24e5299e95973618853ba_master.jpg','NXB Dan Tri',' 140 Amazing Desserts',9)
INSERT INTO Books (book_id,title,price,[image],author,book_name,category_id) VALUES (46,' Popular food' ,9.2,' https://product.hstatic.net/1000219449/product/upload_3926d5bc52014d4c930f878d2b49deba_master.jpg',' NXB My Thuat',' 179 Healthy Vegetarian Dishes',9)



SET IDENTITY_INSERT Books OFF

GO

INSERT INTO Users ( username, password, role) VALUES ('admin','1234',1)
INSERT INTO Users ( username, password, role) VALUES ('hoa','123',2)
INSERT INTO Users ( username, password, role) VALUES ('la','12',2)
GO


INSERT INTO Orders (user_id, status, date) VALUES (1,4,'20160103');
INSERT INTO Orders (user_id, status, date) VALUES (2,4,'20160103');
INSERT INTO Orders (user_id, status, date) VALUES (3,4,'20160103');
INSERT INTO Orders (user_id, status, date) VALUES (1,4,'20160415');
INSERT INTO Orders (user_id, status, date) VALUES (2,4,'20160106');
INSERT INTO Orders (user_id, status, date) VALUES (3,4,'20160105');
INSERT INTO Orders (user_id, status, date) VALUES (1,4,'20160105');
INSERT INTO Orders (user_id, status, date) VALUES (2,4,'20160105');
INSERT INTO Orders (user_id, status, date) VALUES (3,4,'20160108');
INSERT INTO Orders (user_id, status, date) VALUES (1,4,'20160216');
INSERT INTO Orders (user_id, status, date) VALUES (2,4,'20160117');
GO

INSERT INTO CART(cart_id, status, date) VALUES (1,4,'20160103');



select * from categories;
select * from Users;
select * from Books;
select * from Orders;
GO
delete from Users 
where user_id = 5

select * from Users
where username = 'tunn' and password = 123
INSERT INTO Users ( username, password, role) VALUES ('tunn',123,2)