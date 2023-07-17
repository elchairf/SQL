

Use AdventurWorks2014;

select top 5 * from Person.Person;
select top 5 * from HumanResources.Employee;


-- צרו פרוצדורה המקבלת את מספר העובד (BusinessEntityID מטבלת Employee) ומחזירה את רשימת כל המנהלים שלו לפי ההיררכיה הניהולית

-- טבלה זמנית
drop table #temp;
select HR.[BusinessEntityID]
		,P.FirstName
		,P.MiddleName
		,P.LastName
		,HR.[JobTitle]
	   ,HR.OrganizationNode 
	   ,isnull(HR.[OrganizationNode].ToString(),'/') as 'OrganizationNode_string'
	   ,HR.OrganizationLevel 
	   ,HR.[OrganizationNode].GetLevel() as 'Org_Level'
	   ,HR.[OrganizationNode].GetAncestor(1).ToString() as 'Ancestor_string'
Into #temp
from HumanResources.Employee HR
left join (select BusinessEntityID, 
			 FirstName,
			 MiddleName,
			 LastName from Person.Person) P
on HR.BusinessEntityID=P.BusinessEntityID
order by HR.OrganizationNode;

select * from #temp;


-- יצירת פרוצדורה
drop proc "Employees_managers";
create proc "Employees_managers"
-- הצהרה על משתנים בכניסה לפרוצדורה
@BusinessEntityID int
as
begin
declare @OrganizationNode_level int,
		@Ancestor_string varchar(50),
		@query_name varchar (200),
		@query_JobTitle Varchar(50)
		
		
-- איתחול משתנים
set @OrganizationNode_level=(select Org_Level from  #temp where BusinessEntityID=@BusinessEntityID)
set @Ancestor_string=(select Ancestor_string from  #temp where BusinessEntityID=@BusinessEntityID)

-- יצירת טבלה ריקה
DROP TABLE Managers;  
CREATE TABLE Managers (Org_level int
					   ,Manager_name varchar(200)
					   ,Manager_Job_title Varchar(50)
					   ,Ancestor Varchar(50)
					   );

-- כניסה ללולאה
while @OrganizationNode_level>=1
begin
           -- הצבת שם מנהל במשתנה
           set @query_name=(select concat(FirstName,'; ',MiddleName,'; ',LastName) as 'Manager_name' 
							from #temp
							where OrganizationNode_string=@Ancestor_string)

		-- הצבת תיאור תפקיד מנהל במשתנה
			SET @query_JobTitle=(select JobTitle
								from #temp
								where OrganizationNode_string=@Ancestor_string)
								
			
			
		-- הצגת הערכים שמוזנים למשתנים - לא חובה אבל כדאי לבחינת הדאטה
			PRINT @query_name
			print @query_JobTitle
			print @OrganizationNode_level
			print @Ancestor_string
			
			-- איכלוס ערכים בטבלה הריקה מתוך המשתנים
			INSERT INTO Managers 
			VALUES (@OrganizationNode_level,@query_name,@query_JobTitle,@Ancestor_string)
			
	
		-- קידום משתנים 
			set @OrganizationNode_level=@OrganizationNode_level-1
			
			set @BusinessEntityID=(select BusinessEntityID 
								   from #temp 
								   where OrganizationNode_string=@Ancestor_string)
								   
			set @Ancestor_string=(select OrganizationNode.GetAncestor(1).ToString() as 'Ancestor_string' 
				    			  from #temp 
								  where BusinessEntityID=@BusinessEntityID)
										
end
		
		select * from Managers
		order by Org_level;
end
		
go

	
exec Employees_managers 120;

select *  from #temp
where OrganizationNode_string in ('/3/1/11/','/3/1/','/3/','/') or BusinessEntityID=120

