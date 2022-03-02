create database Assignment_3;
USE Assignment_3;

create table Assignment_3.Employee(
EmployeeID numeric(9) primary key,
firstname varchar(10),
lastname varchar(20),
deptcode char(5),
salary numeric(9,2));

create table Assignment_3.Department(
code char(5) primary key,
name varchar(30),
managerID numeric(9),
subdeptof char(5));

create table Assignment_3.Department(
code char(5) primary key,
name varchar(30),
managerID numeric(9),
subdeptof char(5));

create table Assignment_3.Workson(
EmployeeID numeric(9),
projectID char(8),
assignedtime numeric(3,2));

alter table Assignment_3.Employee
add foreign key (deptcode) references Department(code);

alter table Assignment_3.Department
add foreign key (managerID) references Employee(EmployeeID),
add foreign key (subdeptof) references Department(code);

alter table Assignment_3.Workson
add foreign key (EmployeeID) references Employee(EmployeeID),
add foreign key (projectID) references Project(ProjectID);

alter table Assignment_3.Workson
add foreign key (EmployeeID) references Employee(EmployeeID),
add foreign key (projectID) references Project(ProjectID);


insert into Employee (EmployeeID, firstname, lastname, salary)
values
(1, 'Arun',  'Kumar',  70000),
(2, 'Embryo',   'Singh',  40000),
(3, 'Gaurav',   'Javed',  78900),
(4, 'Harish',  'Shami',  80000),
(5, 'Javed',  'Ansari',  65000),
(6, 'Kripa',  'Agarwal',  90000),
(7, 'Lokesh',  'Lakhan',  25000),
(8, 'Naveen',   'Yadav',  100000);

insert into Department (Code, name, managerID, subdeptof)
values
('GEM', 'General Management', 1, 'GEM'),
('MKT', 'Marketing',  2, 'GEM'),
('OPT', 'Operations',   3, 'GEM'),
('FIN', 'Finance',   4, 'GEM'),
('HRD', 'Human Resource',  5, 'GEM'),
('PUR', 'Purchasing',  6, 'GEM'),
('PRE', 'Public Relations',   7, 'GEM'),
('SAL', 'Sales',  8, 'GEM'); 

insert into Project 
(ProjectID, deptcode, description, startdate, stopdate, revenue)
values
('P1', 'GEM', 'Automated voice Assistant',   '2010-07-06', '2019-03-14', 120000),
('P2', 'MKT', 'Website for online tutorials',  '2015-01-07', '2018-04-09', 670000),
('P3', 'OPT', 'A github page for Links section', '2013-05-1`11', '2020-11-05', 345000),
('P4', 'FIN', 'Online Event Organization', '2002-04-23', '2010-07-11', 690000),
('P5', 'HRD', 'Furniture Retailer and Producer', '2001-06-20', '2010-08-07', 550000),
('P6', 'PUR', 'Development of LOCO online streaming platform', '2007-09-01', '2014-07-01', 980000),
('P7', 'PRE', 'Laptop development project', '2004-08-14', '2005-05-14', 8500),
('P8', 'SAL', 'Iteration of codeing questions',  '2001-07-04', '2007-08-02', 50000);

select firstname, lastname from Employee;

select revenue from Project where revenue>40000;
select Projectid from Project where startdate <= '2004-07-01';
select distinct deptcode from Project;

