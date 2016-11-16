--see how many customers are in our table:
select count(*) as "Customer Count" from customers;

--how many unique companies are in our table?
select count(distinct company)as "Distinct Companies" from customers ;

--add a column for the CompanyID to the customers table
alter table customers add CompanyID int;

--notice that the companyId is null
select companyID, company from customers order by company;

--create a table for the companies
--this statement will also create a companyID column which will
--increment when you insert a new record
-- cities, states position


create table Cities (
CityId number generated by default on null as identity,
City varchar(50)
);

drop table Cities;
drop table Positions;

create table Companies (
companyID number generated by default on null as identity,
Company varchar(50)
);

create table States (
stateID number generated by default on null as identity,
State varchar(50)
);

create table Positions (
PositionId number generated by default on null as identity,
Position varchar(60)
);

select position from Customers;
--see what's in your companies table now
select * from Cities;

--add a test company to verify that the identity field works
insert into companies(Company)values ('Dave Company');

select * from companies;

--add unique companies from customers to the company table
insert into Companies (Company) select distinct company from customers;

insert into States (State) select distinct State from customers;

insert into Positions (Position) select distinct Position from customers;

--look at what you've done
select * from Companies;
select * from Cities;
select * from States;
select * from Positions;


--another way to select is to list the fields
select companyID, Company from customers;

select CityId, City from Cities;

select StateId, State from States;

select PositionId, Position from Positions;

describe customers;

--update the compnayId in the customers table
update customers c set c.companyID = (select t.companyID from
Companies t where t.company=c.company);

-- add cityId to customers table
alter table customers add  CityId int;

-- add StateId to customers table
alter table customers add StateId int;

-- add PositionId to customers table
alter table customers add PositionId int;


--update the CityId in the customers table
update customers c set c.CityID = (select t.CityID from
Cities t where t.City=c.City);

select * from customers order by CityId;

--update the StateId in the customers table
update customers c set c.stateId = (select t.stateId from
States t where t.State=c.State);

--update the Position in the customers table
update customers c set c.PositionId = (select t.PositionId from
Positions t where t.Position=c.Position);


select * from customers order by CityId;

select * from customers order by StateId;

select * from customers order by PositionId;

select companyid,company from customers order by companyid;

select lastname, CityId,City from customers order by CityId;

select lastname, StateId,State  from customers order by StateId;

select lastname, PositionId, Position  from customers order by PositionId;

--query to check your data
select c.companyID,c.company,t.companyID,t.Company from
customers c inner join Companies t on c.CompanyID=t.CompanyID;


select c.CityId,c.City,t.CityID,t.City from
customers c inner join Cities t on c.CityId=t.CityId;


select c.PositionId, c.Position, t.PositionId,t.Position from
customers c inner join Positions t on c.PositionId=t.PositionId;


select customers.companyID,customers.company,companies.companyID,companies.Company from
customers inner join Companies on customers.CompanyID=companies.CompanyID;

select c.StateId,c.State,t.StateId,t.State from
customers c inner join States t on c.StateId=t.StateId;


--remove the company column from the customers table. It is no longer needed
alter table customers drop column company;
alter table customers drop column City;
alter table customers drop column State;
alter table customers drop column Position;

--notice you won't see the company column
select * from customers order by StateId;

-- a query to bring it all back together
select fullname, company from customers 
inner join companies on 
customers.companyid=companies.companyid;

select * from cities;

select * from Positions where positionId > 1;

select fullname, state from customers
inner join states on
customers.stateid=states.stateid;

select fullname, Position from customers
inner join Positions on
customers.PositionId=Positions.PositionId;

select positionId, lastname, stateid  from customers order by positionId;
