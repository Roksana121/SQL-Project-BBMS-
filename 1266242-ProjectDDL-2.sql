
/*
							              ------SQL PROJECT----------
								       ----Blood Bank Management System
								-          ----Project By----
								        --TraineeName: Roksana Afroz
							          -----Trainee Id: 1266242
							             ----Batch ID: ESAD-CS/PNTL-M/49/01
						             -----------------------------------------
*/
---Creating Object--DDL---

USE master
GO
DROP DATABASE IF EXISTS BloodBankManagementSystem_DB
Go
CREATE DATABASE BloodBankManagementSystem_DB
ON
( NAME='BloodBankManagementSystem_DB_Data_file',
FILENAME='C:\Users\HP\Desktop\1266242-Project\BloodBankManagementSystem_DB_Data.mdf',
SIZE=50MB,
MAXSIZE=100MB,
FILEGROW=15%
)
LOG ON
(
NAME='BloodBankManagementSystem_DB_Log_file',
FILENAME='C:\Users\HP\Desktop\1266242-Project\BloodBankManagementSystem_DB_Log.ldf',
SIZE=10MB,
MAXSIZE=50MB,
FILEGROW=10%
)
GO
USE  BloodBankManagementSystem_DB
GO

CREATE TABLE tbl_Blood_Donor

( bd_ID int NOT NULL PRIMARY KEY,
 bd_Name varchar(50) NOT NULL,
 bd_Age varchar(40),
 bd_Sex varchar(40),
 bd_Bgroup varchar(10),
 bd_reg_Date date NOT NULL,
 bd_PhNo bigint ,
 reco_ID int References tbl_Recording_Staff(reco_ID) NOT NULL,
 City_ID int References tbl_City(City_ID) NOT NULL
 )
 GO

CREATE TABLE tbl_Recipient

( reci_ID int NOT NULL PRIMARY KEY,
 reci_Name varchar(50) NOT NULL,
 reci_Age varchar(40),
 bd_Bgroup varchar(10)References tbl_Blood_Donor(bd_Bgroup ) NOT NUll,
 reci_Bqnty float ,
 reco_ID int References tbl_Recording_Staff(reco_ID) NOT NULL,
 City_ID int References tbl_City(City_ID) NOT NULL,
 M_ID  int References tbl_BB_Manager(M_ID)NOT NULL,
 reci_Sex varchar(40),
 bd_ID int NOT NULL References tbl_Blood_Donor(bd_ID) NOT NULL,
 bd_reg_Date date NOT NULL References tbl_Blood_Donor(bd_reg_Date) NOT NULL
 )
 GO
CREATE TABLE tbl_BB_Manager

( M_ID int NOT NULL PRIMARY KEY,
 M_Name varchar(50) NOT NULL

)
GO

CREATE TABLE tbl_ Recording_Staff

( reco_ID int NOT NULL PRIMARY KEY,
 reco_Name varchar(50) NOT NULL, 
  bd_ID int References tbl_Blood_Donor(bd_ID) NOT NULL
)
GO
CREATE TABLE  tbl_Blood_Specimen
(
  specimen_ID int NOT NULL PRIMARY KEY,
 bs_Bgroup varchar(10) NOT NULL,
 status   int,
 dfind_ID int References  tbl_ Disease_Finder(dfind_ID) NOT NULL,
 M_Id int References tbl_BB_Manager(M_ID) NOT NULL

)
GO
CREATE TABLE tbl_Disease_Finder
( dfind_ID int NOT NULL PRIMARY KEY,
 dfind_Name varchar(50) NOT NULL,
 dfind_PhNo bigint 
)
GO
CREATE TABLE tbl_Hospital_InfO
( hosp_ID int NOT NULL PRIMARY KEY,
 hosp_Name varchar(100) NOT NULL,
 hosp_needed_Bgroup varchar(10),
 hosp_needed_Bqnty  float,
 City_ID int References tbl_City(City_ID) NOT NULL,
 M_ID int  References tbl_BB_Manager(M_ID)NOT NULL,
 Hosp_PhNo bigint
 )
 GO
 CREATE TABLE tbl_City
( City_ID int NOT NULL,
 City_Name varchar(100) NOT NULL
)
GO

