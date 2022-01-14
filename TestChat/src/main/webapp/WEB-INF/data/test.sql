CREATE TABLE Customer (
   cid				BIGINT      NOT NULL	PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
   name				VARCHAR(10)	NOT NULL,
   ssn				CHAR(14) 	NOT NULL,
   regDate			DATE		NOT NULL
);

CREATE TABLE Account (
	aid					BIGINT		NOT NULL	PRIMARY KEY	GENERATED ALWAYS AS IDENTITY,
	accType				CHAR(1)		NOT NULL	DEFAULT 'S',
	balance				DOUBLE		NOT NULL	DEFAULT 0.0,
	interestRate		DOUBLE		NOT NULL	DEFAULT 0.0,
	overdraftAmount		DOUBLE		NOT NULL	DEFAULT 0.0,
	customerId			BIGINT		NOT NULL,
	regDate				TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	
	CONSTRAINT ACCOUNT_customerId_FK FOREIGN KEY(customerId) REFERENCES Customer(cid)
);

SELECT a.* FROM Account a LEFT JOIN Customer c ON c.cid = a.customerId;

문제 1(평가자체크리스트 1번문제) 에서 정의된 테이블에 대해 위에서 정의된 테이블에서

주민번호가 840104-1234567 고객이 개설한 전체 계좌를 확인할 수 있는 쿼리를 작성하세요.

 

모든 고객은 하나 이상의 계좌를 보유한다고 가정하고 조인하세요.

단, 선택할 컬럼은 계좌PK(aid), 계좌번호, 계좌타입, 잔고, 고객id(cid)

SELECT a.aid, a.accNum, a.accType, a.balance, c.cid FROM Account a LEFT JOIN Customer c ON c.cid = a.customerId WHERE c.ssn = '840104-1234567';