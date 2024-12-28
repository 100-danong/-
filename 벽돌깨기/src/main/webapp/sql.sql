drop table member;

create table member(
memberno varchar2(5) not null primary key,
stageno number(10),
id varchar2(15),
pass varchar2(20),
checks varchar2(1)
);

insert into member values('10001','1', 'sksdmsgp', '1234', '0');
insert into member values('10002','3', 'sksdmsgp1', '1234', '0');
insert into member values('10003','5', 'sksdmsgp2', '1234', '0');
insert into member values('10004','7', 'sksdmsgp3', '1234', '0');
insert into member values('10005','10', 'sksdmsgp4', '1234', '0');

select id, pass from member;

select stageno, id, pass from member order by stageno desc;

select * from member;

select stageno from member where checks = '1';

select
name
from member m
join stage s
on m.stageno = s.stageno
where checks = '1';

drop table stage;
create table stage(
stageno varchar2(10) not null primary key,
name varchar2(10),
content varchar2(300),
link varchar2(100),
link2 varchar2(100)
);

insert into stage values('1', '환상', '이 곳은 모든 곳의 시작이자 원천이다', 'map1.jsp', 'map11.png');
insert into stage values('2', '꿈', '환상을 탈출한 후 들어간 곳은 바로 꿈.. 이 꿈을 깨트리는거야!', 'map2.jsp', 'map12.png');
insert into stage values('3', '현실', '꿈을 탈출하여 나온 곳은 바로 현실... 이 현실을 넘어 세상으로 나아가는 거야!', 'map3.jsp', 'map13.png');
insert into stage values('4', '세상', '세상으로 나왔다.. 이제 앞으로 나아갈 일만 남은건가..? 아닛... 저것은...!?!?!', 'map4.jsp', 'map14.png');
insert into stage values('5', '벽', '세상에 끝에 벽이 있다니.. 내가 지금까지 뚫고 지나온 벽과는 차원이 달라... 이 벽을 넘을 수 있을까..?', 'map5.jsp', 'map15.png');
insert into stage values('6', '하늘', '벽을 넘었더니 어째서 하늘이..? 이판사판이다! 하늘을 뚫자!', 'map6.jsp', 'map16.png');
insert into stage values('7', '우주', '하늘을 너머 우주에 왔다 하지만 어째서 벗어날 수 없는거지..? 자유가 눈 앞에 있다! 자유를 쟁취하자!', 'map7.jsp', 'map17.png');
insert into stage values('8', '자유', '자유를 얻기 위해서는 자유를 깨야한다.. 자유를... 얻고싶어!!', 'map8.jsp', 'map18.png');
insert into stage values('9', '신', '자유를 깨부쉈지만... 신이 내 자유를 가져갔어! 신에게서 내 자유를 되찾고 말겠어!', 'map9.jsp', 'map19.png');
insert into stage values('10', 're:환상', '신을 이겼지만... 이 모든건 신의 장난이였던거야..? 다시 환상 속에 들어오다니... 한번 탈출한 이상 두번이라고 못 하겠냐! 다시 탈출한다!', 'map10.jsp', 'map20.png');

select * from stage;

select name from stage where stageno = ?;
