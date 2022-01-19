CREATE FUNCTION insert_listings_count()
	RETURNS trigger AS
$$
BEGIN
UPDATE Host 
SET listing_count = listing_count + 1
WHERE id = NEW.id;
RETURN NEW;
END;
LANGUAGE plpgsql;

CREATE TRIGGER listing_count 
BEFORE DELETE ON Host
FOR EACH ROW
EXECUTE PROCEDURE insert_listings_count();


CREATE FUNCTION delete_listings_count()
	RETURNS trigger AS
$$ 
BEGIN 
UPDATE Host 
SET listing_count = listing_count - 1 
WHERE id = OLD.id;
RETURN OLD;
END;
LANGUAGE plpgsql;

CREATE TRIGGER listing_count 
AFTER DELETE ON Host
FOR EACH ROW
EXECUTE PROCEDURE delete_listings_count();




/*							CUSTOM TRIGGER 					*/
 /*When a new listing is inserted/deleted into host table, we automaticly increase/decrease the total_listings_count!*/
CREATE FUNCTION update_total_listings()
  RETURNS trigger AS
$$
BEGIN
IF TG_OP = ''INSERT'' THEN
 UPDATE Host SET total_listings_count = total_listings_count + 1
 WHERE id = OLD.host_id;
ELSIF TG_OP = ''DELETE'' THEN
 UPDATE Host SET total_listings_count = total_listings_count - 1
 WHERE id = OLD.host_id;
 RETURN OLD;

 RETURN NEW;
END IF;
END;
LANGUAGE plpgsql;

CREATE TRIGGER trig_total_listing 
AFTER INSERT OR DELETE ON Host
FOR EACH ROW
EXECUTE PROCEDURE update_total_listings();

