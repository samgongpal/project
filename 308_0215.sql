drop table MOVIE;
drop table MUSER;
drop table THEATER;
drop table THEATER_ROOM;
drop table RESERVATION;
drop table qna;

CREATE TABLE MOVIE(
    m_no number(5) PRIMARY KEY,
    m_name varchar2(100),
    m_dir varchar2(50),
    m_actor varchar2(100),
    m_genre varchar2(10),
    m_sdate date,
    m_edate date,
    m_grade char(2), /* A=��ü�̿밡 B=15���̻� C=19���̻� */
    m_rtime number(10),
    m_view number(10),
    m_info varchar(1000)
);

CREATE TABLE MUSER(
    u_no number(5) PRIMARY KEY,
    u_id varchar2(10),
    u_pw varchar2(10),
    u_mail varchar2(30),
    u_birth date,
    u_name varchar2(10),
    u_gender char(2),
    u_regdate date,
    u_phone varchar2(15)
);

CREATE TABLE THEATER(
    t_no number(5) PRIMARY KEY,
    t_name varchar2(10),
    t_address varchar2(10),
    t_list number(3)
);

CREATE TABLE THEATER_ROOM(
    tr_no number(5) PRIMARY KEY,
    tr_row number(10),
    tr_column number(10),
    t_no number(5) not null /* ��ȭ�� ���̺� join */
);
    

CREATE TABLE RESERVATION(
    r_no number(10) PRIMARY KEY,
    r_count number(10),
    r_date date,
    m_no number(5) not null, /* ��ȭ��ȣ : ��ȭ���̺��� ���� ��ȣ�� ������ �� ��ȭ ���� */
    u_no number(5) not null, /* ȸ����ȣ : ȸ�����̺��� ������� �����ͼ� ������� �˻� */
    t_no number(5) not null /* ��ȭ����ȣ : ��ȭ�����̺��� ��ȭ�� ���� join */
);

CREATE TABLE qna(
    q_no number(10) PRIMARY KEY,
    q_title varchar2(100),
    q_con varchar2(3000),
    q_hit number(10),
    q_date date
);
 /*
 hit �� ��ȸ���Դϴ�.
 �α����� ������ �Խñ��� Ŭ�������� +1 �ϵ��� ���ּ���.
 */
 
commit;

