USE MASTER;
GO

IF EXISTS( SELECT 1 FROM sys.databases WHERE name = 'DatawarehouseAnalytics')
BEGIN
    ALTER DATABASE DatawarehouseAnalytics SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DatawarehouseAnalytics;
    PRINT 'Dropped existing database: DatawarehouseAnalytics';
END;
GO

CREATE DATABASE DatawarehouseAnalytics;