INSERT into tbl_Blood_Donor VALUES
(123333,'Arif',25,'M','B+','2020-12-17', 01712000000,101212,1100),
(124444,'Bilkis',35,'F','A+','2020-11-22',01712111111,101212,1100),
(125555,'Dulal',22,'M','O+','2020-01-04',01712222222,101312,1200),
(126666,'Emran',29,'M','O+','2020-07-19',01712333333,101412,1300),
(127777,'Forida',42,'F','A-','2020-12-24',01712444444,101412,1300),
(128888,'Hassan',44,'M','AB+','2020-08-28',01712555555,101212,1200),
(129999,'Jafrina',33,'F','AB-','2020-02-06',01712666666,101212,1400),
(121010,'Kalpona',31,'F','AB+','2020-09-10',0171777777,101312,1200),
(121212,'Lemon',24,'M','B+','2020-10-15',01712888888,101312,1500),
(121313,'Mamun',29,'M','O-','2020-12-17',01712999999,101212,1200)
GO
INSERT into tbl_Recipient VALUES
(10001,'Alif',25,'B+',1,101212,1100,1101,'M',123333,'2020-12-17'),
(10002,'Habib',44,'AB+',1,101312,1200,1106,'M',124444,'2020-08-28'),
(10003,'Farjana',42,'A-',5,101312,1300,1105,'F',125555,'2020-12-24'),
(10004,'Emrul',29,'O+',4,101212,1300,1104,'M',126666,'2020-07-19'),
(10005,'Jakia',33,'AB-',2,101412,1400,1107,'F',127777,'2020-02-06'),
(10006,'Kakoli',31,'AB+',3,101512,1200,1108,'F',128888,'2020-09-10'),
(10007,'Dani',22,'O+',2,101212,1200,1103,'M',129999,'2020-01-04'),
(10008,'Lalon',24,'B+',3,101412,1500,1109,'M',121010,'2020-10-15'),
(10009,'Bokul',35,'A+',1,101312,1100,1102,'F',121212,'2020-11-22'),
(10010,'Mahmud',29,'O-',4,101212,1200,1110,'M',121313,'2020-12-17')
GO
INSERT into tbl_BB_Manager VALUES
(102,'Amin' ),
(103,'Pollob' ),
(104,'Monir' ),
(105,'Josna' ),
(106,'Sisir'),
(107,'Jalal' ),
(108,'Shila' ),
(109,'Monika' ),
(110,'Jobaer' )
Go
INSERT into tbl_Recording_Staff VALUES
(1101,'Abir',123333),
(1102,'Hena',124444),
(1103,'Silvi',125555),
(1104,'Adrian',126666),
(1105,'Malek',127777),
(1106,'Abdul',128888),
(1107,'Jesmin',129999),
(1108,'Tina',121010),
(1109,'Lekha',121212),
(1110,'Monir',121313)
Go
INSERT into tbl_Blood_Specimen VALUES
(1001, 'B+', 1,11,101),
(1002, 'O+', 1,12,109),
(1003, 'AB+', 1,11,102),
(1004, 'O-', 1,13,103),
(1005, 'A+', 0,14,110),
(1006, 'A-', 1,13,107),
(1007, 'AB-', 1,15,104),
(1008, 'AB-', 0,11,108),
(1009, 'B+', 1,13,105),
(1010, 'O+', 0,12,106)
Go
INSERT into tbl_Disease_Finder VALUES
(11,'Pobon',01714804223),
(12,'Papon',01813804223),
(13,'Jafor',01912804223),
(14,'Milon',01716804223),
(15,'Monika',01517804223),
(16,'Rana',01917804123),
(17,'Suspita',01817804223),
(18,'Gita',01913804323),
(19,'Anamul',01811804423),
(20,'Yashin',01711804523)
GO
INSERT into tbl_Hospital_Info VALUES
(1,'PopularHospital', 'AB+',2,1100,101,01711567843),
(2,'CareHospital','O-',3,1200,103,01717567820),
(3,'Newlife','B+',1,1300,103,01912567830),
(4,'Bangladeshmedical','A-',2,1400,104,01811567810),
(5,'CiryHospital','AB-',5,1800,103,01911567890),
(6,'GreenHostital','O+',1,1300,106,01513678001),
(7,'SquareHospital','AB+',3,1300,102,01511567860),
(8,'BRBHospital','AB-',4,1200,106,01752567852),
(9,'Dhakamedical','B+',5,1500,109,01841567809),
(10,'Labaid','O-',1,1700,105,01967567855)
GO
INSERT into tbl_City VALUES
(1100,'Dhanmondi'),
(1200,'Savar'),
(1300,'Mohammadpur'),
(1400,'Gulistan'),
(1500,'Polton'),
(1600,'Panthopath'),
(1700,'Gulshan'),
(1800,'Hatirpul'),
(1900,'Kollanpur')
Go

