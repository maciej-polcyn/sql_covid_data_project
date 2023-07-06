CREATE DATABASE IF NOT EXISTS covid;
USE covid;

DROP TABLE IF EXISTS covidDeaths_2;
CREATE TABLE covidDeaths_2
(
	iso_code VARCHAR(45),
    continent VARCHAR(255),
    location VARCHAR(255),
    date DATE,
    population BIGINT,
    total_cases BIGINT,
    new_cases INT,
    new_cases_smoothed DECIMAL(12,3),
    total_deaths INT,
    new_deaths INT,
    new_deaths_smoothed DECIMAL(9,3),
    total_cases_per_million DECIMAL(12,3),
    new_cases_per_million DECIMAL(9,3),
    new_cases_smoothed_per_million DECIMAL(9,3),
    total_deaths_per_million DECIMAL(9,3),
    new_deaths_per_million DECIMAL(9,3),
    new_deaths_smoothed_per_million DECIMAL(9,3),
    reproduction_rate FLOAT,
    icu_patients INT,
    icu_patients_per_million DECIMAL(6,3),
    hosp_patients INT,
    hosp_patients_per_million DECIMAL(9,3),
    weekly_icu_admissions SMALLINT,
    weekly_icu_admissions_per_million DECIMAL(6,3),
    weekly_hosp_admissions INT,
    weekly_hosp_admissions_per_million DECIMAL(6,3)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\CovidDeaths.csv'
INTO TABLE covidDeaths_2
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES

(@iso_code, @continent, @location, @date, @population, @total_cases, @new_cases, @new_cases_smoothed, @total_deaths, @new_deaths, 
@new_deaths_smoothed, @total_cases_per_million, @new_cases_per_million, 
@new_cases_smoothed_per_million, @total_deaths_per_million, @new_deaths_per_million,
@new_deaths_smoothed_per_million, @reproduction_rate, @icu_patients, @icu_patients_per_million, 
@hosp_patients, @hosp_patients_per_million, @weekly_icu_admissions, @weekly_icu_admissions_per_million, 
@weekly_hosp_admissions, @weekly_hosp_admissions_per_million)

SET 
	 total_cases = NULLIF(@total_cases, ''),
     new_cases = NULLIF(@new_cases, ''),
     new_cases_smoothed = NULLIF(@new_cases_smoothed, ''),
     total_deaths = NULLIF(@total_deaths, ''),
     new_deaths = NULLIF(@new_deaths, ''),
     new_deaths_smoothed = NULLIF(@new_deaths_smoothed, ''),
     total_cases_per_million = NULLIF(@total_cases_per_million, ''),
     new_cases_per_million = NULLIF(@new_cases_per_million, ''),
     new_cases_smoothed_per_million = NULLIF(@new_cases_smoothed_per_million, ''),
     total_deaths_per_million = NULLIF(@total_deaths_per_million, ''),
     new_deaths_per_million = NULLIF(@new_deaths_per_million, ''),
     new_deaths_smoothed_per_million = NULLIF(@new_deaths_smoothed_per_million, ''),
     reproduction_rate = NULLIF(@reproduction_rate, ''),
     icu_patients = NULLIF(@icu_patients, ''),
     icu_patients_per_million = NULLIF(@icu_patients_per_million, ''),
     hosp_patients = NULLIF(@hosp_patients, ''),
     hosp_patients_per_million = NULLIF(@hosp_patients_per_million, ''),
     weekly_icu_admissions = NULLIF(@weekly_icu_admissions, ''),
     weekly_icu_admissions_per_million = NULLIF(@weekly_icu_admissions_per_million, ''),
     weekly_hosp_admissions = NULLIF(@weekly_hosp_admissions, ''),
     weekly_hosp_admissions_per_million = NULLIF(@weekly_hosp_admissions_per_million, '')

    