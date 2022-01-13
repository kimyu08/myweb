--bbs.sql
--답변 및 댓글형 게시판

--테이블 삭제
drop table tb_bbs;

--테이블 생성
create table tb_bbs(
  bbsno    number(5)       not null -- 일련번호 -99999~99999
 ,wname    varchar2(20)    not null -- 작성자
 ,subject  varchar2(100)   not null -- 글제목
 ,content  varchar2(2000)  not null -- 글내용
 ,passwd   varchar2(10)    not null -- 글비밀번호
 ,readcnt  number(5)       default 0 not null -- 글조회수
 ,regdt    date            default  sysdate   -- 글작성일
 ,grpno    number(5)       not null  -- 글 그룹번호
 ,indent   number(5)       default 0 -- 들여쓰기
 ,ansnum   number(5)       default 0 -- 글순서
 ,ip       varchar2(15)    not null  -- 글 IP
 ,primary key(bbsno)                 --bbsno 기본키 
);

--시퀀스 생성
create sequence bbs_seq;

--시퀀스 삭제
drop sequence bbs_seq;

--명령어 완료
commit;

--새글쓰기
bbsno : 시퀀스를 이용한 일련번호
wname, subject, content, password :사용자입력
readcnt, regdt, indent, ansnum : default값
grpno : max(bbsno)+1
ip: 요청 pc의 저장 ip

--그룹번호(grpno)
select max(bbsno) from tb_bbs;
select max(bbsno)+1 from tb_bbs; --null값이면 계산 안됨
select nvl(max(bbsno),0) from tb_bbs; --nvl()함수를 이용해서 bbsno값이 비어있을때 0으로 바꿔줌
select nvl(max(bbsno),0)+1 from tb_bbs; --nvl()함수를 이용해서 bbsno값이 비어있을때 0으로 바꾼 후 +1

--행추가
insert into tb_tts(bbsno, wname, subject, content, passwd, ip, grpno)
values(bbs_seq.nextval,?,?,?,?,?,(select nvl(max(bbsno),0)+1 from tb_bbs))

--전체 목록
select bbsno, wname, subject, readcnt, regdt
from tb_bbs
order by grpno desc, ansnum asc;

--글 갯수
select count(*) as cnt
from tb_bbs;

--상세보기
select * from tb_bbs where bbsno=?;

--조회수 증가
update tb_bbs set readcnt=readcnt+1 where bbsno=?;

--행삭제
delete from tb_bbs where bbsno=? and passwd=?

--게시글 수정후 업데이트.
update tb_bbs set wname=?, subject=?, content=?, ip=?
where bbsno=? and passwd=?
/////////////////////////////////////////////////////////////////////
[답변쓰기 알고리즘]
-새글쓰기: 최초의 부모글
-답변쓰기: 자식글

- 그룹번호(grpno) : 부모글번호와 동일하게
- 들여쓰기(indent): 부모글 들여쓰기 + 1
- 글순서(ansnum): 부모글 글순서 + 1 한 후, 글순서 재조정

번호 제목 		그룹번호 들여쓰기 글순서
1  제주도 	1	  0		 0
2  서울시 	2     0      0
   >마포구 	2     1		 1
    >>홍대	2	  2 	 2	
   	>>신촌	2	  2		 2 > 3
   	 >>>홍대	2	  3		 4 
   	 >>>현대	2	  3		 3 > 4 > 5
   >종로구 	2     1		 1 > 2 > 3 > 4 > 5 > 6
3  부산시 	3     0      0
   >동래구	3	  1		 1
    >>남포동	3	  2		 2
   >해운대구	3	  1		 1 > 2 > 3
4  인천시 	4     0      0

-글순서(ansnum) 재조정

UPDATE tb_bbs
SET ansnum=ansnum+1
WHERE grpno=2 AND indent>=2
///////////////////////////////////////

[검색]
--제목에서 '솔데스크'가 있는지 검색
select * from tb_bbs
where subject like '%솔데스크%'
--내용에서 '솔데스크'가 있는지 검색
select * from tb_bbs
where content like '%솔데스크%'
--제목+내용에서 '솔데스크'가 있는지 검색
select * from tb_bbs
where subject like '%솔데스크%' or content like '%솔데스크%'
--작성자에서 '솔데스크'가 있는지 검색
select * from tb_bbs
where wname like '%솔데스크%'

-cmd창 페이지당 줄수
set pagesize 100;

[페이징]
-rownum 줄번호 활용

1)
SELECT wname, grpno, ansnum
FROM tb_bbs
ORDER BY grpno DESC, ansnum ASC;

2)rownum 추가 - 줄번호까지 정렫룀
SELECT rownum, wname, grpno, ansnum
FROM tb_bbs
ORDER BY grpno DESC, ansnum ASC;

3) 1)의 SQL문을 셀프조인 하고 rownum추가
SELECT rownum, wname, grpno, ansnum
from(
	SELECT wname, grpno, ansnum
	FROM tb_bbs
	ORDER BY grpno DESC, ansnum ASC
);

4) 줄번호 1~5 조회 (1페이지)
SELECT rownum, wname, grpno, ansnum
FROM(
	SELECT wname, grpno, ansnum
	FROM tb_bbs
	ORDER BY grpno DESC, ansnum ASC
)
WHERE rownum>=1 and rownum<=5;

5) 줄번호 6~10 조회(2페이지)	> 조회안됨 . 선택된 레코드가 없습니다.
SELECT rownum, wname, grpno, ansnum
FROM(
	SELECT wname, grpno, ansnum
	FROM tb_bbs
	ORDER BY grpno DESC, ansnum ASC
)
WHERE rownum>=6 and rownum<=10;

6) 줄번호가 있는 3)의 테이블을 한번더 셀프조인하고 그 후
	rownum칼럼명을 rnum으로 바꾼다.

SELECT rnum, wname, grpno, ansnum
FROM(
	SELECT rownum AS rnum, wname, grpno, ansnum
	FROM(
		SELECT wname, grpno, ansnum
		FROM tb_bbs
		ORDER BY grpno DESC, ansnum ASC
		)
	)
WHERE rnum>=6 and rownum<=10;

7) 페이징 + 검색
   제목에서 '농융'가 있는 행을 검색해서 2페이지(6행~10행)조회하시오.
   
SELECT rnum, wname, grpno, ansnum
FROM(
	SELECT rownum AS rnum, wname, grpno, ansnum
	FROM(
		SELECT wname, grpno, ansnum
		FROM tb_bbs
		WHERE subject like '%농융%'
		ORDER BY grpno DESC, ansnum ASC
		)
	)
WHERE rnum>=6 and rownum<=10;
   
   
   
   
   
   
   
   
