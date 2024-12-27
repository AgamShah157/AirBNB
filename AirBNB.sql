-- 1 Import Data from both the .CSV files to create tables, Listings and Booking Details.
create table listing
(id int,
name text, 
host_id int, 
host_name text, 
neighbourhood_group text, 
neighbourhood text, 
room_type text);

load data infile 'D:/Data science/SQL/Project/Air BNB/listing.csv' into table listing
character set ascii
fields terminated BY ','
LINES TERMINATED by'\n'
ignore 1 lines;

create table booking
(listing_id int, 
price float, 
minimum_nights int, 
number_of_reviews int, 
reviews_per_month float, 
calculated_host_listings_count int, 
availability_365 int);

load data infile 'D:/Data science/SQL/Project/Air BNB/booking.csv' into table listing
character set ascii
fields terminated BY ','
LINES TERMINATED by'\n'
ignore 1 lines;

-- 2 Write a query to show names from Listings table
select `name` from listing;

-- 3 Write a query to fetch total listings from the listings table
select COUNT(*) from listing;

-- 4 Write a query to fetch total listing_id from the booking_details table
select COUNT(distinct(listing_id)) from booking;

-- 5 Write a query to fetch host ids from listings table
select host_id from listing;

-- 6 Write a query to fetch all unique host name from listings table
select distinct(host_name) from listing;

-- 7 Write a query to show all unique neighbourhood_group from listings table
select distinct(neighbourhood_group) from listing;

-- 8 Write a query to show all unique neighbourhood from listings table
select distinct(neighbourhood) from listing;

-- 9 Write a query to fetch unique room_type from listings tables
select distinct(room_type) from listing;

-- 10 Write a query to show all values of Brooklyn & Manhattan from listings tables
select * from listing where neighbourhood_group in ("Brooklyn","Manhattan");

-- 11 Write a query to show maximum price from booking_details table 
select max(price) from booking;

-- 12 Write a query to show minimum price fron booking_details table
select min(price) from booking;

-- 13 Write a query to show average price from booking_details table
select avg(price) from booking;

-- 14 Write a query to show minimum value of minimum_nights from booking_details table
select min(minimum_nights) from booking;

-- 15 Write a query to show maximum value of minimum_nights from booking_details table
select max(minimum_nights) from booking;

-- 16 Write a query to show average availability_365
select avg(availability_365) from booking;

-- 17 Write a query to show id , availability_365 and all availability_365 values greater than 300
select listing_id, availability_365 from booking where availability_365 > 300;

-- 18 Write a query to show count of id where price is in between 300 to 400
select count(listing_id) from booking where price between 300 and 400;

-- 19 Write a query to show count of id where minimum_nights spend is less than 5
select count(listing_id) from booking where minimum_nights < 5;

-- 20 Write a query to show count where minimum_nights spend is greater than 100
select count(listing_id) from booking where minimum_nights > 100;

-- 21 Write a query to show all data of listings & booking_details
select * from booking;
select * from listing;

-- 22 Write a query to show host name and price
select listing.host_name,booking.price 
from listing left join booking on listing.id=booking.listing_id;

-- 23 Write a query to show room_type and price
select listing.room_type,booking.price 
from listing left join booking on listing.id=booking.listing_id;

-- 24 Write a query to show neighbourhood_group & minimum_nights spend
select listing.neighbourhood_group,booking.minimum_nights 
from listing left join booking on listing.id=booking.listing_id;

-- 25 Write a query to show neighbourhood & availability_365
select listing.neighbourhood,booking.availability_365 
from listing left join booking on listing.id=booking.listing_id;

-- 26 Write a query to show total price by neighbourhood_group
select neighbourhood_group,sum(booking.price) 
from listing left join booking on listing.id=booking.listing_id group by neighbourhood_group;

-- 27 Write a query to show maximum price by neighbourhood_group
select neighbourhood_group,max(booking.price) 
from listing left join booking on listing.id=booking.listing_id group by neighbourhood_group;

-- 28 Write a query to show maximum night spend by neighbourhood_group
select neighbourhood_group,max(booking.minimum_nights) 
from listing left join booking on listing.id=booking.listing_id group by neighbourhood_group;

-- 29 Write a query to show maximum reviews_per_month spend by neighbourhood
select neighbourhood_group,max(booking.reviews_per_month) 
from listing left join booking on listing.id=booking.listing_id group by neighbourhood_group;

-- 30 Write a query to show maximum price by room type
select room_type,max(booking.price) 
from listing left join booking on listing.id=booking.listing_id group by room_type;

-- 31 Write a query to show average number_of_reviews by room_type
select room_type,avg(booking.reviews_per_month) 
from listing left join booking on listing.id=booking.listing_id group by room_type;

-- 32 Write a query to show average price by room type
select room_type,avg(booking.price) 
from listing left join booking on listing.id=booking.listing_id group by room_type;

-- 33 Write a query to show average night spend by room type
select room_type,avg(booking.minimum_nights) 
from listing left join booking on listing.id=booking.listing_id group by room_type;

-- 34 Write a query to show average price by room type but average price is less than 100
with avgprice as (select room_type,avg(booking.price) as avg_price 
from listing left join booking on listing.id=booking.listing_id group by room_type)
select * from avgprice where avg_price < 100;

