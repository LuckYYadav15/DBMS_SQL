create schema nobel_practise;
use nobel_practise;

create table nobel_win(
year numeric(4),
subject varchar(10),
winner varchar(20),
country varchar(10)
);

insert into nobel_win values(1970,"Physics","Hannes Alfven","Sweden"),(1970,"Physics","Louis Neel","France"),
(1970,"Chemistry","Luis Federico Leloir","France"),(1970,"Physiology","Ulf von Euler","Sweden"),(1970,"Physiology","Bernard Katz","Germany");


## Nobel Prize winner in 1970   Return year, subject and winner.    
select year, subject, winner from nobel_win where year = 1970;

insert into nobel_win values(1971, "Literature","Aleksandr Solz","Russia"),(1971, "Physics", "Dennis Gabor","USA"),
(1971,"Literature","Pablo Neruda","Germany");

## Nobel Prize winner in 'Literature' in the year 1971. Return winner.
select winner from nobel_win where year = 1971 and subject = "Literature";

## Nobel Prize winner 'Dennis Gabor'. Return year, subject.
select year, subject from nobel_win where winner="Dennis Gabor";

## Delete data from table
set SQL_SAFE_UPDATES = 0;
delete from nobel_win where winner="Dennis Gabor";


insert into nobel_win values(1941, "Literature","Alex Hales","Russia"),(1937, "Physics", "Den Den","USA"),
(1911,"Literature","Pan henry","Germany");
## Nobel Prize winners in 'Physics' since the year 1950. Return winner. 
select winner from nobel_win where year>1950;





 