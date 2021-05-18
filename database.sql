
DROP DATABASE appmusic;
CREATE DATABASE appmusic;
USE appmusic;
CREATE TABLE music (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(700) DEFAULT NULL,
  category varchar(700) DEFAULT NULL,
  url varchar(700) DEFAULT NULL,
  image varchar(700) DEFAULT NULL,
  PRIMARY KEY (id)
);
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`)
VALUES(1,'Có Chắc Yêu Là Đây','Nhạc Trẻ','https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview');
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`)
VALUES(2,'Waiting For Love','US-UK','https://drive.google.com/file/d/1bpCc2RucjXK-qvuC9k3AeWxJTWu5sou_/preview','https://drive.google.com/file/d/1Jn13MTlzuduo6W3bAsUscbi2c5kJAOz7/preview');
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`)
VALUES(3,'Em của ngày hôm qua','Nhạc Trẻ','https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview');
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`)
VALUES(4,'Way Back Home','Nhạc Trẻ','https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview');
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`)
VALUES(5,'Something Just Like This','US-UK','https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview');
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`)
VALUES(6,'Phao - 2 Phut Hon','Nhạc Trẻ','https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview');
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`)
VALUES(7,'XIN ĐỪNG NHẤC MÁY','Nhạc Trẻ','https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview');
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`)
VALUES(8,'Exs Hate Me - B Ray x Masew ','Nhạc Trẻ','https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview');
