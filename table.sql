-- Active: 1747915455145@@127.0.0.1@5432@assignment2@public


--! create rangers table
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY ,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
);

--? insert data from rangers table 
INSERT INTO rangers (name, region) VALUES ('Alice Green','Northern Hills'),('Bob White' , 'River Delta'),('Carol King', 'Mountain Range');

--? insert data from rangers table 



--! create species table 
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(200) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(100) check (conservation_status in ('Endangered','Valnerable','Historic')) NOT NULL
);

--? insert data from species table
 INSERT INTO species (common_name,scientific_name,discovery_date,conservation_status) 
 VALUES ('Snow Leopard', 'Panthera uncia','1775-01-01','Endangered'),
 ('Bengal Tiger','Pathera tigris tigris','1758-01-01','Endangered'),
 ('Red Panda','Ailurus fulgens','1825-01-01','Valnerable'),
 ('Asiatic Elephant','Elephas maximus indicus','1758-01-01','Endangered');



--? insert data from species table

--! create sightings table 
CREATE TABLE sightings(
    sightings_id SERIAL PRIMARY KEY,
    species_id INT NOT NULL,
    ranger_id INT NOT NULL,
    sightings_time TIMESTAMP NOT NULL,
    location VARCHAR(200) NOT NULL,
    notes TEXT,

    constraint fk_ranger 
    Foreign Key (ranger_id) REFERENCES rangers (ranger_id) on delete CASCADE,

    constraint fk_species
    Foreign Key (species_id) REFERENCES species (species_id)
);

--? insert data from sightings table 
INSERT INTO sightings(species_id,ranger_id,location,sightings_time,notes)
VALUES (11,1,'Peak Ridge','2024-05-10 07:45:00','Camera trap image captured'),
(10,2, 'Bankwood Area','2024-05-12 16:20:00','Juvenile seen'),
(13,3,'Banboo Grave East', '2024-05-12 09:10:00', 'Feeding observed'),
(11,2,'Snowfall Pass', '2024-05-18 09:10:00', NULL);
--? insert data from sightings table

SELECT * FROM species;
SELECT * FROM sightings;
SELECT species_id, common_name FROM species;
SELECT * FROM rangers;




