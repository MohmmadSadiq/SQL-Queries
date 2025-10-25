--- 8TH Query

SELECT         Makes.Make, FuelTypes.FuelTypeName,Count (*) as NumberOfVehclis 
FROM            FuelTypes INNER JOIN
                         VehicleDetails ON FuelTypes.FuelTypeID = VehicleDetails.FuelTypeID INNER JOIN
                         Makes ON VehicleDetails.MakeID = Makes.MakeID

WHERE YEAR BETWEEN 1950 AND 2000
GROUP BY FuelTypeName,Make 
ORDER BY Make

----9th Query

Select V.*, FuelTypeName  from 
VehicleDetails V join FuelTypes F
on V.FuelTypeID = f.FuelTypeID

where FuelTypeName = N'gas'


---- 10Th Query




Select Distinct MAKE, FuelTypeName  from 
VehicleDetails V join FuelTypes F
on V.FuelTypeID = f.FuelTypeID JOIN Makes M
on V.MakeID = M.MakeID
where FuelTypeName = N'gas'
--group by Make, FuelTypeName
Order by Make

------- 11th Query


Select Count(*) as TotalMakesRunsWithGas from
(Select Distinct MAKE, FuelTypeName  from 
VehicleDetails V join FuelTypes F
on V.FuelTypeID = f.FuelTypeID JOIN Makes M
on V.MakeID = M.MakeID
where FuelTypeName = N'gas'
--group by Make, FuelTypeName
) as R1



-------12nd Query


SELECT        Makes.Make, Count(*) as NumberOfVehclis
FROM            Makes INNER JOIN
                         VehicleDetails ON Makes.MakeID = VehicleDetails.MakeID

group by Make 
order by NumberOfVehclis desc



----------------------------------------13th Query
SELECT        Makes.Make, Count(*) as NumberOfVehclis
FROM            Makes INNER JOIN
                         VehicleDetails ON Makes.MakeID = VehicleDetails.MakeID

group by Make 
Having Count(*) > 20000
order by NumberOfVehclis desc



-------------------------- 14th  Query 

select Make from Makes
where Make like 'B%'

--Get all  Vehicles with make starts with 'B'
SELECT        Makes.Make 
FROM            Makes
where Makes.Make like 'B%';

---------------- 15th Query 

--Get all  Makes with make ends with 'W'
SELECT        Makes.Make 
FROM            Makes
where Makes.Make like '%W';


---------------- 16th Query 

SELECT        Distinct Makes.Make, DriveTypeName
FROM            DriveTypes INNER JOIN
                         VehicleDetails ON DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID INNER JOIN
                         Makes ON VehicleDetails.MakeID = Makes.MakeID

Where DriveTypeName = 'FWD'


--Get all Makes that manufactures DriveTypeName = FWD

SELECT        distinct Makes.Make, DriveTypes.DriveTypeName
FROM            DriveTypes INNER JOIN
                         VehicleDetails ON DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID INNER JOIN
                         Makes ON VehicleDetails.MakeID = Makes.MakeID
Where DriveTypes.DriveTypeName ='FWD'

---------------- 17th Query 

select Count(*) MakeWithFWD from   
(SELECT        distinct Makes.Make, DriveTypes.DriveTypeName
FROM            DriveTypes INNER JOIN
                         VehicleDetails ON DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID INNER JOIN
                         Makes ON VehicleDetails.MakeID = Makes.MakeID
Where DriveTypes.DriveTypeName ='FWD') R1


--Get total Makes that Mantufactures DriveTypeName=FWD

select count(*) MakeWithFWD
from
(
	SELECT        distinct Makes.Make, DriveTypes.DriveTypeName
	FROM            DriveTypes INNER JOIN
							 VehicleDetails ON DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID INNER JOIN
							 Makes ON VehicleDetails.MakeID = Makes.MakeID
	Where DriveTypes.DriveTypeName ='FWD'
) R1


---------------- 18th Query
SELECT         Makes.Make, DriveTypes.DriveTypeName, Count(*) As NumberOfVehclis
FROM            DriveTypes INNER JOIN
						 VehicleDetails ON DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID INNER JOIN
						 Makes ON VehicleDetails.MakeID = Makes.MakeID
