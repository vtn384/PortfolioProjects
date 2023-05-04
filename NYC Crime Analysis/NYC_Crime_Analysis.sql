CREATE TABLE crimes AS 
SELECT  CMPLNT_NUM, RPT_DT,LAW_CAT_CD,OFNS_DESC, Lat_Lon, BORO_NM,  `Zip Codes`, PREM_TYP_DESC, SUSP_AGE_GROUP, SUSP_SEX, SUSP_RACE,VIC_AGE_GROUP, VIC_SEX, VIC_RACE  
FROM nypd_crimes nc;

SELECT *
FROM crimes ;

-- There are duplicates, use distinct to fix; use count(cmplnt_num) AS duplicated_nc to see duplicates 
--  CRIME RATES BY BOROUGH AND OFFENSE TYPE
SELECT boro_nm  AS Borough, LAW_CAT_CD AS Offense_Type, COUNT(DISTINCT cmplnt_num) AS num_crimes
FROM crimes
GROUP BY Borough, Offense_Type;

-- CRIME HOTSPOTS BY LOCATION AND OFFENSE TYPE
SELECT Lat_Lon AS Location, PREM_TYP_DESC AS Location_Id, LAW_CAT_CD AS Offense_Type, COUNT(DISTINCT CMPLNT_NUM) AS num_crimes
FROM crimes 
GROUP BY Location, Location_Id, Offense_Type
ORDER BY num_crimes DESC;

-- NUMBER OF CRIMES BY SUSPECT AGE GROUP & GENDER
SELECT SUSP_AGE_GROUP AS Age, SUSP_SEX AS Gender, COUNT(DISTINCT CMPLNT_NUM) AS num_crimes  
FROM crimes
GROUP BY Age, Gender
ORDER BY num_crimes DESC;

-- NUMBER OF CRIMES BY VICTIM RACE & AGE
SELECT VIC_RACE AS Race, VIC_AGE_GROUP AS Age, Count(DISTINCT CMPLNT_NUM) AS num_crimes
FROM crimes 
GROUP BY Race, Age
ORDER BY num_crimes DESC; 

-- 1. Find the total number of reported crimes in the dataset.
SELECT COUNT(DISTINCT CMPLNT_NUM) AS Reported_Crimes
FROM crimes;

-- 2. Find the most common type of crime in the dataset.
SELECT LAW_CAT_CD AS Most_Common_Crime, COUNT(DISTINCT CMPLNT_NUM) AS num_crimes
FROM crimes
GROUP BY Most_Common_Crime
ORDER BY num_crimes DESC
LIMIT 1;

-- 3. Find the top 10 locations (latitude and longitude) where crimes occur the most.
SELECT Lat_Lon AS Common_Crime_Locations, COUNT(DISTINCT CMPLNT_NUM) AS num_crimes
FROM crimes 
GROUP BY Common_Crime_Locations
ORDER BY num_crimes DESC
LIMIT 10;

-- 4. Find the number of reported crimes by borough.
SELECT BORO_NM AS Borough, COUNT(DISTINCT CMPLNT_NUM) AS num_crimes
FROM crimes 
GROUP BY Borough;

-- 5. Find the percentage of reported crimes that occur in each borough.
SELECT BORO_NM AS Borough, COUNT(DISTINCT CMPLNT_NUM) / (SELECT COUNT(DISTINCT CMPLNT_NUM) FROM crimes) * 100 AS Percentage_Reported_Crimes 
FROM crimes 
GROUP BY Borough;

-- 6.	Find the number of reported crimes that occurred in each zip code.
SELECT `Zip Codes` AS Zip_Code, COUNT(DISTINCT CMPLNT_NUM) AS num_crimes
FROM crimes
GROUP BY Zip_Code
ORDER BY num_crimes DESC;

-- 7.	Find the percentage of reported crimes that occurred in each zip code.
SELECT `Zip Codes` AS Zip_Code, COUNT(DISTINCT CMPLNT_NUM) / (SELECT COUNT(DISTINCT CMPLNT_NUM) FROM crimes) * 100 AS Percentage_Reported_Crimes
FROM crimes 
GROUP BY Zip_Code
ORDER BY percentage_reported_crimes DESC;

-- 8.	Find the average age of the suspects involved in reported crimes.
SELECT AVG(CASE 
WHEN SUSP_AGE_GROUP = 'UNKNOWN' THEN NULL 
ELSE CAST(SUBSTRING_INDEX(SUSP_AGE_GROUP, '-',1) AS UNSIGNED) +
CAST(SUBSTRING_INDEX(SUSP_AGE_GROUP, '-',-1) AS UNSIGNED) / 2
END) AS Avg_Age
FROM crimes;

-- 9.	Find the average age of the victims involved in reported crimes.
SELECT AVG(CASE 
WHEN VIC_AGE_GROUP = 'UNKNOWN' THEN NULL 
ELSE CAST(SUBSTRING_INDEX(VIC_AGE_GROUP, '-',1) AS UNSIGNED) +
CAST(SUBSTRING_INDEX(VIC_AGE_GROUP, '-',-1) AS UNSIGNED) / 2
END) AS Avg_Age
FROM crimes;

-- 10.	Find the percentage of reported crimes in which the suspect was male.
SELECT (COUNT(CASE WHEN SUSP_SEX = 'M' THEN 1 END) / COUNT(DISTINCT CMPLNT_NUM)) * 100 AS Percentage_Male_Suspects
FROM crimes; 

-- 11.	Find the percentage of reported crimes in which the suspect was female.
SELECT (COUNT(CASE WHEN SUSP_SEX = 'F' THEN 1 END) / COUNT(DISTINCT CMPLNT_NUM)) * 100 AS Percentage_Female_Suspects
FROM crimes; 

-- 12.	Find the percentage of reported crimes in which the victim was male.
SELECT (COUNT(CASE WHEN VIC_SEX = 'M' THEN 1 END) / COUNT(DISTINCT CMPLNT_NUM)) * 100 AS Percentage_Male_Victims
FROM crimes; 

-- 13.	Find the percentage of reported crimes in which the victim was female.
SELECT (COUNT(CASE WHEN VIC_SEX = 'F' THEN 1 END) / COUNT(DISTINCT CMPLNT_NUM)) * 100 AS Percentage_Female_Victims
FROM crimes; 



