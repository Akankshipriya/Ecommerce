create database fashion
use fashion

create table brands(brand_id int primary key identity, brand_name nvarchar(20))


insert into brands values('Adidas')
insert into brands values('BMW')
insert into brands values('Myntra')
insert into brands values('One+')
insert into brands values('Realme')
insert into brands values('Puma')
insert into brands values('only')
insert into brands values('Fastrack')
insert into brands values('Roadster')
insert into brands values('Nike')

select * from brands

create table celebrity(celebrity_id numeric primary key identity(100,1),celebrity_name nvarchar(30))


insert into celebrity values('Kim')
insert into celebrity values('selena')
insert into celebrity values('kamila')
insert into celebrity values('Dipika')
insert into celebrity values('Kriti')
insert into celebrity values('Adavani')
insert into celebrity values('Sid')
insert into celebrity values('Katrina')
insert into celebrity values('Arjun')
insert into celebrity values('Bob')

select * from celebrity

create table endorsments(brand_id int,c_id numeric, constraint fk_b_id foreign key (brand_id) references brands(brand_id),constraint fk_cid foreign key (c_id) references celebrity(celebrity_id) on delete cascade on update cascade)


insert into endorsments values(1,100)
insert into endorsments values(3,103)
insert into endorsments values(5,102)
insert into endorsments values(1,107)
insert into endorsments values(6,100)
insert into endorsments values(7,108)
insert into endorsments values(8,109)
insert into endorsments values(6,109)
insert into endorsments values(10,106)
insert into endorsments values(9,102)

select * from endorsments

--left join
--not endorsing brands
select b.brand_id ,b.brand_name from brands as b left join endorsments as e on b.brand_id =e.brand_id where e.brand_id is null

--using stored procedure
create procedure sp_brandnotendorsed
as
begin
select b.brand_id ,b.brand_name from brands as b left join endorsments as e on b.brand_id =e.brand_id where e.brand_id is null
end

exec sp_brandnotendorsed


-- not endorsing any celebrity

create procedure sp_notendorsed_celebrity
as
begin
select c.celebrity_id,c.celebrity_name from endorsments as e right join celebrity as c on c.celebrity_id=e.c_id where e.c_id is null
end

exec sp_notendorsed_celebrity





--common brands endorsed by celebrities

create procedure sp_common_brands
as begin
select b.brand_name from endorsments as e
inner join brands as b
on e.brand_id=b.brand_id 
group by b.brand_name
having count(b.brand_name)>1
end
exec sp_common_brands



--celebrities endorsing multiple brands

create procedure sp_common_celebrities
as
begin
select c.celebrity_name from endorsments as e
inner join celebrity as c
on e.c_id=c.celebrity_id
group by c.celebrity_name
having count(c.celebrity_name)>1
end

exec sp_common_celebrities