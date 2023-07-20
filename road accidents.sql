--Q1 How many accidents have occured in urban areas vs rural areas?

select Area, count(AccidentIndex) as 'Total Accidents '
from dbo.accident
group by Area

--Q2 which day of the week has the highest number of accidents?

select Day, count(AccidentIndex) as 'Total Accidents' 
from dbo.accident
group by Day 
order by 'Total Accidents ' desc

--Q3 What is the average age of vehicles involved in the accidents based on their type ?

select  VehicleType, count(AccidentIndex) As 'Total Accident', avg(AgeVehicle ) as 'Avg Age '
from dbo.vehicle
where AgeVehicle is not null
group by VehicleType 
order by 'Total Accident' desc

--Q4 Can we identify any trends in accidents based on the age of vehicles involved?

select 
	AgeGroup,
	count(AccidentIndex) as 'Total Accidents ' ,
	avg(AgeVehicle) as 'Average year' 
from(
  select  
     AccidentIndex, 
	 AgeVehicle,
      CASE 
		  when (AgeVehicle) BEtween 0 and 5 then 'New'
		  when (AgeVehicle) BEtween 6 and 10 then 'Regular'
		  else 'Old'
	  end as 'AgeGroup'
  from dbo.vehicle 
) as subquery 
group by AgeGroup

--Q5 Are there any specific weather conditions that contribute to severe accidents?

declare @severity varchar(100)
set @severity = 'serious'
select WeatherConditions , count(AccidentIndex) as 'Total Accidents '
from dbo.accident
where severity = @severity
Group by WeatherConditions
order by 'Total Accidents' desc

--Q6 Do accidents often involve impacts on the left hand side of vehicles?

select lefthand, count(Accidentindex) as 'Total Accidents'
from dbo.vehicle
group by lefthand 
having lefthand is not null

--Q7 Are there any relationships between journey purposes and severity of accidents?

select v.journeypurpose, count(a.severity) as 'Total Accidents',
	CASE
		when count(a.severity) between 0 and 1000 then 'low'
		when count(a.severity) between 1001 and 3000 then 'moderate'
		else 'high'
	end as 'level'
from dbo.accident as a
join dbo.vehicle as v
on v.accidentindex= a.accidentindex
group by v.journeypurpose
order by 'Total Accidents' desc

--Q8 Calculate the average age of vehicles involved in accidents considering day light and point of impact. 

declare @impact varchar(100)
declare @lightconditions varchar(100)
set @impact= 'nearside'
set @lightconditions= 'daylight'
select a.lightConditions, v.PointImpact, avg(v.agevehicle) as 'Average Year'
from dbo.accident a
join dbo.vehicle v 
on v.accidentindex =a.accidentindex
group by a.lightconditions, v.pointimpact
having pointimpact = @impact and lightconditions=@lightconditions