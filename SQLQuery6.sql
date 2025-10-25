---------------------------- 33th Query

Select Min(Engine_CC) as MinEngine_CC, Max(Engine_CC)as MaxEngine_CC, Avg(Engine_CC) as AvgEngine_CC 
from VehicleDetails


-- Get Minimum Engine CC , Maximum Engine CC , and Average Engine CC of all Vehicles

select  Min(Engine_CC) as MinimimEngineCC,Max(Engine_CC) as MaximumEngineCC, AVG(Engine_CC)  as AverageEngineCC
from VehicleDetails


----------------------------------------- 34th Query

Select * from VehicleDetails
Where Engine_CC = (select  Min(Engine_CC) from VehicleDetails)


-- Get all vehicles that have the minimum Engine_CC

Select VehicleDetails.Vehicle_Display_Name from VehicleDetails
where Engine_CC = ( select  Min(Engine_CC) as MinEngineCC  from VehicleDetails )



----------------------------------------- 34th Query


Select VehicleDetails.Vehicle_Display_Name from VehicleDetails
where Engine_CC = ( select  Max(Engine_CC) as MaxEngineCC  from VehicleDetails )


-- Get all vehicles that have the Maximum Engin_CC

Select VehicleDetails.Vehicle_Display_Name from VehicleDetails
where Engine_CC = ( select  Max(Engine_CC) as MinEngineCC  from VehicleDetails )


---------------------------------36th Query

Select VehicleDetails.Vehicle_Display_Name 
from VehicleDetails
where Engine_CC < ( select  Avg(Engine_CC) as MinEngineCC  from VehicleDetails )

-- Get all vehicles that have  Engin_CC below average

Select VehicleDetails.Vehicle_Display_Name 
from VehicleDetails
where Engine_CC < ( select  avg(Engine_CC) as MinEngineCC  from VehicleDetails )


-----------------------------------37thQuery

Select Count(*)
from VehicleDetails
Where Engine_CC > ( select  avg(Engine_CC) as MinEngineCC  from VehicleDetails )


-- Get total vehicles that have  Engin_CC above average

select Count(*) as NumberOfVehiclesAboveAverageEngineCC from
(
 
	Select ID,VehicleDetails.Vehicle_Display_Name from VehicleDetails
	where Engine_CC > ( select  Avg(Engine_CC) as MinEngineCC  from VehicleDetails )

) R1

------------------------------38th Query
Select distinct Engine_CC from VehicleDetails
Order by Engine_CC Desc


-- Get all unique  Engin_CC and sort them Desc

Select  distinct  Engine_CC from VehicleDetails
Order By Engine_CC Desc


-----------------------------------------39th Query
Select distinct Top 3   Engine_CC
from VehicleDetails
Order By Engine_CC Desc

-- Get the maximum 3 Engine CC

Select  distinct top 3 Engine_CC from VehicleDetails
	Order By Engine_CC Desc


	------
select top 3 Max(Engine_CC) from VehicleDetails
Group by Engine_CC
Order by Engine_CC desc



---------------------------40th Query

Select *from VehicleDetails
where Engine_CC in (Select  distinct top 3 Engine_CC from VehicleDetails Order By Engine_CC Desc)




-- Get all vehicles that has one of the Max 3 Engine CC

Select Vehicle_Display_Name from VehicleDetails
where Engine_CC in 
(
	
	Select  distinct top 3 Engine_CC from VehicleDetails
	Order By Engine_CC Desc
)


--------------------------------41th Query

SELECT     distinct   Makes.Make
FROM            Makes INNER JOIN
                         VehicleDetails ON Makes.MakeID = VehicleDetails.MakeID
where Engine_CC in 
(
	
	Select  distinct top 3 Engine_CC from VehicleDetails
	Order By Engine_CC Desc
)
Order By Make






-- Get all Makes  that manufactures one of the Max 3 Engine CC

SELECT        distinct Makes.Make
FROM            VehicleDetails INNER JOIN
                         Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE        (VehicleDetails.Engine_CC IN
                             (SELECT DISTINCT TOP (3) Engine_CC
                               FROM            VehicleDetails 
                               ORDER BY Engine_CC DESC)
							 )

Order By Make



------------------------------------------------------42the Query
select top 1 * from VehicleDetails

-- Get a table of unique Engine_CC and calculate tax per Engine CC as follows:
	-- 0 to 1000    Tax = 100
	-- 1001 to 2000 Tax = 200
	-- 2001 to 4000 Tax = 300
	-- 4001 to 6000 Tax = 400
	-- 6001 to 8000 Tax = 500
	-- Above 8000   Tax = 600
	-- Otherwise    Tax = 0

