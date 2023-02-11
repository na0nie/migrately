ALTER proc [dbo].[Attorneys_Delete]
		 @Id int
		

AS
/*----- TEST CODE -----

Execute dbo.Attorneys_Delete 1, 0

Select * FROM dbo.AttorneyProfiles
*/

BEGIN
	DECLARE @dateNow datetime2 = getutcdate();

	UPDATE [dbo].[AttorneyProfiles]
	SET [IsActive] = 0
		,[DateModified] = @dateNow
	
	WHERE Id = @Id
	

END
