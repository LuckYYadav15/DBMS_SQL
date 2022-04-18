create schema practise;
-- show schemas;
use practise;


create table practise.salesman(
salesman_id numeric(4) primary key,
name varchar(20),
city varchar(20),
commission numeric(3,2)
);

create table practise.customer(
customer_id numeric(4) primary key,
customer_name varchar(20),
city varchar(20),
grade numeric(3),
salesman_id numeric(4),
foreign key(salesman_id) references salesman(salesman_id)
);

create table practise.order(
order_no numeric(5) primary key,
purch_amt numeric(8,2),
order_date date,
customer_id numeric(4),
salesman_id numeric(4),
foreign key(salesman_id) references salesman(salesman_id),
foreign key(customer_id) references customer(customer_id)
);



insert into salesman values (5001, "James Hoog", "New York", 0.15),(5002, "Nail Knite", "Paris", 0.13),(5005, "Pit Alex", "London", 0.11),
(5006, "Mc Lyon", "Paris", 0.14), (5003, "Lauson Hen","New Jersey", 0.12), (5007, "Paul Adam", "Rome", 0.13);

insert into customer values (3002, "Nick Rimando", "New York", 100, 5001),(3005, "Graham Zusi", "California", 200, 5002),
(3001, "Brad Guzan", "London", 100, 5003),(3004, "Fabian Johns", "Paris", 300, 5006),(3007,"Brad Davis", "New York", 200, 5001),
(3009, "Geoff Camero", "Berlin", 100, 5005),(3008, "Julian Green", "London", 300, 5002),(3003, "Jozy Altidor", "Moncow", 200, 5007);

insert into practise.order values (70001, 150.5, '2016-10-05', 3005, 5002),(70009, 270.65, '2016-09-10', 3001, 5005),(70002, 65.26, '2016-10-05', 3002, 5001),
(70004, 110.5, '2016-08-17', 3009, 5005),(70007, 948.5, '2016-09-10', 3005, 5002),(70005, 2400.6, '2016-07-27', 3007, 5001),(70008, 5760, '2016-09-10', 3002,5001),
(70010, 1943.43, '2016-10-10', 3004, 5006),(70003, 2480.4,'2016-10-10',3009, 5001),(70012,250.45,'2016-06-27',3008,5002),(70011, 75.29, '2016-08-17',3003,5007);


## Display name and commission of all the salesmen 
select name, commission from salesman;

##  Retrieve salesman id of all salesmen from orders table without any repeats.
select distinct salesman_id from practise.order;

## Display names and city of salesman, who belongs to the city of Paris.
select name, city from practise.salesman where city = "Paris";

##  Display all the information for those customers with a grade of 200.
select * from practise.customer where grade=200;

## Display the order number, date and the purchase amount for order(s) which will be delivered by the salesman with ID 5001
select order_no, order_date, purch_amt from practise.order where salesman_id = 5001;

## 


