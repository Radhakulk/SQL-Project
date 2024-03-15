create database library;
create table Authours_book_mapping
(author_book_id int primary key,
author_id int not null,
foreign key(author_id) references author(author_id),
Book_id int);
create table Reviews
(Review_id int primary key,
book_id int,
foreign key(book_id) references books(book_id),
member_id int,
foreign key (member_id) references member(member_id),
rating int,
review_text varchar(50),
review_date varchar(50));
create table member 
(member_id int,
member_name varchar(10),
ph_number  int);
create table Author 
(author_id int primary key,
author_name varchar(10));

alter table author add index(author_id);
create table transactions
(transaction_id int primary key,
member_id int,
foreign key (member_id) references member(member_id),
transaction_date varchar(10),
transaction_type varchar(10),
amount_paid int NOT NULL);
select * from transactions;
insert into authours_book_mapping values 
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,6);
insert into author values
(1,'xxx'),
(2,'yyy'),
(3,'zzz'),
(4,'aaa'),
(5,'bbb'),
(6,'ccc');
insert into book_copies_table values
(1,1,001,'good','A1'),
(2,1,002,'Fair','B3'),
(3,2,003,"Bad",'C1'),
(4,2,003,'Good','d2'),
(5,3,001,'Fair','E1'),
(6,5,002,'Bad','f5'),
(7,6,001,'Bad','A4');
insert into books values
(1,'The Secret',1),
(2,'Ikigagi',2),
(3,'The hope',3),
(4,'Healer',4),
(5,'Love',5),
(6,'Mind',6),
(7,'Money',7);
insert into member values
(101,'Deepa',90846526),
(102,'Raju',92397428),
(103,'John',87294714),
(104,'Ajay',94914651),
(105,'Rekha',89849413),
(106,'Vidya',921470),
(107,'Aman',9741414);
insert into publishers values
(1,'sss','India'),
(2,'ssd','Japan'),
(4,'asas','USA'),
(3,'sss','UK'),
(5,'aad','India'),
(6,'WAS','Japan'),
(7,'sas','Italy');
insert into reviews values
(1,1,101,3,'A classic masterpiece',2024-2-3),
(2,2,103,4.8,'Mindblowing',2024-2-12),
(3,1,104,5,'Must read book',2023-12-1),
(4,5,105,2,'Not a good one',2023-3-3),
(5,6,106,4,'Loved it',2023-3-12),
(6,7,102,2.3,'Hard to undestad',2024-1-1),
(7,4,107,5,'Masterpiece',2024-2-3),
(8,3,107,3,'A fair one',2023-12-12);
insert into transactions values
(1,101,2024-2-3,'Borrow',0),
(2,103,2024-3-2,'Borrow',0),
(3,102,2024-4-5,'Purchased',199),
(4,104,2023-12-23,'Purchased',299),
(5,106,2023-11-12,'borrow',0),
(6,107,2023-12-23,'Purchased',159),
(7,105,2023-3-4,'Borrow',50);
alter table books add published_year int;



SELECT Genere, COUNT(*) AS Genere_Count
FROM books
GROUP BY Genere
ORDER BY Genere_Count DESC;
select max(rating) as hieghest_rating
from reviews;
SELECT b.book_name, AVG(t.rating) AS avg_rating
FROM reviews t
JOIN books b ON t.book_id = b.book_id
GROUP BY b.book_id, b.book_name
ORDER BY avg_rating DESC;
select member_name from 
member join transactions on
member.member_id=transactions.member_id
group by member.member_id,member.member_name
 having count(*)>5;
select member_name from 
member join transactions on
member.member_id=transactions.member_id
group by member.member_id,member.member_name
 having count(*)<5;
SELECT book_name, AVG(rating) AS average_rating, COUNT(review_id) AS review_count
FROM books
JOIN reviews ON books.book_id = reviews.book_id
GROUP BY books.book_id, book_name
HAVING COUNT(review_id) >= 5
ORDER BY average_rating DESC;
SELECT SUM(amount_paid) AS total_revenue
FROM transactions;
SELECT books.book_name, author.author_name, publishers.publisher_name
FROM books
JOIN author ON books.author_name = author.author_name
JOIN publishers ON books.publisher_id = publishers.publisher_id;
SELECT book_name
FROM books
WHERE availability = 'yes';
alter table books add availability varchar(10);
update  books
set published_year=case
when book_id=1 then '1999'
when book_id=2 then '2000'
when book_id=3 then '2001'
when book_id=4 then "1987"
when book_id=5 then '2002'
when book_id=6 then '1999'
when book_id=7 then '2000'
else availability end;
set sql_safe_updates=0;
select*from books;
SELECT member_id, member_name
FROM transactions
JOIN member ON transactions.member_id = member.member_id
WHERE transaction_date < CURRENT_DATE
AND transaction_date IS NOT NULL;
SELECT books.book_id, books.book_name, COUNT(*) AS borrow_count
FROM books join transactions on 
books.book_id=transactions.book_id
GROUP BY books.book_id, books.book_name
ORDER BY borrow_count DESC
LIMIT 10;
SELECT AVG(transaction_daye) AS avg_borrow_duration
FROM transactions
WHERE return_date IS NOT NULL;
SELECT published_year AS publication_year, COUNT(*) AS total_books_published
FROM books
GROUP BY published_year;
SELECT member_id, COUNT(*) AS borrow_count
FROM transactions
WHERE transaction_type = 'borrow'
GROUP BY member_id
HAVING COUNT(*) > 1;
select books.book_name,books.author_name, avg(reviews.rating) as average_rating 
from books join reviews
on books.book_id=reviews.book_id
group by books.book_id,books.author_name,books.book_name;
SELECT b.book_name, SUM(bct.copy_number) AS total_no_copies
FROM books b
JOIN book_copies_table bct ON b.book_id = bct.book_id
GROUP BY b.book_name;
CREATE USER 'myuser'@'localhost' IDENTIFIED WITH mysql_native_password BY '12345';
GRANT SELECT ON transaction_view TO myuser@localhost;
GRANT SELECT (member_id) ON transaction_view TO myuser@localhost;










 
  












 