/* ��ȭ��ȣ, ��ȭ����, ����, ���, �帣, ������, ������, �������, �󿵽ð�, ������, ��ȭ���� */
insert into MOVIE values(1, '����Ƽ��', '�纥�÷���', '��Ȧ����,��ũ������', '�׼�', '20220216', '20220516', 
'A', 116, 40000, '��� ���� �ɾ��ٸ� ���� �������� ������ ã�ƾ� �Ѵ�!');
insert into MOVIE values(2, '������ �ּ�ȸ�� 0', '�ڼ���', '����Ÿ�ޱ���,�ϳ��ڿ�ī��', '�ִ�', '20220217', '20220517',
'B', 105, 20000, '12�� 24��, �츮�� ��;����� �����Ѵ�');
insert into MOVIE values(3, '��', '��� ������', 'Ƽ��ü����,����ī�۰Ž�', 'SF', '20220209', '20220509',
'A', 155, 50000, '���� �����ϴ� �ڰ� ���ָ� �����Ѵ�!');
insert into MOVIE values(4, '�� ��Ʈ��', '�˸��꽺', '�ι�Ʈ��ƾ��,���ٳ�', '�׼�', '20220301', '20220601',
'B', 176, 10000, '������ �� ���ΰ� �Ǵ��� �� ���ΰ� ����� ������ ���ø��� ���Ҵ�');
insert into MOVIE values(5, '���ڸ��� ����', '�� �丶�� �ش���', '�˶�����,����ȣ����', '���', '20220216', '20220516',
'B', 134, 70000, '1973�� ��� ������ ������ û���� �Ѻ������� �޷����� �׵��� �̾߱�');
insert into MOVIE values(6, '���� ���� ����', '�ɳ׽� �귡��', '�ɳ׽��귡��,������', '����', '20220209', '20220509',
'C', 127, 90000, '��ȥ�κθ� �¿� ����Ʈ ���ϰ��� ��ȣȭ ���������� ���λ���� ��������');
insert into MOVIE values(7, '355', '���̸� Ų����', '����ī��������,���̾�ũ���', '�׼�', '20220209', '20220509',
'B', 122, 100000, '����Ŭ���� �� ������Ʈ TEAM ��355�� ���� �׵��� �����δ�!');
insert into MOVIE values(8, '�ظ����Ϳ� �һ�������', '���̺� ������', '�ٴϿ�����Ŭ����,�����ӽ�', 'ȯŸ��', '20220209', '20220509',
'A', 137, 50000, '����� ���¿� ���� ȣ�׿�Ʈ�� ���ϱ� ���� �ظ����Ϳ� �һ��� ����, �׵��� ���� ��Ҵ�!');
insert into MOVIE values(9, '���� �к�', '���Ǽ�', '����,�ڿ���', '��ť', '20220210', '20220510',
'A', 88, 20000, '2016�� �����谡 �ָ��� �� ������ �� ������ ������ �ѳ���� ��ġ�ε��� �׳��� ��ȭ�� �����Ѵ�!');
insert into MOVIE values(10, '��2�Դ�', '�������׽�', '��Ʃ��Ŀ����,����������Ǭ', '�ִ�', '20220105', '20220405',
'A', 109, 60000, '�� ���谡 �ָ��� ��������! �Բ� ������ �غ����?');
/* ȸ����ȣ, ���̵�, ��й�ȣ, �̸���, �������, �̸�, ����, ��������, ��ȭ */
INSERT INTO MUSER VALUES(1, 'aaa123', 'aaa123', 'aaa123@aaa.com', '19900101', '��ȸ��', 'M', '20210101', '01011112222');
INSERT INTO MUSER VALUES(2, 'bbb123', 'bbb123', 'bbb123@bbb.com', '19910202', '��ȸ��', 'F', '20210201', '01011113333');
INSERT INTO MUSER VALUES(3, 'ccc123', 'ccc123', 'ccc123@ccc.com', '19920303', '��ȸ��', 'M', '20210301', '01011114444');
INSERT INTO MUSER VALUES(4, 'ddd123', 'ddd123', 'ddd123@ddd.com', '19930404', '��ȸ��', 'F', '20210401', '01011115555');
INSERT INTO MUSER VALUES(5, 'eee123', 'eee123', 'eee123@eee.com', '19940505', '��ȸ��', 'M', '20210501', '01011116666');
INSERT INTO MUSER VALUES(6, 'fff123', 'fff123', 'fff123@fff.com', '19950606', '��ȸ��', 'F', '20210601', '01011117777');
INSERT INTO MUSER VALUES(7, 'ggg123', 'ggg123', 'ggg123@ggg.com', '19960707', '��ȸ��', 'M', '20210701', '01011118888');
INSERT INTO MUSER VALUES(8, 'hhh123', 'hhh123', 'hhh123@hhh.com', '19970808', '��ȸ��', 'F', '20210801', '01011119999');
INSERT INTO MUSER VALUES(9, 'iii123', 'iii123', 'iii123@iii.com', '19980909', '��ȸ��', 'M', '20210901', '01022221111');
INSERT INTO MUSER VALUES(10, 'jjj123', 'jjj123', 'jjj123@jjj.com', '19991010', '��ȸ��', 'F', '20211001', '01022223333');
 /* ��ȭ����ȣ, ��ȭ���̸�, ����(��), �󿵰����� */
INSERT INTO THEATER VALUES(1, '�����', '�߾ӵ�', 3);
INSERT INTO THEATER VALUES(2, '�����', '������', 2);
INSERT INTO THEATER VALUES(3, '�����', '�絿', 2);
 /* �󿵰���ȣ, ���¼�, ���¼�, ��ȭ����ȣ(��ȭ�����̺�join) */
insert into theater_room values(1, 5, 5, 1);
insert into theater_room values(2, 6, 6, 1);
insert into theater_room values(3, 7, 7, 1);
 /*���Ź�ȣ, �ο���, ���ų�¥, ��ȭ��ȣ(��ȭ���̺�), ȸ����ȣ(ȸ�����̺�), ��ȭ����ȣ(��ȭ�����̺�) */
