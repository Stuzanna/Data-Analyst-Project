UPDATE TABLE `covid-vacinations` --rename tab;e
RENAME to `covid_vacinations`;

UPDATE `covid_deaths`
SET `date` = STR_TO_DATE(`date`,'%d/%m/%Y'); -- trying to change to date

-- duplicate table
CREATE TABLE covid_deathsT AS SELECT * FROM covid_deaths;
