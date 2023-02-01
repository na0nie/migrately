ALTER proc [dbo].[Attorneys_Update]
	    @Id int
       ,@Practice nvarchar(255) = null
	   ,@LocationTypeId int
	   ,@LineOne nvarchar(255)
	   ,@LineTwo nvarchar(255)
	   ,@City nvarchar(255)
	   ,@Zip nvarchar(50)
	   ,@StateId int
	   ,@Latitude float
	   ,@Longitude float
	   ,@CreatedBy int
	   ,@ModifiedBy int
	   ,@Bio nvarchar(4000) = null
	   ,@Phone nvarchar(20) = null
	   ,@Email nvarchar(255) = null
	   ,@Website nvarchar(255) = null
	   ,@AttorneyLanguages dbo.LanguageNames READONLY	

as

BEGIN

	DECLARE @dateNow datetime2 = getutcdate();
	DECLARE @LocationId int = (SELECT LocationId 
							   FROM dbo.AttorneyProfiles
							   WHERE Id = @Id)

	UPDATE [dbo].[Locations]
	SET [LocationTypeId] = @LocationTypeId
		,[LineOne] = @LineOne
		,[LineTwo] = @LineTwo
		,[City] = @City
		,[Zip] = @Zip
		,[StateId] = @StateId
		,[Latitude] = @Latitude
		,[Longitude] = @Longitude
		,[CreatedBy] = @CreatedBy
		,[ModifiedBy] = @ModifiedBy
		,[DateModified] = @dateNow

	WHERE Id = @LocationId

	UPDATE [dbo].[AttorneyProfiles]
	SET [PracticeName] = @Practice
		,[LocationId] = @LocationId
		,[Bio] = @Bio
		,[Phone] = @Phone
		,[Email] = @Email
		,[Website] = @Website
		,[CreatedBy] = @CreatedBy
		,[DateModified] = @dateNow
	
	WHERE Id = @Id


    DELETE FROM [dbo].[AttorneyLanguages]
	WHERE AttorneyProfileId = @Id

	INSERT INTO dbo.AttorneyLanguages
					(AttorneyProfileId
					,LanguageId)
		SELECT @Id
			   ,la.Id
		FROM dbo.Languages as la 
		WHERE EXISTS (Select 1
				      FROM @AttorneyLanguages as al
					  WHERE al.Name = la.Name)


END
