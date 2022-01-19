CREATE TABLE Price
  AS (SELECT DISTINCT listing.id, room.price, weekly_price, monthly_price, security_deposit, cleaning_fee,        
				guests_included, extra_people, minimum_nights, maximum_nights,minimum_minimum_nights, maximum_minimum_nights, 
				minimum_maximum_nights,maximum_maximum_nights, minimum_nights_avg_ntm, maximum_nights_avg_ntm
	 FROM listing,room);
	 
	 

UPDATE  Price
SET
/* recognises dollar in order to convert it into numeric*/ 
price = REPLACE(price,'$',''),
weekly_price = REPLACE (weekly_price,'$',''),
monthly_price = REPLACE (monthly_price,'$',''),
extra_people = REPLACE (extra_people,'$',''),
security_deposit = REPLACE(security_deposit,'$','');


UPDATE  Price
SET 
price = REPLACE(price,',',''),
weekly_price = REPLACE (weekly_price,',',''),
monthly_price = REPLACE (monthly_price,',',''),
extra_people = REPLACE (extra_people,',',''),
security_deposit = REPLACE (security_deposit,',','');




ALTER TABLE Price 
ALTER COLUMN price TYPE numeric(10,0) using price::numeric,
ALTER COLUMN weekly_price TYPE numeric(10,0) using weekly_price::numeric,
ALTER COLUMN monthly_price TYPE numeric(10,0) using monthly_price::numeric,
ALTER COLUMN cleaning_fee TYPE numeric(10,0) using cleaning_fee::numeric,
ALTER COLUMN extra_people TYPE numeric(10,0) using extra_people::numeric,
ALTER COLUMN security_deposit TYPE numeric(10,0) using security_deposit::numeric,
ALTER COLUMN minimum_nights_avg_ntm TYPE numeric(10,0) using minimum_nights_avg_ntm::numeric,
ALTER COLUMN maximum_nights_avg_ntm TYPE numeric(10,0) using maximum_nights_avg_ntm::numeric;
 

/*itan diegramena apo proigoumeno erwtima
ALTER TABLE Listing
DROP COLUMN price,
DROP COLUMN weekly_price, 
DROP COLUMN monthly_price;
*/



ALTER TABLE Listing
/*DROP COLUMN security_deposit => itan diegrammeno*/
DROP COLUMN cleaning_fee,        
DROP COLUMN guests_included,
DROP COLUMN extra_people,
DROP COLUMN minimum_nights,
DROP COLUMN maximum_nights,
DROP COLUMN minimum_minimum_nights,
DROP COLUMN maximum_minimum_nights, 
DROP COLUMN minimum_maximum_nights,
DROP COLUMN maximum_maximum_nights, 
DROP COLUMN minimum_nights_avg_ntm, 
DROP COLUMN maximum_nights_avg_ntm;















