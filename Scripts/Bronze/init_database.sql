/*
=====================================
Create Database and Schemas
=====================================
Script Purpose:
	This script creates a new database named 'DataWarehouse' after checking if it aleady exists.
	If the database exists, it is dropped and recreated.
	Additionally, the script sets up three schemas within the database: 'bronze', 'silver', and 'gold'.

WARNING:
	Running this script will dro the entire 'DataWarehouse' database if it exists.
	All data will be deleted. Proceed with caution and ensure you have proper backups befor running this script.

*/

USE master;
GO

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
Begin
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;

CREATE DATABASE DataWarehouse;

USE DataWarehouse;
GO

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO