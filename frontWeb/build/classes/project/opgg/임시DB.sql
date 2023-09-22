CREATE TABLE GAME_HISTORY(
	GAMEID NUMBER,
	GAMECODE VARCHAR(50),
	TEAMCOLOR VARCHAR(10),
	USERID VARCHAR(50),
	CHAMID VARCHAR(50),
	RUNEID VARCHAR(50),
	SPELLID1 VARCHAR(50),
	SPELLID2 VARCHAR(50),
	ITEMID1 VARCHAR(50),
	ITEMID2 VARCHAR(50),
	POS VARCHAR(10),
	KILL NUMBER(2),
	DEATH NUMBER(2),
	ASSIST NUMBER(2),
	KDA VARCHAR(10),
	ATTACK NUMBER,
	DAMAGE NUMBER,
	ISWIN VARCHAR(5),
	START_TIME DATE,
	END_TIME DATE,
	PRIMARY KEY (GAMEID),
	FOREIGN KEY (USERID) REFERENCES USER_INFO(USERID),
	FOREIGN KEY (CHAMID) REFERENCES CHAM_INFO(CHAMID),
	FOREIGN KEY (RUNEID) REFERENCES RUNE_INFO(RUNEID),
	FOREIGN KEY (SPELLID1) REFERENCES SPELL_INFO(SPELLID),
	FOREIGN KEY (SPELLID2) REFERENCES SPELL_INFO(SPELLID),
	FOREIGN KEY (ITEMID1) REFERENCES ITEM_INFO(ITEMID),
	FOREIGN KEY (ITEMID2) REFERENCES ITEM_INFO(ITEMID)
);
SELECT * FROM rune_info;
DROP TABLE GAME_HISTORY ;
CREATE TABLE USER_INFO(
	USERID VARCHAR(50),
	ULEVEL NUMBER,
	UTIER VARCHAR(20),	
	PRIMARY KEY (USERID)
);
CREATE TABLE CHAM_INFO(
	CHAMID VARCHAR(50),
	CHAMIMG VARCHAR(100),
	PRIMARY KEY (CHAMID)
);
CREATE TABLE RUNE_INFO(
	RUNEID VARCHAR(50),
	RUNEIMG VARCHAR(100),
	PRIMARY KEY (RUNEID)
);
CREATE TABLE SPELL_INFO(
	SPELLID VARCHAR(50),
	SPELLIMG VARCHAR(100),
	PRIMARY KEY(SPELLID)
);
CREATE TABLE ITEM_INFO(
	ITEMID VARCHAR(50),
	ITEMDESCRITION1 VARCHAR(100),
	ITEMDESCRITION2 VARCHAR(100),
	ITEMPRICE NUMBER,
	ITEMIMG VARCHAR(100),
	PRIMARY KEY (ITEMID)
);

DROP TABLE CHAM_INFO;
DROP TABLE USER_INFO;
DROP TABLE game_history;
DROP TABLE ITEM_INFO;
DROP TABLE SPELL_INFO;

SELECT * FROM cham_info;

INSERT ALL
INTO USER_INFO VALUES ('동현',188,'GOLD')
INTO USER_INFO VALUES ('지우',192,'IRON')
INTO USER_INFO VALUES ('은서',69,'BRONZE')
INTO USER_INFO VALUES ('선영',52,'DIAMOND')
INTO USER_INFO VALUES ('학수',182,'SILVER')
INTO USER_INFO VALUES ('석민',96,'PLATINUM')
INTO USER_INFO VALUES ('혜원',94,'GRANDMASTER')
INTO USER_INFO VALUES ('현우',103,'DIAMOND')
INTO USER_INFO VALUES ('상우',62,'SILVER')
INTO USER_INFO VALUES ('준혁',54,'IRON')
INTO USER_INFO VALUES ('영재',66,'CHALLENGER')
INTO USER_INFO VALUES ('윤아',88,'BRONZE')
INTO USER_INFO VALUES ('경웅',101,'MASTER')
INTO USER_INFO VALUES ('준규',68,'GOLD')
INTO USER_INFO VALUES ('다솜',144,'PLATINUM')
SELECT * FROM dual;
--
INSERT ALL
INTO ITEM_INFO (ITEMID) VALUES('부패물약')
INTO ITEM_INFO (ITEMID) VALUES('도란의 검')
INTO ITEM_INFO (ITEMID) VALUES('도란의 반지')
INTO ITEM_INFO (ITEMID) VALUES('수확의 낫')
INTO ITEM_INFO (ITEMID) VALUES('도란의 방패')
INTO ITEM_INFO (ITEMID) VALUES('사냥꾼의 마체테')
INTO ITEM_INFO (ITEMID) VALUES('암흑의 인장')
INTO ITEM_INFO (ITEMID) VALUES('주문도둑의 검')
INTO ITEM_INFO (ITEMID) VALUES('여신의 눈물')
INTO ITEM_INFO (ITEMID) VALUES('고대유물 방패')
INTO ITEM_INFO (ITEMID) VALUES('판금장화')
INTO ITEM_INFO (ITEMID) VALUES('헤르메스의 발걸음')
INTO ITEM_INFO (ITEMID) VALUES('아이오니아 장화')
INTO ITEM_INFO (ITEMID) VALUES('기동력의 장화')
INTO ITEM_INFO (ITEMID) VALUES('마법사의 신발')
INTO ITEM_INFO (ITEMID) VALUES('신속의 장화')
INTO ITEM_INFO (ITEMID) VALUES('장화')
INTO ITEM_INFO (ITEMID) VALUES('약간 신비한 신발')
SELECT * FROM dual;
COMMIT;
INSERT ALL
INTO RUNE_INFO (RUNEID) VALUES('결의')
INTO RUNE_INFO (RUNEID) VALUES('정밀')
INTO RUNE_INFO (RUNEID) VALUES('지배')
INTO RUNE_INFO (RUNEID) VALUES('마법')
INTO RUNE_INFO (RUNEID) VALUES('영감')
SELECT * FROM dual;

