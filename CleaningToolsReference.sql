DROP TABLE covid_deaths;

ALTER TABLE `covid-deaths3` -- rename table
RENAME to `covid_deaths`;

-- Updating the column datatype, repeat per table and per column

SHOW FIELDS FROM covid_deaths; -- shows the table to check datatype

-- Empty vs Null, loads of values were EMPTY rather than NULL
UPDATE covid_deaths 
SET continent = NULLIF(continent, '');

-- example
UPDATE table 
SET col1 = NULLIF(col1, '');

-- Fills in the empty values with 0, as can't convert NULL to INT
update covid_deaths
set `total_deaths` = '0' where trim(coalesce(population, '')) = '';


-- converts the column to new datatype
-- change the MODIFY statement to what you need
ALTER TABLE covid_deaths MODIFY `total_deaths` INT;