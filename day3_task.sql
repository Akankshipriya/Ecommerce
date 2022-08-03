create database Ecommerce

create table product(product_id int identity(1,1) primary key, product_name nvarchar(20), product_price numeric(18,2),product_category nvarchar(20))

insert into product values('Phone', 20000,'electronics')
insert into product values('Induction', 1800,'electronics')
insert into product values('Chair', 2000,'furniture')
insert into product values('Bread', 45,'grocery')
insert into product values('Rice', 80,'grocery')

select * from product

create table customer(customer_id int identity(1,1) primary key, customer_name nvarchar(20), phone_number nvarchar(10),address nvarchar(25))

insert into customer values('Ankit','8888888888','delhi')
insert into customer values('Bob','8888889999','pune')
insert into customer values('charlie','8888899999','pune')
insert into customer values('David','8888889999','mumbai')
insert into customer values('Erin','8888999999','kolkata')

select * from customer

create table account(card_number int, acc_name nvarchar(20), c_address nvarchar(20))

insert into account values(1001,'Ankit','delhi')
insert into account values(1002,'Bob','pune')
insert into account values(1003,'charlie','pune')
insert into account values(1002,'Bob','bangalore')

select * from account

select card_number, acc_name from account
union
select customer_id,customer_name from customer


select card_number, acc_name from account
intersect
select customer_id,customer_name from customer


select * from customer where customer_name like 'a%' or address='pune'

select * from customer where customer_id is null

select * from customer where customer_id is not null

select * from customer where exists(select * from customer where customer_id is null)

select * from customer where exists(select * from customer where customer_id=1)

select * from customer where customer_name like 'a_[vgnhj]%'

select * from product where product_price between 2000 and 20000