---Create a View of recipients and donors names having the same blood group registered on the same date.

CREATE VIEW Blood_Donor_Recipient_SameBGrp
AS
select tbl_Blood_Donor.bd_Name,tbl_Recipient.reci_name,reco_Name 
from tbl_Recording_Staff
inner join tbl_Blood_Donor on tbl_Recording_Staff.reco_ID = tbl_Blood_Donor.reco_ID
inner join tbl_Recipient on tbl_Recording_Staff.reco_ID = tbl_Recipient.reco_ID
where tbl_Blood_Donor.bd_Bgroup = tbl_Recipient.bd_Bgroup  and
 tbl_Blood_Donor.bd_reg_date = tbl_Recipient.bd_reg_date
GO


----Create non clustered index ON
CREATE NONCLUSTERED INDEX NCI_bd_Bgroup 
ON tbl_Blood_Donor(bd_Bgroup )
GO
-- ---CREATE INDEX--
 CREATE CLUSTERED  INDEX IX_City_ID
 ON tbl_City(City_ID)
 GO

---create a  Table Valued Function  BloodDonor bloodgroup and Recipient bloodgroup having the same blood group
CREATE FUNCTION bd_BgroupBlood_DonorRecipient 
(
@bd_Bgroup varchar(10)

)
RETURNS TABLE
AS
RETURN
(
SELECT bd_Bgroup FROM tbl_Recipient bd_Bgroup
INNER JOIN tbl_Blood_Donor bd ON bd. bd_Bgroup=reci.bd_Bgroup
where reci.bd_Bgroup=@bd_Bgroup
)
GO


---Create  a Salar Valued FUNCTION the donors having the same blood groups required by the recipient staying in the same
---city along with recipient details.

  CREATE FUNCTION RecipientBlood_DonorCity
  (
    @Recipient INT
 )
  RETURNS @RecipientBlood_DonorCity TABLE
  (
 reci_ID int ,
 reci_name varchar(50) ,
 reci_age varchar(40),
 bd_Bgroup varchar(10),
 reci_Bqnty float ,
 reco_ID int ,
 City_ID int ,
 M_id  int ,
 reci_sex varchar(40),
 bd_reg_date date 
 )

 AS
 BEGIN
    INSERT @RecipientBlood_DonorCity
     SELECT reci_ID,reci_name,reci_age,bd_Bgroup,reci_Bqnty,reco_ID,City_ID,M_id,reci_sex,bd_reg_date
     FROM tbl_Recipient 
     WHERE reci_ID=@Recipient
     RETURN
 END
 GO





----create Trigger for Create on After Trigger for Update , Delete action
Create Trigger trUptadeDelete
On tbl_Recipient
After Update, Delete

As
Begin
       Print 'Trigger fried!!'
	   Rollback Transaction
End
Go
-----------

create trigger trHospital_info
On tbl_Hospital_Info
for insert
as
Begin
       IF UPDATE(Bqnty)
	   BEGIN
	   DECLARE @i INT,  --for hospId
				@q INT	 --for hosp_needed_Bqnty   
		SELECT @i=hosp_Id,@Bqnty= FROM deleted

		UPDATE Recipient
		SET Recipient =Recipient-@q
		WHERE hosp_Id =@i
	   End

End
Go
---Create an instead of insert trigger


CREATE TRIGGER trDisease_Finder
ON tbl_Disease_Finder
INSTEAD OF INSERT
AS
BEGIN

INSERT INTO tbl_Disease_Finder(dfind_ID,dfind_Name,dfind_PhNo)
SELECT dfind_ID,dfind_Name,dfind_PhNo
FROM inserted
END
GO
---Test the trigger to see if the instead of trigger works or not.
---We want to insert data through the tbl_Disease_Finder
--values before insert
SELECT * FROM tbl_Disease_Finder
GO
INSERT INTO tbl_Disease_Finder VALUES (20,'Yashin',01711804523)

GO
SELECT * FROM tbl_Disease_Finder
GO
--------------------------
--STORED PROCEDURE FOR INSERTING DATA TO tbl_BB_Manager Table

CREATE PROCEDURE sp_Inserttbl_BB_Manager
				 @M_Name VARCHAR(50)
AS
BEGIN
	INSERT INTO tbl_BB_Manager VALUES(@M_Name)
END
GO

