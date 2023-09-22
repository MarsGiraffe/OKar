-- 차량 등록 정보
SELECT * FROM CAR_REGIST_INFO cri ;

-- 차량 이미지 정보
SELECT * FROM CAR_IMG ci ;

-- 판매 등록 차량 정보
SELECT * FROM OKAY_CAR_REGISTER ;


-- 옵션 정보
SELECT * FROM OPTION_INFO oi ;

-- 차량별 옵션 정보
SELECT * FROM CAR_OPTIONS ;


-- 회원 등록 정보
SELECT * FROM MEM_INFO mi ;

-- 회원 등록 차량 정보
SELECT * FROM MEM_CAR_REGISTER mcr ;

-- 회원 등록 차량 평가 정보
SELECT * FROM CAR_ESTIMATION ce ; 

-- 평가완료된 차량정보(등록이 필요한 정보)
SELECT mcr.*,ce.ISPASS ,ce.ACCIDENT_CNT ,ce.DIAG ,ce.isreg
FROM MEM_CAR_REGISTER mcr ,CAR_ESTIMATION ce
WHERE mcr.CAR_NUM =ce.CAR_NUM AND mcr.EVAL='TRUE' AND ce.ISREG='FALSE'
ORDER BY isreg,WANT_TIME ASC;





