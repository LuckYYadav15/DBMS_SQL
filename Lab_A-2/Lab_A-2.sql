create database Assignment;
USE Assignment;

create table Assignment.Category_details(
category_id numeric(2),
category_name varchar(30));

create table Assignment.Sub_category_details(
sub_category_id numeric(2) not null,
category_id numeric(2),
sub_category_name varchar(30));

create table Assignment.Product_details(
Product_id numeric(6),
category_id numeric(2),
sub_category_id numeric(2),
product_name varchar(30));

alter table Assignment.Category_details
add primary key(category_id);

alter table Assignment.Sub_Category_details
add constraint cname primary key(sub_category_id);

alter table Assignment.Sub_Category_details
add constraint fk_sub_cat foreign key(category_id) references Category_details(category_id);


alter table Assignment.Product_details
add constraint pk_detail primary key(product_id);

alter table Assignment.Product_details
add constraint fk_prod_cat foreign key(category_id) references category_details(category_id),
add constraint fk_sub_detail foreign key(sub_category_id) references sub_category_details(sub_category_id);


alter table Assignment.Product_details
add column price numeric(2);


alter table Assignment.Product_details
modify column price numeric(6,2);

insert into Assignment.Category_details(
category_id,
category_name)
values(11,"Stationary"),
(12,"grocery"),
(13,"raw-material"),
(14,"Packed");


insert into Assignment.Sub_category_details(
sub_category_id,
category_id,
sub_category_name )
values(1,11,"Pen"),
(2,12,"sugar"),
(3,12,"Pulse"),
(4,14,"Soap");


insert into Assignment.Product_details(
Product_id,
category_id,
sub_category_id,
product_name,price)
values(01,14,4,"Dove",85),
(02,12,2,"Sugar Cosmetics",45),
(03,12,3,"Tata Sampann",120),
(04,11,1,"Elkos",15);

alter table Assignment.Product_details
drop column price;
