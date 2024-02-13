SELECT R.*,
M.nickname AS extra__writerName
FROM reply AS R
LEFT JOIN `member` AS M
ON R.memberId = M.id
WHERE R.relTypeCode = 'coin'
AND R.relId = 1543
ORDER BY R.id DESC;

select * from board;
INSERT INTO `sb_c_2021_2nd_t`.`board` (`id`, `regDate`, `updateDate`, `code`, `name`, `delStatus`, `delDate`) 
VALUES ('3', now(), now(), 'shorts', '쇼츠', '0', null);


CREATE TABLE `board` (
  `IDX` bigint NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CONTENTS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `AUTHOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CREATED_AT` datetime DEFAULT NULL,
  PRIMARY KEY (`IDX`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='게시판 테이블';
select * from board;
INSERT INTO BOARD (IDX, TITLE, CONTENTS, AUTHOR, CREATED_AT) VALUES (1, '게시글 제목1', '게시글 내용1', '작성자1', '2022-02-18 23:24:00');
INSERT INTO BOARD (IDX, TITLE, CONTENTS, AUTHOR, CREATED_AT) VALUES (2, '게시글 제목2', '게시글 내용2', '작성자2', '2022-02-18 23:24:00');
INSERT INTO BOARD (IDX, TITLE, CONTENTS, AUTHOR, CREATED_AT) VALUES (3, '게시글 제목3', '게시글 내용3', '작성자3', '2022-02-18 23:24:00');
INSERT INTO BOARD (IDX, TITLE, CONTENTS, AUTHOR, CREATED_AT) VALUES (4, '게시글 제목4', '게시글 내용4', '작성자4', '2022-02-18 23:24:00');
INSERT INTO BOARD (IDX, TITLE, CONTENTS, AUTHOR, CREATED_AT) VALUES (5, '게시글 제목5', '게시글 내용5', '작성자5', '2022-02-18 23:24:00');
INSERT INTO BOARD (IDX, TITLE, CONTENTS, AUTHOR, CREATED_AT) VALUES (6, '게시글 제목6', '게시글 내용6', '작성자6', '2022-02-18 23:24:00');
INSERT INTO BOARD (IDX, TITLE, CONTENTS, AUTHOR, CREATED_AT) VALUES (7, '게시글 제목7', '게시글 내용7', '작성자7', '2022-02-18 23:24:00');
INSERT INTO BOARD (IDX, TITLE, CONTENTS, AUTHOR, CREATED_AT) VALUES (8, '게시글 제목8', '게시글 내용8', '작성자8', '2022-02-18 23:24:00');
INSERT INTO BOARD (IDX, TITLE, CONTENTS, AUTHOR, CREATED_AT) VALUES (9, '게시글 제목9', '게시글 내용9', '작성자9', '2022-02-18 23:24:00');
INSERT INTO BOARD (IDX, TITLE, CONTENTS, AUTHOR, CREATED_AT) VALUES (10, '게시글 제목10', '게시글 내용10', '작성자10', '2022-02-18 23:24:00');