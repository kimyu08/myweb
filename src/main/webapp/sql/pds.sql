--pds.sql
--포토 갤러리 게시판

--테이블 생성
CREATE TABLE tb_pds (
  pdsno       NUMBER         NOT NULL
  ,wname      VARCHAR2(100)  NOT NULL
  ,subject    VARCHAR2(250)  NOT NULL
  ,regdate    DATE           NOT NULL
  ,passwd     VARCHAR2(15)   NOT NULL
  ,readcnt    NUMBER         DEFAULT 0
  ,filename   VARCHAR2(250)  NOT NULL   --파일명
  ,filesize   NUMBER         DEFAULT 0  --파일크기
  ,PRIMARY KEY(pdsno)
);

--시퀀스 생성
create sequence pds_seq;

--행추가
pdsno :				   : 시퀀스
wname, subject, passwd : 사용자 입력
regdate					: sysdate
filename, filesize		: 첨부파일 정보


INSERT INTO tb_pds(pdsno, wname, subject, passwd, filename, filesize, regdate)
VALUES(pds_seq,?,?,?,?,?,sysdate)

--목록
SELECT pdsno, wname, subject, filename, regdate
FROM tb_pds
ORDER BY regdate DESC;


--삭제
글번호와 비밀번호가 일치하면 테이블삭제 행삭제. + 관련된 첨부파일 삭제


--수정

