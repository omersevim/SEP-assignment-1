Create table Employee (id int not null, firstname varchar(20) not null, age int)

--insert into Employee values (1,'Smith',27)

insert into Employee Values (2, 'Peter', null)

select * from Employee

delete from employee where id is null

alter table employee
alter column  firstname varchar(20) not null

drop table Employee

Create table Employee (id int unique, firstname varchar(20) not null, age int)

insert into Employee values (null,'Peter',29,Null)

select * from Employee

alter table employee
add  mobile varchar(10)

alter table employee
add constraint UQ_Mobile_Employee unique(mobile)

Create table Employee (Id int primary key, FirstName varchar(20) not null, Age int,
Mobile varchar(10))

insert into Employee values (3,'Smith',28, '9888543210')
insert into Employee values (1,'Dylan',28, '9887743210')
insert into Employee values (4,'Warren',37, '8888543210')
insert into Employee values (2,'Charlie',28, '9898543210')

insert into Employee values (5,'Ryan',32,'6777889900')


select * from Employee



/*
 1. Unique constraint allows one null value but primary key does not
 2. In a table only one primary key is allowed but multiple unique constraints
 3. Primary key will sort the data in asc order by default but unique key does not do that
 4. Primary key by default creates the clustered index but unique create non clustured index
*/

-- composite constraint :- when a single constraint is applied on the combination of
--                           two or more columns then it is called composite constraint



Create table Dept(Id int, DName varchar(20), Loc varchar(20),Primary key(Id,DName)) 


alter table Employee
add Constraint check_age_employee Check(age>=20 and age <=50)


Create table Dept(Id int primary key, DName varchar(20) unique, Loc varchar(20) not null)

insert into Dept values (1,'IT','Sterling')
insert into dept values (2,'QA','Leesburg')
insert into Dept values (3,'HR','Reston')

create table Employee(Id int primary key, FirstName varchar(20), Mobile varchar(20) unique,
DeptId int foreign key references Dept(Id) on delete set null)

truncate table dept

Select * from Dept
select * from Employee

delete from dept where id=3

insert into Employee values (3,'Maria','9876643310',16)


delete from Employee

create table Product (Id int primary key identity(1,1), ProductName varchar(20), Unitprice decimal(5,2))

insert into Product(Id,ProductName,Unitprice) values (5,'Mattress',500)
select * from product

delete from product where id=2


Set identity_insert Product off