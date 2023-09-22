CREATE TABLE CAR_ESTIMATION(
	CAR_NUM VARCHAR2(10),
	ISPASS VARCHAR2(15),
	ACCIDENT_CNT NUMBER,
	DIAG VARCHAR2(12),
	isreg varchar2(5),
	FOREIGN KEY (CAR_NUM) REFERENCES MEM_CAR_REGISTER (CAR_NUM)
	ON DELETE CASCADE
);

DROP TABLE car_estimation;

INSERT INTO car_estimation VALUES 
('18바8515','판매가능',3,'사고');
INSERT INTO CAR_ESTIMATION (car_num,ISPASS,ACCIDENT_CNT,DIAG) VALUES
(?,?,?,?);

SELECT * FROM car_estimation;

SELECT mi.*,mcr.*,ce.ISPASS ,ce.ACCIDENT_CNT ,ce.DIAG ,ce.isreg 
FROM MEM_CAR_REGISTER mcr ,CAR_ESTIMATION ce, MEM_INFO mi 
WHERE mcr.CAR_NUM =ce.CAR_NUM AND mcr.MEM_ID = mi.MEM_ID  
AND mcr.CAR_NUM = '09구5500' ORDER BY isreg,WANT_TIME asc;

SELECT * FROM MEM_CAR_REGISTER mcr ORDER BY eval,WANT_TIME ASC;
UPDATE MEM_CAR_REGISTER SET eval = 'FALSE' WHERE eval = 'TRUE';
UPDATE MEM_CAR_REGISTER SET isreg = 'TRUE' WHERE CAR_NUM = ?;

ALTER TABLE CAR_ESTIMATION ADD isreg varchar2(5) DEFAULT 'FALSE';