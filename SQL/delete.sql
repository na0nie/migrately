ALTER proc [dbo].[Attorneys_DeleteProfiles]
		@Id int

AS

BEGIN

Declare @LocationId int = (SELECT LocationId FROM dbo.AttorneyProfiles
						   WHERE Id = @Id)

	DELETE FROM dbo.AttorneyLanguages
	WHERE AttorneyProfileId= @Id

	DELETE FROM dbo.AttorneyProfiles
	WHERE Id = @Id

	DELETE from dbo.Locations
	WHERE Id = @LocationId

END