INSERT ALL 
INTO SPELL_INFO (SPELLID) VALUES('방어막')
INTO SPELL_INFO (SPELLID) VALUES('정화')
INTO SPELL_INFO (SPELLID) VALUES('점멸')
INTO SPELL_INFO (SPELLID) VALUES('유체화')
INTO SPELL_INFO (SPELLID) VALUES('점화')
INTO SPELL_INFO (SPELLID) VALUES('강타')
INTO SPELL_INFO (SPELLID) VALUES('탈진')
INTO SPELL_INFO (SPELLID) VALUES('회복')
INTO SPELL_INFO (SPELLID) VALUES('텔레포트')
SELECT * FROM dual;
SELECT * FROM GAME_HISTORY;
SELECT * FROM USER_INFO;
SELECT * FROM SPELL_INFO;
SELECT * FROM RUNE_INFO;
SELECT * FROM ITEM_INFO;
SELECT * FROM CHAM_INFO;
INSERT ALL
INTO CHAM_INFO (CHAMID) VALUES('가렌')
INTO CHAM_INFO (CHAMID) VALUES('애니')
INTO CHAM_INFO (CHAMID) VALUES('탈론')
INTO CHAM_INFO (CHAMID) VALUES('밀리오')
INTO CHAM_INFO (CHAMID) VALUES('카이사')
INTO CHAM_INFO (CHAMID) VALUES('제드')
INTO CHAM_INFO (CHAMID) VALUES('이즈리얼')
INTO CHAM_INFO (CHAMID) VALUES('워윅')
INTO CHAM_INFO (CHAMID) VALUES('세트')
INTO CHAM_INFO (CHAMID) VALUES('카직스')
INTO CHAM_INFO (CHAMID) VALUES('소나')
INTO CHAM_INFO (CHAMID) VALUES('소라카')
INTO CHAM_INFO (CHAMID) VALUES('코그모')
INTO CHAM_INFO (CHAMID) VALUES('오공')
INTO CHAM_INFO (CHAMID) VALUES('사이온')
SELECT * FROM dual;
INSERT ALL
INTO GAME_HISTORY VALUES (1,'자유랭크-1','BLUE','선영','오공','지배','회복','텔레포트','도란의 반지','마법사의 신발','TOP',7,5,9,'3.2',13900,68300,'Win',sysdate+1/24+0,sysdate+2/24+0)
INTO GAME_HISTORY VALUES (2,'자유랭크-1','BLUE','혜원','소라카','마법','방어막','정화','도란의 검','장화','JUG',12,6,6,'3.0',76500,25900,'Win',sysdate+1/24+0,sysdate+2/24+0)
INTO GAME_HISTORY VALUES (3,'자유랭크-1','BLUE','다솜','애니','결의','방어막','정화','여신의 눈물','판금장화','MID',5,0,14,'Perfect',60800,67200,'Win',sysdate+1/24+0,sysdate+2/24+0)
INTO GAME_HISTORY VALUES (4,'자유랭크-1','BLUE','석민','사이온','마법','방어막','정화','도란의 방패','판금장화','BOT',12,18,8,'1.11',67800,45900,'Win',sysdate+1/24+0,sysdate+2/24+0)
INTO GAME_HISTORY VALUES (5,'자유랭크-1','BLUE','영재','탈론','마법','회복','텔레포트','고대유물 방패','장화','SUP',19,2,8,'13.5',32200,41600,'Win',sysdate+1/24+0,sysdate+2/24+0)
INTO GAME_HISTORY VALUES (6,'자유랭크-1','RED','상우','세트','영감','점화','강타','부패물약','약간 신비한 신발','TOP',7,18,7,'0.78',10200,54700,'Lose',sysdate+1/24+0,sysdate+2/24+0)
INTO GAME_HISTORY VALUES (7,'자유랭크-1','RED','현우','코그모','정밀','유체화','점화','주문도둑의 검','약간 신비한 신발','JUG',2,8,3,'0.63',94400,11800,'Lose',sysdate+1/24+0,sysdate+2/24+0)
INTO GAME_HISTORY VALUES (8,'자유랭크-1','RED','학수','가렌','마법','회복','텔레포트','도란의 검','기동력의 장화','MID',5,12,8,'1.08',64500,50700,'Lose',sysdate+1/24+0,sysdate+2/24+0)
INTO GAME_HISTORY VALUES (9,'자유랭크-1','RED','윤아','이즈리얼','영감','점화','강타','부패물약','판금장화','BOT',3,17,19,'1.29',17000,43300,'Lose',sysdate+1/24+0,sysdate+2/24+0)
INTO GAME_HISTORY VALUES (10,'자유랭크-1','RED','준규','워윅','영감','점화','강타','부패물약','장화','SUP',2,12,8,'0.83',80900,85400,'Lose',sysdate+1/24+0,sysdate+2/24+0)
INTO GAME_HISTORY VALUES (11,'칼바람-2','BLUE','경웅','애니','정밀','점멸','유체화','부패물약','아이오니아 장화','TOP',3,4,18,'5.25',46200,58800,'Win',sysdate+2/24+0,sysdate+3/24+0)
INTO GAME_HISTORY VALUES (12,'칼바람-2','BLUE','석민','밀리오','영감','유체화','점화','주문도둑의 검','약간 신비한 신발','JUG',10,7,2,'1.71',31900,12400,'Win',sysdate+2/24+0,sysdate+3/24+0)
INTO GAME_HISTORY VALUES (13,'칼바람-2','BLUE','윤아','이즈리얼','결의','정화','점멸','도란의 반지','판금장화','MID',16,10,4,'2.0',64700,66300,'Win',sysdate+2/24+0,sysdate+3/24+0)
INTO GAME_HISTORY VALUES (14,'칼바람-2','BLUE','준규','세트','정밀','점멸','유체화','여신의 눈물','신속의 장화','BOT',3,2,8,'5.5',100000,8200,'Win',sysdate+2/24+0,sysdate+3/24+0)
INTO GAME_HISTORY VALUES (15,'칼바람-2','BLUE','다솜','탈론','영감','회복','텔레포트','암흑의 인장','아이오니아 장화','SUP',12,5,5,'3.4',83600,45600,'Win',sysdate+2/24+0,sysdate+3/24+0)
INTO GAME_HISTORY VALUES (16,'칼바람-2','RED','은서','소나','결의','정화','점멸','여신의 눈물','판금장화','TOP',2,16,11,'0.81',85000,27100,'Lose',sysdate+2/24+0,sysdate+3/24+0)
INTO GAME_HISTORY VALUES (17,'칼바람-2','RED','지우','카직스','결의','점멸','유체화','주문도둑의 검','기동력의 장화','JUG',4,15,7,'0.73',42800,64300,'Lose',sysdate+2/24+0,sysdate+3/24+0)
INTO GAME_HISTORY VALUES (18,'칼바람-2','RED','준혁','가렌','지배','탈진','회복','부패물약','기동력의 장화','MID',16,19,2,'0.95',91400,61400,'Lose',sysdate+2/24+0,sysdate+3/24+0)
INTO GAME_HISTORY VALUES (19,'칼바람-2','RED','혜원','제드','마법','유체화','점화','도란의 검','아이오니아 장화','BOT',8,18,12,'1.11',19800,36800,'Lose',sysdate+2/24+0,sysdate+3/24+0)
INTO GAME_HISTORY VALUES (20,'칼바람-2','RED','영재','사이온','지배','정화','점멸','여신의 눈물','마법사의 신발','SUP',4,16,10,'0.88',37000,5500,'Lose',sysdate+2/24+0,sysdate+3/24+0)
SELECT * FROM dual;
COMMIT;
SELECT * FROM GAME_HISTORY;