Select  distinct  Engine_CC 
, Case 
when Engine_CC Between 0 And 1000  Then  100
when Engine_CC Between 1001 And 2000 Then  200
when Engine_CC Between  2001 And 4000 Then 300
when Engine_CC Between  4001 And 6000 Then 400
when Engine_CC Between  6001 And 8000 Then 500
when Engine_CC > 8000 Then   600
Else  0
End as Tax
from VehicleDetails
	Order By Engine_CC Desc


select Engine_CC,

	CASE
		WHEN Engine_CC between 0 and 1000 THEN 100
		 WHEN Engine_CC between 1001 and 2000 THEN 200
		 WHEN Engine_CC between 2001 and 4000 THEN 300
		 WHEN Engine_CC between 4001 and 6000 THEN 400
		 WHEN Engine_CC between 6001 and 8000 THEN 500
		 WHEN Engine_CC > 8000 THEN 600	
		ELSE 0

	END as Tax

from 
(
	select distinct Engine_CC from VehicleDetails
	
) R1
order by Engine_CC


------------------------------------43th Query


SELECT        Makes.Make, Sum(VehicleDetails.NumDoors) As NumberOfDoors
FROM            Makes INNER JOIN
                         VehicleDetails ON Makes.MakeID = VehicleDetails.MakeID
Group by Make
Order by NumberOfDoors Desc

-- Get Make and Total Number Of Doors Manufactured Per Make

SELECT        Makes.Make, Sum(VehicleDetails.NumDoors) AS TotalNumberOfDoors
FROM            VehicleDetails INNER JOIN
                         Makes ON VehicleDetails.MakeID = Makes.MakeID

Group By Make
Order By TotalNumberOfDoors desc


----------------------------------44th Query 
SELECT        Makes.Make, Sum(VehicleDetails.NumDoors) AS TotalNumberOfDoors
FROM            VehicleDetails INNER JOIN
                         Makes ON VehicleDetails.MakeID = Makes.MakeID
where make = 'ford'
Group By Make
Order By TotalNumberOfDoors desc



-- Get Total Number Of Doors Manufactured by 'Ford'

SELECT        Makes.Make, Sum(VehicleDetails.NumDoors) AS TotalNumberOfDoors
FROM            VehicleDetails INNER JOIN
                         Makes ON VehicleDetails.MakeID = Makes.MakeID

Group By Make
Having Make='Ford'


--------------------------------------------- 45th Query
SELECT       top 3 Makes.Make, Count(MakeModels.ModelName) as ModelNumbers
FROM            MakeModels INNER JOIN
                         Makes ON MakeModels.MakeID = Makes.MakeID INNER JOIN
                         VehicleDetails ON MakeModels.ModelID = VehicleDetails.ModelID AND Makes.MakeID = VehicleDetails.MakeID

Group By Make
order by ModelNumbers desc




SELECT      top 3  Makes.Make, Count(MakeModels.ModelName) as ModelNumbers
FROM            MakeModels INNER JOIN
                         Makes ON MakeModels.MakeID = Makes.MakeID
Group By Make
order by ModelNumbers desc

SELECT       top 3 Make, Count(ModelName) as ModelNumbers from
(
SELECT        Distinct   Makes.Make, MakeModels.ModelName 
FROM            MakeModels INNER JOIN
                         Makes ON MakeModels.MakeID = Makes.MakeID INNER JOIN
                         VehicleDetails ON MakeModels.ModelID = VehicleDetails.ModelID AND Makes.MakeID = VehicleDetails.MakeID



) as R1

Group By Make
order by ModelNumbers desc


SELECT       top 3 Make, Count(ModelName) as ModelNumbers from
(
SELECT       distinct Makes.Make, MakeModels.ModelName 
FROM            MakeModels INNER JOIN
                         Makes ON MakeModels.MakeID = Makes.MakeID
)as R1

Group By Make
order by ModelNumbers desc

select Count(*) from 
(select Distinct ModelID from VehicleDetails) as R1

Select Count(*) from MakeModels


-- Get Number of Models Per Make

SELECT        Makes.Make, COUNT(*) AS NumberOfModels
FROM            Makes INNER JOIN
                         MakeModels ON Makes.MakeID = MakeModels.MakeID
GROUP BY Makes.Make
Order By NumberOfModels Desc

---------------------------------
--------------------------------------46th Query

