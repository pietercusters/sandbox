CREATE TRIGGER [dbo].[trg_dbo.Employee$InsteadOfInsert]
ON [dbo].[Employee]

INSTEAD OF INSERT 
AS

BEGIN
--	SET NOCOUNT ON

    -- Update existing rows
	UPDATE E
	SET
	     E.LastModifiedDate = GETUTCDATE()
	    ,E.FirstName = I.FirstName
	    ,E.LastName = I.LastName

	FROM dbo.Employee E
	INNER JOIN INSERTED I
	    ON E.EmployeeId = I.EmployeeId

    -- Insert new rows
	INSERT INTO dbo.Employee (
	     FirstName
	    ,LastName
	    ) VALUES (
            SELECT
                 I.FirstName
                ,I.LastName

            FROM dbo.Employee E
            LEFT JOIN INSERTED I
                ON E.EmployeeId = I.EmployeeId

            WHERE E.EmployeeId IS NULL
		)
END