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
(1, 'Narendra', 'Gandhi',     40000),
(2, 'Rahul',    'Kejriwal',   50000),
(3, 'Arvind',   'Yadav',      34500),
(4, 'Akhilesh', 'Modi',       100000),
(5, 'Joe',      'Clint',      55000),
(6, 'Taylor',   'Swift',      70000),
(7, 'Camila',   'Cabello',    48500),
(8, 'Hailee',   'Steinfeld',  160000);

insert into departments
(Code, Name, ManagerID, Subdeptof)
values
('GEM', 'General Management', 1, 'GEM'),
('MKT', 'Marketing',          2, 'GEM'),
('OPT', 'Operations',         3, 'GEM'),
('FIN', 'Finance',            4, 'GEM'),
('HRD', 'Human Resource',     5, 'GEM'),
('PUR', 'Purchasing',         6, 'GEM'),
('PRE', 'Public Relations',   7, 'GEM'),
('SAL', 'Sales',        	  8, 'GEM'); 

insert into projects
(Projectid, Deptcode, Description, Startdate, Stopdate, Revenue)
values
('H1', 'HRD', 'Policies, procedures, safety rules and other important information design to overcome language and cultural barriers',    '2021-10-26', '2022-03-14', 74700),
('M1', 'MKT', 'A study on the factors affecting dealer performance to evolve a strategy for increasing market share',  					 '2022-01-29', '2023-03-29', 50000),
('M2', 'MKT', 'Emergence of Internet Marketing -Origins, Needs, Challenges and Opportunities',                                           '2021-12-05', '2022-11-02', 34500),
('S1', 'SAL', 'IMPACT OF CELEBRITY ENDORSEMENT ON CONSUMER BEHAVIOR AND SALES VOLUME OF AN ORGANIZATION',                                '2022-02-13', '2023-06-12', 60000),
('S2', 'SAL', 'DIGITAL MARKETING AS A KEY DRIVER OF SALES IMPROVEMENT AMONG SMALL AND MEDIUM SCALE ENTERPRISES', 						 '2021-09-30', '2022-04-07', 55000),
('P1', 'PUR', 'To provide quality services to business joinING hands with new and emerging technologies.', 								 '2021-07-16', '2022-09-28', 70000),
('H2', 'HRD', 'A study on identification of non performing dealers and measures to be taken to convert them into performing dealers', 	 '2022-01-01', '2023-06-04', 148500),
('F1', 'FIN', 'Investment awareness in financial asset and preference of financial intermediaries in equities trading', 				 '2021-11-11', '2022-08-22', 750000);

insert into workson
(Employeeid, Projectid, Assignedtime)
values
(1, 'H1', 1.32),
(2, 'M1', 4.55),
(3, 'M2', 3.00),
(4, 'S1', 2.15),
(5, 'S2', 8.22),
(6, 'P1', 9.30),
(7, 'H2', 6.20),
(8, 'F1', 5.45);

update employees
set Deptcode='GEM' where EmployeeID=1;
update employees
set Deptcode='MKT' where EmployeeID=2;
update employees
set Deptcode='OPT' where EmployeeID=3;
update employees
set Deptcode='FIN' where EmployeeID=4;
update employees
set Deptcode='HRD' where EmployeeID=5;
update employees
set Deptcode='PUR' where EmployeeID=6;
update employees
set Deptcode='PRE' where EmployeeID=7;
update employees
set Deptcode='SAL' where EmployeeID=8;

select Firstname, Lastname from employees;
select Revenue from projects where revenue>40000;
select Revenue from projects where (revenue>100000 and revenue<150000);
select Projectid from projects where Startdate <= '2004-07-01';
select distinct Deptcode from projects;











