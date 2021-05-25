--  Exercise 1
\ echo Ex.1.1
select *
from customers;
\ echo * * * * * * * *
alter table customers
add column date_of_birth DATE;
\ echo * * * * * * * *
select *
from customers;
\ echo Ex.1.2
alter table customers
    rename date_of_birth to birthdate;
\ echo * * * * * * * *
select *
from customers;
-- 1.3
alter table customers drop column birthdate;
\ echo * * * * * * * *
select *
from customers;
-- Exercise 2
-- 2.1
-- () needed to creating an empty table 
create table test ();
drop table test;
-- Exercise 3
-- 3.1
select *
from hotels;
\ echo * * * * * * * *
update hotels
set postcode = 'L10XYZ'
where name = 'Elder Lake Hotel';
\ echo * * * * * * * *
select *
from hotels;
-- 3.2
update hotels
set rooms = 25
where name = 'Cozy Hotel';
\ echo * * * * * * * *
select *
from hotels;
-- 3.3
select *
from customers;
\ echo * * * * * * * *
update customers
set address = '2 Blue Street',
    city = 'Glasgow',
    postcode = 'G11ABC'
where name = 'Nadia Sethuraman';
\ echo * * * * * * * *
select *
from customers;
-- 3.4
select *
from bookings;
\ echo * * * * * * * *
update bookings
set nights = 5
where customer_id = 1
    and hotel_id = 1;
select *
from bookings;
-- Exercise 4
-- 4.1
select *
from bookings;
\ echo * * * * * * * *
delete from bookings
where customer_id = 8
    and checkin_date = '2020-01-03';
\ echo * * * * * * * *
select *
from bookings;
-- 4.2
delete from bookings
where customer_id = 6;
\ echo * * * * * * * *
select *
from bookings;
-- 4.3
select *
from customers;
\ echo * * * * * * * *
delete from customers
where id = 6;
\ echo * * * * * * * *
select *
from customers;
\ echo Exercise 5 -- Exercise 5
-- 5.1
-- load all bookings along with customer data
SELECT *
FROM customers
    INNER JOIN bookings ON customers.id = bookings.customer_id;
-- load all bookings along with customer data and hotel data
SELECT *
FROM bookings
    INNER JOIN customers ON customers.id = bookings.customer_id
    INNER JOIN hotels ON hotels.id = bookings.hotel_id;
-- load the booking checkin dates for customer ID 1 along with the customer name and the hotel name
SELECT bookings.checkin_date,
    customers.name,
    hotels.name
FROM bookings
    INNER JOIN customers ON customers.id = bookings.customer_id
    INNER JOIN hotels ON hotels.id = bookings.hotel_id
WHERE customers.id = 1;
/ echo Ex.5.2
select *
from customers
    inner join bookings AS b on customer_id = b.customer_id;
/ echo Ex.5.3 -- Mark
-- Extra WHERE operators: In and LIKE
​ -- IN is equivalent to using a lot of ORs...
SELECT *
FROM hotels
WHERE postcode IN ('ABCDE1', 'AYD189', 'L10ABC');
​ -- LIKE is a wildcard match for strings...
-- % stands for any number of characters, even none.
-- _ stands for any ONE character
-- the rest have to be a literal match...
SELECT *
FROM hotels
WHERE postcode LIKE '%B%';
-- must have a B in it
SELECT *
FROM hotels
WHERE postcode LIKE '_B%';
-- must have B as the second character
SELECT *
FROM hotels
WHERE postcode LIKE '%B_';
-- B must be penultimate character
SELECT *
FROM hotels
WHERE postcode LIKE '____B_';
-- B must be penultimate of 6 characters
​ -- Joining tables together INNER JOIN ... ON
SELECT b.*,
    c.name,
    h.name
FROM bookings AS b
    INNER JOIN customers AS c ON b.customer_id = c.id -- link foreign key to key on referred to table
    INNER JOIN hotels AS h ON b.hotel_id = h.id -- link foreign key to key on referred to table
ORDER BY h.name,
    b.checkin_date,
    c.name;
-- sort the results
​
SELECT h.name,
    c.name,
    b.checkin_date,
    nights
FROM bookings AS b
    INNER JOIN customers AS c ON b.customer_id = c.id
    INNER JOIN hotels AS h ON b.hotel_id = h.id
ORDER BY h.name,
    b.checkin_date,
    c.name;
​
SELECT h.name AS Hotel,
    c.name AS Customer,
    b.checkin_date AS "Checkin Date",
    nights
FROM bookings AS b
    INNER JOIN customers AS c ON b.customer_id = c.id
    INNER JOIN hotels AS h ON b.hotel_id = h.id
ORDER BY h.name,
    b.checkin_date,
    c.name;
​
SELECT h.name AS "Hotel",
    b.checkin_date AS "Checkin Date",
    c.name AS "Customer",
    b.nights AS "No. of Nights"
FROM bookings AS b
    INNER JOIN customers AS c ON b.customer_id = c.id
    INNER JOIN hotels AS h ON b.hotel_id = h.id
WHERE b.nights > 1
ORDER BY h.name,
    b.checkin_date,
    c.name
LIMIT 5;
​ -------- Aggregates: GROUP BY, HAVING
-- SUM
SELECT SUM(nights) as total_nights
from bookings;
​
SELECT hotel_id,
    SUM(nights) AS total_nights
FROM bookings
GROUP BY hotel_id
ORDER BY hotel_id;
​ -- COUNT
SELECT hotel_id,
    COUNT(customer_id)
FROM bookings
GROUP BY hotel_id
ORDER BY hotel_id;
​ -- DISTINCT means remove any duplicates (before counting in this case)
SELECT hotel_id,
    COUNT(DISTINCT customer_id)
FROM bookings
GROUP BY hotel_id
ORDER BY hotel_id;
​ -- Here we pick out the hotels that have return customers
SELECT hotel_id,
    COUNT(customer_id) AS c1,
    COUNT(DISTINCT customer_id) AS c2
FROM bookings
WHERE nights < 9
GROUP BY hotel_id
HAVING COUNT(customer_id) <> COUNT(DISTINCT customer_id)
ORDER BY hotel_id;
​ -- Use this to see the individual bookings for hotel with id = 1
SELECT *
FROM bookings
WHERE hotel_id = 1;
-- 3 bookings but from only 2 customers!