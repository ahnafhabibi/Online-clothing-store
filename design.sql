----FIRST NORMAL FORM CONFIRMATION------
SELECT *
FROM TRANSACTIONS
---3455 rows and single value cell---

SELECT COUNT(*)
FROM 
(SELECT DISTINCT *
FROM TRANSACTIONS) as abc
---3455 rows---

---2nd normal form----
SELECT * 
FROM TRANSACTIONS--- transactionid,(timestampsec and customerid) are candidate keys

----MODIFICATION AND SPLITTING TRANSACTIONS TABLE----


---first table customers----
CREATE TABLE trial AS (select customerid,firstname,surname,shipping_state,loyalty_discount from TRANSACTIONS)

SELECT *
FROM TRIAL

CREATE TABLE CUSTOMERS AS
(SELECT DISTINCT * FROM TRIAL)

SELECT *
FROM CUSTOMERS

---editing transactions table----
SELECT * 
FROM TRANSACTIONS

alter table transactions
drop column firstname,
drop column surname,
drop column shipping_state,
drop column loyalty_discount

SELECT *
FROM TRANSACTIONS---CUSTOMERID IS FOREIGN KEY---


----3rd normal form----
select * 
from customers

select *
from transactions

---modification 3rd normal form---
create table trial as
(select item,description,retail_price from transactions)
select *
from trial

---editing trial to make item table according to 1f,2f,3f---
create table item as
(select distinct * from trial)
select *
from item

---editing transactions table----

alter table transactions
drop column description,
drop column retail_price

select *
from transactions

---3rd normal form confirmed----






