CREATE TABLE dbo.Employee (
     InsertDate DATETIME NOT NULL DEFAULT GETUTCDATE()
    ,LastModifiedDate DATETIME NOT NULL DEFAULT GETUTCDATE()
    ,EmployeeId UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID()
    ,FirstName VARCHAR(50)
    ,LastName VARCHAR(50)
)

INSERT INTO dbo.Employee (
     FirstName
    ,LastName
) VALUES
    ('Dane', 'Linssen')
    ('Pieter', 'Custers')