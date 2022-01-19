CREATE TABLE Amenity AS
(SELECT DISTINCT amenities AS amenity_name FROM room );

ALTER  TABLE Amenity
ADD COLUMN amenity_id SERIAL PRIMARY KEY;


--ftiaxnoume enan proswrino pinaka gia na metaferoume ta columnns twn pinakwn room,amenities. ton onomazoume newTable kai dimiourgoume ton room_amenity me vasi ton newTable
CREATE TABLE Room_Amenity AS
(SELECT newTable.id , amenity.amenity_id AS amenity_id FROM amenity,
   (SELECT room.id AS id, amenities AS amenity_name FROM room ) AS newTable
WHERE newTable.amenity_name = amenity.amenity_name);
  
ALTER TABLE room_amenity
ADD PRIMARY KEY(id, amenity_id);
 
ALTER TABLE Room_Amenity
ADD FOREIGN KEY (id) REFERENCES Room(id),
ADD FOREIGN KEY (amenity_id) REFERENCES Amenity(amenity_id); 

ALTER TABLE Room
DROP COLUMN amenities;

