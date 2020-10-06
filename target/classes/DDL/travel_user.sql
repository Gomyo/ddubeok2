//유저 테이블
CREATE TABLE travel_user (
	account VARCHAR(50) PRIMARY KEY,
	password VARCHAR(100) NOT NULL,
	nickname VARCHAR(50) NOT NULL UNIQUE,
	email VARCHAR(30) NOT NULL,
	grade INT NOT NULL DEFAULT 0
);
//유저 방문기록 테이블
CREATE TABLE user_visited(
	areacode INT NOT NULL,
	sigungucode INT NOT NULL,
	account VARCHAR(50) NOT NULL
);
//account로 연결시키는 쿼리문
ALTER TABLE user_visited
ADD CONSTRAINT fk_travel_user_user_visited
FOREIGN KEY (account) 
REFERENCES travel_user (account);
