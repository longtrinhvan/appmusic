
DROP DATABASE appmusic;
CREATE DATABASE appmusic;
USE appmusic;
CREATE TABLE music (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(700) DEFAULT NULL,
  category varchar(700) DEFAULT NULL,
  url varchar(700) DEFAULT NULL,
  image varchar(700) DEFAULT NULL,
  isdelete int DEFAULT NULL,
  PRIMARY KEY (id)
);
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`,`isdelete`)
VALUES(1,'Có Chắc Yêu Là Đây','Nhạc Trẻ','https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',1);
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`,`isdelete`)
VALUES(2,'Waiting For Love','US-UK','https://drive.google.com/file/d/1bpCc2RucjXK-qvuC9k3AeWxJTWu5sou_/preview','https://drive.google.com/file/d/1Jn13MTlzuduo6W3bAsUscbi2c5kJAOz7/preview',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`,`isdelete`)
VALUES(3,'Em của ngày hôm qua','Nhạc Trẻ','https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`,`isdelete`)
VALUES(4,'Way Back Home','Nhạc Trẻ','https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`,`isdelete`)
VALUES(5,'Something Just Like This','US-UK','https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`,`isdelete`)
VALUES(6,'Phao - 2 Phut Hon','Nhạc Trẻ','https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`,`isdelete`)
VALUES(7,'XIN ĐỪNG NHẤC MÁY','Nhạc Trẻ','https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',0);
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`,`isdelete`)
VALUES(8,'Exs Hate Me - B Ray x Masew ','Nhạc Trẻ','https://drive.google.com/file/d/1e7gszNEnC1T_LRMUkZYdf0DmX7hiWvCI/preview','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',0);

INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`,`isdelete`)
VALUES(9,'Light rock 1.1','Nhạc Trẻ','https://www.mediacollege.com/downloads/music/ama/ama_01-1.mp3','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`,`isdelete`)
VALUES(10,'Light rock 1.2','Nhạc Trẻ','https://www.mediacollege.com/downloads/music/ama/ama_01-2.mp3','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`,`isdelete`)
VALUES(11,'Light rock 1.3','Nhạc Trẻ','https://www.mediacollege.com/downloads/music/ama/ama_01-3.mp3','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`,`isdelete`)
VALUES(12,'Light rock 1.4','Nhạc Trẻ','https://www.mediacollege.com/downloads/music/ama/ama_02-1.mp3','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`,`isdelete`)
VALUES(13,'Light rock 1.5','Nhạc Trẻ','https://www.mediacollege.com/downloads/music/ama/ama_02-2.mp3','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`,`isdelete`)
VALUES(14,'Light rock 1.6','Nhạc Trẻ','https://www.mediacollege.com/downloads/music/ama/ama_02-3.mp3','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`,`isdelete`)
VALUES(15,'Light rock 1.7','Nhạc Trẻ','https://www.mediacollege.com/downloads/music/ama/ama_01-4.mp3','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`,`isdelete`)
VALUES(16,'Light rock 1.8','Nhạc Trẻ','https://www.mediacollege.com/downloads/music/ama/ama_01-1.mp3','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`,`isdelete`)
VALUES(17,'Light rock 1.9','Nhạc Trẻ','https://www.mediacollege.com/downloads/music/ama/ama_01-1.mp3','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',4);
INSERT INTO `appmusic`.`music`(`id`,`name`,`category`,`url`,`image`,`isdelete`)
VALUES(19,'Light rock 1.10','Nhạc Trẻ','https://www.mediacollege.com/downloads/music/ama/ama_01-1.mp3','https://drive.google.com/file/d/1ZnebNtmtX9cIFOYbEgNkyy0cCEhQEzJA/preview',4);


update music set isdelete = 1  where id = 1;
DELETE FROM music
WHERE id= 1 ;
SELECT * FROM appmusic.music WHERE isdelete = 0 ORDER BY id DESC LIMIT 5,10;
SELECT *from  music;