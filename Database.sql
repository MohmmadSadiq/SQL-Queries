-- Create a new database (optional, you can run this on an existing database)
CREATE DATABASE VehicleDB;
GO

-- Use the created database
USE VehicleDB;
GO

-- 1. Create Lookup Tables (those that don't depend on other tables)

-- FuelTypes Table
CREATE TABLE FuelTypes (
    FuelTypeID INT PRIMARY KEY IDENTITY(1,1),
    FuelTypeName NVARCHAR(50) NOT NULL
);
GO

-- DriveTypes Table
CREATE TABLE DriveTypes (
    DriveTypeID INT PRIMARY KEY IDENTITY(1,1),
    DriveTypeName NVARCHAR(50) NOT NULL
);
GO

-- Vehicle Bodies Table
CREATE TABLE Bodies (
    BodyID INT PRIMARY KEY IDENTITY(1,1),
    BodyName NVARCHAR(50) NOT NULL
);
GO

-- Makes (Manufacturers) Table
CREATE TABLE Makes (
    MakeID INT PRIMARY KEY IDENTITY(1,1),
    Make NVARCHAR(50) NOT NULL
);
GO

-- 2. Create Tables that depend on the previous tables

-- MakeModels Table (Depends on Makes)
CREATE TABLE MakeModels (
    ModelID INT PRIMARY KEY IDENTITY(1,1),
    MakeID INT NOT NULL,
    ModelName NVARCHAR(50) NOT NULL,
    CONSTRAINT FK_MakeModels_Makes FOREIGN KEY (MakeID) REFERENCES Makes(MakeID)
);
GO

-- SubModels Table (Depends on MakeModels)
CREATE TABLE SubModels (
    SubModelID INT PRIMARY KEY IDENTITY(1,1),
    ModelID INT NOT NULL,
    SubModelName NVARCHAR(50) NOT NULL,
    CONSTRAINT FK_SubModels_MakeModels FOREIGN KEY (ModelID) REFERENCES MakeModels(ModelID)
);
GO

-- 3. Create the Central Table (VehicleDetails)
-- This table depends on all other tables

CREATE TABLE VehicleDetails (
    ID INT PRIMARY KEY IDENTITY(1,1),
    MakeID INT NOT NULL,
    ModelID INT NOT NULL,
    SubModelID INT NULL, -- SubModelID can be NULL (optional)
    BodyID INT NOT NULL,
    Vehicle_Display_Name NVARCHAR(150) NULL,
    [Year] SMALLINT NOT NULL,
    DriveTypeID INT NOT NULL,
    Engine NVARCHAR(100) NULL,
    Engine_CC INT NULL,
    Engine_Cylinders INT NULL,
    Engine_Liter_Display NVARCHAR(20) NULL,
    FuelTypeID INT NOT NULL,
    NumDoors INT NULL,

    -- Define Foreign Key constraints
    CONSTRAINT FK_VehicleDetails_Makes FOREIGN KEY (MakeID) REFERENCES Makes(MakeID),
    CONSTRAINT FK_VehicleDetails_MakeModels FOREIGN KEY (ModelID) REFERENCES MakeModels(ModelID),
    CONSTRAINT FK_VehicleDetails_SubModels FOREIGN KEY (SubModelID) REFERENCES SubModels(SubModelID),
    CONSTRAINT FK_VehicleDetails_Bodies FOREIGN KEY (BodyID) REFERENCES Bodies(BodyID),
    CONSTRAINT FK_VehicleDetails_DriveTypes FOREIGN KEY (DriveTypeID) REFERENCES DriveTypes(DriveTypeID),
    CONSTRAINT FK_VehicleDetails_FuelTypes FOREIGN KEY (FuelTypeID) REFERENCES FuelTypes(FuelTypeID)
);
GO