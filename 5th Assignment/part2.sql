/* It shows the neighbourhoods that exists in table Geolocation and have latitude > 32.84214
Rows: 8040 */
SELECT location.neighbourhood,location.latitude
FROM location
LEFT JOIN geolocation on properties_neighbourhood = location.neighbourhood
GROUP BY (location.neighbourhood,location.latitude)
HAVING location.latitude > '32.84214'
ORDER BY (location.neighbourhood);

/* It shows the ids of the rooms in some neighbourhood in some cities  which price is less than 30$
Rows: 3322 */
SELECT room.id, location.neighbourhood, location.city 
FROM room, location
LEFT JOIN neighbourhood on neighbourhood.neighbourhood = location.neighbourhood
WHERE room.id = location.id and room.price < '$30.00'
ORDER BY (room.id);

/* It shows the ids of the hosts which have response rate over than 75% in specific location,except the N/A-ratings
Rows: 246*/
SELECT host.id, host.response_rate, host.location
FROM host
INNER JOIN Location on location.neighbourhood = host.neighbourhood
GROUP BY (host.id, host.response_rate, host.location)
HAVING host.response_rate > '75%' AND host.response_rate <> 'N/A'
ORDER BY (host.id);

/*inner join columns from tables room_amenity and amenity. It shows amenity's id and name in order by room_amenity.id
Rows: 11541*/
SELECT room_amenity.id, room_amenity.amenity_id, amenity.amenity_name
FROM room_amenity, amenity
WHERE room_amenity.amenity_id = amenity.amenity_id
ORDER BY(room_amenity.id);

/* It shows the prices's ids for minimum nights = 5 */
SELECT price.id,price.minimum_nights
FROM price
WHERE price.minimum_nights < 5













