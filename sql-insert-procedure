-- =============================================
-- Author: Chun, Naon
-- Create date: 12/16/2022
-- Description: 
-- Code Reviewer:

-- MODIFIED BY: Chun, Naon
-- MODIFIED DATE: 12/29/2022
-- Code Reviewer:
-- Note:
-- =============================================


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


/*----- TEST CODE -----

	Declare @AttorneyLanguages dbo.LanguageNames
	Insert into @AttorneyLanguages (Name)
	Values ('Mexican Spanish'), ('Cree')
	Select * From @AttorneyLanguages



	Declare	 	@Id int
				,@Practice nvarchar(255) = 'JCS Immigration and Visa Law Office'
				,@LocationTypeId int = 3
				,@LineOne nvarchar(255) = '2975 Wilshire Blvd'
				,@LineTwo nvarchar(255) = 'Suite 352'
				,@City nvarchar(255) = 'Los Angeles'
				,@Zip nvarchar(50) = '90010'
				,@StateId int = 5
				,@Latitude float = 34.063
				,@Longitude float = -118.357
				,@CreatedBy int = 1
				,@ModifiedBy int = 1
				,@Bio nvarchar(4000) = 'Citizenship legal assistance, Family-based immigration assistance, Green card legal assistance, Green card attorney, Immigration Consultation, Marriage green card, USCIS representation'
				,@Phone nvarchar(20) = '(323)380-8034'
				,@Email nvarchar(255) = null
				,@Website nvarchar(255) = 'www.newwebsite.com'
				

	Execute dbo.Attorneys_Insert
							@AttorneyLanguages
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
							,@Id OUTPUT

Execute dbo.Attorneys_SelectAll_Paginated 0, 10

Select * From dbo.Locations

select *
from dbo.languages
where name like '%Spanish%'
--- END TEST CODE --- */


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
