DROP TABLE covid_deaths;

ALTER TABLE `covid-deaths3` -- rename table
RENAME to `covid_deaths`;

-- Updating the column datatype, repeat per table and per column

SHOW FIELDS FROM covid_deaths; -- shows the table to check datatype

-- For converting EMPTY to NULL
UPDATE covid_deaths 
SET continent = NULLIF(continent, '');
-- other example
UPDATE table 
SET col1 = NULLIF(col1, '');

-- For filling EMPTY to 0
update covid_deaths
set `population` = '0' where trim(coalesce(population, '')) = '';

-- converts the column to new datatype
-- change the MODIFY statement to what you need
ALTER TABLE covid_deaths MODIFY `total_deaths` INT;

-- Converting from text to date
UPDATE covid_deaths SET `date` = STR_TO_DATE( `date`,'%d/%m/%Y' ); -- text to string in date ready format
ALTER TABLE covid_deaths MODIFY `date` DATE; -- change datatype to date