insert into RESERVATION values(1, 1, '20220201', 1, 1, 1);
insert into RESERVATION values(2, 3, '20220201', 2, 2, 2);
insert into RESERVATION values(3, 2, '20220202', 3, 3, 3);
insert into RESERVATION values(4, 2, '20220202', 4, 4, 2);
insert into RESERVATION values(5, 1, '20220203', 5, 5, 1);
insert into RESERVATION values(6, 2, '20220204', 6, 4, 2);
/* ������ȣ, ����, ����, ��ȸ��, �ۼ����� */
INSERT INTO qna VALUES(1,'����Ʈ ������ ���޾Ҿ��.','* ����� ��ϵ� ��ȭ�������� ��� �����ǥ�ҿ����� ���Ұ����մϴ�.',0,'20220115');
INSERT INTO qna VALUES(2,'�޸�����̶�� �ϴµ� ��� ���� �ϳ���?','* �޸���� ������ 1�� ���� �����ϸ� ��� �� Ż��ó�� �Ǹ� ���������� �ı�˴ϴ�.',0,'20220116');
INSERT INTO qna VALUES(3,'��ȭ ���� �� ���������ϴ�.','* ������ ���� : ��~�ݿ���(������ ����)',0,'20220116');
INSERT INTO qna VALUES(4,'VIP�� �Ǹ� � ������ ���� �� �ֳ���?','* ����� ȸ������� �����ϴ�. �˼��մϴ�.',0,'20220117');
INSERT INTO qna VALUES(5,'�̸��� �����ߴµ� ��� �ٲٳ���?','* Ȩ������ �� ���� ȸ�� �α��� �� [����������] - [�������� ����]���� [�̸�����]�� �����Ͽ��ֽø� �����մϴ�.',0,'20220120');
INSERT INTO qna VALUES(6,'�ܺ����� ������ �����Ѱ���?','* �󿵰� �� �ܺ� ���� ������ �����ϳ�
��ȭ ���� �� �ٸ� ���Կ��� ���ذ� �������� ǰ�� ���Ͽ� ���� �����մϴ�.
���� ���� �� �������� ������ �߻��ϴ� ǰ���� ��� �� �������ֽñ� ��Ź�帮��,
������ ���� ȯ���� ���� ���� ���� ��Ź�帳�ϴ�.',0,'20220120');
INSERT INTO qna VALUES(7,'�нǹ� ���Ǵ� ��� �ϳ���?','* Ȩ������ �� ����� ���� ������ > �нǹ� ���Ǹ� ���� �����Ͻ� ������ �� ������ �����Ͽ� �����Ͽ��ֽø�
�������� Ȯ�� �� ���� �亯�� �帳�ϴ�.',0,'20220123');
INSERT INTO qna VALUES(8,'��Ż� ���������� ��� �ǳ���?','* ����� ��ϵ� ��ȭ�������� ��� �����ǥ�ҿ����� ���Ұ����մϴ�.',0,'20220126');
INSERT INTO qna VALUES(9,'����Ʈ ������ ���޾Ҿ��.','* ���� ���� ���� ��� �ް��ڽ� ����� ����Ʈ ���� �Ұ�',0,'20220126');
INSERT INTO qna VALUES(10,'���Ű� ���� �ʾ� �����ߴ� �¼����� �ٽ� ���Ÿ� �Ϸ��� �մϴ�','�����ϱ� ��ư�� ������ ��ȭ�󿵰��� �ð��� �������ּ���.',0,'20220128');
INSERT INTO qna VALUES(11,'��Ż� ���������� ��� �ǳ���?','* ����� ��ϵ� ��ȭ�������� ��� �����ǥ�ҿ����� ���Ұ����մϴ�.',0,'20220126');
INSERT INTO qna VALUES(12,'��ȸ�� 1:1���ǽ� Ȯ���� �Ұ����Ѱ���?','* ',0,'20220202');
INSERT INTO qna VALUES(13,'��ȭ��ǰ���̳�,���ǸӴ� ��ǰ�����ε� ���Ű� �����Ѱ���?','',0,'20220202');

/*join ���� - select (join ���� �� ����� ������(���̺��.�÷���)) from (�÷� ���� �� ���̺��) WHERE ���� ex) A���̺��� C������ B���̺��� C������ ���� ���� ��*/
select theater.t_name, theater.t_address, theater.t_list, theater_room.tr_no, theater_room.tr_row, theater_room.tr_column from theater, theater_room WHERE THEATER.t_no = THEATER_ROOM.t_no;

/* SELECT�� �׽�Ʈ */
/* ����01. �������̺��� 1��ȸ���� �̸�, ����, ��ȭ��ȣ ����ϱ�*/
select muser.u_name, muser.u_gender, muser.u_phone from muser, reservation WHERE muser.u_no = reservation.u_no;

/* ����02. �������̺��� 3����ȭ�� ����, ���, �帣 ����ϱ�*/
select movie.m_name, movie.m_actor, movie.m_genre from movie, reservation where movie.m_no = reservation.m_no;

/* ����03. ���ų�¥�� 2022�� 2�� 2���� ���Ÿ�� ����ϱ�*/
select * from reservation where r_date = '20220202';

/* ����04. ���� �ο����� ���� ������ ����*/
select * from reservation order by r_count desc;

/* ����05. 4��ȸ���� ���� ��� ����ϱ�*/
select * from reservation where u_no = '4';

/* ����06. �ۼ����� ������ ������� �����Ͻÿ�.*/
SELECT*FROM qna ORDER BY q_date ASC;

/* ����07. �нǹ� ������ �Խñ��� ������ �ҷ����ÿ�.*/
SELECT q_con FROM qna WHERE q_title like '%�нǹ�%';

/* ����08. �ֽű� ������� �����Ͻÿ�.*/
SELECT*FROM qna ORDER BY q_date DESC;

/* ����09. 10��°�� �ۼ��� ���� ������ �������ÿ�.*/
SELECT q_title FROM qna WHERE q_no = 10;

/* ����10. �� �Խù� ������ ���Ͻÿ�.*/
SELECT count(*) FROM qna; 

/* ����11. �󿵽ð� 2�ð� �̻��� ��ȭ */
select m_name, m_info, m_rtime from movie where m_rtime >= 120;

/* ����12. 3�� ���� ������ */
select m_name, m_sdate from movie where m_sdate >= '220301';

/* ����13. ���� ���� ������ �̸�, �¼�����, ��¥ */
select u.u_name, u.u_gender, r.r_count, r.r_date from muser u, reservation r where u.u_no = r.u_no and u.u_gender = 'M';
select u.u_name, u.u_gender, r.r_count, r.r_date from muser u, reservation r where u.u_no = r.u_no and u.u_gender = 'F';

/* ����14. ������ ������ȣ�� ��ȭ����� ���� */
select reservation.u_no, movie.m_name, movie.m_dir from movie, reservation where reservation.m_no = movie.m_no;

/* ����15. �䰡 ���� ��ȭ ���� */
select * from movie order by m_view desc;

/* ����16. ������ȣ�� 1���� ����� �̸��� ��ȣ, �����ο���  ���೯¥ ��ȭ�̸��� ����ϼ���*/
select muser.u_name, muser.u_phone, RESERVATION.r_count, reservation.r_date, MOVIE.m_name from muser, RESERVATION, MOVIE WHERE muser.u_no = 1 AND muser.u_no = RESERVATION.u_no;

/* ����17. �絿 ��ȭ���� ���� �ο����� ����ϼ���*/
select THEATER.t_name, RESERVATION.r_count from THEATER, RESERVATION WHERE RESERVATION.t_no = 3 And RESERVATION.t_no = THEATER.t_no;

/* ����18. 19�� �̻� ��ȭ�� ����ϼ���*/
select * from MOVIE WHERE m_grade = 'C';

/* ����19. ��ȭ ������ ����*/
SELECT * from MOVIE order by m_sdate asc;

/* ����20. ȸ�� ���Լ� ������������ ����*/
SELECT * from MUSER order by u_regdate DESC; 
