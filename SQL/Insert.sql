ALTER proc [dbo].[Attorneys_Insert]
		@AttorneyLanguages dbo.LanguageNames READONLY					
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
	   ,@Id int OUTPUT

as

BEGIN

	DECLARE @LocationId int
	EXECUTE dbo.Locations_Insert 
				 @LocationTypeId
				,@LineOne
				,@LineTwo
				,@City
				,@Zip
				,@StateId
				,@Latitude
				,@Longitude
				,@CreatedBy
				,@ModifiedBy
				,@LocationId OUTPUT

	INSERT INTO dbo.AttorneyProfiles
			   ([PracticeName]
			   ,[LocationId]
			   ,[Bio]
			   ,[Phone]
			   ,[Email]
			   ,[Website]
			   ,[CreatedBy])
		 VALUES
				(@Practice
				,@LocationId
				,@Bio
				,@Phone
				,@Email
				,@Website
				,@CreatedBy)	   

		SET @Id = SCOPE_IDENTITY()

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
