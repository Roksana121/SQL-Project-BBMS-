                                  ------SQL PROJECT----------
								Blood Bank Management--System
								-----Project By----
								     Roksana Afroz
								-Trainee Id: 1266242-
								-Batch ID: ESAD-CS/PNTL-M/49/01-
						 --------------------------------------
-----Executing File--DML---

USE master
GO

USE BloodBankManagementSystem_DB
GO

Select * From tbl_Blood_Donor
GO
Select * From tbl_Recipient
GO
Select * From tbl_BB_Manager
GO
Select * From tbl_Recording_Staff
GO
Select * From tbl_Blood_Specimen
GO
Select * From tbl_DiseaseFinder
GO
Select * From tbl_Hospital_InfO
GO
Select * From tbl_City
GO


--JOIN QUERY with Group Query to find out Recording_Staff and Recipient wise Blood Donor list and Use Having QUERY.

SELECT reco .reco_Name,reci.reci_Name,COUNT(bd.bd_Name) 'Total BloodDonor '  FROM tbl_Recording_Staff reco
JOIN tbl_Blood_Donor bd ON bd.reco_ID=reco .reco_ID
JOIN tbl_Recording_Staff reco ON reco.bd_ID =bd.bd_ID 
JOIN tbl_Recipient reci ON reci.reci_ID=recibd.reci_ID
GROUP BY reco .reco_Name ,reci.reci_Name
HAVING COUNT(bd.bd_Name) >=1
GO


----SUB Query recipients and donors names having the same blood group registered on the same date.

SELECT  bd_Name FROM (SELECT DISTINCT bd.bd_Name ,COUNT(reci.reci_Name) 'Total BloodDonor' FROM tbl_Blood_Donor bd
JOIN tbl_Blood_Donor bd ON bd.reco_ID=reco .reco_ID
JOIN tbl_Recording_Staff reco ON reco.bd_ID =bd.bd_ID 
JOIN tbl_Recipient reci ON reci.reci_ID=recibd.reci_ID
where tbl_Blood_Donor.bd_Bgroup = tbl_Recipient.bd_Bgroup  and 
where tbl_Blood_Donor.bd_reg_date = tbl_Recipient.bd_reg_date
GO

--SELECT INTO STATENENT


SELECT M_ID,M_Name INTO tbl_BB_ManagerCopy FROM tbl_BB_Manager
GO
--TEST
SELECT * FROM tbl_BB_ManagerCopy
GO

--UPDATE QUERY --
update tbl_City set City_name = 'Savar' where City_ID = 1200
GO

--TEST 
SELECT * FROM tbl_CityCopy
GO

---DELETE QUERY

DELETE FROM tbl_Blood_SpecimenCopy WHERE Blood_Specimen=1001
GO
--TEST 
SELECT * FROM tbl_Blood_SpecimenCopy
GO


----CAST
SELECT CAST('01-June-2019 10:00 AM' AS DATE) AS 'Date'
GO
-----CONVERT
SELECT CONVERT(TIME,'01-June-2019 10:00 AM') AS 'Time'
GO
					
--DISTINCT,BETWEEN
SELECT DISTINCT bd.bd_Name FROM tbl_Blood_Donor
WHERE bd.bd_ID BETWEEN 121212 AND 121313 
GO
----Alter table Recipient
Alter table tbl_Recipient
ADD reci_Sex varchar(50)
-----
--ROLLUP----

SELECT reco .reco_Name,reci.reci_Name,COUNT(bd.bd_Name) 'Total BloodDonor '  FROM tbl_Recording_Staff reco
JOIN tbl_Blood_Donor bd ON bd.reco_ID=reco .reco_ID
JOIN tbl_Recording_Staff reco ON reco.bd_ID =bd.bd_ID 
JOIN tbl_Recipient reci ON reci.reci_ID=recibd.reci_ID
GROUP BY reco .reco_Name ,reci.reci_Name with ROLLUP
GO
-------------CTE

WITH CTE_Recording_StaffRecipientBlood_Donor(reco_Name,reci.reci_Name,bd.bd_Name)
AS
(
SELECT reco .reco_Name,reci.reci_Name,bd.bd_Name  FROM tbl_Recording_Staff reco
JOIN tbl_Blood_Donor bd ON bd.reco_ID=reco .reco_ID
JOIN tbl_Recording_Staff reco ON reco.bd_ID =bd.bd_ID 
JOIN tbl_Recipient reci ON reci.reci_ID=recibd.reci_ID
)
SELECT * FROM CTE_Recording_StaffRecipientBlood_Donor
Go

SELECT  bd_Name FROM (SELECT DISTINCT bd.bd_Name ,COUNT(reci.reci_Name) 'Total Students' FROM tbl_Blood_Donor bd
JOIN tbl_Blood_Donor bd ON bd.reco_ID=reco .reco_ID
JOIN tbl_Recording_Staff reco ON reco.bd_ID =bd.bd_ID 
JOIN tbl_Recipient reci ON reci.reci_ID=recibd.reci_ID
where tbl_Blood_Donor.bd_Bgroup = tbl_Recipient.bd_Bgroup  and 
O By tbl_Blood_Donor.bd_reg_date = tbl_Recipient.bd_reg_date
GO
---------
SELECT DISTINCT bd.bd_ID  ,bd.bd_Name ,bd.bd_reg_date,reco.reco_Name,reci.reci_Name
FROM tbl_Blood_Donor bd
JOIN Blood_Donor ON bd.reco_ID=reco .reco_ID
JOIN Recording_Staff reco ON reci.reci_ID=recibd.reci_ID
JOIN Recipient reci ON reci.reci_ID=recibd.reci_ID
ORDER BY bd.bd_reg_date ASC
GO

--TEST
SELECT * FROM View_AllofCity
GO
---test trigger

SELECT * FROM Hospital_Info
SELECT * FROM Recipient 
GO
DELETE Recipient  WHERE id=10001
GO


------------------------------------------------------







