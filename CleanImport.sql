DROP TABLE covid_deaths;

ALTER TABLE `covid-deaths3` -- rename table
RENAME to `covid_deaths`;

-- Updating the column datatype, repeat per table and per column

SHOW FIELDS FROM covid_deaths; -- shows the table to check datatype


-- Empty to NULL for columns of interest
-- Empty vs Null, loads of values were EMPTY rather than NULL
UPDATE covid_deaths 
SET continent = NULLIF(continent, '');

UPDATE covid_deaths 
SET population = NULLIF(population, '');

UPDATE covid_deaths 
SET total_cases = NULLIF(total_cases, '');

UPDATE covid_deaths 
SET total_deaths = NULLIF(total_deaths, '');

UPDATE covid_deaths 
SET new_cases = NULLIF(new_cases, '');


-- converts the column to new datatype
-- change the MODIFY statement to what you need
ALTER TABLE covid_deaths MODIFY `total_deaths` INT;
ALTER TABLE covid_deaths MODIFY `total_cases` INT;
ALTER TABLE covid_deaths MODIFY new_cases INT;
ALTER TABLE covid_deaths MODIFY population BIGINT;


UPDATE covid_deaths SET `date` = STR_TO_DATE( `date`,'%d/%m/%Y' ); -- text to string in date ready format
ALTER TABLE covid_deaths MODIFY `date` DATE; -- change datatype to date

SHOW COLUMNS FROM covid_deaths; -- review datatypes
