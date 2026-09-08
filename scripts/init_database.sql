/*
================================================================
create database and schema
================================================================
script purpose:
  This script will create a new database  named datawarehouse after checking if it already exists.
  if the database exists, it is dropped and recreate the database, the script sets up three schemas
  within the database: bronze,silver,gold.

Warning:
running this script will drop the entire datawarehouse database if it exists.
all data in the database will permanently deleted.proceed with caution
and ensure you have proper backups before running this script.
*/

-- create Data Base "Data Warehouse"
use master;
go

--drop and recreate the data warehouse  data base
if exists(select 1 from sys.databases where name = 'DataWarehouse')
begin
	alter DATABASE DataWarehouse set SINGLE_USER with rollback immediate;
	drop DATABASE DataWarehouse;
end;
go
-- create new database
create database DataWarehouse;
go
use DataWarehouse;
go
create schema bronze;
go
create schema silver;
go
create schema gold;
go
