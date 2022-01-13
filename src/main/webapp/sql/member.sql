-- member.sql

-- 회원등급
A1: 관리자
B1: 중간 관리자
C1: 우수 사용자
D1: 일반 사용자 (기본)
E1: 비회원
F1: 탈퇴한 회원

-- 회원테이블
CREATE TABLE member (
    id       VARCHAR(10)  NOT NULL, -- 아이디, 중복 안됨.
    passwd   VARCHAR(10)  NOT NULL, -- 패스워드
    mname    VARCHAR(20)  NOT NULL, -- 성명
    tel      VARCHAR(14)  NULL,     -- 전화번호
    email    VARCHAR(50)  NOT NULL  UNIQUE, -- 전자우편 주소, 중복 안됨
    zipcode  VARCHAR(7)   NULL,     -- 우편번호, 12345
    address1 VARCHAR(255) NULL,     -- 주소 1
    address2 VARCHAR(255) NULL,     -- 주소 2(나머지주소)
    job      VARCHAR(20)  NOT NULL, -- 직업
    mlevel   CHAR(2)      NOT NULL, -- 회원 등급, A1, B1, C1, D1, E1, F1
    mdate    DATE         NOT NULL, -- 가입일    
    PRIMARY KEY (id)
);

commit;

-- 행추가
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values('webmaster', '12341234', '웹마스터', '123-4567', 'web@soldesk.com'
     , '12345', '서울시 종로구 관철동', '코아빌딩8층', 'A02', 'A1', sysdate );

insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values('soldesk', '12341234', '웹마스터', '123-4567', 'sol@soldesk.com'
     , '12345', '서울시 종로구 관철동', '코아빌딩8층', 'A02', 'D1', sysdate );
     
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values('user1', '12341234', '웹마스터', '123-4567', 'user1@soldesk.com'
     , '12345', '서울시 종로구 관철동', '코아빌딩8층', 'A02', 'F1', sysdate );

insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values('testmem', '12341234', '테스트멤버', '123-4567', 'diakahxh89@naver.com'
     , '12345', '경기도 김포시', '장기동', 'A02', 'D1', sysdate );     
     
delete from member;     
commit;
select id, passwd, mlevel from member;


-- 로그인 성공하면(아이디와 비번이 일치하면) 회원등급 가져오기
-- (단, 비회원(E1)과 탈퇴회원(F1)은 제외)
--로그인 관련 함수
select mlevel
from member
where id='webmaster' and passwd='12341234' and mlevel in ('A1', 'B1', 'C1', 'D1') ;

select mlevel
from member
where id='user1' and passwd='12341234' and mlevel in ('A1', 'B1', 'C1', 'D1') ; --탈퇴회원


-- 아이디 중복확인
from member
where id=?;

--회원 정보 수정
SELECT *
FROM member
WHERE id=? <- 현재 로그인되어 있는 세션변수(s_id)

UPDATE member 
SET	    passwd=?, 
	    mname=?,   
    	tel=?,      
    	email=?,    
    	zipcode=?,  
    	address1=?,
    	address2=?,
    	job=?   
WHERE id=?   <- 현재 로그인되어 있는 세션변수(s_id)

--회원탈퇴
UPDATE member SET mlevel='F1'
WHERE id=? AND passwd=?
(id:세션번수 s_id, passwd:입력받은값)

--아이디/비번찾기

UPDATE member
SET passwd=?
WHERE mname=? AND email=?  --임시 비밀번호 업데이트 하기

SELECT id
FROM member
WHERE  mname=? AND email=?

--회원 정보 불러오기
SELECT mname,tel,email,zipcode,address1,address2,job
FROM member
WHERE id=?



--=============================================================
[공지사항 구축]
1) 테이블 생성
create table tb_notice(
     noticeno   number           not null  -- 일련번호
    ,subject    varchar2(255)    not null  -- 제목
    ,content    varchar2(4000)   not null  -- 내용
    ,regdt      date    default  sysdate   -- 작성일
    ,primary key(noticeno)                 -- noticeno 기본키
   );

2) 일련번호 시퀀스 생성
   create sequence noticeno_seq;

3) JSP 작업폴더 : notice 생성

4) Package명    : net.notice

5) 자바빈즈 파일명
   net.notice.NoticeDTO
   net.notice.NoticeDAO
   
2. JSP 파일

1) 공지사항 입력폼   : noticeForm.jsp  
   - 제목, 내용에 빈 문자열이 입력되지 않도록 자바스크립트 유효성 검사 추가

2) 공지사항 추가     : noticeIns.jsp

3) 공지사항 리스트   : noticeList.jsp
   -제목, 작성일 출력

4) 공지사항 상세보기 : noticeRead.jsp

5) 공지사항 삭제     : noticeDel.jsp

6) 공지사항 수정     : noticeUpdate.jsp

 

※ 게시판 소스 참고

------------------------------------------------- [과제]

1) 관리자 페이지

  - 회원관리    : 회원삭제(delete)

  - 게시판관리  : 글삭제(delete)
 
  - 공지사항관리: 쓰기 / 수정 / 삭제

 

2) 메인 페이지
 
  - 로그인  : 아이디/비번 찾기
              회원정보수정 / 회원탈퇴
 
  - 공지사항: 목록/상세보기