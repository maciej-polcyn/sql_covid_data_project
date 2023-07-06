CREATE DATABASE IF NOT EXISTS covid;
USE covid;

DROP TABLE IF EXISTS covidVax;
CREATE TABLE covidVax
(
	iso_code VARCHAR(45),
    continent VARCHAR(255),
    location VARCHAR(255),
    date DATE,
    total_tests BIGINT,
    new_tests INT,
    total_tests_per_thousand DECIMAL(9,3),
    new_tests_per_thousand DECIMAL(6,3),
    new_tests_smoothed INT,
    new_tests_smoothed_per_thousand DECIMAL(6,3),
    positive_rate FLOAT,
    tests_per_case DECIMAL (10,1),
    tests_units VARCHAR(255),
    total_vaccinations BIGINT,
    people_vaccinated BIGINT,
    people_fully_vaccinated BIGINT,
    total_boosters BIGINT,
    new_vaccinations INT,
    new_vaccinations_smoothed INT,
    total_vaccinations_per_hundred DECIMAL(6,2),
    people_vaccinated_per_hundred DECIMAL(5,2),
    people_fully_vaccinated_per_hundred DECIMAL(5,2),
    total_boosters_per_hundred DECIMAL(5,2),
    new_vaccinations_smoothed_per_million INT,
    new_people_vaccinated_smoothed INT,
    new_people_vaccinated_smoothed_per_hundred DECIMAL(6,2) 
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\CovidVaccinations.csv'
INTO TABLE covidVax
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES

(@iso_code, @continent, @location, @date, @total_tests, @new_tests, @total_tests_per_thousand, 
@new_tests_per_thousand, @new_tests_smoothed, @new_tests_smoothed_per_thousand, 
@positive_rate, @tests_per_case, @tests_units, @total_vaccinations, @people_vaccinated, @people_fully_vaccinated,
@total_boosters, @new_vaccinations, @new_vaccinations_smoothed, @total_vaccinations_per_hundred, 
@people_vaccinated_per_hundred, @people_fully_vaccinated_per_hundred, @total_boosters_per_hundred, 
@new_vaccinations_smoothed_per_million, @new_people_vaccinated_smoothed, @new_people_vaccinated_smoothed_per_hundred)

SET 
	 iso_code = NULLIF(@iso_code, ''),
     continent = NULLIF(@continent, ''),
     location = NULLIF(@location, ''),
     date = NULLIF(@date, ''),
     total_tests = NULLIF(@total_tests, ''),
     new_tests = NULLIF(@new_tests, ''),
     total_tests_per_thousand = NULLIF(@total_tests_per_thousand, ''),
     new_tests_per_thousand = NULLIF(@new_tests_per_thousand, ''),
     new_tests_smoothed = NULLIF(@new_tests_smoothed, ''),
     new_tests_smoothed_per_thousand = NULLIF(@new_tests_smoothed_per_thousand, ''),
     positive_rate = NULLIF(@positive_rate, ''),
     tests_per_case = NULLIF(@tests_per_case, ''),
     tests_units = NULLIF(@tests_units, ''),
     total_vaccinations = NULLIF(@total_vaccinations, ''),
     people_vaccinated = NULLIF(@people_vaccinated, ''),
     people_fully_vaccinated = NULLIF(@people_fully_vaccinated, ''),
     total_boosters = NULLIF(@total_boosters, ''),
     new_vaccinations = NULLIF(@new_vaccinations, ''),
     new_vaccinations_smoothed = NULLIF(@new_vaccinations_smoothed, ''),
     total_vaccinations_per_hundred = NULLIF(@total_vaccinations_per_hundred, ''),
     people_vaccinated_per_hundred = NULLIF(@people_vaccinated_per_hundred, ''),
     people_fully_vaccinated_per_hundred = NULLIF(@people_fully_vaccinated_per_hundred, ''),
     total_boosters_per_hundred = NULLIF(@total_boosters_per_hundred, ''),
     new_vaccinations_smoothed_per_million = NULLIF(@new_vaccinations_smoothed_per_million, ''),
     new_people_vaccinated_smoothed = NULLIF(@new_people_vaccinated_smoothed, ''),
     new_people_vaccinated_smoothed_per_hundred = NULLIF(@new_people_vaccinated_smoothed_per_hundred, '')