CREATE PROC [dbo].[AddPeople]
@count AS INTEGER
AS
BEGIN
WHILE (@count > 0)
	BEGIN
		DECLARE @fname varchar(60)
		DECLARE @lname varchar(60)
		DECLARE @email varchar(75)
		DECLARE @address varchar(120)
		DECLARE @zip char(5)
		DECLARE @areacode char(3)
		DECLARE @phone char(9)

		DECLARE @PersonID INTEGER

		SELECT TOP 1
			@fname = CustomerFname,
			@lname = CustomerLname,
			@email = Email,
			@address = CustomerAddress,
			@zip = CustomerZIP,
			@areacode = AreaCode,
			@phone = Phone
		FROM PEOPLE;

		EXEC @PersonID = AddPerson @fname = @fname, @lname = @lname, @email = @email, @address = @address, @zip = @zip, @areacode = @areacode, @phone = @phone

		PRINT(@PersonID)
		
		DELETE TOP (1) FROM PEOPLE
		
		SET @count = @count -1 
	END
END