group by Makes.Make, DriveTypes.DriveTypeName
Order by Make asc
 
               -------------------------                          -------------------------
SELECT         Makes.Make, DriveTypes.DriveTypeName, Count(*) As NumberOfVehclis
FROM            DriveTypes INNER JOIN
						 VehicleDetails ON DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID INNER JOIN
						 Makes ON VehicleDetails.MakeID = Makes.MakeID
group by Makes.Make, DriveTypes.DriveTypeName
Order by NumberOfVehclis Desc

--Get total vehicles per DriveTypeName Per Make and order them per make asc then per total Desc

SELECT        distinct Makes.Make, DriveTypes.DriveTypeName, Count(*) AS Total
FROM            DriveTypes INNER JOIN
                         VehicleDetails ON DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID INNER JOIN
                         Makes ON VehicleDetails.MakeID = Makes.MakeID

Group By Makes.Make, DriveTypes.DriveTypeName

Order By Make ASC, Total Desc

---------------- 19th Query

SELECT        distinct Makes.Make, DriveTypes.DriveTypeName, Count(*) AS Total
FROM            DriveTypes INNER JOIN
                         VehicleDetails ON DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID INNER JOIN
                         Makes ON VehicleDetails.MakeID = Makes.MakeID

Group By Makes.Make, DriveTypes.DriveTypeName
having Count(*) > 10000
Order By Make ASC, Total Desc


--Get total vehicles per DriveTypeName Per Make then filter only results with total > 10,000

SELECT        distinct Makes.Make, DriveTypes.DriveTypeName, Count(*) AS Total
FROM            DriveTypes INNER JOIN
                         VehicleDetails ON DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID INNER JOIN
                         Makes ON VehicleDetails.MakeID = Makes.MakeID

Group By Makes.Make, DriveTypes.DriveTypeName
Having Count(*) > 10000

Order By Make ASC, Total Desc


------------------------20th Query

Select * from VehicleDetails
where NumDoors is NULL

Select Count(*) from VehicleDetails
where NumDoors is NULL

------------------------21th Query
--Get all Vehicles that number of doors is not specified

select count(*) as TotalWithNoSpecifiedDoors from VehicleDetails
where NumDoors is Null

------------------------22th Query

select PercWithNoSpecifiedDoors = Cast((select count(*) from VehicleDetails where NumDoors is Null)As Float) / Cast((Select Count(*) From VehicleDetails)As float)


--Get percentage of vehicles that has no doors specified

select 
	(
	
	
		CAST(	(select count(*) as TotalWithNoSpecifiedDoors from VehicleDetails
		where NumDoors is Null) as float)


		/
	
	
		Cast( (select count(*) from VehicleDetails as TotalVehicles) as float)
	
	
	) as PercOfNoSpecifiedDoors



------------------------23th Query
SELECT       Distinct Makes.MakeID , Makes.Make, SubModels.SubModelName
FROM            Makes INNER JOIN
                         VehicleDetails ON Makes.MakeID = VehicleDetails.MakeID INNER JOIN
                         SubModels ON VehicleDetails.SubModelID = SubModels.SubModelID
where SubModelName = 'Elite'
------------------------

SELECT    distinct    VehicleDetails.MakeID, Makes.Make, SubModelName
FROM            VehicleDetails INNER JOIN
                         SubModels ON VehicleDetails.SubModelID = SubModels.SubModelID INNER JOIN
                         Makes ON VehicleDetails.MakeID = Makes.MakeID
	
	where SubModelName='Elite'


------------------ 24th Query

Select * from VehicleDetails
where Engine_Liter_Display > 3 and NumDoors = 2

-- Get all vehicles that have Engines > 3 Liters and have only 2 doors

	select * from VehicleDetails
	where Engine_Liter_Display > 3 and NumDoors =2

	------------------ 25th Query

SELECT        Makes.Make, VehicleDetails.*
FROM            Makes INNER JOIN
                         VehicleDetails ON Makes.MakeID = VehicleDetails.MakeID
where Engine like '%OHV%' and Engine_Cylinders = 4

-- Get  make and vehicles that the engine contains 'OHV' and have Cylinders = 4

SELECT        Makes.Make, VehicleDetails.*
FROM            VehicleDetails INNER JOIN
                         Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE        (VehicleDetails.Engine LIKE '%OHV%') AND (VehicleDetails.Engine_Cylinders = 4)

