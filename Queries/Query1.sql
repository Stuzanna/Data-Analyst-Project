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


-- Showing with the Highest Death Count per population
SELECT location, MAX(total_deaths) as TotalDeathCount
FROM PortfolioProject.covid_deaths
GROUP BY `location`
ORDER BY 2 DESC;
-- This query grouped continents and world etc., below modified for countries


SELECT location, MAX(total_deaths) as TotalDeathCount
FROM PortfolioProject.covid_deaths
WHERE continent is NOT NULL
GROUP BY `location`
ORDER BY 2 DESC;

-- Let's break down by continent
-- see the GROUP BY
SELECT continent, MAX(total_deaths) as TotalDeathCount
FROM PortfolioProject.covid_deaths
WHERE continent is NOT NULL
GROUP BY continent
order by TotalDeathCount DESC;


/*Global Numbers*/

-- daily cases & deaths, %
SELECT date, SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, (SUM(new_deaths)/SUM(new_cases))*100 as DeathPercentage 
FROM PortfolioProject.covid_deaths
WHERE continent is NOT NULL
GROUP BY date
order by 1,2;


-- confirming the entries match by date and location between tables
-- don't run this in Code as it breaks, use TablePlus

Select *
FROM covid_deaths dea
JOIN covid_vacinations vac -- join is inner join
	ON dea.`location` = vac.`location`
	AND dea.`date` = vac.`date`
;

-- looking at Total Population vs Vaccinations #1
Select dea.continent, dea.`location`, dea.`date`, dea.population, vac.new_vaccinations
FROM covid_deaths dea
JOIN covid_vacinations vac -- join is inner join
	ON dea.`location` = vac.`location`
	AND dea.`date` = vac.`date`
WHERE dea.continent IS NOT NULL
ORDER BY 1,2,3
;



-- looking at Total Population vs Vaccinations #2
Select dea.continent, dea.`location`, dea.`date`, dea.population, vac.new_vaccinations,
SUM(vac.new_vaccinations) OVER (PARTITION by dea.`location` ORDER BY dea.`location`, dea.`date`) as RollingPeopleVaccinated -- need this order by location & date or just sums all new vac
FROM covid_deaths dea
JOIN covid_vacinations vac -- join is inner join
	ON dea.`location` = vac.`location`
	AND dea.`date` = vac.`date`
WHERE dea.continent IS NOT NULL
ORDER BY 1,2,3
;

-- CTE of the above looks like this below

/* CTE method, storing calc. column for further calc, bothering to do this
as you can't use the RollingPeopleVacinated from above in any calcs.
Notice the query on the CTE immediately below the close bracket. 
Alternative would be to make a temp-table*/
WITH PopvsVac (continent, `location`, `date`, population, new_vaccinations, RollingPeopleVaccinated) -- match column number for CTE with the below
AS
(

-- looking at Total Population vs Vaccinations
Select dea.continent, dea.`location`, dea.`date`, dea.population, vac.new_vaccinations,
SUM(vac.new_vaccinations) OVER (PARTITION by dea.`location` ORDER BY dea.`location`, dea.`date`) as RollingPeopleVaccinated -- need this order by location & date or just sums all new vac
FROM covid_deaths dea
JOIN covid_vacinations vac -- join is inner join
	ON dea.`location` = vac.`location`
	AND dea.`date` = vac.`date`
WHERE dea.continent IS NOT NULL
-- ORDER BY 1,2,3 -- can't use me in CTE
)
Select *, (RollingPeopleVaccinated/population)*100
FROM PopvsVac

-- Creating View to store data for later visualisations
/*Creating a view so can reuse later, similar to a table for later use
 */
CREATE VIEW PercentPopulationVaccinated AS
Select dea.continent, dea.`location`, dea.`date`, dea.population, vac.new_vaccinations,
SUM(vac.new_vaccinations) OVER (PARTITION by dea.`location` ORDER BY dea.`location`, dea.`date`) as RollingPeopleVaccinated -- need this order by location & date or just sums all new vac
FROM covid_deaths dea
JOIN covid_vacinations vac -- join is inner join
	ON dea.`location` = vac.`location`
	AND dea.`date` = vac.`date`
WHERE dea.continent IS NOT NULL
ORDER BY 1,2,3
;
