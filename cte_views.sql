USE AdventureWorks2019
GO
 
CREATE VIEW Person.vPerson AS
	SELECT 
		Person.Title
		,Person.FirstName
		,Person.LastName
		,EmailAddress.EmailAddress
	FROM 
		Person.Person 
	JOIN 
		Person.EmailAddress
		ON 
			Person.BusinessEntityID = EmailAddress.BusinessEntityID
;
GO

WITH TestCTE1 AS
	(
	SELECT
		BusinessEntityID
		,FirstName
		,LastName
	FROM 
		Person.Person
	),

TestCTE2 AS
	(
	SELECT
		BusinessEntityID
		,PhoneNumber
	FROM 
		Person.PersonPhone
	)

SELECT
	Employee.BusinessEntityID
	,Employee.NationalIDNumber
	,Employee.JobTitle
	,TestCTE1.Firstname
	,TestCTE1.LastName
	,TestCTE2.PhoneNumber
FROM	
	HumanResources.Employee
LEFT JOIN 
	TestCTE1 
	ON
		Employee.BusinessEntityID = TestCTE1.BusinessEntityID
LEFT JOIN
	TestCTE2 
	ON	
	 	Employee.BusinessEntityID = TestCTE2.BusinessEntityID




