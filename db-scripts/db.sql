IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'app')
BEGIN
    CREATE DATABASE app;
END
GO

USE app;
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'KobankUsers')
BEGIN
    EXEC('CREATE SCHEMA KobankUsers');
END
GO

CREATE TABLE [KobankUsers].[Users]
(
    [UserId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
    [Email] NVARCHAR(256) NOT NULL,
    [Password] NVARCHAR(256) NOT NULL,
    [Branch] NVARCHAR(100) NOT NULL,
    [FirstName] NVARCHAR(100) NOT NULL,
    [LastName] NVARCHAR(100) NOT NULL,
    [MiddleName] NVARCHAR(100) NULL,
    [CreatedAt] DATETIMEOFFSET NOT NULL,
    [CreatedBy] NVARCHAR(100) NOT NULL
)
GO