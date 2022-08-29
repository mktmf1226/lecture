
파일->새로만들기->데이터베이스계층->데이터베이스 파일
i:\java202207\database\20220829_03CSV변환.sql
///////////////////////////////////////////////////////////////////////////////

● [CSV 파일]
  - 모든 데이터가 , 로 구분되어 있는 파일
  
● [CSV 파일을 데이터베이스로 가져오기]
  - 공공데이터포털 https://data.go.kr/ 활용
  
  
  
문) 도로명 우편번호 테이블 구축하기

--1) zipdoro.csv준비 (258267행)


--2) zipdoro.csv 내용을 저장하는 zipdoro테이블 생성
create table zipdoro (
    zipno      char(5)        --우편번호
   ,zipaddress varchar(1000)  --주소 
);

commit;
drop table zipdoro; --테이블 삭제

--3) 가져오기와 내보내기
  - zipdoro 테이블 우클릭 -> 데이터 임포트 (가져오기)
  - zipdoro 테이블 우클릭 -> export      (내보내기)

select count(*) from zipdoro; --258267행

select * from zipdoro;


--서울특별시 강남구로 시작되는 우편번호가 몇개인지 확인하시오
select count(*) 
from zipdoro
where zipaddress like '서울특별시 강남구%';

select count(*) 
from zipdoro
where zipno like '_6___';

select zipno, count(zipno) 
from zipdoro
where zipaddress like '서울특별시 강남구%'
group by zipno;
////////////////////////////////////////////////////////////////////

문2) 한국교원대학교_초중등학교위치.csv를 변환하시오 (11874행)
create table tb_school (
    schno   char(10)        --학교ID
   ,schname varchar(1000)   --학교명 
   ,grade   varchar(100)    --학교급구분
   ,address varchar(1000)   --소재지도로명주소
   ,regdt   date            --생성일자
   ,condt   date            --변경일자
   ,letitd  number(12,9)    --위도
   ,longitd number(12,9)    --경도
);

commit;
drop table tb_school;


select count(*) from tb_school;

select *
from tb_school
where schno is null or
      schname is null or
      grade is null or
      address is null or
      regdt is null or
      condt is null or
      letitd is null or
      longitd is null;

