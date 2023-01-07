-- =============================================
-- Author: Chun, Naon
-- Create date:
-- Description: 
-- Code Reviewer: 

-- MODIFIED BY:
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================

ALTER proc [dbo].[Attorneys_DeleteProfiles]
		@Id int

AS
/* --- TEST CODE ---

Execute dbo.Attorneys_DeleteProfiles 18

Execute dbo.Attorneys_SelectAll_Paginated 0, 20

*/
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
