
use master

DROP DATABASE IF EXISTS Data_Analyst_Project
GO

CREATE DATABASE  Data_Analyst_Project
GO

USE Data_Analyst_Project
GO

CREATE TABLE [dbo].DimBorough(
	BoroughCode varchar(5) PRIMARY KEY, ------  transform 2 to 5 text
	BoroughName varchar(50) ------  transform 20 to 50 text
	)
GO

CREATE TABLE  DimIssuer (
IssuerKey INT Primary Key,
IssuerID VARCHAR(20),
IssuingAgencyCode varchar(5)
)
GO

CREATE TABLE DimIssuingAgency (
IssuingAgencyCode varchar(5) Primary Key, 
IssuingAgencyName VARCHAR(100),
IssuingAgencyAverageYearlySalary money
)
GO

CREATE TABLE DimLocation (
LocationKey int Primary Key,
BoroughCode VARCHAR(2),
StreetCode VARCHAR(10),
StreetName VARCHAR(10),
HouseNumber VARCHAR(20),
City VARCHAR(20),
StateCode  VARCHAR(2)
)
GO

ALTER TABLE DimLocation
ALTER COLUMN  StreetName VARCHAR(100)
sp_Help DimLocation



CREATE TABLE DimBodyType (
BodyTypeCode VARCHAR(5) Primary Key,
BodyTypeName varchar(50)
)
GO

CREATE TABLE DimPlateType (
PlateTypeCode VARCHAR(5) Primary Key,
PlateTypeName varchar(40)
)
GO

CREATE TABLE DimState  (
StateCode VARCHAR(5) Primary Key,
StateName varchar(40)
)
GO

CREATE TABLE DimColor (
ColorCode VARCHAR(10) Primary Key,
ColorName varchar(40)
)
GO


CREATE TABLE DOFParking (
CODE INT Primary Key,
Defenition varchar(150),
Fine varchar(150),
)
GO 

SP_HELP DOFParking

CREATE TABLE DimVehicle (
VehicleKey INT Primary Key,
PlateID VARCHAR(10),
RegistrationStateCode VARCHAR(2),
PlateTypeCode VARCHAR(3),
BodyTypeCode VARCHAR(5),
BodyMakeName VARCHAR(5),
VehicleColorCode VARCHAR(10),
vehicleYear VARCHAR(4),
ExpirationDate VARCHAR(8)
)
GO

sp_Help DimVehicle



CREATE TABLE FactParkingViolation (
ParkingViolationKey INT Primary Key,
[Summons Number] varchar(50),
PlateID  varchar(50),
[Issue Date] varchar(50), --Transform to Date Data Type
[Violation Code] varchar(50),
[Violation Time] varchar(50),
[Violation In Front Of Or Opposite]  varchar(50),
VehicleKey INT,
IssuerKey INT,
LocationKey INT
)
GO

ALTER TABLE FactParkingViolation
ADD [Time Group] VARCHAR(50)

sp_Help FactParkingViolation



-----------------
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME !='players'
-----
SELECT *
from SYS.all_views

------------------------ CHECK TABLES CONTENT AFTER SSIS PROCESS


TRUNCATE TABLE DimIssuingAgency

SELECT *
FROM FactParkingViolation
--where year([Issue Date]) between 2015 and 2016

