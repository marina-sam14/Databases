/* minimum specific coORdinates,expect null values, fOR every neighbourhood in Neighbourhoods */
SELECT min(geometry_coORdinates_0_0_75_1)
FROM Geolocation
INNER JOIN Neighbourhoods ON Neighbourhoods.neighbourhood = Geolocation.properties_neighbourhood 
AND geometry_coORdinates_0_0_75_1 is not null;
--min = 37.95378


/*show a list FROM the reviewers who saw the airbnb between 2 dates */
SELECT Listings.name,Listings.id,Reviews.*
FROM Reviews
INNER JOIN listings ON Listings.name = Reviews.reviewer_name AND date between '2018-01-01' AND '2019-01-01'
ORDER BY Listings.name;
--110 rows

/*the number of max nights must be mORe than 5 an the min nights must be 
between 1 AND 3. The listings are ORdered FROM the one with the most nights you can stay. 1 to 3
*/
SELECT Listings.id, Listings.minimum_nights,  Listings.maximum_nights
FROM Listings 
WHERE  Listings.maximum_nights > 5 AND Listings.minimum_nights BETWEEN 1 AND 3
ORDER BY Listings.maximum_nights;
--1067 rows

/*it shows a list FROM availability on specific dates */
SELECT calendar.date,listings.has_availability 
FROM calendar,listings
where date between '2019-01-10' AND '2019-01-14' AND has_availability  = 'true'
ORDER BY calendar.date;
--0 rows

/*show top listings that have some really good reviews. It counts how many "good", "great" comments listings have */
SELECT Count(Reviews.comments), Reviews.listing_id 
FROM Reviews
WHERE comments LIKE '%good%' OR comments LIKE '%super%' OR comments LIKE '%wonderful%'
GROUP BY (Reviews.listing_id);
--7318 rows

/*Listings ORdered by reviewer_name with their comments. The comments are 100.*/
SELECT Listings.id, Listings.listing_url, Reviews.reviewer_id, Reviews.reviewer_name, Reviews.comments
FROM Listings, Reviews
WHERE Listings.id = Reviews.listing_id
ORDER BY Reviews.reviewer_name
LIMIT 100;
--100 rows


/* it shows every reviewer's (whose id is in Listigs table) picture url  */
SELECT Reviews.*, Listings.picture_url
FROM Reviews
INNER JOIN Listings ON Listings.id = Reviews.listing_id
LIMIT 100;
--828470 rows without the limitation

/* how many ids which belong in_summary_listings,don't belong in listings*/
SELECT count (summary_listings.id)
FROM summary_listings
INNER JOIN listings ON listings.id != summary_listings.id;
--count = 133183140


	
/* it shows if there are any neigbourhoods which are not covered by any listings */	
SELECT COUNT(*) 
FROM (
SELECT Geolocation.properties_neighbourhood, Listings.neighbourhood
FROM  Geolocation 
	LEFT OUTER JOIN  Listings  ON Geolocation.properties_neighbourhood = Listings.neighbourhood
) 
AS neighbourhoods_without_listings 
	WHERE neighbourhoods_without_listings.neighbourhood = null;
	
	
/* It shows how many beds are available with price less than 60*/
SELECT max(bedrooms)
FROM listings
where listings.price < '60' AND listings.has_availability = 't' ;
--14

/*Airbnb's without duplicates based ON ids AND specific date */
SELECT distinct listings.name
FROM listings
INNER JOIN calendar ON calendar.listing_id = listings.id AND calendar.date between '2020-10-01' AND '2020-10-03' 
AND calendar.price < '60';
--7159 rows

/* average number of the reviews where reviewers belong to listings table at a specific date */
select avg(number_of_reviews)
from listings
inner join reviews on reviews.reviewer_name = listings.name
and reviews.date < '2020-10-30'
--avg = 11.8709677419354839


	






