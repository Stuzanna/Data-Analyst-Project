-- SELECT * FROM `covid-deaths`
-- order by 3,4;


-- Selecting data that we are going to be using

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject.`covid_deaths`
ORDER BY 1,2;




-- Looking at total cases vs total deaths
-- Shows likelihood of death if you contract covid in the UK
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM PortfolioProject.`covid_deaths`
WHERE `location` like '%kingdom%'
ORDER BY 1,2;




-- Looking at total cases vs Population
-- Shows what percentage population got covid

SELECT location, date, total_cases, population, (total_cases/population)*100 as ContractionPercentage
FROM PortfolioProject.`covid_deaths`
WHERE `location` like '%kingdom%'
ORDER BY 1,2;

-- Trying to turn column into INT
SELECT CAST(population AS INT) FROM covid_deathsT;
ALTER TABLE covid_deathsT MODIFY COLUMN population TYPE integer USING (trim(population)::integer);