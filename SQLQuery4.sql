-- 2nd Query
SELECT    * from   VehicleDetails 
where Year  between 1950 and 2000
-- 3th Query
Select  count(*) as VehiclesNumbers from VehicleDetails 
where Year  between 1950 and 2000
-------------------------------------------------------------------------------------
------------------------------------
----------------------
-- 4th Query
	
	-- My Solution
Select Make, Count(*) as NumberOfVehciles from 
(
SELECT        Year, VehicleDetails.MakeID, Makes.Make
FROM            Makes INNER JOIN
                         VehicleDetails ON Makes.MakeID = VehicleDetails.MakeID) as TempTable

where Year  between 1950 and 2000
group by Make
order by NumberOfVehciles Desc


	-- AboHadhode Solution
Select Make, Count(*) as NumberOfVehciles 
FROM            Makes INNER JOIN
                        VehicleDetails ON Makes.MakeID = VehicleDetails.MakeID

where Year  between 1950 and 2000
group by Make
order by NumberOfVehciles Desc

-----------------------------------------------------------------------
-----------------------------------------------------------------
--------------------------------------------------------
-- 5th Query
    ---- with having
Select Make, Count(*) as NumberOfVehciles 
FROM            Makes INNER JOIN
                        VehicleDetails ON Makes.MakeID = VehicleDetails.MakeID

where Year  between 1950 and 2000
group by Make
Having Count(*) >= 12000 
order by NumberOfVehciles Desc


   ---- without Having
Select * from(Select Make, Count(*) as NumberOfVehciles 
FROM            Makes INNER JOIN
                        VehicleDetails ON Makes.MakeID = VehicleDetails.MakeID

where Year  between 1950 and 2000
group by Make
) as R1
where R1.NumberOfVehciles >= 12000
order by NumberOfVehciles Desc

------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------
--------------------------------------------------------
-- 6th Query
Select Make, Count(*) as NumberOfVehciles , TotalVihcles
FROM            Makes INNER JOIN
                        VehicleDetails ON Makes.MakeID = VehicleDetails.MakeID Cross join (Select Count(*) as TotalVihcles from VehicleDetails) As new 

where Year  between 1950 and 2000
group by Make
order by NumberOfVehciles Desc

-- The Correct Answer
Select * from
(Select Make, Count(*) as NumberOfVehciles 
FROM            Makes INNER JOIN
                        VehicleDetails ON Makes.MakeID = VehicleDetails.MakeID

where Year  between 1950 and 2000
group by Make
) As new1 , (Select Count(*) as TotalVihcles from VehicleDetails) as New2
Order by NumberOfVehciles desc


----  Abo hadhode solution
Select Make, Count(*) as NumberOfVehciles ,(Select Count(*)  from VehicleDetails) as TotalVehciles
FROM            Makes INNER JOIN
                        VehicleDetails ON Makes.MakeID = VehicleDetails.MakeID

where Year  between 1950 and 2000
group by Make
order by NumberOfVehciles Desc


 ------- Temp Triel

Select Make, Count(*) as NumberOfVehciles , (Select top 1 Make--, Count(*) as NumberOfVehciles 
FROM            Makes INNER JOIN
                        VehicleDetails ON Makes.MakeID = VehicleDetails.MakeID

where Year  between 1950 and 2000
group by Make
Having Count(*) >= 12000 
)
FROM            Makes INNER JOIN
                        VehicleDetails ON Makes.MakeID = VehicleDetails.MakeID

where Year  between 1950 and 2000
group by Make
order by NumberOfVehciles Desc
------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------
--------------------------------------------------------
-------------------------------------------------
---- 7th Query
---
Select Make, Count(*) as NumberOfVehciles ,(Select Count(*)  from VehicleDetails) as TotalVehciles , Percentagea = NumberOfVehciles / TotalVehciles * 100 
FROM            Makes INNER JOIN
                        VehicleDetails ON Makes.MakeID = VehicleDetails.MakeID

where Year  between 1950 and 2000
group by Make
order by NumberOfVehciles Desc




Select * , Percentagea =  cast(NumberOfVehciles as float)  / cast(TotalVihcles as float)* 100  from
(Select Make, Count(*) as NumberOfVehciles 
FROM            Makes INNER JOIN
                        VehicleDetails ON Makes.MakeID = VehicleDetails.MakeID

where Year  between 1950 and 2000
group by Make
) As new1 , (Select Count(*) as TotalVihcles from VehicleDetails) as New2
Order by NumberOfVehciles desc



---- abo hadhode Solution 
Select * ,Perc =  cast(NumberOfVehciles as float)  / cast(TotalVehciles as float)
from (
Select Make, Count(*) as NumberOfVehciles ,(Select Count(*)  from VehicleDetails) as TotalVehciles
FROM            Makes INNER JOIN
                        VehicleDetails ON Makes.MakeID = VehicleDetails.MakeID

where Year  between 1950 and 2000
group by Make
) as R1
order by NumberOfVehciles Desc



