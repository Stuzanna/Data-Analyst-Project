UPDATE TABLE `covid-vacinations`
RENAME to `covid_vacinations`;

UPDATE `covid_deaths`
SET `date` = STR_TO_DATE(`date`,'%d/%m/%Y');

CREATE TABLE covid_deathsT AS SELECT * FROM covid_deaths;
