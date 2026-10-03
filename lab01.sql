create database insurance;
use insurance;
create table PERSON(driver_id VARCHAR(10) PRIMARY KEY,name VARCHAR(20) NOT NULL,address VARCHAR(10) NOT NULL);
create table CAR(reg_no VARCHAR(20) PRIMARY KEY,model VARCHAR(10) NOT NULL,year int NOT NULL);
create table accident(rep_no int PRIMARY KEY,accident_date DATE,location VARCHAR(10) NOT NULL);
create table owns(driver_id VARCHAR(10),reg_no VARCHAR(20),
                  PRIMARY KEY(driver_id,reg_no ),
                  FOREIGN KEY(driver_id) references PERSON (driver_id),
                  FOREIGN KEY(reg_no) references CAR (reg_no));
create table PARTICIPATED(driver_id VARCHAR(10),reg_no VARCHAR(20),rep_no int,damage_amount int,
			PRIMARY KEY(driver_id,reg_no,rep_no),
			 FOREIGN KEY(driver_id) references PERSON (driver_id),
			 FOREIGN KEY(reg_no) references CAR (reg_no),
			 FOREIGN KEY(rep_no) references accident (rep_no),
             CHECK (damage_amount >= 0 ) );
insert into PERSON VALUES ("110","SAM","MYSURU"),
                          ("111","ZAM","BENGALURU"),
                          ("112","LAM","HASSAN"),
                          ("113","YAM","KODAGU"),
                          ("114","MAM","MANDYA");
select * from PERSON;
insert into CAR VALUES ("7788","benz",1995),
                          ("8877","audi",2000),
                          ("9911","toyota",1950),
                          ("2233","tata",2005),
                          ("1818","mahindra",2010);
select * from CAR;
insert into accident VALUES (77,"2007-01-01","MYSURU Rn"),
                          (88,"2001-03-01","BENGALURU"),
                          (99,"2015-04-01","HASSAN Rn"),
                          (22,"2023-01-08","KODAGU Rn"),
                          (18,"2025-07-07","MANDYA Rn"); 
select * from accident;
insert into owns VALUES ("110","7788"),
                          ("111","8877"),
                          ("112","9911"),
                          ("113","2233"),
                          ("114","1818");
SELECT * FROM owns;
insert into PARTICIPATED VALUES ("110","7788",77,1000),
                          ("111","8877",88,2000),
                          ("112","9911",99,3000),
                          ("113","2233",22,4000),
                          ("114","1818",18,5000);
UPDATE PARTICIPATED SET damage_amount = 25000 WHERE reg_no = "7788" ;
select * from PARTICIPATED;
ALTER TABLE accident ADD COLUMN new_accident varchar(20);
select accident_date , location from accident;
select driver_id,damage_amount from PARTICIPATED where damage_amount >=25000;
						
