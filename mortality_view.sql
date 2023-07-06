DROP VIEW IF EXISTS mortality;
CREATE VIEW mortality AS
SELECT
	location,
    date,
    total_cases,
    total_deaths,
    ROUND(total_deaths/total_cases*100, 2) as mortality_percent
FROM coviddeaths
    
    