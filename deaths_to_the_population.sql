-- Total deaths in comparison to country population
Select 
	Location,
    population,
    MAX(total_deaths) AS total_deaths,
    MAX(total_deaths/population*100) AS deaths_percent
FROM countries_deaths
GROUP BY location, population
ORDER BY deaths_percent DESC;



