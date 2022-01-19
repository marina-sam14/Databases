CREATE TABLE Neighborhood
AS (SELECT DISTINCT neighbourhood as neighborhood_name, 
    neighbourhood_cleansed as zip_code FROM Location);


DELETE FROM Neighborhood
WHERE  neighborhood_name is null OR zip_code is null;


ALTER TABLE Neighborhood
ADD PRIMARY KEY (neighborhood_name, zip_code);


ALTER TABLE Location
ADD FOREIGN KEY (neighbourhood, neighbourhood_cleansed ) REFERENCES Neighborhood(neighborhood_name, zip_code);






