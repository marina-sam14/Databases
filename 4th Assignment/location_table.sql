CREATE TABLE Location
  AS (SELECT DISTINCT id,street,neighbourhood, neighbourhood_cleansed, city, state,zipcode, market, smart_location, country_code, country, latitude, longitude,is_location_exact 
	 FROM listing);

ALTER TABLE Location
ADD PRIMARY KEY (id);

ALTER TABLE Listing 
  DROP COLUMN smart_location,	 
  DROP COLUMN is_location_exact,	 
  DROP COLUMN review_scores_location,	 
  DROP COLUMN review_scores_location
  
  
ALTER TABLE Listing
ADD FOREIGN KEY (id) REFERENCES Location(id); --location -> listing





ALTER TABLE Listing
DROP COLUMN street,
DROP COLUMN neighbourhood, 
DROP COLUMN neighbourhood_cleansed, 
DROP COLUMN city, 
DROP COLUMN state,
DROP COLUMN zipcode, 
DROP COLUMN market, 
DROP COLUMN smart_location, 
DROP COLUMN country_code, 
DROP COLUMN country, 
DROP COLUMN latitude, 
DROP COLUMN longitude,
DROP COLUMN is_location_exact 


