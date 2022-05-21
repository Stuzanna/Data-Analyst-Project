/*

Part 2 Video

Moving data back to Excel for Tableau Public.

*/


-- Part 1

Select SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(new_cases)*100 as DeathPercentage
FROM PortfolioProject.`covid_deaths`
-- Where location like '%kingdom%'
where continent is not null 
-- Group By date
order by 1,2;
-- The above copied to Excel: Tableau-Table1

--  -- Sanity check World and not null are similar, they are
-- Select SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(new_cases)*100 as DeathPercentage
-- FROM PortfolioProject.`covid_deaths`
-- Where location = 'World'
-- -- Group By date
-- order by 1,2;


-- Part 2

-- We're removing these as they are not included in the above queries, want to stay consistent
-- European Union is part of Europe

SELECT `location`, SUM(new_deaths) as TotalDeathCount
FROM PortfolioProject.covid_deaths
-- Where location like '%kingdom%'
WHERE continent is NULL
AND `location` not IN ('World', 'European Union', 'International', 'Upper middle income',
'High income', 'Lower middle income', 'Low income')
-- also not interested in the income dataset
GROUP BY `location`
ORDER BY TotalDeathCount DESC;
-- The above original query was copied to Excel: Tableau-Table2
-- This query is now in Tableau-Table2.1


-- Part 3

SELECT `location`, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
FROM PortfolioProject.covid_deaths
-- Where location like '%kingdom%'
GROUP BY `location`, population
ORDER BY PercentagePopulationInfected desc;
-- The above copied to Excel: Tableau-Table3


-- Part 4

SELECT `location`, population, `date`, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
FROM PortfolioProject.covid_deaths
-- Where location like '%kingdom%'
WHERE `location` not IN ('World', 'European Union', 'International', 'Upper middle income',
'High income', 'Lower middle income', 'Low income', 'Europe')
GROUP BY `location`, population, `date`
ORDER BY PercentPopulationInfected DESC
-- The above original query was copied to Excel: Tableau-Table4
-- This query is now in Tableau-Table4.1
