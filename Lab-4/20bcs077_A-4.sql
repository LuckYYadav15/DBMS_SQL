create database assignment3;

use assignment3;

create table Employees (
EmployeeID numeric(9) primary key,
Firstname  varchar(10),
Lastname   varchar(20),
Deptcode   char(5),
Salary     numeric(9, 2));

create table Departments (
Code       char(5) primary key,
Name       varchar(30),
Managerid  numeric(9),
Subdeptof  char(5));

create table Projects (
Projectid   char(8) primary key,
Deptcode    char(5),
Description varchar(200),
Startdate   date,
Stopdate    date,
Revenue     numeric(12, 2));

create table Workson (
Employeeid    numeric(9),
Projectid     char(8),
Assignedtime  numeric(3, 2));

alter table employees
add foreign key (deptcode)
references departments (code);

alter table departments
add foreign key (Managerid)
references employees (EmployeeID),
add foreign key (Subdeptof)
references departments (Code);

alter table workson
add foreign key (EmployeeID)
references employees (EmployeeID),
add foreign key (Projectid)
references projects (ProjectID);

alter table projects
add foreign key (Deptcode)
references departments (code);

insert into employees
(EmployeeID, Firstname, Lastname, Salary)
values
(1, 'Amit', 'Kumar',     70000),
(2, 'Bhanwar',    'Yuvraj',   60000),
(3, 'Gaurav',   'Patel',      78500),
(4, 'Joe', 'Root',       66000),
(5, 'Kristrofer',      'Henry',      99000),
(6, 'Lora',   'Lane',      138000),
(7, 'Manish',   'Singh',    67500),
(8, 'Oven',   'Proven',  180000);


insert into departments
(Code, Name, ManagerID, Subdeptof)
values
('GM', 'General Management', 1, 'GM'),
('MK', 'Marketing',          2, 'GM'),
('OP', 'Operations',         3, 'GM'),
('FN', 'Finance',            4, 'GM'),
('HR', 'Human Resource',     5, 'GM'),
('PU', 'Purchasing',         6, 'GM'),
('PR', 'Public Relations',   7, 'GM'),
('SL', 'Sales',        	     8, 'GM'); 


insert into projects
(Projectid, Deptcode, Description, Startdate, Stopdate, Revenue)
values
('H1', 'HR', 'Web Development',null, '2023-03-01', 14700),
('M1', 'MK', 'App development','2022-08-02', '2025-03-09', 45000),
('M2', 'MK', 'security application','2023-01-05', '2032-11-02', 22500),
('S1', 'SL', 'Reports and Analysis', null, '2023-07-16', 60000),
('S2', 'SL', 'Cyber Checking','2020-10-30', '2029-09-01', 11000),
('P1', 'PU', 'Metaverse', 		'2019-08-23', '2024-01-18', 89000),
('H2', 'HR', 'Facebook clone', 	 '2021-09-11', '2023-04-16', 238500),
('F1', 'FN', 'Financial Company and Investment', 	 '2022-02-22', '2022-07-22', 88000);


insert into workson
(Employeeid, Projectid, Assignedtime)
values
(1, 'H1', 2.02),
(2, 'M1', 1.00),
(3, 'M2', 4.33),
(4, 'S1', 2.15),
(5, 'S2', 7.12),
(6, 'P1', 3.60),
(7, 'H2', 9.78),
(8, 'F1', 5.01);


update employees
set Deptcode='GM' where EmployeeID=1;
update employees
set Deptcode='MK' where EmployeeID=2;
update employees
set Deptcode='OP' where EmployeeID=3;
update employees
set Deptcode='FN' where EmployeeID=4;
update employees
set Deptcode='HR' where EmployeeID=5;
update employees
set Deptcode='PU' where EmployeeID=6;
update employees
set Deptcode='PR' where EmployeeID=7;
update employees
set Deptcode='SL' where EmployeeID=8;


select * from projects
where Startdate > '2022-02-25' or Startdate=null;

select Projectid, Stopdate - Startdate from projects;

select distinct year(Startdate) from projects;

select Employeeid from workson 
where Assignedtime*7 > 20;
select Employeeid from workson 
where Assignedtime*7 > 40;
select Employeeid from workson 
where Assignedtime*7 > 60;

select Projectid, year(Startdate)
from projects 
order by year(Startdate);

select avg(Revenue)
from projects;

select min(Salary)
from employees;

select max(Salary)
from employees;

select Firstname from employees 
where Firstname like '______';

select Firstname, Lastname from employees 
where Firstname like 'a%';


select e.Firstname, e.Lastname, w.Projectid
from employees e inner join workson w 
on e.EmployeeID = w.Employeeid
where e.EmployeeID
in (select Employeeid from workson 
group by Employeeid having count(Employeeid) > 1);

select * from employees
where Salary != (select max(Salary) from employees)
and Salary != (select min(Salary) from employees);
