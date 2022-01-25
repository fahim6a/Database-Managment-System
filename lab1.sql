create database DenoDB;
use DenoDB;
create table lab1(Id int, Name char(20), CGPA float);

select* from lab1;

insert into lab1 values(201311006,'Fahim',3.34);
delete from lab1 where Name='';
Alter table lab1 add Department char(15);
update lab1
set Department ='CSE'
where Name='Fahim';