CREATE TABLE user  (
  `u_account` varchar(30) NOT NULL,
  `u_name` varchar(18) NOT NULL,
  `u_password` varchar(32) NOT NULL,
  `u_date` date NOT NULL,
  `u_limit` int(1) NOT NULL default 1,
  PRIMARY KEY (`u_account`)
);

CREATE TABLE file  (
  `f_id` int(0) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(20) NOT NULL,
  `f_limit` int(1) NOT NULL,
  `f_uploadtime` datetime(0) NOT NULL,
  `f_parent` varchar(20),
  `f_type` int(1) NOT NULL,
  `f_state` int(1) NOT NULL DEFAULT 1,
  `f_size` decimal(14,7) NOT NULL,
  `f_user` varchar(30) NOT NULL,
  PRIMARY KEY (`f_id`),
  CONSTRAINT `FK_USER` FOREIGN KEY (`f_user`) REFERENCES `xdrive`.`user` (`u_account`)
);

CREATE TABLE userinfo  (
  `i_sex` int(1) NULL,
  `i_birthday` date NULL,
  `i_location` varchar(60) NULL,
  `i_job` varchar(9) NULL,
  `i_school` varchar(60) NULL,
  `i_company` varchar(60) NULL,
  `i_signature` varchar(150) NULL,
  `i_user` varchar(30) NOT NULL,
  PRIMARY KEY (`i_user`),
  CONSTRAINT `FK_USERID` FOREIGN KEY (`i_user`) REFERENCES `xdrive`.`user` (`u_account`)
);
