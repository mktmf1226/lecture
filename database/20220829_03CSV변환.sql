
����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
i:\java202207\database\20220829_03CSV��ȯ.sql
///////////////////////////////////////////////////////////////////////////////

�� [CSV ����]
  - ��� �����Ͱ� , �� ���еǾ� �ִ� ����
  
�� [CSV ������ �����ͺ��̽��� ��������]
  - �������������� https://data.go.kr/ Ȱ��
  
  
  
��) ���θ� �����ȣ ���̺� �����ϱ�

--1) zipdoro.csv�غ� (258267��)


--2) zipdoro.csv ������ �����ϴ� zipdoro���̺� ����
create table zipdoro (
    zipno      char(5)        --�����ȣ
   ,zipaddress varchar(1000)  --�ּ� 
);

commit;
drop table zipdoro; --���̺� ����

--3) ��������� ��������
  - zipdoro ���̺� ��Ŭ�� -> ������ ����Ʈ (��������)
  - zipdoro ���̺� ��Ŭ�� -> export      (��������)

select count(*) from zipdoro; --258267��

select * from zipdoro;


--����Ư���� �������� ���۵Ǵ� �����ȣ�� ����� Ȯ���Ͻÿ�
select count(*) 
from zipdoro
where zipaddress like '����Ư���� ������%';

select count(*) 
from zipdoro
where zipno like '_6___';

select zipno, count(zipno) 
from zipdoro
where zipaddress like '����Ư���� ������%'
group by zipno;
////////////////////////////////////////////////////////////////////

��2) �ѱ��������б�_���ߵ��б���ġ.csv�� ��ȯ�Ͻÿ� (11874��)
create table tb_school (
    schno   char(10)        --�б�ID
   ,schname varchar(1000)   --�б��� 
   ,grade   varchar(100)    --�б��ޱ���
   ,address varchar(1000)   --���������θ��ּ�
   ,regdt   date            --��������
   ,condt   date            --��������
   ,letitd  number(12,9)    --����
   ,longitd number(12,9)    --�浵
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

