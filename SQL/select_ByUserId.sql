ALTER proc [dbo].[Attorneys_SelectByUserId]
					@UserId int


AS
/*----- TEST CODE -----

EXECUTE dbo.Attorneys_SelectByUserId 238

*/

BEGIN

	SELECT  ap.Id
		   ,ap.PracticeName
		   ,l.Id
		   ,lt.Id
		   ,lt.[Name]
		   ,l.LineOne
		   ,l.LineTwo
		   ,l.City
		   ,l.Zip
		   ,l.StateId
		   ,s.Name
		   ,l.Latitude
		   ,l.Longitude
		   ,l.DateCreated
		   ,l.DateModified
		   ,l.CreatedBy
		   ,l.ModifiedBy
		   ,ap.Bio
		   ,ap.Phone
		   ,ap.Email
		   ,ap.Website
		   ,Languages = (
						  SELECT la.Id, la.Code, la.Name
						  FROM dbo.AttorneyLanguages as al 
							   inner join dbo.Languages as la
								  on al.LanguageId = la.Id
						  WHERE al.AttorneyProfileId = ap.Id
						  FOR JSON AUTO
						)
			,ap.DateCreated
			,ap.DateModified
			,TotalCount = COUNT(1) OVER()

	FROM dbo.AttorneyProfiles as ap inner join dbo.Locations as l
				on ap.LocationId = l.Id
			inner join dbo.LocationTypes as lt 
				on l.LocationTypeId = lt.Id
			inner join dbo.States as s
				on l.StateId = s.Id

	WHERE ap.IsActive = 1  and ap.CreatedBy = @UserId
	

	ORDER BY ap.Id

END
