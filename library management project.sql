drop table published_by;
drop table publisher;
drop table borrow_by;
drop table member; 
drop table book;



create table book(
book_id varchar(10) not null,
price number(5),
title varchar(30),
author varchar(30),
available  int check(available = 0 or available = 1),
primary key (book_id)
);
describe book;


create table member(
member_id  varchar(10) not null,
name varchar(20), 
member_type  varchar(8),
mem_address varchar(25),   
join_date varchar(15),
slot_location_id varchar(10),
primary key (member_id)
);
describe member;


create table borrow_by(
issue_date varchar(15),
return_date varchar(15),
book_id varchar(10) not null,
member_id  varchar(10) not null,
foreign key (book_id) references book(book_id) on delete cascade,
foreign key (member_id) references member(member_id) on delete cascade
);
describe borrow_by;

create table publisher(
pub_id varchar(12) not null,
pub_address varchar(25),   
pub_name varchar(35),
primary key (pub_id)
);
describe publisher;

create table published_by(
book_id varchar(10) not null,
pub_id varchar(12) not null,
rating_score number(5),
foreign key (book_id) references book(book_id) on delete cascade,
foreign key (pub_id) references publisher(pub_id) on delete cascade
);
describe published_by;

insert into book(book_id,price,title,author,available) values(1467,257,'bikel hawa','noor hossain',1);
insert into book(book_id,price,title,author,available) values(4368,285,'mind tuning','raivi ahmed',0);
insert into book(book_id,price,title,author,available) values(1546,257,'liberation war','rejwan arefin',0);
insert into book(book_id,price,title,author,available) values(1236,257,'telepathy basics','nafin shah',1);
insert into book(book_id,price,title,author,available) values(4268,285,'royal palace','rizvi hasan',1);
insert into book(book_id,price,title,author,available) values(5897,257,'jungle land','alvi khalek',1);
insert into book(book_id,price,title,author,available) values(4237,257,'travel history','jakaria talukder',1);

select * from book;

insert into member(member_id,name,mem_address,join_date,slot_location_id) values(2461,'Shuvo', 'Badda, Dhaka-1212', '12-03-2017','ASDF12'); 
insert into member(member_id,name,mem_address,join_date,slot_location_id) values(2462,'Rafi', 'Gulshan, Dhaka-1212', '13-03-2017','ASDF13');
insert into member(member_id,name,mem_address,join_date,slot_location_id) values(2463,'Rasel', 'Baridhara, Dhaka-1212', '12-04-2017','ASDF14');
insert into member(member_id,name,mem_address,join_date,slot_location_id) values(2464,'Kabir', 'Banani, Dhaka-1212', '19-04-2017','ASDF15');
insert into member(member_id,name,mem_address,join_date,slot_location_id) values(2465,'Kashem', 'Purbachal, Dhaka-1212', '11-09-2017','ASDF16');
insert into member(member_id,name,mem_address,join_date,slot_location_id) values(2466,'Shamim', 'Dhanmondi, Dhaka-1212', '14-06-2017','ASDF17');
insert into member(member_id,name,mem_address,join_date,slot_location_id) values(2467,'Shakib', 'Khilkhet, Dhaka-1212', '12-12-2017','ASDF18');

select * from member;

insert into borrow_by values('12-03-2017', '14-03-2017', '1236','2463');
insert into borrow_by values('12-03-2017', '15-03-2017', '1546','2462');
insert into borrow_by values('12-03-2017', '16-03-2017', '4268','2461');
insert into borrow_by values('12-03-2017', '15-03-2017', '5897','2466');
insert into borrow_by values('12-03-2017', '13-03-2017', '4237','2467');

select * from borrow_by;

insert into publisher(pub_id,pub_address,pub_name) values(1110, 'Nilkhet Dhaka', 'Sheba Prokashoni');
insert into publisher(pub_id,pub_address,pub_name) values(1111, 'Nilkhet Dhaka', 'Onno Prokash');
insert into publisher(pub_id,pub_address,pub_name) values(1112, 'Nilkhet Dhaka', 'Bangla Academy');
insert into publisher(pub_id,pub_address,pub_name) values(1113, 'Nilkhet Dhaka', 'Gyankosh Prokashoni');
insert into publisher(pub_id,pub_address,pub_name) values(1114, 'Nilkhet Dhaka', 'Onnorokom Prokashoni');

select * from publisher;

insert into published_by values('1467','1110',25);
insert into published_by values('4368','1114',37);
insert into published_by values('4237','1112',59);
insert into published_by values('5897','1111',78);
insert into published_by values('1236','1113',91);

select * from published_by;


-- Some general select operation with allising
select b.title, y.issue_date, b.author
from  book b, borrow_by y 
where b.book_id = y.book_id;

-- Example of Join operations applied to the project
select b.title, y.issue_date, b.author
from book b join borrow_by y
on b.book_id = y.book_id;

-- Normal join operation with using clause
select b.title, y.return_date, b.author
from book b join borrow_by y
using (book_id);

-- Natural join operation
select book_id, b.title, y.issue_date, b.author
from book b natural join borrow_by y;

-- Cross join operation
select b.title, m.name
from book b cross join member m;

-- Inner join operation
select p.pub_name, p.pub_address, q.rating_score
from publisher p inner join published_by q
on p.pub_id=q.pub_id;

-- Left outer join operation
select p.pub_name, p.pub_address, q.rating_score
from publisher p left outer join published_by q
on p.pub_id=q.pub_id;

-- Right outer join operation
select p.pub_name, p.pub_address, q.rating_score
from publisher p right outer join published_by q
on p.pub_id=q.pub_id;


-- Full outer join operation
select p.pub_name, p.pub_address, q.rating_score
from publisher p  outer join published_by q
on p.pub_id=q.pub_id;














