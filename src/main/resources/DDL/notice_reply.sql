CREATE TABLE notice_reply (
	reply_id INT PRIMARY KEY AUTO_INCREMENT,
	writer VARCHAR(50) NOT NULL,
	content VARCHAR(1000) NOT NULL,
	reg_date TIMESTAMP NOT NULL DEFAULT 0,
	board_id INT NOT NULL
);

ALTER TABLE notice_reply ADD CONSTRAINT fk_notice_board_notice_reply
FOREIGN KEY (board_id) REFERENCES notice_board (board_id);
