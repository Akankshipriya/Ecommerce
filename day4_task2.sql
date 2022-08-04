create table celebrity_log(logID int identity(100,1),cid int,operation nvarchar(20),updateddate Datetime)
select * from celebrity_log

--celebrity insert
create trigger Celebrity_Insert_Trigger
on celebrity
for insert
as
insert into celebrity_log(logID,operation,updateddate)
select celebrity_id,'Data Inserted', GETDATE() from inserted


-- Celebrity update trigger

create trigger Celebrity_Update_Trigger
on celebrity
after update
as
insert into celebrity_log(logID,operation,updateddate)
select celebrity_id,'Data Updated', GETDATE() from deleted

update celebrity set celebrity_name='Anis' where celebrity_id=5


-- Celebrity delete trigger

create trigger Celebrity_Delete_Trigger
on celebrity
instead of delete
as
insert into celebrity_log(logID,operation,updateddate)
select celebrity_id,'Data to be Deleted', GETDATE() from deleted

delete from celebrity where celebrity_id=7


create table brand_log(logID int identity(100,1),bid int,operation nvarchar(20),updateddate Datetime)
select * from brand_log

--Brand Insert
create trigger Brand_Insert_Trigger
on brands
for insert
as
insert into brand_log(logID,operation,updateddate)
select brand_id,'Data Inserted', GETDATE() from inserted

-- Brands update trigger
create trigger Brand_Update_Trigger
on brands
after update
as
insert into brand_log(logID,operation,updateddate)
select brand_id,'Data Updated', GETDATE() from deleted

update brands set brand_name='Tanisk' where brand_id=1

--brand delete trigger

create trigger Brand_Delete_Trigger
on brands
instead of delete
as
insert into brand_log(logID,operation,updateddate)
select brand_id,'Data to be Deleted', GETDATE() from deleted

delete from brands where brand_id=10


create table endorsed_log(logID int identity(100,1),eid int,operation nvarchar(20),updateddate Datetime)
select * from endorsed_log

--insert trigger
create trigger Endorsed_Insert_Trigger
on endorsments
for insert
as
insert into endorsed_log(logID,operation,updateddate)
select brand_id,'Data Inserted',GETDATE() from inserted

insert into endorsments values(6,4)


--update trigger

create trigger EndorsedUpdateTrigger
on endorsments
after update
as
insert into endorsed_log(logID,operation,updateddate)
select brand_id,'Data Updates',GETDATE() from deleted

update endorsments set brand_id=2 


--Delete trigger
create trigger EndorsedDeleteTrigger
on endorsments
after delete
as
insert into endorsed_log(logID,operation,updateddate)
select brand_id,'Data Deleted',GETDATE() from deleted

delete from endorsments where brand_id=5
