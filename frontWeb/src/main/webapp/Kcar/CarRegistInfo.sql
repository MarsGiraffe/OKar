-- 차량등록정보 ==> 필터링에 사용하셈
CREATE TABLE CAR_REGIST_INFO(
	CRI_NO NUMBER(4) PRIMARY KEY,
	NAME VARCHAR2(50) NOT NULL,
	REFNO NUMBER(4)
);

DROP TABLE CAR_REGIST_INFO;

SELECT LPAD(' ',8*(LEVEL-1))||NAME NAMES,
	CRI_NO,
	REFNO
FROM CAR_REGIST_INFO
START WITH REFNO=0
CONNECT BY PRIOR CRI_NO=REFNO;
-------------------------------------------------
SELECT cri.NAME, ci.IMG_SRC  FROM CAR_REGIST_INFO cri, CAR_IMG ci WHERE cri.NAME =ci.MODEL;
SELECT * FROM CAR_REGIST_INFO WHERE REFNO = 0 ORDER BY REFNO ASC;

INSERT all
INTO CAR_REGIST_INFO VALUES (1000,'현대',0)
INTO CAR_REGIST_INFO VALUES (2000,'기아',0)
INTO CAR_REGIST_INFO VALUES (3000,'쉐보레',0)
INTO CAR_REGIST_INFO VALUES (4000,'폭스바겐',0)
SELECT * FROM dual;

INSERT INTO CAR_REGIST_INFO VALUES (5000,'제네시스',0);

INSERT ALL
INTO CAR_REGIST_INFO VALUES (1100,'아반떼',1000)
INTO CAR_REGIST_INFO VALUES (1200,'쏘나타',1000)
INTO CAR_REGIST_INFO VALUES (1300,'그랜저',1000)
INTO CAR_REGIST_INFO VALUES (2100,'K3',2000)
INTO CAR_REGIST_INFO VALUES (2200,'K5',2000)
INTO CAR_REGIST_INFO VALUES (2300,'K9',2000)
INTO CAR_REGIST_INFO VALUES (3100,'크루즈',3000)
INTO CAR_REGIST_INFO VALUES (3200,'말리부',3000)
INTO CAR_REGIST_INFO VALUES (3300,'임팔라',3000)
INTO CAR_REGIST_INFO VALUES (4100,'제타',4000)
INTO CAR_REGIST_INFO VALUES (4200,'파사트',4000)
INTO CAR_REGIST_INFO VALUES (4300,'골프',4000)
SELECT * FROM dual;



INSERT ALL
INTO CAR_REGIST_INFO VALUES (2400,'K8',2000)
INTO CAR_REGIST_INFO VALUES (2500,'K9',2000)
INTO CAR_REGIST_INFO VALUES (2600,'모하비',2000)
INTO CAR_REGIST_INFO VALUES (2700,'셀토스',2000)
INTO CAR_REGIST_INFO VALUES (2800,'스포티지',2000)
INTO CAR_REGIST_INFO VALUES (2900,'쏘렌토',2000)
INTO CAR_REGIST_INFO VALUES (1400,'싼타페',1000)
INTO CAR_REGIST_INFO VALUES (1500,'코나',1000)
INTO CAR_REGIST_INFO VALUES (1600,'투싼',1000)
INTO CAR_REGIST_INFO VALUES (1700,'캐스퍼',1000)
INTO CAR_REGIST_INFO VALUES (1800,'팰리세이드',1000)
INTO CAR_REGIST_INFO VALUES (5100,'G80',5000)
INTO CAR_REGIST_INFO VALUES (5200,'GV80',5000)
INTO CAR_REGIST_INFO VALUES (5300,'GV70',5000)
INTO CAR_REGIST_INFO VALUES (3400,'트레일블레이저',3000)
INTO CAR_REGIST_INFO VALUES (3500,'트랙스크로스오버',3000)
INTO CAR_REGIST_INFO VALUES (3600,'트래버스',3000)
INTO CAR_REGIST_INFO VALUES (3700,'타호',3000)
INTO CAR_REGIST_INFO VALUES (3800,'이쿼녹스',3000)
INTO CAR_REGIST_INFO VALUES (4400,'티구안',4000)
INTO CAR_REGIST_INFO VALUES (4500,'아테온',4000)
INTO CAR_REGIST_INFO VALUES (4600,'투아렉',4000)
SELECT * FROM dual;