EXEC sp_Inserttbl_BB_Manager 'Amin'
EXEC sp_Inserttbl_BB_Manager 'Amin' 
EXEC sp_Inserttbl_BB_Manager 'Pollob' 
EXEC sp_Inserttbl_BB_Manager  'Monir'
EXEC sp_Inserttbl_BB_Manager 'Josna'
EXEC sp_Inserttbl_BB_Manager 'Sisir'
EXEC sp_Inserttbl_BB_Manager 'Jalal'
EXEC sp_Inserttbl_BB_Manager 'Shila' 
EXEC sp_Inserttbl_BB_Manager 'Monika' 
EXEC sp_Inserttbl_BB_Manager 'Jobaer' 
GO

--STORED PROCEDURE FOR INSERTING DATA TO City TABLE 
CREATE PROC SP_insertingDataCity
			@City_Name NVARCHAR (100)
AS
BEGIN
	INSERT INTO tbl_City VALUES (@City_Name)
END
GO

EXEC SP_insertingDataCity 'Dhanmondi'
EXEC SP_insertingDataCity  'Savar'
EXEC SP_insertingDataCity  'Mohammadpur'
EXEC SP_insertingDataCity  'Gulistan'
EXEC SP_insertingDataCity  'Polton'
EXEC SP_insertingDataCity  'Panthopath'
EXEC SP_insertingDataCity 'Gulshan'
EXEC SP_insertingDataCity 'Hatirpul'
EXEC SP_insertingDataCity 'Kollanpur'
GO
--STOR PROC DATA INSERT INOT tbl_Blood_Donor TABLE
CREATE PROC SP_DataInserttbl_Blood_Donor
				@ bd_ID INT,
				@bd_Name VARCHAR(50),
				@ bd_Age VARCHAR(40),
				@bd_Sex VARCHAR(40),
				@bd_Bgroup VARCHAR(10),
				@bd_reg_Date INT,
				@bd_PhNo bigint ,
				@reco_ID INT,
				@City_ID INT,

AS
BEGIN
	INSERT INTO tbl_Blood_Donor VALUES 
(	
	            @ bd_ID INT,
				@bd_Name VARCHAR (50),
				@ bd_Age VARCHAR(40),
				@bd_Sex VARCHAR(40),
				@bd_Bgroup VARCHAR (10),
				@bd_reg_Date INT,
				@bd_PhNo bigint ,
				@reco_ID INT,
				@City_ID INT,
)
END
GO

EXEC SP_DataInserttbl_Blood_Donor 123333,'Arif',25,'M','B+','2020-12-17', 01712000000,101212,1100
EXEC SP_DataInserttbl_Blood_Donor 124444,'Bilkis',35,'F','A+','2020-11-22',01712111111,101212,1100
EXEC SP_DataInserttbl_Blood_Donor 125555,'Dulal',22,'M','O+','2020-01-04',01712222222,101312,1200
EXEC SP_DataInserttbl_Blood_Donor 126666,'Emran',29,'M','O+','2020-07-19',01712333333,101412,1300
EXEC SP_DataInserttbl_Blood_Donor 127777,'Forida',42,'F','A-','2020-12-24',01712444444,101412,1300
EXEC SP_DataInserttbl_Blood_Donor 128888,'Hassan',44,'M','AB+','2020-08-28',01712555555,101212,1200
EXEC SP_DataInserttbl_Blood_Donor 129999,'Jafrina',33,'F','AB-','2020-02-06',01712666666,101212,1400
EXEC SP_DataInserttbl_Blood_Donor 121010,'Kalpona',31,'F','AB+','2020-09-10',0171777777,101312,1200
EXEC SP_DataInserttbl_Blood_Donor 121212,'Lemon',24,'M','B+','2020-10-15',01712888888,101312,1500
EXEC SP_DataInserttbl_Blood_Donor 121313,'Mamun',29,'M','O-','2020-12-17',01712999999,101212,1200

GO
--STOR PROC DATA Delete From tbl_BB_Manager TABLE
CREATE PROCEDURE spDeleteBB_Manager
				 @ID int
AS
BEGIN
	DELETE FROM tbl_BB_Manager WHERE M_ID=@ID
END
GO

--STOR PROC DATA Update From tbl_City TABLE

CREATE PROCEDURE spUpdateCity
					@City_ID INT,
					@City_Name VARCHAR(100)

AS
BEGIN
	UPDATE tbl_City SET City_Name=@City_Name WHERE City_ID=@City_ID
END
GO
----------------------------END--------------