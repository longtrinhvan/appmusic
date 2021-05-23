
DROP DATABASE appmusic;
CREATE DATABASE appmusic;
USE appmusic;

CREATE TABLE album(
  idalbum int NOT NULL AUTO_INCREMENT,
  namealbum varchar(100) DEFAULT NULL,
  PRIMARY KEY (idalbum)
);
INSERT INTO `appmusic`.`album`(`idalbum`,`namealbum`)
VALUES('1','album 1');
INSERT INTO `appmusic`.`album`(`idalbum`,`namealbum`)
VALUES('2','album 2');
INSERT INTO `appmusic`.`album`(`idalbum`,`namealbum`)
VALUES('3','album 3');
INSERT INTO `appmusic`.`album`(`idalbum`,`namealbum`)
VALUES('4','album 4');
INSERT INTO `appmusic`.`album`(`idalbum`,`namealbum`)
VALUES('5','album 5');
INSERT INTO `appmusic`.`album`(`idalbum`,`namealbum`)
VALUES('6','album 6');

CREATE TABLE category (
  idcategory int NOT NULL AUTO_INCREMENT,
  namecategory varchar(100) DEFAULT NULL,
  PRIMARY KEY (idcategory)
);

INSERT INTO `appmusic`.`category`(`idcategory`,`namecategory`)
VALUES('1','rock');
INSERT INTO `appmusic`.`category`(`idcategory`,`namecategory`)
VALUES('2','pop');
INSERT INTO `appmusic`.`category`(`idcategory`,`namecategory`)
VALUES('3','jazz');
INSERT INTO `appmusic`.`category`(`idcategory`,`namecategory`)
VALUES('4','R&B');
INSERT INTO `appmusic`.`category`(`idcategory`,`namecategory`)
VALUES('5','hip hop');
INSERT INTO `appmusic`.`category`(`idcategory`,`namecategory`)
VALUES('6','dance');
INSERT INTO `appmusic`.`category`(`idcategory`,`namecategory`)
VALUES('7','Latinh');

CREATE TABLE music (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(700) DEFAULT NULL,
  idalbum int NOT NULL,
  idcategory int NOT NULL,
  url varchar(700) DEFAULT NULL,
  image varchar(700) DEFAULT NULL,
  isdelete int DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (idalbum) REFERENCES album(idalbum),
  FOREIGN KEY (idcategory) REFERENCES category(idcategory)
);

INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(1,'Có Chắc Yêu Là Đây',1,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',1);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(2,'Waiting For Love',1,1,'https://drive.google.com/file/d/1bpCc2RucjXK-qvuC9k3AeWxJTWu5sou_/preview','https://i.pinimg.com/originals/79/33/84/79338437d58d124a1f6f039c318574d5.jpg',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(3,'Em của ngày hôm qua',1,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://phapluatxahoi.vn/stores/news_dataimages/thanhthuyplxh/032021/07/13/4443_cam-am-sao-truc-em-cua-ngay-hom-qua.jpg?rt=20210307134445',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(4,'Way Back Home',1,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','http://tienghancoban.edu.vn/images/2018/11/05/1566524.jpg',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(5,'Something Just Like This',2,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://i1.sndcdn.com/artworks-000220086310-6z7vf7-t500x500.jpg',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(6,'Phao - 2 Phut Hon',2,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://media-cdn.laodong.vn/Storage/NewsPortal/2020/3/9/789544/Phao.png',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(7,'XIN ĐỪNG NHẤC MÁY',3,3,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://r2h8t4h7.stackpathcdn.com/wp-content/uploads/2021/04/saostar-bw63b3gkecyvzvlh.png',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(8,'Exs Hate Me - B Ray x Masew ',2,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://c-sg.smule.com/s-sf-bck2/arr/1c/c9/91daf483-cc67-40d3-bb8c-7b6479d4554e_1024.jpg',0);

INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(441,'MUỘN RỒI MÀ SAO CÒN',1,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://cdnmedia.thethaovanhoa.vn/Upload/HkZGoyHWnkz0zSe1YDYTw/files/2021/04/mr.jpg',1);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(442,'Dù Cho Mai Về Sau',1,1,'https://drive.google.com/file/d/1bpCc2RucjXK-qvuC9k3AeWxJTWu5sou_/preview','https://i.ytimg.com/vi/Lz8G_Hwc8B8/sddefault.jpg',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(443,'SẮP 30 - TRỊNH ĐÌNH QUANG',1,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://leecoffee.net/wp-content/uploads/2021/05/Sap-30-Trinh-Dinh-Quang-1024x566.jpg',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(444,'MỘT BƯỚC YÊU VẠN DẶM ĐAU',1,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://i1.sndcdn.com/artworks-000503874891-0lqsjz-t500x500.jpg',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(445,'Bài Này Chill Phết',2,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://cdn.vietnammoi.vn/2019/5/22/r-den-vau-min-13-15584965816891407398177.jpg',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(446,'Trốn Tìm',2,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://vnn-imgs-f.vgcloud.vn/2021/05/13/21/den-vau-bat-tay-nhom-mtv-lam-mv-day-hoai-niem-tron-tim.jpg',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(447,'HÃY TRAO CHO ANH',3,3,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://dep.com.vn/wp-content/uploads/2019/07/deponline-sontung.jpg',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(448,'CHẠY NGAY ĐI | RUN NOW',2,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://i1.sndcdn.com/artworks-000383044971-0n90tt-t500x500.jpg',0);


INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(111,'STREAM ĐẾN BAO GIỜ ',1,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://i1.sndcdn.com/artworks-AhSqmZ3cXJp3C9QZ-DrIGhg-t500x500.jpg',1);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(112,'ÔNG BÀ GIÀ TAO LO HẾT',1,1,'https://drive.google.com/file/d/1bpCc2RucjXK-qvuC9k3AeWxJTWu5sou_/preview','https://i.scdn.co/image/ab67616d0000b2732e4c9cf911a8a885cbf63656',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(113,'Skyler Theme Song',1,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://avatar-ex-swe.nixcdn.com/song/2021/03/19/e/1/4/b/1616144893741_640.jpg',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(114,'Hoa Nở Không Màu',1,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://1.bp.blogspot.com/-hi38OaHIQDA/XvtgB_bEArI/AAAAAAAAXq8/Xsh4vvPipekHvUHXP6rpsybKPByu1NJOACK4BGAsYHg/s1000/Folder.jpg',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(115,'Nếu Là Anh',2,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://i1.sndcdn.com/artworks-000081114114-wcpx0y-t500x500.jpg',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(116,'Em Gái Mưa',2,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://avatar-ex-swe.nixcdn.com/mv/2017/09/04/c/1/9/c/1504540862822_640.jpg',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(117,'Bình Yên Những Phút Giây',3,3,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://ss-images.saostar.vn/2017/04/20/1233279/sontung006.jpg',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(118,'NGƯỜI ƠI NGƯỜI Ở ĐỪNG VỀ ',2,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://avatar-ex-swe.nixcdn.com/song/2020/09/22/8/6/c/e/1600750113820_640.jpg',0);

INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(9,'Light rock 1.1',3,3,'https://www.mediacollege.com/downloads/music/ama/ama_01-1.mp3','https://cdn.shopify.com/s/files/1/0747/3829/products/mQ0289_1024x1024.jpeg',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(10,'Light rock 1.2',3,3,'https://www.mediacollege.com/downloads/music/ama/ama_01-2.mp3','https://image.shutterstock.com/shutterstock/photos/769420375/display_1500/stock-vector-rock-forever-freedom-and-love-guitarist-playing-electric-guitar-icon-decorated-with-lines-and-769420375.jpg',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(11,'Light rock 1.3',3,3,'https://www.mediacollege.com/downloads/music/ama/ama_01-3.mp3','https://previews.123rf.com/images/sergeypykhonin/sergeypykhonin1709/sergeypykhonin170900036/85811603-rock-music-lettering-guitar-fretboard-label-vector-illustration.jpg',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(12,'Light rock 1.4',3,3,'https://www.mediacollege.com/downloads/music/ama/ama_02-1.mp3','https://image.freepik.com/free-vector/rock-music-logo_23-2147889169.jpg',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(13,'Light rock 1.5',3,3,'https://www.mediacollege.com/downloads/music/ama/ama_02-2.mp3','https://ejomlexus.files.wordpress.com/2011/07/god-listens-to-rock-music.jpg',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(14,'Light rock 1.6',3,3,'https://www.mediacollege.com/downloads/music/ama/ama_02-3.mp3','https://images.squarespace-cdn.com/content/v1/59eb8ebc1f318dc4da490f5d/1533170224865-T37P9ODBEKP626QMXJXW/ke17ZwdGBToddI8pDm48kCQk2zunoKiIFW35B84FIyV7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UXiDXE9gBE6MpsvHTR9qjuuOzYwSNUnR7AC_J8RtCgbszwMy-Jd4qnWKZiGmV5bqqQ/guitarhero.jpg',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(15,'Light rock 1.7',3,3,'https://www.mediacollege.com/downloads/music/ama/ama_01-4.mp3','https://www.pngfind.com/pngs/m/330-3306161_rock-music-classic-sign-of-the-bar-tune.png',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(16,'Light rock 1.8',3,3,'https://www.mediacollege.com/downloads/music/ama/ama_01-1.mp3','https://akm-img-a-in.tosshub.com/indiatoday/music-day-story,-facebook_647_062116084641.jpg',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(17,'Light rock 1.9',3,3,'https://www.mediacollege.com/downloads/music/ama/ama_01-1.mp3','https://www.roadiemusic.com/blog/wp-content/uploads/2020/02/Is-Rock-Music-Dead.png',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(19,'Light rock 1.10',3,3,'https://www.mediacollege.com/downloads/music/ama/ama_01-1.mp3','https://www.gordlemonmusic.com/wp-content/uploads/2018/02/Gord-Lemon-Rock-Music-Production-600x375.jpg',4);


CREATE TABLE role (
  idrole int NOT NULL AUTO_INCREMENT,
  namerole varchar(200) DEFAULT NULL,
  PRIMARY KEY (idrole)
);

INSERT INTO `appmusic`.`role`(`idrole`,`namerole`)
VALUES('1','admin');
INSERT INTO `appmusic`.`role`(`idrole`,`namerole`)
VALUES('2','user');


CREATE TABLE account (
  id int NOT NULL AUTO_INCREMENT,
  idrole int NOT NULL ,
  name varchar(200) DEFAULT NULL,
  fullname varchar(200) DEFAULT NULL,
  password varchar(200) DEFAULT NULL,
  image varchar(700) DEFAULT NULL,
  isdelete int DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (idrole) REFERENCES role(idrole)
);

INSERT INTO `appmusic`.`account`(`id`,`idrole`,`name`,`fullname`,`password`,`image`,`isdelete`)
VALUES(1,1,'long','Trịnh Văn Long','$2a$10$slYQmyNdGzTn7ZLBXBChFOC9f6kFjAqPhccnP6DxlWXx2lPk1C3G6','https://yt3.ggpht.com/ytc/AAUvwniNNRXsKcsAunIOF31uQCGXMaxGrK5m3Kjj_T9cMg=s900-c-k-c0x00ffffff-no-rj',0);
INSERT INTO `appmusic`.`account`(`id`,`idrole`,`name`,`fullname`,`password`,`image`,`isdelete`)
VALUES(2,1,'sang','Đỗ Thái Sang','$2a$10$slYQmyNdGzTn7ZLBXBChFOC9f6kFjAqPhccnP6DxlWXx2lPk1C3G6','https://yt3.ggpht.com/ytc/AAUvwniNNRXsKcsAunIOF31uQCGXMaxGrK5m3Kjj_T9cMg=s900-c-k-c0x00ffffff-no-rj',0);
INSERT INTO `appmusic`.`account`(`id`,`idrole`,`name`,`fullname`,`password`,`image`,`isdelete`)
VALUES(3,2,'hung','Nguyễn Văn Hưng','$2a$10$slYQmyNdGzTn7ZLBXBChFOC9f6kFjAqPhccnP6DxlWXx2lPk1C3G6','https://yt3.ggpht.com/ytc/AAUvwniNNRXsKcsAunIOF31uQCGXMaxGrK5m3Kjj_T9cMg=s900-c-k-c0x00ffffff-no-rj',0);
INSERT INTO `appmusic`.`account`(`id`,`idrole`,`name`,`fullname`,`password`,`image`,`isdelete`)
VALUES(4,2,'minh','Trịnh Văn Minh','$2a$10$slYQmyNdGzTn7ZLBXBChFOC9f6kFjAqPhccnP6DxlWXx2lPk1C3G6','https://yt3.ggpht.com/ytc/AAUvwniNNRXsKcsAunIOF31uQCGXMaxGrK5m3Kjj_T9cMg=s900-c-k-c0x00ffffff-no-rj',0);
INSERT INTO `appmusic`.`account`(`id`,`idrole`,`name`,`fullname`,`password`,`image`,`isdelete`)
VALUES(5,2,'hanh','Đỗ Thái Hạnh','$2a$10$slYQmyNdGzTn7ZLBXBChFOC9f6kFjAqPhccnP6DxlWXx2lPk1C3G6','https://yt3.ggpht.com/ytc/AAUvwniNNRXsKcsAunIOF31uQCGXMaxGrK5m3Kjj_T9cMg=s900-c-k-c0x00ffffff-no-rj',0);
INSERT INTO `appmusic`.`account`(`id`,`idrole`,`name`,`fullname`,`password`,`image`,`isdelete`)
VALUES(6,2,'hungpro','Nguyễn Văn Hưng','$2a$10$slYQmyNdGzTn7ZLBXBChFOC9f6kFjAqPhccnP6DxlWXx2lPk1C3G6','https://yt3.ggpht.com/ytc/AAUvwniNNRXsKcsAunIOF31uQCGXMaxGrK5m3Kjj_T9cMg=s900-c-k-c0x00ffffff-no-rj',0);
INSERT INTO `appmusic`.`account`(`id`,`idrole`,`name`,`fullname`,`password`,`image`,`isdelete`)
VALUES(7,2,'longpro','Trịnh Văn Long','$2a$10$slYQmyNdGzTn7ZLBXBChFOC9f6kFjAqPhccnP6DxlWXx2lPk1C3G6','https://yt3.ggpht.com/ytc/AAUvwniNNRXsKcsAunIOF31uQCGXMaxGrK5m3Kjj_T9cMg=s900-c-k-c0x00ffffff-no-rj',0);
INSERT INTO `appmusic`.`account`(`id`,`idrole`,`name`,`fullname`,`password`,`image`,`isdelete`)
VALUES(8,2,'ngan','Đỗ Thúy Ngân','$2a$10$slYQmyNdGzTn7ZLBXBChFOC9f6kFjAqPhccnP6DxlWXx2lPk1C3G6','https://yt3.ggpht.com/ytc/AAUvwniNNRXsKcsAunIOF31uQCGXMaxGrK5m3Kjj_T9cMg=s900-c-k-c0x00ffffff-no-rj',0);
INSERT INTO `appmusic`.`account`(`id`,`idrole`,`name`,`fullname`,`password`,`image`,`isdelete`)
VALUES(9,2,'hung2222','Nguyễn Văn Hưng','$2a$10$slYQmyNdGzTn7ZLBXBChFOC9f6kFjAqPhccnP6DxlWXx2lPk1C3G6','https://yt3.ggpht.com/ytc/AAUvwniNNRXsKcsAunIOF31uQCGXMaxGrK5m3Kjj_T9cMg=s900-c-k-c0x00ffffff-no-rj',0);
INSERT INTO `appmusic`.`account`(`id`,`idrole`,`name`,`fullname`,`password`,`image`,`isdelete`)
VALUES(10,2,'long2323','Trịnh Văn Long','$2a$10$slYQmyNdGzTn7ZLBXBChFOC9f6kFjAqPhccnP6DxlWXx2lPk1C3G6','https://yt3.ggpht.com/ytc/AAUvwniNNRXsKcsAunIOF31uQCGXMaxGrK5m3Kjj_T9cMg=s900-c-k-c0x00ffffff-no-rj',0);
INSERT INTO `appmusic`.`account`(`id`,`idrole`,`name`,`fullname`,`password`,`image`,`isdelete`)
VALUES(11,2,'Aanabc','Nguyễn Văn Ân','$2a$10$slYQmyNdGzTn7ZLBXBChFOC9f6kFjAqPhccnP6DxlWXx2lPk1C3G6','https://yt3.ggpht.com/ytc/AAUvwniNNRXsKcsAunIOF31uQCGXMaxGrK5m3Kjj_T9cMg=s900-c-k-c0x00ffffff-no-rj',0);
INSERT INTO `appmusic`.`account`(`id`,`idrole`,`name`,`fullname`,`password`,`image`,`isdelete`)
VALUES(12,2,'trang','Nguyễn Thị Trang','$2a$10$slYQmyNdGzTn7ZLBXBChFOC9f6kFjAqPhccnP6DxlWXx2lPk1C3G6','https://yt3.ggpht.com/ytc/AAUvwniNNRXsKcsAunIOF31uQCGXMaxGrK5m3Kjj_T9cMg=s900-c-k-c0x00ffffff-no-rj',0);
INSERT INTO `appmusic`.`account`(`id`,`idrole`,`name`,`fullname`,`password`,`image`,`isdelete`)
VALUES(13,2,'mai233','Đỗ Thị Mai','$2a$10$slYQmyNdGzTn7ZLBXBChFOC9f6kFjAqPhccnP6DxlWXx2lPk1C3G6','https://yt3.ggpht.com/ytc/AAUvwniNNRXsKcsAunIOF31uQCGXMaxGrK5m3Kjj_T9cMg=s900-c-k-c0x00ffffff-no-rj',0);
INSERT INTO `appmusic`.`account`(`id`,`idrole`,`name`,`fullname`,`password`,`image`,`isdelete`)
VALUES(114,2,'hoa1212','Lê Thái Hòa','$2a$10$slYQmyNdGzTn7ZLBXBChFOC9f6kFjAqPhccnP6DxlWXx2lPk1C3G6','https://yt3.ggpht.com/ytc/AAUvwniNNRXsKcsAunIOF31uQCGXMaxGrK5m3Kjj_T9cMg=s900-c-k-c0x00ffffff-no-rj',0);
INSERT INTO `appmusic`.`account`(`id`,`idrole`,`name`,`fullname`,`password`,`image`,`isdelete`)
VALUES(15,2,'hungaaaa','Nguyễn Văn Hùng','$2a$10$slYQmyNdGzTn7ZLBXBChFOC9f6kFjAqPhccnP6DxlWXx2lPk1C3G6','https://yt3.ggpht.com/ytc/AAUvwniNNRXsKcsAunIOF31uQCGXMaxGrK5m3Kjj_T9cMg=s900-c-k-c0x00ffffff-no-rj',0);
INSERT INTO `appmusic`.`account`(`id`,`idrole`,`name`,`fullname`,`password`,`image`,`isdelete`)
VALUES(16,2,'binh','Đỗ Thị Bình','$2a$10$slYQmyNdGzTn7ZLBXBChFOC9f6kFjAqPhccnP6DxlWXx2lPk1C3G6','https://yt3.ggpht.com/ytc/AAUvwniNNRXsKcsAunIOF31uQCGXMaxGrK5m3Kjj_T9cMg=s900-c-k-c0x00ffffff-no-rj',0);
INSERT INTO `appmusic`.`account`(`id`,`idrole`,`name`,`fullname`,`password`,`image`,`isdelete`)
VALUES(17,2,'tung','Nguyễn Thanh Tùng','$2a$10$slYQmyNdGzTn7ZLBXBChFOC9f6kFjAqPhccnP6DxlWXx2lPk1C3G6','https://yt3.ggpht.com/ytc/AAUvwniNNRXsKcsAunIOF31uQCGXMaxGrK5m3Kjj_T9cMg=s900-c-k-c0x00ffffff-no-rj',0);
INSERT INTO `appmusic`.`account`(`id`,`idrole`,`name`,`fullname`,`password`,`image`,`isdelete`)
VALUES(18,2,'van222222','Ngô Thanh Vân','$2a$10$slYQmyNdGzTn7ZLBXBChFOC9f6kFjAqPhccnP6DxlWXx2lPk1C3G6','https://yt3.ggpht.com/ytc/AAUvwniNNRXsKcsAunIOF31uQCGXMaxGrK5m3Kjj_T9cMg=s900-c-k-c0x00ffffff-no-rj',0);
INSERT INTO `appmusic`.`account`(`id`,`idrole`,`name`,`fullname`,`password`,`image`,`isdelete`)
VALUES(19,2,'vanvip','Trịnh Thị Vân','$2a$10$slYQmyNdGzTn7ZLBXBChFOC9f6kFjAqPhccnP6DxlWXx2lPk1C3G6','https://yt3.ggpht.com/ytc/AAUvwniNNRXsKcsAunIOF31uQCGXMaxGrK5m3Kjj_T9cMg=s900-c-k-c0x00ffffff-no-rj',0);





