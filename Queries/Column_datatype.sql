-- Updating the column datatype

SHOW FIELDS FROM covid_deathsT; -- shows the table to check datatype

-- Fills in the empty values with 0, as can't convert NULL to INT
update covid_deathsT
set population = '0' where trim(coalesce(population, '')) = '';

-- converts the column
ALTER TABLE covid_deathsT MODIFY population BIGINT UNSIGNED NOT NULL;