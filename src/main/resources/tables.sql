CREATE TABLE user  (
  `u_id` int(0) NOT NULL AUTO_INCREMENT,
  `u_account` varchar(30) NOT NULL,
  `u_name` varchar(18) NOT NULL,
  `u_password` varchar(20) NOT NULL,
  `u_date` date NOT NULL,
  `u_limit` int(1) NOT NULL,
  PRIMARY KEY (`u_id`)
);

CREATE TABLE file  (
  `f_id` int(0) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(20) NOT NULL,
  `f_limit` varchar(1) NOT NULL,
  `f_uploadtime` datetime(0) NOT NULL,
  `f_userid` int(0) NOT NULL,
  PRIMARY KEY (`f_id`),
  CONSTRAINT `FK_USERID` FOREIGN KEY (`f_userid`) REFERENCES `xdrive`.`user` (`u_id`)
);

