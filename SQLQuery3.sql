Create View  MyVehicleMasterDetails As
select ID, V.MakeID, Make , V.ModelID,ModelName, V.SubModelID, SubModelName, V.BodyID, BodyName,Vehicle_Display_Name, Year, V.DriveTypeID,  DriveTypeName,Engine, Engine_CC, Engine_Cylinders, Engine_Liter_Display ,V.FuelTypeID,FuelTypeName,NumDoors
from VehicleDetails V join 
Makes M ON V.MakeID = M.MakeID join
MakeModels MM ON MM. ModelID = V.ModelID join
SubModels S ON S.SubModelID = V.SubModelID join
Bodies B On B.BodyID=V.BodyID Join 
DriveTypes D ON D.DriveTypeID= V.DriveTypeID Join
FuelTypes F On F.FuelTypeID = V.FuelTypeID

select * from MyVehicleMasterDetails


select * from VehicleMasterDetails

select Count(*) from VehicleDetails;
select Count(*) from VehicleMasterDetails;
select Count(*) from MyVehicleMasterDetails;

Select Count (*) from VehicleDetails

Select Count (*) from VehicleDetails 
where DriveTypeID is  NULL

Select Count (*) from 
(select   v.ID, v.MakeID, ma.Make,v.ModelID, m.ModelName, v.SubModelID, s.SubModelName, v.BodyID,b.BodyName,v.Vehicle_Display_Name,v.Year, v.DriveTypeID,d.DriveTypeName,v.Engine, v.Engine_CC, v.Engine_Cylinders, v.Engine_Liter_Display, v.FuelTypeID, f.FuelTypeName,v.NumDoors

from VehicleDetails v
join SubModels s
on s.SubModelID = v.SubModelID

join MakeModels m
on s.ModelID = m.ModelID

join Makes ma
on m.MakeID = ma.MakeID

left join Bodies b
on v.BodyID = b.BodyID

left join DriveTypes d
on d.DriveTypeID = v.DriveTypeID

left join FuelTypes f
on f.FuelTypeID = v.FuelTypeID)AS SubQueryAlias