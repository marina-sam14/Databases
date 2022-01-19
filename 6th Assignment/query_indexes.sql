--QUERY First
CREATE INDEX indexForHost ON Host(id);
--DROP INDEX indexForHost;

--QUERY Second
--CREATE INDEX indexForGuests ON Listing(guests_included, price);


--Room_Amenity
CREATE INDEX ram_index ON room_amenity(id, amenity_id);
--Listing
CREATE INDEX listing_id_index ON listing(id);
--Host
CREATE INDEX host_name_neighbourhood_index on host(name,neighbourhood);
--Room
CREATE INDEX room_id ON room(id);
--Location
CREATE INDEX location_id_lat_index ON location(id,latitude);
--Price
CREATE INDEX price_week_id ON price(weekly_price,id);
--Host
CREATE INDEX host_neigh_index ON host(neighbourhood);