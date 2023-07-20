# Accident Data Analysis

## Introduction

This project aims to analyze accident data to gain insights into various aspects related to accidents. The dataset used for analysis contains information about accidents, vehicles involved, weather conditions, and other relevant factors. SQL queries have been written to extract and analyze data from the database.

## Dataset

The link to the dataset is provided above
The dataset used for analysis consists of two main tables:
- `dbo.accident`: Contains information about accidents, including the accident index, area (urban/rural), day of the week, severity, and weather conditions.
- `dbo.vehicle`: Contains information about vehicles involved in accidents, including the vehicle type, age, left-hand side impact, journey purpose, and point of impact.

## SQL Queries

Below are the main SQL queries used in this analysis:

1. **Accidents by Area (Urban vs. Rural)**:
   - Query: `SELECT Area, COUNT(AccidentIndex) AS 'Total Accidents' FROM dbo.accident GROUP BY Area;`
   - Purpose: This query provides the count of accidents that occurred in urban and rural areas.

2. **Accidents by Day of the Week**:
   - Query: `SELECT Day, COUNT(AccidentIndex) AS 'Total Accidents' FROM dbo.accident GROUP BY Day ORDER BY 'Total Accidents' DESC;`
   - Purpose: This query identifies the day of the week with the highest number of accidents.

3. **Average Age of Vehicles by Type**:
   - Query: `SELECT VehicleType, COUNT(AccidentIndex) AS 'Total Accidents', AVG(AgeVehicle) AS 'Avg Age' FROM dbo.vehicle WHERE AgeVehicle IS NOT NULL GROUP BY VehicleType ORDER BY 'Total Accidents' DESC;`
   - Purpose: This query calculates the average age of vehicles involved in accidents based on their type.

4. **Trends in Accidents by Age of Vehicles**:
   - Query: (subquery with CASE statements)
   - Purpose: This query categorizes vehicles into age groups (New, Regular, Old) and calculates the total accidents and average age for each group.

5. **Severe Accidents by Weather Conditions**:
   - Query: (uses a parameter `@severity`)
   - Purpose: This query identifies specific weather conditions that contribute to severe accidents.

6. **Left-hand Side Impacts in Accidents**:
   - Query: `SELECT lefthand, COUNT(AccidentIndex) AS 'Total Accidents' FROM dbo.vehicle GROUP BY lefthand HAVING lefthand IS NOT NULL;`
   - Purpose: This query analyzes whether accidents often involve impacts on the left-hand side of vehicles.

7. **Relationship between Journey Purposes and Severity of Accidents**:
   - Query: This query uses a subquery to join `dbo.accident` and `dbo.vehicle`, then groups and calculates the total accidents for each journey purpose, and assigns a severity level.
   - Purpose: The query explores any relationships between journey purposes and the severity of accidents.

8. **Average Age of Vehicles Involved Considering Daylight and Point of Impact**:
   - Query: (uses parameters `@impact` and `@lightconditions`)
   - Purpose: This query calculates the average age of vehicles involved in accidents based on the point of impact and daylight conditions.

## Conclusion

This project provides valuable insights into accident data using SQL queries. The analysis covers accident counts by area, day of the week, weather conditions, and more. It also explores relationships between the age of vehicles and accident trends. The findings can be used to implement safety measures and improve road conditions.

For more details on the database schema and data, refer to the data documentation provided in the dataset.
