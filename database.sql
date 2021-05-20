
DROP DATABASE appmusic;
CREATE DATABASE appmusic;
USE appmusic;

CREATE TABLE album(
  id int NOT NULL AUTO_INCREMENT,
  name varchar(100) DEFAULT NULL,
  PRIMARY KEY (id)
);
INSERT INTO `appmusic`.`album`(`id`,`name`)
VALUES('1','album 1');
INSERT INTO `appmusic`.`album`(`id`,`name`)
VALUES('2','album 2');
INSERT INTO `appmusic`.`album`(`id`,`name`)
VALUES('3','album 3');
INSERT INTO `appmusic`.`album`(`id`,`name`)
VALUES('4','album 4');
INSERT INTO `appmusic`.`album`(`id`,`name`)
VALUES('5','album 5');
INSERT INTO `appmusic`.`album`(`id`,`name`)
VALUES('6','album 6');

CREATE TABLE category (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(100) DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT INTO `appmusic`.`category`(`id`,`name`)
VALUES('1','rock');
INSERT INTO `appmusic`.`category`(`id`,`name`)
VALUES('2','pop');
INSERT INTO `appmusic`.`category`(`id`,`name`)
VALUES('3','jazz');
INSERT INTO `appmusic`.`category`(`id`,`name`)
VALUES('4','R&B');
INSERT INTO `appmusic`.`category`(`id`,`name`)
VALUES('5','hip hop');
INSERT INTO `appmusic`.`category`(`id`,`name`)
VALUES('6','dance');
INSERT INTO `appmusic`.`category`(`id`,`name`)
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
  FOREIGN KEY (idalbum) REFERENCES album(id),
  FOREIGN KEY (idcategory) REFERENCES category(id)
);

INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(1,'Có Chắc Yêu Là Đây',1,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',1);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(2,'Waiting For Love',1,1,'https://drive.google.com/file/d/1bpCc2RucjXK-qvuC9k3AeWxJTWu5sou_/preview','https://drive.google.com/file/d/1Jn13MTlzuduo6W3bAsUscbi2c5kJAOz7/preview',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(3,'Em của ngày hôm qua',1,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(4,'Way Back Home',1,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(5,'Something Just Like This',2,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(6,'Phao - 2 Phut Hon',2,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(7,'XIN ĐỪNG NHẤC MÁY',2,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(8,'Exs Hate Me - B Ray x Masew ',2,1,'https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',0);

INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(9,'Light rock 1.1',3,3,'https://www.mediacollege.com/downloads/music/ama/ama_01-1.mp3','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(10,'Light rock 1.2',3,3,'https://www.mediacollege.com/downloads/music/ama/ama_01-2.mp3','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(11,'Light rock 1.3',3,3,'https://www.mediacollege.com/downloads/music/ama/ama_01-3.mp3','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(12,'Light rock 1.4',3,3,'https://www.mediacollege.com/downloads/music/ama/ama_02-1.mp3','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(13,'Light rock 1.5',3,3,'https://www.mediacollege.com/downloads/music/ama/ama_02-2.mp3','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(14,'Light rock 1.6',3,3,'https://www.mediacollege.com/downloads/music/ama/ama_02-3.mp3','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(15,'Light rock 1.7',3,3,'https://www.mediacollege.com/downloads/music/ama/ama_01-4.mp3','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(16,'Light rock 1.8',3,3,'https://www.mediacollege.com/downloads/music/ama/ama_01-1.mp3','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(17,'Light rock 1.9',3,3,'https://www.mediacollege.com/downloads/music/ama/ama_01-1.mp3','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`idalbum`,`idcategory`,`url`,`image`,`isdelete`)
VALUES(19,'Light rock 1.10',3,3,'https://www.mediacollege.com/downloads/music/ama/ama_01-1.mp3','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',4);


CREATE TABLE role (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(200) DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT INTO `appmusic`.`role`(`id`,`name`)
VALUES('1','admin');
INSERT INTO `appmusic`.`role`(`id`,`name`)
VALUES('2','user');


CREATE TABLE account (
  id int NOT NULL AUTO_INCREMENT,
  idrole int NOT NULL ,
  name varchar(200) DEFAULT NULL,
  password varchar(20) DEFAULT NULL,
  image varchar(700) DEFAULT NULL,
  isdelete int DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (idrole) REFERENCES role(id)
);

INSERT INTO `appmusic`.`account`(`id`,`idrole`,`name`,`password`,`image`,`isdelete`)
VALUES(1,1,'long','123456','acount.jpg',0);
INSERT INTO `appmusic`.`account`(`id`,`idrole`,`name`,`password`,`image`,`isdelete`)
VALUES(2,2,'sang','123456','acount.jpg',0);
INSERT INTO `appmusic`.`account`(`id`,`idrole`,`name`,`password`,`image`,`isdelete`)
VALUES(3,2,'hung','123456','acount.jpg',0);


update music set isdelete = 1  where id = 1;
DELETE FROM music
WHERE id= 1 ;
SELECT * FROM appmusic.music WHERE isdelete = 0 ORDER BY id DESC LIMIT 5,10;
SELECT *from  music;