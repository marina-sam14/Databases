ALTER TABLE Calendar
ALTER COLUMN price TYPE varchar,
ALTER COLUMN adjusted_price TYPE varchar;
--ALTER COLUMN available TYPE boolean einai idi boolean
--done


UPDATE  Calendar
SET 
price = REPLACE(price,'$',''),
adjusted_price = REPLACE (adjusted_price,'$','');

UPDATE  Calendar
SET 
price = REPLACE(price,',',''),
adjusted_price = REPLACE (adjusted_price,',','');

ALTER TABLE Calendar 
ALTER COLUMN price TYPE numeric(10,0) using price::numeric,
ALTER COLUMN adjusted_price TYPE numeric(10,0) using adjusted_price::numeric;
