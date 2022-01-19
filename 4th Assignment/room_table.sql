CREATE TABLE Room
  AS (SELECT DISTINCT id,accommodates,bathrooms,bedrooms,beds,bed_type,amenities,square_feet,price,weekly_price,monthly_price,security_deposit
	 FROM listing);
	 
	 
  ALTER TABLE Listing 
  DROP COLUMN room_type,
  DROP COLUMN calculated_host_listings_count_private_rooms,
  DROP COLUMN calculated_host_listings_count_shared_rooms;
  
  ALTER TABLE Room
  ADD PRIMARY KEY(id);
  
  
  ALTER TABLE Listing
  ADD FOREIGN KEY (id) REFERENCES Room(id);
  
  
  
  
  ALTER TABLE Listing 
  DROP COLUMN accommodates,
  DROP COLUMN bathrooms,
  DROP COLUMN bedrooms,
  DROP COLUMN beds,
  DROP COLUMN bed_type,
  DROP COLUMN amenities,
  DROP COLUMN square_feet,
  DROP COLUMN price,
  DROP COLUMN weekly_price,
  DROP COLUMN monthly_price,
  DROP COLUMN security_deposit;
	 
	 
	  