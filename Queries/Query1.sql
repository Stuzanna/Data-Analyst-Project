-- SELECT * FROM `covid-deaths`
-- order by 3,4;


-- Selecting data that we are going to be using

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject.`covid_deaths`
ORDER BY 1,2;


-- Looking at total cases vs total deaths
-- Shows likelihood of death if you contract covid in the UK
SELECT location, date, total_cases, total_deaths,
 (total_deaths/total_cases)*100 as DeathPercentage
FROM PortfolioProject.`covid_deaths`
WHERE `location` like '%kingdom%'
ORDER BY 1,2;


-- Looking at total cases vs Population
-- Shows what percentage population got covid

SELECT location, date, total_cases, population, (total_cases/population)*100 as ContractionPercentage
FROM PortfolioProject.`covid_deaths`
WHERE `location` like '%kingdom%'
ORDER BY 1,2;


-- Looking at countries with Highest Infection Rate compared to Population

SELECT location, population, MAX(total_cases) as MaxInfectionCount,
 (MAX(total_cases/population))*100 as MaxContractionPercentage
FROM PortfolioProject.covid_deaths
GROUP BY `location`, population
ORDER BY 4 DESC;


-- Showing with the Highest Deat Count per population

SELECT location, MAX(total_deaths) as TotalDeathCount
FROM PortfolioProject.covid_deaths
GROUP BY `location`
ORDER BY 2 DESC;
-- This query grouped continents and world etc., below modified for countries

SELECT location, MAX(total_deaths) as TotalDeathCount, continent
FROM PortfolioProject.covid_deaths
WHERE continent is NOT NULL
GROUP BY `location`, continent
ORDER BY 2 DESC;