-- 35 Write a query to show average night by neighbourhood and average_nights is greater than 5
with avgnight as (select neighbourhood,
avg(booking.minimum_nights) as avg_night 
from listing 
left join booking on listing.id=booking.listing_id 
group by neighbourhood)
select * from avgnight where avg_night > 5;

-- 36 Write a query to show all data from listings where price is greater than 200 using sub-query.
select id, price, host_id, host_name, neighbourhood_group, neighbourhood, room_type 
from (select * from listing left join booking on listing.id=booking.listing_id where price > 200) T;

-- 37 Write a query to show all values from booking_details table where host id is 314941 using sub-query.
select listing_id, Host_ID, price, minimum_nights, number_of_reviews, reviews_per_month, calculated_host_listings_count, availability_365
from (select * from booking left join listing on listing.id=booking.listing_id where host_id = 314941 ) T;

-- 38 Find all pairs of id having the same host id, each pair coming once only.
SELECT a.id AS id1, b.id AS id2
FROM listing AS a
cross join listing AS b
where a.host_id=b.host_id and a.id < b.id;
#OR
SELECT a.id AS id1, b.id AS id2
FROM listing AS a
JOIN listing AS b ON a.host_id = b.host_id and a.id < b.id;

-- 39 Write an sql query to show fetch all records that have the term cozy in name
select * from listing where `name` like '%cozy%';

-- 40 Write an sql query to show price, host id, neighbourhood_group of manhattan neighbourhood_group
select price, host_id, neighbourhood_group 
from listing 
join booking on listing.id=booking.listing_id 
where neighbourhood_group = "manhattan";

-- 41 Write a query to show id , host name, neighbourhood and price but only for Upper West Side & Williamsburg neighbourhood, also make sure price is greater than 100
select id , host_name, neighbourhood, price 
from listing 
join booking on listing.id=booking.listing_id 
where neighbourhood in ("Upper West Side","Williamsburg") and price > 100;

-- 42 Write a query to show id , host name, neighbourhood and price for host name Elise and neighbourhood is Bedford-Stuyvesant
select id , host_name, neighbourhood, price 
from listing 
join booking on listing.id=booking.listing_id 
where host_name = "Elise" and neighbourhood = "Bedford-Stuyvesant";

-- 43 Write a query to show host_name, availability_365,minimum_nights only for 100+ availability_365 and minimum_nights
select host_name, availability_365,minimum_nights
from listing 
join booking on listing.id=booking.listing_id 
where availability_365 > 100 and minimum_nights > 100;

-- 44 Write a query to show to fetch id , host_name , number_of_reviews, and reviews_per_month but show only that records where number of reviews are 500+ and review per month is 5+
select id , host_name , number_of_reviews, reviews_per_month
from listing 
join booking on listing.id=booking.listing_id 
where number_of_reviews > 500 and reviews_per_month > 5;
/* Analysis: 
Carol, Jj, Maya, Dona, and Danielle are among 
the top-rated hosts, each boasting over 500 total reviews 
and receiving more than five reviews per month on average.*/

-- 45 Write a query to show neighbourhood_group which have most total number of review
select neighbourhood_group,`count(number_of_reviews)` from (select neighbourhood_group,count(number_of_reviews)
from listing 
join booking on listing.id=booking.listing_id
group by neighbourhood_group
order by count(number_of_reviews) DESC
limit 1) A;
/* Analysis: 
Manhattan has the highest number of reviews among all neighborhoods, 
with an impressive total of 21,661.*/

-- 46 Write a query to show host name which have most cheaper total price
select distinct(host_name),price
from listing 
join booking on listing.id=booking.listing_id
order by price ASC;
/* Analysis: 
Martial Loft, Anisha, Aymeric, Adeyemi, Kimberly, Lauren, Sergii 
and Qiuchi, offers unique accommodation options, 
including some available at no cost.*/

-- 47 Write a query to show host name which have most costly total price
select host_name,price
from listing 
join booking on listing.id=booking.listing_id
order by price DESC
limit 1;
/* Analysis:
Erin offers a range of accommodation options, 
with the highest price point reaching ₹10,000. */

-- 48 Write a query to show host name which have max price using sub-query
select host_name from (select host_name,price
from listing 
join booking on listing.id=booking.listing_id
order by price DESC
limit 1) A;

-- 49 Write a query to show neighbourhood_group where price is less than 100
select Distinct(neighbourhood_group)
from listing 
join booking on listing.id=booking.listing_id
where price < 100;
/* Analysis: 
Budget-conscious travelers can find a variety of affordable accommodation options across all five boroughs of 
New York City: Brooklyn, Manhattan, Queens, Staten Island, and the Bronx. 
These neighborhood groups offer a range of rooms priced below $100 */

-- 50 Write a query to find max price, average availability_365 for each room type and order in ascending by maximum price.
select room_type,max(price) AS Max_Price, avg(availability_365) As Avg_Availability
from listing 
join booking on listing.id=booking.listing_id
group by room_type
order by Max_Price;
/* Analysis: 
AirBNB offer a range of accommodation options to suit various needs and budgets. 
From budget-friendly shared rooms with a maximum price of ₹1800 to 
private rooms providing greater privacy and comfort for up to ₹10,000, and for those seeking complete independence, 
we also offer entire homes or apartments for rent, with a maximum price of ₹10,000. */