-- Active: 1747915455145@@127.0.0.1@5432@assignment2@public
--! Problem 1 ans 

INSERT INTO rangers(name,region) VALUES('Derek Fox','Coastal Plains');


--! Problem 2  ans 

SELECT COUNT(*) AS unique_species_count 
FROM (SELECT species_id FROM sightings GROUP BY species_id) 

--! Problem 3 ans 

SELECT * FROM sightings WHERE location LIKE '%Pass%'; 

--! Problem 4 ans 

SELECT r.name, count(s.sightings_id) as total_sightings FROM rangers as r LEFT JOIN sightings as s ON r.ranger_id=s.ranger_id GROUP BY r.name; 


--! Problem 5 ans 

SELECT s.common_name FROM species as s LEFT JOIN sightings as si ON s.species_id = si.species_id 

WHERE si.species_id IS NULL ;

--! Problem 6 ans 

SELECT sp.common_name, si.sightings_time as time,r.name FROM sightings as si 

JOIN species as sp ON si.species_id =sp.species_id 
JOIN rangers as r ON si.ranger_id = r.ranger_id 
ORDER BY time DESC LIMIT 2 ;


--! Problem 7 ans 

UPDATE species SET conservation_status = 'Historic' WHERE discovery_date < '1800-01-01';

--! Problem 8 ans 
 SELECT sightings_id, 
 CASE 
    WHEN extract(HOUR FROM sightings_time)<12 THEN 'Morning' 
    WHEN extract(HOUR FROM sightings_time) BETWEEN 12 and 17 THEN 'Afternoon'  
    ELSE  'Evening'   
 END as time_of_day
 FROM sightings

 --! Problem 9 ans 

 DELETE FROM rangers WHERE ranger_id NOT in (SELECT DISTINCT ranger_id FROM sightings);