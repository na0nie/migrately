-- =============================================
-- Author: Chun, Naon
-- Create date:
-- Description: 
-- Code Reviewer:

-- MODIFIED BY: Chun, Naon
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================


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

/*----- TEST CODE -----
	Declare @Id int = 2;
	Declare @AttorneyLanguages dbo.LanguageNames
	Insert into @AttorneyLanguages (Name)
	Values ('American English'), ('Mexican Spanish')

	Declare	 	 @Practice nvarchar(255) = 'Goldstein Immigration Lawyers'
				,@LocationTypeId int = 3
				,@LineOne nvarchar(255) = '611 Wilshire Blvd'
				,@LineTwo nvarchar(255) = 'Suite 317'
				,@City nvarchar(255) = 'Los Angeles'
				,@Zip nvarchar(50) = '90017'
				,@StateId int = 5
				,@Latitude float = 34.0483839
				,@Longitude float = -118.2563018
				,@CreatedBy int = 1
				,@ModifiedBy int = 1
				,@Bio nvarchar(4000) = 'Asylum, Citizenship, Deportation defense litigation, Employment-based immigration legal assistance, family-based immigration assistance, student visa, visitor visa, work visa legal assistance'
				,@Phone nvarchar(20) = '(213)262-2000'
				,@Email nvarchar(255) = null
				,@Website nvarchar(255) = 'www.immigrationlawyerslosangeles.com'			

	Execute dbo.Attorneys_Update
							 @Id
							,@Practice
							,@LocationTypeId
							,@LineOne
							,@LineTwo
							,@City
							,@Zip
							,@StateId
							,@Latitude
							,@Longitude
							,@CreatedBy
							,@ModifiedBy
							,@Bio
							,@Phone
							,@Email
							,@Website
							,@AttorneyLanguages

	Execute dbo.Attorneys_SelectAll_Paginated 0, 10

	Select * From dbo.Locations

*/

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