SELECT       top 3 Makes.Make, COUNT(*) AS NumberOfModels
FROM            Makes INNER JOIN
                         MakeModels ON Makes.MakeID = MakeModels.MakeID
GROUP BY Makes.Make
Order By NumberOfModels Desc


-- Get the highest 3 manufacturers that make the highest number of models

SELECT      top 3  Makes.Make, COUNT(*) AS NumberOfModels
FROM            Makes INNER JOIN
                         MakeModels ON Makes.MakeID = MakeModels.MakeID
GROUP BY Makes.Make
Order By NumberOfModels Desc


-----------------------------------------47th Query

SELECT         top 1 MakeModels.ModelName, Count(*) as NumberOfModels
FROM            MakeModels INNER JOIN
                         VehicleDetails ON MakeModels.ModelID = VehicleDetails.ModelID

Group by    MakeModels.ModelName
Order by NumberOfModels Desc

select Max(NumberOfModels) As MaxNumberOfModesl from
(SELECT         MakeModels.ModelName, Count(*) as NumberOfModels
FROM            MakeModels INNER JOIN
                         VehicleDetails ON MakeModels.ModelID = VehicleDetails.ModelID

Group by    MakeModels.ModelName) as R1


-- Get the highest number of models manufactured

select Max(NumberOfModels) as MaxNumberOfModels
from
(

		SELECT        Makes.Make, COUNT(*) AS NumberOfModels
		FROM            Makes INNER JOIN
								 MakeModels ON Makes.MakeID = MakeModels.MakeID
		GROUP BY Makes.Make
		
) R1


------------------------------48 Query

select R1.Make ,NumberOfModels from

(SELECT        Makes.Make, COUNT(*) AS NumberOfModels
		FROM            Makes INNER JOIN
								 MakeModels ON Makes.MakeID = MakeModels.MakeID
		GROUP BY Makes.Make)As R1
Where NumberOfModels = (select Max(NumberOfModels) as MaxNumberOfModels
from
(

		SELECT        Makes.Make, COUNT(*) AS NumberOfModels
		FROM            Makes INNER JOIN
								 MakeModels ON Makes.MakeID = MakeModels.MakeID
		GROUP BY Makes.Make
		
) R1) 


-- Get the highest Manufacturers manufactured the highest number of models , 
-- remember that they could be more than one manufacturer have the same high number of models


SELECT        Makes.Make, COUNT(*) AS NumberOfModels
		FROM            Makes INNER JOIN
								 MakeModels ON Makes.MakeID = MakeModels.MakeID
		GROUP BY Makes.Make

		having COUNT(*) = (

										select Max(NumberOfModels) as MaxNumberOfModels
										from
										(

												SELECT      MakeID, COUNT(*) AS NumberOfModels
												FROM       
																		 MakeModels
												GROUP BY MakeID
												
										) R1

							)




SELECT       Top 1 Makes.Make, COUNT(*) AS NumberOfModels
FROM            Makes INNER JOIN
					 MakeModels ON Makes.MakeID = MakeModels.MakeID
GROUP BY Makes.Make
Order by NumberOfModels Desc



---------------------------------------- 49thQuery

SELECT        Makes.Make, COUNT(*) AS NumberOfModels
		FROM            Makes INNER JOIN
								 MakeModels ON Makes.MakeID = MakeModels.MakeID
		GROUP BY Makes.Make

		having COUNT(*) = (

										select Min(NumberOfModels) as MaxNumberOfModels
										from
										(

												SELECT      MakeID, COUNT(*) AS NumberOfModels
												FROM       
																		 MakeModels
												GROUP BY MakeID
												
										) R1

							)


-- Get the Lowest  Manufacturers manufactured the lowest number of models , 
-- remember that they could be more than one manufacturer have the same Lowest  number of models


SELECT        Makes.Make, COUNT(*) AS NumberOfModels
		FROM            Makes INNER JOIN
								 MakeModels ON Makes.MakeID = MakeModels.MakeID
		GROUP BY Makes.Make

		having COUNT(*) = (

										select min(NumberOfModels) as MaxNumberOfModels
										from
										(

												SELECT      MakeID, COUNT(*) AS NumberOfModels
												FROM       
																		 MakeModels
												GROUP BY MakeID
												
										) R1

							)


							-----------------------------------50th Query

Select NewID(), * from FuelTypes
order by NewID()

-- Get all FuelTypes , each time the result should be showed in random order
-- Note that the NewID() function will generate GUID for each row 

select * from FuelTypes
order by NewID()



