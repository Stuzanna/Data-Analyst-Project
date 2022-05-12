-- Queries that were lying around in Tableplus

DROP TABLE covid_deathsT;
CREATE TABLE covid_deathsT AS SELECT * FROM covid_deaths;

-- ----
USE covid_deathsT SET `date` = STR_TO_DATE(`date`,'%d/%m/%Y'); -- trying to change to date
ALTER TABLE covid_deathsT MODIFY `date` DATE; -- need to convert to YYYY-MM-DD
SHOW FIELDS FROM covid_deathsT;
-- ---
CONVERT(VARCHAR,`date`) FROM covid_deathsT;
USE covid_deathsT SET `date` = STR_TO_DATE(`date`,'%d/%m/%Y'); -- trying to change to date
ALTER TABLE covid_deathsT MODIFY `date` DATE; -- need to convert to YYYY-MM-DD
SHOW FIELDS FROM covid_deathsT;


-- ------------
UPDATE covid_deathsT
SET `date` = STR_TO_DATE( `date`,'%d/%m/%Y' );



ALTER TABLE test.test1 CHANGE date_start date_start DATE NULL;


CREATE TABLE covid_deathsT AS SELECT * FROM covid_deaths;

ALTER TABLE covid_deaths MODIFY date VARCHAR(20);

SHOW COLUMNS FROM covid_deaths;

SHOW FIELDS FROM covid_deathsT;

-- 
SHOW FIELDS FROM covid_vacinations; -- shows the table to check datatype

-- Fills in the empty values with 0, as can't convert NULL to INT
update covid_deaths
set new_cases = '0' where trim(coalesce(new_cases, '')) = '';

-- converts the column
ALTER TABLE covid_deaths MODIFY new_cases INT;
-- 
UPDATE covid_vacinations SET `date` = STR_TO_DATE( `date`,'%d/%m/%Y' ); -- text to string in date ready format
ALTER TABLE covid_vacinations MODIFY `date` DATE; -- change datatype to date

SHOW COLUMNS FROM covid_vacinations; -- review datatypes
]

-- Creating View to store data for later visualisations

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
\