INSERT ALL
INTO CAR_REGIST_INFO VALUES (2710,'1.6 가솔린 터보',2700)
INTO CAR_REGIST_INFO VALUES (2720,'2.0 가솔린',2700)
INTO CAR_REGIST_INFO VALUES (2610,'3.0 디젤 4WD',2600)
INTO CAR_REGIST_INFO VALUES (2510,'3.3 가솔린 터보',2500)
INTO CAR_REGIST_INFO VALUES (2520,'3.8 가솔린',2500)
INTO CAR_REGIST_INFO VALUES (2810,'1.6 가솔린 터보 2WD',2800)
INTO CAR_REGIST_INFO VALUES (2820,'1.6 가솔린 터보 4WD',2800)
INTO CAR_REGIST_INFO VALUES (2830,'2.0 디젤 2WD',2800)
INTO CAR_REGIST_INFO VALUES (2840,'2.0 디젤 4WD',2800)
INTO CAR_REGIST_INFO VALUES (2850,'1.6 가솔린 터보 2WD',2800)
INTO CAR_REGIST_INFO VALUES (2860,'1.6 가솔린 터보 4WD',2800)
INTO CAR_REGIST_INFO VALUES (2870,'2.0 디젤 2WD',2800)
INTO CAR_REGIST_INFO VALUES (2880,'2.0 디젤 4WD',2800)
INTO CAR_REGIST_INFO VALUES (2910,'2.2 디젤',2900)
INTO CAR_REGIST_INFO VALUES (2920,'2.2 디젤 AWD',2900)
INTO CAR_REGIST_INFO VALUES (2930,'2.5 가솔린 터보',2900)
INTO CAR_REGIST_INFO VALUES (2940,'2.5 가솔린 터보 AWD',2900)
INTO CAR_REGIST_INFO VALUES (2410,'1.6 HEV',2400)
INTO CAR_REGIST_INFO VALUES (1410,'2.2 디젤',1400)
INTO CAR_REGIST_INFO VALUES (1420,'2.2 디젤 AWD',1400)
INTO CAR_REGIST_INFO VALUES (1430,'2.5 가솔린 터보',1400)
INTO CAR_REGIST_INFO VALUES (1440,'2.5 가솔린 터보 AWD',1400)
INTO CAR_REGIST_INFO VALUES (1510,'1.6 가솔린 터보',1500)
INTO CAR_REGIST_INFO VALUES (1520,'1.6 가솔린 터보 4WD',1500)
INTO CAR_REGIST_INFO VALUES (1530,'2.0 가솔린',1500)
INTO CAR_REGIST_INFO VALUES (1610,'1.6 가솔린 터보',1600)
INTO CAR_REGIST_INFO VALUES (1620,'1.6 가솔린 터보 AWD',1600)
INTO CAR_REGIST_INFO VALUES (1630,'2.0 디젤',1600)
INTO CAR_REGIST_INFO VALUES (1640,'2.0 디젤 AWD',1600)
INTO CAR_REGIST_INFO VALUES (1650,'1.6 가솔린 터보 N라인',1600)
INTO CAR_REGIST_INFO VALUES (1660,'1.6 가솔린 터보 N라인 AWD',1600)
INTO CAR_REGIST_INFO VALUES (1670,'2.0 디젤 N라인',1600)
INTO CAR_REGIST_INFO VALUES (1680,'2.0 디젤 N라인 AWD',1600)
INTO CAR_REGIST_INFO VALUES (1710,'1.0 가솔린',1700)
INTO CAR_REGIST_INFO VALUES (1720,'1.0 가솔린 터보',1700)
INTO CAR_REGIST_INFO VALUES (1810,'2.2 디젤',1800)
INTO CAR_REGIST_INFO VALUES (1820,'2.2 디젤 AWD',1800)
INTO CAR_REGIST_INFO VALUES (1830,'3.8 가솔린',1800)
INTO CAR_REGIST_INFO VALUES (1840,'3.8 가솔린 AWD',1800)
INTO CAR_REGIST_INFO VALUES (5110,'2.5 가솔린 터보',5100)
INTO CAR_REGIST_INFO VALUES (5120,'2.5 가솔린 터보 AWD',5100)
INTO CAR_REGIST_INFO VALUES (5130,'3.5 가솔린 터보',5100)
INTO CAR_REGIST_INFO VALUES (5140,'2.5 가솔린 터보 AWD',5100)
INTO CAR_REGIST_INFO VALUES (5210,'2.5 가솔린 터보',5200) 
INTO CAR_REGIST_INFO VALUES (5220,'2.5 가솔린 터보 AWD',5200) 
INTO CAR_REGIST_INFO VALUES (5230,'3.0 디젤',5200) 
INTO CAR_REGIST_INFO VALUES (5240,'3.0 디젤 AWD',5200) 
INTO CAR_REGIST_INFO VALUES (5250,'3.5 가솔린 터보',5200) 
INTO CAR_REGIST_INFO VALUES (5260,'3.5 가솔린 터보 AWD',5200)
INTO CAR_REGIST_INFO VALUES (5310,'2.2 디젤',5300)
INTO CAR_REGIST_INFO VALUES (5320,'2.2 디젤 AWD',5300)
INTO CAR_REGIST_INFO VALUES (5330,'2.5 가솔린 터보',5300)
INTO CAR_REGIST_INFO VALUES (5340,'2.5 가솔린 터보 AWD',5300)
INTO CAR_REGIST_INFO VALUES (5350,'3.5 가솔린 터보 AWD',5300)
INTO CAR_REGIST_INFO VALUES (3410,'1.35 가솔린',3400)
INTO CAR_REGIST_INFO VALUES (3420,'1.35 가솔린 AWD',3400)
INTO CAR_REGIST_INFO VALUES (3510,'1.2 가솔린 AWD',3500)
INTO CAR_REGIST_INFO VALUES (3610,'3.6 가솔린',3600)
INTO CAR_REGIST_INFO VALUES (3710,'6.2 가솔린',3700)
INTO CAR_REGIST_INFO VALUES (3810,'1.5 가솔린',3800)
INTO CAR_REGIST_INFO VALUES (3820,'1.5 가솔린 AWD',3800)
INTO CAR_REGIST_INFO VALUES (4410,'2.0 TDI',4400)
INTO CAR_REGIST_INFO VALUES (4420,'2.0 TSI',4400)
INTO CAR_REGIST_INFO VALUES (4510,'2.0 TDI',4500)
INTO CAR_REGIST_INFO VALUES (4520,'2.0 TDI 4Motion',4500)
INTO CAR_REGIST_INFO VALUES (4610,'3.0 TSI',4600)
SELECT * FROM DUAL;