-----------------------26th Query

SELECT       Bodies.BodyName, VehicleDetails.*
FROM            Bodies INNER JOIN
                         VehicleDetails ON Bodies.BodyID = VehicleDetails.BodyID
where BodyName = 'Sport Utility'  and Year >2020


-- Get all vehicles that their body is 'Sport Utility' and Year > 2020

SELECT       BodyName,  VehicleDetails.*
FROM            VehicleDetails INNER JOIN
                         Bodies ON VehicleDetails.BodyID = Bodies.BodyID
Where BodyName='Sport Utility' and Year > 2020


SELECT       BodyName,  VehicleDetails.*
FROM            VehicleDetails INNER JOIN
                         Bodies ON VehicleDetails.BodyID = Bodies.BodyID
Where BodyName = 'Coupe' or BodyName ='Hatchback' or BodyName ='Sedan'

-- Get all vehicles that their Body is 'Coupe' or 'Hatchback' or 'Sedan'

SELECT       bodyName, VehicleDetails.*
FROM            VehicleDetails INNER JOIN
                         Bodies ON VehicleDetails.BodyID = Bodies.BodyID
Where BodyName in ('Coupe','Hatchback','Sedan')

-------------------28th Query

SELECT       bodyName, VehicleDetails.*
FROM            VehicleDetails INNER JOIN
                         Bodies ON VehicleDetails.BodyID = Bodies.BodyID
Where BodyName in ('Coupe','Hatchback','Sedan') and Year in (2008, 2021, 2020)

-- Get all vehicles that their body is 'Coupe' or 'Hatchback' or 'Sedan' and manufactured in year  2008 or 2020 or 2021

SELECT       bodyName, VehicleDetails.*
FROM            VehicleDetails INNER JOIN
                         Bodies ON VehicleDetails.BodyID = Bodies.BodyID
Where BodyName in ('Coupe','Hatchback','Sedan') and Year in ( 2008, 2020, 2021)

-------------- 29th Query

select Found =  if exists (select * from VehicleDetails where Year = 1950)


select found = 1
where exists (select * from VehicleDetails where Year = 150)


-- Return found=1 if there is any vehicle made in year 1950

select found=1 
where 
exists (
        select top 1 * from VehicleDetails where Year =1950
      )


------------------------------------ 30th Query

select Vehicle_Display_Name, NumDoors,
Case 
when NumDoors = 0 then 'Zero'
when NumDoors = 1 then 'one Door'
when NumDoors = 2 then 'Two Doors'
when NumDoors = 3 then 'Three Doors'
when NumDoors = 4 then 'Four Doors'
when NumDoors = 5 then 'Five Doors'
when NumDoors = 6 then 'Six Doors'
when NumDoors = 7 then 'Seven Doors'
when NumDoors = 8 then 'Eight Doors'
when NumDoors is Null then 'Not Set'
else 'Unkown'
End 
from VehicleDetails
order by NumDoors

------------------------------ 31th Query
select Vehicle_Display_Name, VehicleDetails.Year , Age =  Year(GetDate()) - VehicleDetails.Year  
from VehicleDetails
Order by age desc
-- Get all Vehicle_Display_Name, year and add extra column to calculate the age of the car then sort the results by age desc.


-- Note that YEAR in capital Letters is built in function in SQL Server that will give your the year of the given date :-) , 
-- and the year in small letters is the column name

Select VehicleDetails.Vehicle_Display_Name, Year, Age= YEAR(GetDate()) - VehicleDetails.year
from VehicleDetails
Order by Age Desc

------------------------32 Query

Select VehicleDetails.Vehicle_Display_Name, Year,  YEAR(GetDate()) - VehicleDetails.year as Age
from VehicleDetails
where YEAR(GetDate()) - VehicleDetails.year  between 15 and 25
Order by Age Desc

-- Get all Vehicle_Display_Name, year, Age for vehicles that their age between 15 and 25 years old 

select Count(*) from
( 
	Select VehicleDetails.Vehicle_Display_Name, Year, Age= YEAR(GetDate()) - VehicleDetails.year
	from VehicleDetails
) R1

Where Age between 15 and 25

--------------------------------------------33th Query