INSERT ALL 
INTO CAR_REGIST_INFO VALUES (1110,'1.6 가솔린',1100)
INTO CAR_REGIST_INFO VALUES (1120,'1.6 LPi',1100)
INTO CAR_REGIST_INFO VALUES (1210,'2.0 가솔린',1200)
INTO CAR_REGIST_INFO VALUES (1220,'2.0 LPi',1200)
INTO CAR_REGIST_INFO VALUES (1230,'1.6 가솔린 터보',1200)
INTO CAR_REGIST_INFO VALUES (1240,'2.5 가솔린 터보',1200)
INTO CAR_REGIST_INFO VALUES (1310,'2.5 가솔린',1300)
INTO CAR_REGIST_INFO VALUES (1320,'3.5 가솔린',1300)
INTO CAR_REGIST_INFO VALUES (1330,'3.5 가솔린 AWD',1300)
INTO CAR_REGIST_INFO VALUES (1340,'3.5 LPG',1300)
INTO CAR_REGIST_INFO VALUES (2110,'1.6 가솔린',2100)
INTO CAR_REGIST_INFO VALUES (2210,'1.6 가솔린 터보',2200)
INTO CAR_REGIST_INFO VALUES (2220,'2.0 가솔린',2200)
INTO CAR_REGIST_INFO VALUES (2230,'2.0 LPi',2200)
INTO CAR_REGIST_INFO VALUES (2310,'3.3 가솔린 터보',2300)
INTO CAR_REGIST_INFO VALUES (2320,'3.3 가솔린 터보 AWD',2300)
INTO CAR_REGIST_INFO VALUES (2330,'3.8 가솔린',2300)
INTO CAR_REGIST_INFO VALUES (2340,'3.8 가솔린 AWD',2300)
INTO CAR_REGIST_INFO VALUES (3110,'1.4 터보',3100)
INTO CAR_REGIST_INFO VALUES (3120,'1.6 디젤',3100)
INTO CAR_REGIST_INFO VALUES (3210,'1.35 가솔린 터보',3200)
INTO CAR_REGIST_INFO VALUES (3220,'2.0 가솔린 터보',3200)
INTO CAR_REGIST_INFO VALUES (3310,'2.5 가솔린',3300)
INTO CAR_REGIST_INFO VALUES (3320,'3.6 가솔린',3300)
INTO CAR_REGIST_INFO VALUES (4110,'1.5 TSI',4100)
INTO CAR_REGIST_INFO VALUES (4210,'2.0 TDI',4200)
INTO CAR_REGIST_INFO VALUES (4220,'2.0 TDI 4Motion',4200)
INTO CAR_REGIST_INFO VALUES (4310,'2.0 TDI',4300)
SELECT * FROM dual;