USE Proj_INFO_430_A1
GO

-- BACKUP DATABASE Proj_INFO_430_A1 TO DISK = 'C:SQL\Proj_INFO_430_A1.BAK' WITH DIFFERENTIAL

---------------------
-- Creating tables --
---------------------

-- Creates Patient table
CREATE TABLE tblPATIENT (
PatientID INT IDENTITY(1,1) PRIMARY KEY,
PatientFirstName NVARCHAR(35) NOT NULL,
PatientLastName NVARCHAR(35) NOT NULL,
PatientDOB DATE NOT NULL,
PatientPhoneNumber NVARCHAR(15) NOT NULL,
PatientAddress NVARCHAR(100) NOT NULL,
PatientCity NVARCHAR(50) NOT NULL,
PatientState NVARCHAR(2) NOT NULL,
PatientZipCode NVARCHAR(10) NOT NULL
)
GO

-- Creates Appointment table
CREATE TABLE tblAPPOINTMENT (
AppointmentID INT IDENTITY(1,1) PRIMARY KEY,
PatientID INT NOT NULL,
DepartmentID INT NOT NULL,
AppointmentDateTime DATETIME NOT NULL,
AppointmentTypeID INT NOT NULL
)
GO

-- Creates Brand table
CREATE TABLE tblBRAND (
BrandID INT IDENTITY(1,1) PRIMARY KEY,
BrandName NVARCHAR(100)
)
GO

-- Creates Lab table
CREATE TABLE tblLAB (
LabID INT IDENTITY(1,1) PRIMARY KEY,
AppointmentID INT NOT NULL,
LabTypeID INT NOT NULL,
LabDate DATE NOT NULL
)
GO

-- Creates AppointmentSymptom table
CREATE TABLE tblAPPOINTMENT_SYMPTOM (
AppointmentID INT NOT NULL,
SymptomID INT NOT NULL,
SeverityID INT NOT NULL,
PRIMARY KEY (AppointmentID, SymptomID)
)
GO

-- Creates StaffPosition table
CREATE TABLE tblSTAFF_POSITION (
StaffPositionID INT IDENTITY(1,1) PRIMARY KEY,
StaffPositionName NVARCHAR(100) NOT NULL
)
GO

-- Creates Diagnosis table
CREATE TABLE tblDIAGNOSIS (
DiagnosisID INT IDENTITY(1,1) PRIMARY KEY,
DiagnosisName NVARCHAR(100) NOT NULL
)
GO

-- Creates PatientInsurancePlan table
CREATE TABLE tblPATIENT_INSURANCE_PLAN (
  InsurancePlanID INT NOT NULL,
  PatientID INT NOT NULL,
  PRIMARY KEY (InsurancePlanID, PatientID)
)
GO

-- Creates AppointmentDiagnosis table
CREATE TABLE tblAPPOINTMENT_DIAGNOSIS (
  AppointmentID INT NOT NULL,
  DiagnosisID INT NOT NULL,
  PRIMARY KEY (AppointmentID,  DiagnosisID)
)
GO

-- Creates Department table
CREATE TABLE tblDEPARTMENT (
  DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
  DepartmentName NVARCHAR(100) NOT NULL,
  HospitalID INT NOT NULL
)
GO

-- Creates Procedure table
CREATE TABLE tblPROCEDURE (
  ProcedureID INT IDENTITY(1,1) PRIMARY KEY,
  ProcedureName NVARCHAR(100) NOT NULL
)
GO

-- Creates Hospital table
CREATE TABLE tblHOSPITAL (
  HospitalID INT IDENTITY(1,1) PRIMARY KEY,
  HospitalName NVARCHAR(100) NOT NULL,
  HospitalPhoneNumber NVARCHAR(15) NOT NULL,
  HospitalAddress NVARCHAR(100) NOT NULL,
  HospitalCity NVARCHAR(50) NOT NULL,
  HospitalState NVARCHAR(2) NOT NULL,
  HospitalZipCode NVARCHAR(10) NOT NULL,
  HospitalTypeID INT NOT NULL,
)
GO

-- Creates InsuranceComp table
CREATE TABLE tblINSURANCE_COMP (
  InsuranceCompID INT IDENTITY(1,1) PRIMARY KEY,
  InsuranceCompName NVARCHAR(100) NOT NULL
)
GO

-- Creates Staff table
CREATE TABLE tblSTAFF (
  StaffID INT IDENTITY(1,1) PRIMARY KEY,
  StaffFirstName NVARCHAR(35) NOT NULL,
  StaffLastName NVARCHAR(35) NOT NULL,
  StaffDOB DATE NOT NULL,
  StaffPhoneNumber NVARCHAR(15) NOT NULL,
  StaffAddress NVARCHAR(100) NOT NULL,
  StaffCity NVARCHAR(50) NOT NULL,
  StaffState NVARCHAR(2) NOT NULL,
  StaffZipCode NVARCHAR(10) NOT NULL,
  StaffPositionID INT NOT NULL
)
GO

-- Creates LabType table
CREATE TABLE tblLAB_TYPE (
LabTypeID INT IDENTITY(1,1) PRIMARY KEY,
LabTypeName NVARCHAR(100) NOT NULL,
LabTypeDesc NVARCHAR(500) NOT NULL)
GO

-- Creates HospitalType table
CREATE TABLE tblHOSPITAL_TYPE (
HospitalTypeID INT IDENTITY(1,1) PRIMARY KEY,
HospitalTypeName NVARCHAR(100) NOT NULL,
HospitalTypeDesc NVARCHAR(500) NOT NULL)
GO

-- Creates AppointmentProcedure table
CREATE TABLE tblAPPOINTMENT_PROCEDURE (
AppointmentID INT NOT NULL,
StaffID INT NOT NULL,
ProcedureID INT NOT NULL,
ProcedureResults NVARCHAR(500) NOT NULL,
ProcedureNotes NVARCHAR(500) NOT NULL,
PRIMARY KEY (AppointmentID, StaffID, ProcedureID))
GO

-- Creates MedicineForm table
CREATE TABLE tblMEDICINE_FORM (
MedicineFormID INT IDENTITY(1,1) PRIMARY KEY,
MedicineFormName NVARCHAR(100) NOT NULL)
GO

-- Creates AppointmentStaff table
CREATE TABLE tblAPPOINTMENT_STAFF (
AppointmentID INT NOT NULL,
StaffID INT NOT NULL,
AppointmentNotes NVARCHAR(500) NULL,
PRIMARY KEY (AppointmentID, StaffID))
GO

-- Creates Medicine Table
CREATE TABLE tblMEDICINE (
MedicineID INT IDENTITY(1,1) PRIMARY KEY,
MedicineName NVARCHAR(100) NOT NULL,
MedicineTypeID INT NOT NULL,
BrandID INT NOT NULL,
MedicineFormID INT NOT NULL,
MedicinePrice NUMERIC(6,2) NOT NULL)
GO

-- Creates Prescription table
CREATE TABLE tblPRESCRIPTION (
PrescriptionID INT IDENTITY(1,1) PRIMARY KEY,
OrderID INT NOT NULL,
MedicineID INT NOT NULL,
PrescriptionDosage NVARCHAR(100) NOT NULL,
PrescriptionRefills INT NOT NULL,
PrescriptionExpiration DATE NOT NULL,)
GO

-- Creates Order table
CREATE TABLE tblORDER (
OrderID INT IDENTITY(1,1) PRIMARY KEY,
AppointmentID INT NOT NULL,
OrderDate DATE NOT NULL)
GO

-- Creates InsurancePlan table
CREATE TABLE tblINSURANCE_PLAN (
 InsurancePlanID INT IDENTITY(1,1) PRIMARY KEY,
 InsuranceCompID INT NOT NULL,
 InsurancePlanName NVARCHAR(100) NOT NULL,
 InsuranceDesc NVARCHAR(500) NULL)
GO

-- Creates MedicineType Table
CREATE TABLE tblMEDICINE_TYPE (
MedicineTypeID INT IDENTITY(1,1) PRIMARY KEY,
MedicineTypeName NVARCHAR(100) NOT NULL)
GO

-- Creates Symptom table
CREATE TABLE tblSYMPTOM (
 SymptomID INT IDENTITY(1,1) PRIMARY KEY,
 SymptomName NVARCHAR(100) NOT NULL)
GO

-- Creates Message table
CREATE TABLE tblMESSAGE (
 MessageID INT IDENTITY(1,1) PRIMARY KEY,
 PatientID INT NOT NULL,
 StaffID INT NOT NULL,
 ConversationText NVARCHAR(500) NOT NULL,
 MessageDate DATE NOT NULL)
GO

-- Creates LabResults table
CREATE TABLE tblLAB_RESULTS (
 LabResultsID INT IDENTITY(1,1) PRIMARY KEY,
 LabID INT NOT NULL,
 LabResults VARBINARY(MAX) NOT NULL)
 GO

-- Creates AppointmentType table
CREATE TABLE tblAPPOINTMENT_TYPE (
 AppointmentTypeID INT IDENTITY(1,1) PRIMARY KEY,
 AppointmentTypeName NVARCHAR(100) NOT NULL)
GO

-- Creates Severity table
CREATE TABLE tblSEVERITY (
 SeverityID INT IDENTITY(1,1) PRIMARY KEY,
 SeverityName NVARCHAR(100) NOT NULL,
 SeverityDesc NVARCHAR(500) NOT NULL)
GO

------------------------------------------------------
-- Altering tables to add Foreign Key relationships --
------------------------------------------------------

-- Alters Insurance_Plan table by adding InsuranceCompID as a foreign key
ALTER TABLE tblINSURANCE_PLAN
ADD CONSTRAINT FK_tblINSURANCE_PLAN_InsuranceCompID
FOREIGN KEY (InsuranceCompID)
REFERENCES tblINSURANCE_COMP (InsuranceCompID)
GO

-- Alters Patient_Insurance_Plan table by adding InsurancePlanID as a foreign key
ALTER TABLE tblPATIENT_INSURANCE_PLAN
ADD CONSTRAINT FK_tblPATIENT_INSURANCE_PLAN_InsurancePlanID
FOREIGN KEY (InsurancePlanID)
REFERENCES tblINSURANCE_PLAN (InsurancePlanID)
GO

-- Alters Patient_Insurance_Plan table by adding PatientID as a foreign key
ALTER TABLE tblPATIENT_INSURANCE_PLAN
ADD CONSTRAINT FK_tblPATIENT_INSURANCE_PLAN_PatientID
FOREIGN KEY (PatientID)
REFERENCES tblPATIENT (PatientID)
GO

-- Alters Appointment_Diagnosis table by adding AppointmentID as a foregin key
ALTER TABLE tblAPPOINTMENT_DIAGNOSIS
ADD CONSTRAINT FK_tblAPPOINTMENT_DIAGNOSIS_AppointmentID
FOREIGN KEY (AppointmentID)
REFERENCES tblAPPOINTMENT (AppointmentID)
GO

-- Alters Appointment_Diagnosis table by adding DiagnosisID as a foregin key
ALTER TABLE tblAPPOINTMENT_DIAGNOSIS
ADD CONSTRAINT FK_tblAPPOINTMENT_DIAGNOSIS_DiagnosisID
FOREIGN KEY (DiagnosisID)
REFERENCES tblDIAGNOSIS (DiagnosisID)
GO

-- Alters Appointment table by adding PatientID as a foreign key
ALTER TABLE tblAPPOINTMENT
ADD CONSTRAINT FK_tblAPPOINTMENT_PatientID
FOREIGN KEY (PatientID)
REFERENCES tblPATIENT (PatientID)
GO

-- Alters Appointment table by adding AppointmentTypeID as a foreign key
ALTER TABLE tblAPPOINTMENT
ADD CONSTRAINT FK_tblAPPOINTMENT_AppointmentTypeID
FOREIGN KEY (AppointmentTypeID)
REFERENCES tblAPPOINTMENT_TYPE (AppointmentTypeID)
GO

-- Alters Department table by adding HospitalID as a foreign key
ALTER TABLE tblDEPARTMENT 
ADD CONSTRAINT FK_tblDEPARTMENT_HospitalID
FOREIGN KEY (HospitalID) 
REFERENCES tblHOSPITAL(HospitalID)
GO

-- Alters Medicine table by adding MedicineTypeID as a foreign key
ALTER TABLE tblMEDICINE 
ADD CONSTRAINT FK_tblMEDICINE_MedicineTypeID
FOREIGN KEY (MedicineTypeID)
REFERENCES tblMEDICINE_TYPE(MedicineTypeID)
GO

-- Alters Medicine table by adding MedicineFormID as a foreign key
ALTER TABLE tblMEDICINE
ADD CONSTRAINT FK_tblMEDICINE_MedicineFormID
FOREIGN KEY (MedicineFormID)
REFERENCES tblMEDICINE_FORM(MedicineFormID)
GO

-- Alters Medicine table by adding BrandID as a foreign key
ALTER TABLE tblMEDICINE 
ADD CONSTRAINT FK_tblMEDICINE_BrandID
FOREIGN KEY (BrandID)
REFERENCES tblBRAND(BrandID)
GO

-- Alters Prescription table by adding MedicineID as a foreign key
ALTER TABLE tblPRESCRIPTION 
ADD CONSTRAINT FK_tblPRESCRIPTION_MedicineID
FOREIGN KEY (MedicineID)
REFERENCES tblMEDICINE(MedicineID)
GO

-- Alters Prescription table by adding OrderID as a foreign key
ALTER TABLE tblPRESCRIPTION 
ADD CONSTRAINT FK_tblPRESCRIPTION_OrderID
FOREIGN KEY (OrderID)
REFERENCES tblORDER(OrderID)
GO

-- Alters Order table by adding AppointmentID as a foreign key
ALTER TABLE tblORDER 
ADD CONSTRAINT FK_tblAPPOINTMENT_AppointmentID
FOREIGN KEY (AppointmentID)
REFERENCES tblAPPOINTMENT(AppointmentID)
GO

-- Alters Lab table by adding LabTypeID as a foreign key
ALTER TABLE tblLAB 
ADD CONSTRAINT FK_tblLAB_LabTypeID
FOREIGN KEY(LabTypeID)
REFERENCES tblLAB_TYPE(LabTypeID)
GO

-- Alters Lab table by adding AppointmentID as a foreign key
ALTER TABLE tblLAB
ADD CONSTRAINT FK_tblLAB_AppointmentID
FOREIGN KEY(AppointmentID)
REFERENCES tblAPPOINTMENT(AppointmentID)
GO

-- Alters LabResults table by adding LabID as a foreign key
ALTER TABLE tblLAB_RESULTS
ADD CONSTRAINT FK_tblLAB_LabID
FOREIGN KEY(LabID)
REFERENCES tblLAB(LabID)
GO

-- Alters AppointmentSymptom table by adding AppointmentID as a foreign key
ALTER TABLE tblAPPOINTMENT_SYMPTOM
ADD CONSTRAINT FK_tblAPPOINTMENT_SYMPTOM_AppointmentID
FOREIGN KEY(AppointmentID)
REFERENCES tblAPPOINTMENT(AppointmentID)
GO

-- Alters AppointmentSymptom table by adding SymptomID as a foreign key
ALTER TABLE tblAPPOINTMENT_SYMPTOM
ADD CONSTRAINT FK_tblAPPOINTMENT_SYMPTOM_SymptomID
FOREIGN KEY(SymptomID)
REFERENCES tblSYMPTOM(SymptomID)
GO

-- Alters AppointmentSymptom table by adding SeverityID as a foreign key
ALTER TABLE tblAPPOINTMENT_SYMPTOM
ADD CONSTRAINT FK_tblAPPOINTMENT_SYMPTOM_SeverityID
FOREIGN KEY(SeverityID)
REFERENCES tblSEVERITY(SeverityID)
GO

-- Alters Appointment table by adding DepartmentID as a foreign key
ALTER TABLE tblAPPOINTMENT
ADD CONSTRAINT FK_tblAPPOINTMEN_DepartmentID
FOREIGN KEY(DepartmentID)
REFERENCES tblDEPARTMENT(DepartmentID)
GO

-- Alters Message table by adding PatientID as a foreign key
ALTER TABLE tblMESSAGE
ADD CONSTRAINT FK_tblMESSAGE_PatientID
FOREIGN KEY (PatientID)
REFERENCES tblPATIENT(PatientID)
GO

-- Alters Message table by adding StaffID as a foreign key
ALTER TABLE tblMESSAGE
ADD CONSTRAINT FK_tblMESSAGE_StaffID
FOREIGN KEY (StaffID)
REFERENCES tblSTAFF(StaffID)
GO

-- Alters Staff table by adding StaffPositionID as a foreign key
ALTER TABLE tblSTAFF
ADD CONSTRAINT FK_tblSTAFF_StaffPositionID
FOREIGN KEY (StaffPositionID)
REFERENCES tblSTAFF_POSITION(StaffPositionID)
GO

-- Alters AppointmentStaff table by adding StaffID as a foreign key
ALTER TABLE tblAPPOINTMENT_STAFF
ADD CONSTRAINT FK_tblAPPOINTMENT_STAFF_StaffID
FOREIGN KEY (StaffID)
REFERENCES tblSTAFF(StaffID)
GO

-- Alters AppointmentStaff table by adding AppointmentID as a foreign key
ALTER TABLE tblAPPOINTMENT_STAFF
ADD CONSTRAINT FK_tblAPPOINTMENT_STAFF_AppointmentID
FOREIGN KEY (AppointmentID)
REFERENCES tblAPPOINTMENT(AppointmentID)
GO

-- Alters AppointmentProcedure table by adding AppointmentStaffID as a foreign key
ALTER TABLE tblAPPOINTMENT_PROCEDURE
ADD CONSTRAINT FK_tblAPPOINTMENT_PROCEDURE_AppointmentStaffID
FOREIGN KEY (AppointmentID, StaffID)
REFERENCES tblAPPOINTMENT_STAFF(AppointmentID, StaffID)
GO

-- Alters AppointmentProcedure table by adding ProcedureID as a foreign key
ALTER TABLE tblAPPOINTMENT_PROCEDURE
ADD CONSTRAINT FK_tblAPPOINTMENT_PROCEDURE_ProcedureID
FOREIGN KEY (ProcedureID)
REFERENCES tblPROCEDURE(ProcedureID)
GO

-- Alters Hospital table by adding HospitalTypeID as a foreign key
ALTER TABLE tblHOSPITAL
ADD CONSTRAINT FK_tblHOSPITAL_HospitalTypeID
FOREIGN KEY (HospitalTypeID)
REFERENCES tblHOSPITAL_TYPE(HospitalTypeID)
GO

--------------------------------
-- Creating Stored Procedures --
--------------------------------

-- Creates stored procedure to populate Message table
-- Written by Damita
CREATE PROCEDURE uspInsMessage
@PatF NVARCHAR(35),
@PatL NVARCHAR(35),
@PatDOB DATE,
@StaffF NVARCHAR(35),
@StaffL NVARCHAR(35),
@StaffBirth DATE,
@MsgTxt NVARCHAR(500),
@MsgDate DATE
AS

DECLARE @Pat_ID INT, @Staff_ID INT

EXEC uspGetPatientID
@PatientFname2 = @PatF,
@PatientLname2 = @PatL,
@PatientDOB2 = @PatDOB,
@P_ID2 = @Pat_ID OUTPUT

-- error handling if Pat_ID is null
IF @Pat_ID IS NULL
  BEGIN
      PRINT 'Could not find patient. Check spelling of @PatientFirstName, @PatientLastName, @PatientDOB';
      THROW 560001, 'Null value will fail', 1;
  END

EXEC uspGetStaffID
@StaffFname2 = @StaffF,
@StaffLname2 = @StaffL,
@StaffDOB2 = @StaffBirth,
@ST_ID2 = @Staff_ID OUTPUT

-- error handling if Staff_ID is null
IF @Staff_ID IS NULL
  BEGIN
      PRINT 'Could not find staff person. Check spelling of @StaffFirstName, @StaffLastName, @StaffDOB';
      THROW 560001, 'Null value will fail', 1;
  END

BEGIN TRANSACTION INSERT_INTO_MSG
INSERT INTO tblMESSAGE (PatientID, StaffID, ConversationText, MessageDate)
VALUES (@Pat_ID, @Staff_ID, @MsgTxt, @MsgDate)
IF @@ERROR <> 0
  BEGIN
      PRINT '@@ERROR <> 0. Rollback transaction'
      ROLLBACK TRANSACTION INSERT_INTO_MSG
  END
ELSE
  COMMIT TRANSACTION INSERT_INTO_MSG
GO

-- Creates stored procedure to populate AppointmentDiagnosis table
-- Written by Damita
CREATE PROCEDURE uspInsAppDiagnosis
@Patient_Fname NVARCHAR(35),
@Patient_Lname NVARCHAR(35),
@Patient_DOB DATE,
@AppDate DATETIME,
@Diagnosis_Name NVARCHAR(100)
AS

DECLARE @AppID INT, @D_ID INT

EXEC uspGetAppointmentID
@PatientFname3 = @Patient_Fname,
@PatientLname3 = @Patient_Lname,
@PatientDOB3 = @Patient_DOB,
@AppointmentDateTime3 = @AppDate,
@A_ID3 = @AppID OUTPUT

-- error handling if AppointmentID is null
IF @AppID IS NULL
   BEGIN
       PRINT 'Could not find appointment ID. Please check appointment date and time.';
       THROW 560001, 'Null value will fail', 1;
   END

EXEC uspGetDiagnosisID
@DiagnosisName2 = @Diagnosis_Name,
@DiagnosisID2 = @D_ID OUTPUT

-- error handling if DiagnosisID is null
IF @D_ID IS NULL
   BEGIN
       PRINT 'Could not find diagnosis. Check spelling of @DiagnosisName.';
       THROW 560001, 'Null value will fail', 1;
   END

BEGIN TRANSACTION INSERT_APPOINTMENT_DIAGNOSIS
INSERT INTO tblAPPOINTMENT_DIAGNOSIS (AppointmentID, DiagnosisID)
VALUES (@AppID, @D_ID)
IF @@ERROR <> 0
   BEGIN
       PRINT '@@ERROR <> 0. Rollback transaction'
       ROLLBACK TRANSACTION INSERT_APPOINTMENT_DIAGNOSIS
   END
ELSE
   COMMIT TRANSACTION INSERT_APPOINTMENT_DIAGNOSIS
GO

-- Creates stored procedure to populate Medicine table
-- Written by Zhi
CREATE PROCEDURE uspInsMedicine
@MT_NAME NVARCHAR(100),
@MB_NAME NVARCHAR(100),
@MF_NAME NVARCHAR(100),
@MedicineName NVARCHAR(100),
@MedicinePrice NUMERIC(10,2)
AS

DECLARE @MT_ID INT, @MB_ID INT, @MF_ID INT

EXEC uspGetMedicineTypeID
@MT_Name2 = @MT_Name,
@MT_ID2 = @MT_ID OUTPUT
-- Error Handling
If @MT_ID IS NULL
Begin
	Print '@MT_ID IS NULL, which is a problem'
	Raiserror ('@MT_ID cannot be NULL', 11,1)
	Return
End

EXEC uspGetBrandID
@MB_Name2 = @MB_Name,
@MB_ID2 = @MB_ID OUTPUT
-- Error Handling
If @MB_ID IS NULL
Begin
	Print '@MB_ID IS NULL, which is a problem'
	Raiserror ('@MB_ID cannot be NULL', 11,1)
	Return
End

EXEC uspGetMedicineFormID
@MF_Name2 = @MF_Name,
@MF_ID2 = @MF_ID OUTPUT
-- Error Handling
If @MF_ID IS NULL
Begin
	Print '@MF_ID IS NULL, which is a problem'
	Raiserror ('@MF_ID cannot be NULL', 11,1)
	Return
End

BEGIN TRAN Z1
	INSERT INTO tblMEDICINE (MedicineTypeID, BrandID, MedicineFormID, MedicineName, MedicinePrice)
	VALUES (@MT_ID, @MB_ID, @MF_ID, @MedicineName, @MedicinePrice)
COMMIT TRAN Z1
Go

-- Creates stored procedure to populate Appointment table
-- Written by Zhi
CREATE PROCEDURE uspInsAppointment
@PatientFname NVARCHAR(35),
@PatientLname NVARCHAR(35),
@PatientDOB DATE,
@D_Name NVARCHAR(100),
@H_Name NVARCHAR(100),
@AT_Name NVARCHAR(100),
@AppointmentDateTime DATETIME
AS

DECLARE @P_ID INT, @D_ID INT, @H_ID INT,  @AT_ID INT

Exec uspGetPatientID
@PatientFname2 = @PatientFname,
@PatientLname2 = @PatientLname,
@PatientDOB2 = @PatientDOB, 
@P_ID2 = @P_ID OUTPUT
-- Error Handling
If @P_ID IS NULL
Begin
	Print '@P_ID IS NULL, which is a problem'
	Raiserror ('@P_ID cannot be NULL', 11,1)
	Return
End

EXEC uspGetHospitalID
@H_Name2 = @H_Name,
@H_ID2 = @H_ID OUTPUT
-- Error Handling
If @H_ID IS NULL
Begin
	Print '@H_ID IS NULL, which is a problem'
	Raiserror ('@H_ID cannot be NULL', 11,1)
	Return
End

EXEC uspGetDepartmentID
@D_Name2 = @D_Name,
@H_ID2 = @H_ID,
@D_ID2 = @D_ID OUTPUT
-- Error Handling
If @D_ID IS NULL
Begin
	Print '@D_ID IS NULL, which is a problem'
	Raiserror ('@D_ID cannot be NULL', 11,1)
	Return
End

EXEC uspGetAppointmentTypeID
@AT_Name2 = @AT_Name,
@AT_ID2 = @AT_ID OUTPUT
-- Error Handling
If @AT_ID IS NULL
Begin
	Print '@AT_ID IS NULL, which is a problem'
	Raiserror ('@AT_ID cannot be NULL', 11,1)
	Return
End

BEGIN TRAN Z1
	INSERT INTO tblAPPOINTMENT (PatientID, DepartmentID, AppointmentDateTime, AppointmentTypeID)
	VALUES (@P_ID, @D_ID, @AppointmentDateTime, @AT_ID)
COMMIT TRAN Z1
GO

-- Creates stored procedure to populate AppointmentSymptom table
-- Written by Rebecca
CREATE PROCEDURE uspAddAppointmentSymptom
@PatientFirstName NVARCHAR(35),
@PatientLastName NVARCHAR(35),
@PatientDOB DATE,
@AppointmentDateTime DATETIME,
@SeverityName NVARCHAR(100),
@SymptomName NVARCHAR(100)
AS

DECLARE  @A_ID INT, @Sev_ID INT, @Sym_ID INT

EXEC uspGetAppointmentID
@PatientFname3 = @PatientFirstName,
@PatientLname3 = @PatientLastName,
@PatientDOB3 = @PatientDOB,
@AppointmentDateTime3 = @AppointmentDateTime,
@A_ID3 = @A_ID OUTPUT

IF @A_ID IS NULL
	BEGIN
		PRINT 'Could not find appointment. Check that patient and @AppointmentDateTime are correct';
		THROW 560001, 'Null value will fail', 1;
	END

EXEC uspGetSeverityID
@SeverityName2 = @SeverityName,
@Sev_ID2 = @Sev_ID OUTPUT

IF @Sev_ID IS NULL
	BEGIN
		PRINT 'Could not find severity. Check spelling of @SeverityName';
		THROW 560001, 'Null value will fail', 1;
	END

EXEC uspGetSymptomID
@SymptomName2 = @SymptomName,
@Sym_ID2 = @Sym_ID OUTPUT

IF @Sym_ID IS NULL
	BEGIN
		PRINT 'Could not find symptom. Check spelling of @SymptomName';
		THROW 560001, 'Null value will fail', 1;
	END

BEGIN TRAN T1
INSERT INTO tblAPPOINTMENT_SYMPTOM(AppointmentID, SeverityID, SymptomID)
VALUES (@A_ID, @Sev_ID , @Sym_ID)
IF @@ERROR <> 0
	ROLLBACK TRAN T1
ELSE
	COMMIT TRAN T1
GO

-- Creates stored procedure to populate Prescription table
-- Set @OrderDate to NULL to create a new order with prescription
-- Written by Rebecca
CREATE PROCEDURE uspAddPrescription
@PatientFirstName NVARCHAR(35),
@PatientLastName NVARCHAR(35),
@PatientDOB DATE,
@AppointmentDateTime DATETIME,
@OrderDate DATE,
@MedicineName NVARCHAR(100),
@PrescriptionDosage NVARCHAR(100),
@PrescriptionRefills INT,
@PrescriptionExpiration DATE
AS

DECLARE @A_ID INT, @O_ID INT, @M_ID INT

IF @OrderDate IS NULL
	BEGIN
		BEGIN TRAN T2
			EXEC uspGetAppointmentID
			@PatientFname3 = @PatientFirstName,
			@PatientLname3 = @PatientLastName,
			@PatientDOB3 = @PatientDOB,
			@AppointmentDateTime3 = @AppointmentDateTime,
			@A_ID3 = @A_ID OUTPUT

			IF @A_ID IS NULL
				BEGIN
					PRINT 'Could not find appointment. Check that patient and @AppointmentDateTime are correct';
					THROW 560001, 'Null value will fail', 1;
				END

		INSERT INTO tblORDER(AppointmentID, OrderDate)
		VALUES (@A_ID, GETDATE())
		SET @O_ID = (SELECT SCOPE_IDENTITY())

		IF @@ERROR <> 0
			ROLLBACK TRAN T2
		ELSE
			COMMIT TRAN T2
	END
ELSE
	BEGIN
		EXEC uspGetOrderID
		@PatientFname4 = @PatientFirstName,
		@PatientLname4 = @PatientLastName,
		@PatientDOB4 = @PatientDOB,
		@AppointmentDateTime4 = @AppointmentDateTime,
		@OrderDate4 = @OrderDate,
		@O_ID4 = @O_ID OUTPUT
	END

IF @O_ID IS NULL
	BEGIN
		PRINT 'Could not find order. Check that patient, @AppointmentDateTime, and @OrderDate are correct';
		THROW 560001, 'Null value will fail', 1;
	END

EXEC uspGetMedicineID
@MedicineName2 = @MedicineName,
@M_ID2 = @M_ID OUTPUT

IF @M_ID IS NULL
	BEGIN
		PRINT 'Could not find medicine. Check spelling of @MedicineName';
		THROW 560001, 'Null value will fail', 1;
	END

BEGIN TRAN T1
INSERT INTO tblPRESCRIPTION(OrderID, MedicineID, PrescriptionDosage, PrescriptionRefills, PrescriptionExpiration)
VALUES (@O_ID, @M_ID , @PrescriptionDosage, @PrescriptionRefills, @PrescriptionExpiration)
IF @@ERROR <> 0
	ROLLBACK TRAN T1
ELSE
	COMMIT TRAN T1
GO

-- Creates stored procedure to populate Lab table
-- Written by Anish
CREATE PROCEDURE uspInstblLAB
@PatientFname NVARCHAR(35),
@PatientLname NVARCHAR(35),
@PatientDOB DATE,
@AppointmentDate DATETIME,
@LT_name NVARCHAR(100),
@Date DATE
AS

DECLARE @AP_ID INT, @LT_ID INT, @L_ID INT

EXEC uspGetAppointmentID
@PatientFname3 = @PatientFname,
@PatientLname3 = @PatientLname,
@PatientDOB3 = @PatientDOB,
@AppointmentDateTime3 = @AppointmentDate,
@A_ID3 = @AP_ID OUTPUT
-- Error Handling
If @AP_ID IS NULL
Begin
	Print '@AP_ID IS NULL, which is a problem'
	Raiserror ('@AP_ID cannot be NULL', 11,1)
	Return
End

EXEC uspGetLabTypeID
@LabTypeName2 = @LT_name,
@LT_ID2 = @LT_ID OUTPUT
-- Error Handling
If @LT_ID IS NULL
Begin
	Print '@LT_ID IS NULL, which is a problem'
	Raiserror ('@LT_ID cannot be NULL', 11,1)
	Return
End

BEGIN TRAN T1
	INSERT INTO tblLAB (AppointmentID, LabTypeID, LabDate)
	VALUES (@AP_ID, @LT_ID, @Date)
COMMIT TRAN T1
GO

-- Creates stored procedure to populate PatientInsurancePlan table
-- Written by Anish
CREATE PROCEDURE uspInsPatientInsurancePlan
@PatientFname NVARCHAR(35),
@PatientLname NVARCHAR(35),
@PatientDOB DATE,
@InsurancePlanName NVARCHAR(100)
AS

DECLARE @P_ID INT, @IP_ID INT

Exec uspGetPatientID
@PatientFname2 = @PatientFname,
@PatientLname2 = @PatientLname,
@PatientDOB2 = @PatientDOB, 
@P_ID2 = @P_ID OUTPUT
-- Error Handling
If @P_ID IS NULL
Begin
	Print '@P_ID IS NULL, which is a problem'
	Raiserror ('@P_ID cannot be NULL', 11,1)
	Return
End

EXEC uspGetIP_ID
@InsurancePlanName2 = @InsurancePlanName,
@IP_ID2 = @IP_ID OUTPUT
-- Error Handling
If @IP_ID IS NULL
Begin
	Print '@IP_ID IS NULL, which is a problem'
	Raiserror ('@IP_ID cannot be NULL', 11,1)
	Return
End

BEGIN TRAN T1
	INSERT INTO tblPATIENT_INSURANCE_PLAN(PatientID, InsurancePlanID)
	VALUES (@P_ID, @IP_ID)
COMMIT TRAN T1
GO

------------------------------
-- Adding Check Constraints --
------------------------------

/*
Prescriptions (that have one or more refills) cannot be ordered through an appointment at a hospital 
if the patient has a permanent address in a different state than the hospital 
and have an active prescription that has one or more refills with a hospital in their own state 
*/

-- Creates a function to test the above business rule
-- Written by Damita
CREATE FUNCTION CheckPatientAddress()
RETURNS INT
AS
BEGIN
   DECLARE @RET INT = 0
   IF EXISTS (
       SELECT *
       FROM tblAPPOINTMENT A
       JOIN (SELECT P.PatientID, P.PatientState
           FROM tblPATIENT P JOIN tblAPPOINTMENT AP
           ON P.PatientID = AP.PatientID JOIN tblDEPARTMENT DP
           ON AP.DepartmentID = DP.DepartmentID JOIN tblHOSPITAL HP
           ON DP.HospitalID = HP.HospitalID JOIN tblORDER OP
           ON AP.AppointmentID = OP.AppointmentID JOIN tblPRESCRIPTION PP
           ON OP.OrderID = PP.OrderID
           WHERE P.PatientState = HP.HospitalState
               AND PP.PrescriptionExpiration > GETDATE()
               AND PP.PrescriptionRefills > 0) AS PA
       ON A.PatientID = PA.PatientID JOIN tblDEPARTMENT D
       ON A.DepartmentID = D.DepartmentID JOIN tblHOSPITAL H
       ON D.HospitalID = H.HospitalID JOIN tblORDER O
       ON A.AppointmentID = O.AppointmentID JOIN tblPRESCRIPTION PR
       ON O.OrderID = PR.OrderID
       WHERE PA.PatientState <> H.HospitalState
           AND PR.PrescriptionExpiration > GETDATE()
           AND PR.PrescriptionRefills > 0
   )
   BEGIN
       SET @RET = 1
   END
RETURN @RET
END
GO

-- Adds the above business rule as a constraint to the Prescription table
ALTER TABLE tblPRESCRIPTION with nocheck
ADD CONSTRAINT CK_CheckPatientAddress
CHECK (dbo.CheckPatientAddress() = 0)
GO

/*
A patient must have at least two insurance plans to have more than five
active prescriptions (not expired) unless the patient is age 50 or older
*/

-- Creates a function to test the above business rule
-- Written by Damita
CREATE FUNCTION CheckInsuranceforPrescriptions()
RETURNS INT
AS
BEGIN
   DECLARE @RET INT = 0
   IF EXISTS (
       SELECT *
       FROM (
           SELECT P.PatientID, COUNT(IP.InsurancePlanID) AS NumofPlans, COUNT(PR.PrescriptionID) AS NumofPrescriptions
           FROM tblPATIENT P
           JOIN tblPATIENT_INSURANCE_PLAN PIP
           ON P.PatientID = PIP.PatientID
           JOIN tblINSURANCE_PLAN IP
           ON PIP.InsurancePlanID = IP.InsurancePlanID
           JOIN tblAPPOINTMENT A
           ON P.PatientID = A.PatientID
           JOIN tblORDER O
           ON A.AppointmentID = O.AppointmentID
           JOIN tblPRESCRIPTION PR
           ON O.OrderID = PR.PrescriptionID
           WHERE PR.PrescriptionExpiration > GETDATE()
               AND P.PatientDOB > DATEADD(year, -50, GETDATE())
           GROUP BY P.PatientID
       ) AS PatientCounts
       WHERE NumofPlans < 2
           AND NumofPrescriptions > 5
   )
   BEGIN
       SET @RET = 1
   END
RETURN @RET
END
GO

-- Adds the above business rule as a constraint to the Prescription table
ALTER TABLE tblPRESCRIPTION with nocheck
ADD CONSTRAINT CK_CheckInsuranceforPrescriptions
CHECK (dbo.CheckInsuranceforPrescriptions() = 0)
GO

/*
Patients must be at least 18 years old and have a valid phone number and zip code to schedule an appointment 
which cannot be scheduled prior to the current date
unless they have an order with multiple prescriptions 
and an order date for the same date they are trying to schedule the appointment
*/

-- Creates a function to test the above business rule
-- Written by Zhi
CREATE FUNCTION ScheduleAppointments()
RETURNS INT
AS
BEGIN
DECLARE @RET INT = 1
	IF EXISTS (
		SELECT *
  		FROM tblPATIENT P
		  JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID
		WHERE P.PatientDOB > (SELECT DATEADD(year, -18, GETDATE()))
		  AND P.PatientPhoneNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
		  AND P.PatientZipCode LIKE '[0-9][0-9][0-9][0-9][0-9]'
		  AND A.AppointmentDateTime > GETDATE() OR A.AppointmentID IN (
			SELECT A.AppointmentID
			FROM  tblPATIENT P
      		  JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID
			  JOIN tblORDER O ON A.AppointmentID = O.AppointmentID
			  JOIN tblPRESCRIPTION PR ON O.OrderID = PR.OrderID
			WHERE O.OrderDate BETWEEN (SELECT DATEADD(day, -1, A.AppointmentDateTime)) AND A.AppointmentDateTime
			GROUP BY O.OrderID, A.AppointmentID
			HAVING COUNT(PR.PrescriptionID) > 1))
   	BEGIN
		SET @RET = 0
	END
RETURN @RET
END
GO

-- Adds the above business rule as a constraint to the Appointment table
ALTER TABLE tblAPPOINTMENT with nocheck
ADD CONSTRAINT CK_18PhoneZipDate
CHECK (dbo.ScheduleAppointments() = 0)
GO

/*
Staff for any appointments with severe conditions, 5 diagnosis, and 4 or more symptoms
must have been involved with at least 5 appointments with severe conditions
*/

-- Creates a function to test the above business rule
-- Written by Zhi
CREATE FUNCTION StaffAppointmentsWith5DiaSevereSevAtLeast4Sym()
RETURNS INT
AS
BEGIN
DECLARE @RET INT = 0
	IF EXISTS (
		SELECT *
		FROM tblSTAFF_POSITION SP
			JOIN tblSTAFF ST ON SP.StaffPositionID = ST.StaffPositionID
			JOIN tblAPPOINTMENT_STAFF AST ON ST.StaffID = AST.AppointmentID
			JOIN tblAPPOINTMENT A ON AST.AppointmentID = A.AppointmentID			
			-- Appointments with severe condition
			JOIN (
				SELECT A.AppointmentID
				FROM tblAPPOINTMENT A
				JOIN tblAPPOINTMENT_SYMPTOM ASY ON A.AppointmentID = ASY.AppointmentID
				JOIN tblSYMPTOM SY ON ASY.SymptomID = SY.SymptomID
				JOIN tblSEVERITY SE ON ASY.SeverityID = SE.SeverityID
				WHERE SE.SeverityName = 'severe'
			) AS subq1 ON A.AppointmentID = subq1.AppointmentID
			-- Appointments with 5 diagnosis or more 
			JOIN (
				SELECT A.AppointmentID
				FROM tblAPPOINTMENT A
				JOIN tblAPPOINTMENT_DIAGNOSIS AD ON A.AppointmentID = AD.AppointmentID
				JOIN tblDIAGNOSIS D ON AD.DiagnosisID = D.DiagnosisID
				GROUP BY A.AppointmentID
				HAVING COUNT(D.DiagnosisID) >= 5
			) AS subq2 ON A.AppointmentID = subq2.AppointmentID
			-- Appointments with 4 or more symptoms
			JOIN (
				SELECT A.AppointmentID
				FROM tblAPPOINTMENT A
				JOIN tblAPPOINTMENT_SYMPTOM ASY ON A.AppointmentID = ASY.AppointmentID
				JOIN tblSYMPTOM SY ON ASY.SymptomID = SY.SymptomID
				JOIN tblSEVERITY SE ON ASY.SeverityID = SE.SeverityID
				GROUP BY A.AppointmentID
				HAVING COUNT(ASY.SymptomID) >= 4
			) AS subq3 ON A.AppointmentID = subq3.AppointmentID
			--5 Appointments with severe conditions
			JOIN (
				SELECT S.StaffID
				FROM tblAPPOINTMENT A
				JOIN tblAPPOINTMENT_SYMPTOM ASY ON A.AppointmentID = ASY.AppointmentID
				JOIN tblSEVERITY SE ON ASY.SeverityID = SE.SeverityID
				JOIN tblAPPOINTMENT_STAFF AF ON A.AppointmentID = AF.AppointmentID
				JOIN tblSTAFF S ON AF.StaffID = S.StaffID
				WHERE SE.SeverityName = 'severe'
				GROUP BY S.StaffID
				HAVING COUNT(A.AppointmentID) < 5
			) AS subq4 ON ST.StaffID = subq4.StaffID)
		BEGIN
			SET @RET = 1
		END
RETURN @RET
END
GO

-- Adds the above business rule as a constraint to the Appointment table
ALTER TABLE tblAPPOINTMENT_STAFF with nocheck
ADD CONSTRAINT CK_StaffAppointmentsWith5DiaSevereSevAtLeast4Sym
CHECK (dbo.StaffAppointmentsWith5DiaSevereSevAtLeast4Sym() = 0)
GO

/*
Patients cannot have 2 labs scheduled for the same date and related appointment 
unless they have at least 3 symptoms associated with the related appointment 
or at least one of them has a critical severity
*/

-- Creates a function to test the above business rule
-- Written by Rebecca
CREATE FUNCTION No2LabsUnless3Symptoms1Critical()
RETURNS INT
AS
BEGIN
DECLARE @RET INT = 0
	IF EXISTS (
		SELECT *
		FROM tblLAB L
			JOIN tblAPPOINTMENT A ON L.AppointmentID = A.AppointmentID
			JOIN tblAPPOINTMENT_SYMPTOM ASY ON A.AppointmentID = ASY.AppointmentID
			JOIN tblSYMPTOM SY ON ASY.SymptomID = SY.SymptomID
			JOIN tblSEVERITY SE ON ASY.SeverityID = SE.SeverityID
			-- only appointments that have less than 3 symptoms
			JOIN (
				SELECT A.AppointmentID
				FROM tblAPPOINTMENT A
				JOIN tblAPPOINTMENT_SYMPTOM ASY ON A.AppointmentID = ASY.AppointmentID
				JOIN tblSYMPTOM SY ON ASY.SymptomID = SY.SymptomID
				JOIN tblSEVERITY SE ON ASY.SeverityID = SE.SeverityID
				GROUP BY A.AppointmentID
				HAVING COUNT(ASY.SymptomID) < 3
			) AS subq1 ON A.AppointmentID = subq1.AppointmentID
			-- only appointments that do not have critcal severity symptoms
			JOIN (
				SELECT A.AppointmentID
				FROM tblAPPOINTMENT A
				JOIN tblAPPOINTMENT_SYMPTOM ASY ON A.AppointmentID = ASY.AppointmentID
				JOIN tblSYMPTOM SY ON ASY.SymptomID = SY.SymptomID
				JOIN tblSEVERITY SE ON ASY.SeverityID = SE.SeverityID
				WHERE SE.SeverityName != 'critical'
			) AS subq2 ON A.AppointmentID = subq2.AppointmentID
		-- check for at least 2 labs on the same day
		GROUP BY A.AppointmentID, L.LabDate
		HAVING COUNT(L.LabID) >= 2
	)
		BEGIN
			SET @RET = 1
		END
RETURN @RET
END
GO

-- Adds the above business rule as a constraint to the Lab table
ALTER TABLE tblLAB with nocheck
ADD CONSTRAINT CK_2LabsWithout3Symptoms1Critical
CHECK (dbo.No2LabsUnless3Symptoms1Critical() = 0)
GO

/*
Orders cannot contain multiple prescriptions for the same medicine 
without the patient having an insurance provider unless at least one has zero refills, 
or there were at least 2 doctors involved with the associated appointment
*/

-- Creates a function to test the above business rule
-- Written by Rebecca
CREATE FUNCTION NoDuplicatePrescriptionMedWithoutInsurance()
RETURNS INT
AS
BEGIN
DECLARE @RET INT = 0
	IF EXISTS (
		SELECT *
		FROM tblMEDICINE M
			JOIN tblPRESCRIPTION P ON M.MedicineID = P.MedicineID
			JOIN tblORDER O ON P.OrderID = O.OrderID
			JOIN tblAPPOINTMENT A ON O.AppointmentID = A.AppointmentID
			JOIN tblPATIENT PA ON A.PatientID = PA.PatientID
			JOIN tblPATIENT_INSURANCE_PLAN I ON PA.PatientID = I.PatientID
			-- only appointments that do not have at least 2 doctors involved
			JOIN (
				SELECT A.AppointmentID
				FROM tblAPPOINTMENT A
				JOIN tblAPPOINTMENT_STAFF AST ON A.AppointmentID = AST.AppointmentID
				JOIN tblSTAFF S ON AST.StaffID = S.StaffID
				JOIN tblSTAFF_POSITION SP ON S.StaffPositionID = SP.StaffPositionID
				WHERE SP.StaffPositionName = 'Doctor'
				GROUP BY A.AppointmentID
				HAVING COUNT(AST.StaffID) < 2
			) AS subq1 ON A.AppointmentID = subq1.AppointmentID
		WHERE P.PrescriptionRefills > 0
		GROUP BY P.OrderID, P.MedicineID, PA.PatientID
		HAVING COUNT(P.PrescriptionID) >= 2
		AND COUNT(I.InsurancePlanID) = 0
	)
		BEGIN
			SET @RET = 1
		END
RETURN @RET
END
GO

-- Adds the above business rule as a constraint to the Prescription table
ALTER TABLE tblPRESCRIPTION with nocheck
ADD CONSTRAINT CK_DuplicatePrescriptionMedWithoutInsurance
CHECK (dbo.NoDuplicatePrescriptionMedWithoutInsurance() = 0)
GO

-------------------------------
-- Creating Computed Columns --
-------------------------------

-- Creates function to find the number of departments a hospital has
-- Written by Damita
CREATE FUNCTION CountDepts(@H_ID INT)
RETURNS INT
AS
BEGIN
   RETURN (
       SELECT COUNT(DepartmentID)
       FROM tblDEPARTMENT
       WHERE HospitalID = @H_ID
   )
END
GO

-- Adds a column to the hospital table using the above function
ALTER TABLE tblHOSPITAL
ADD NumDepts AS dbo.CountDepts(HospitalID)
GO

-- Creates function to find the number of non-expired prescriptions for a patient
-- Written by Damita
CREATE FUNCTION ActivePrescriptions(@P_ID INT)
RETURNS INT
AS
BEGIN
   RETURN (
       SELECT COUNT(P.PrescriptionID)
       FROM tblAPPOINTMENT A
       JOIN tblORDER O ON A.AppointmentID = O.AppointmentID
       JOIN tblPRESCRIPTION P ON O.OrderID = P.OrderID
       WHERE A.PatientID = @P_ID
           AND P.PrescriptionExpiration > GETDATE()
   )
END
GO

-- Adds a column to the patient table using the above function
ALTER TABLE tblPATIENT
ADD NumActivePrescriptions AS dbo.ActivePrescriptions(PatientID)
GO

-- Creates function to find the number of staff in a department
-- Written by Zhi
CREATE FUNCTION fn_NumStaffDep(@PKID INT)
RETURNS INT
AS
BEGIN
  DECLARE @RET INT =
    (SELECT COUNT(DISTINCT S.StaffID)
    FROM tblDEPARTMENT D
      JOIN tblAPPOINTMENT A ON D.DepartmentID = A.DepartmentID 
      JOIN tblAPPOINTMENT_STAFF APS ON A.AppointmentID = APS.AppointmentID
      JOIN tblSTAFF S ON APS.StaffID = S.StaffID
    WHERE D.DepartmentID = @PKID)
RETURN @Ret
END
GO

-- Adds a column to the department table using the above function
ALTER TABLE tblDEPARTMENT
ADD NumStaff
AS (dbo.fn_NumStaffDep(DepartmentID))
GO

--Creates function to find the number of appointments for a patient
-- Written by Zhi
CREATE FUNCTION fn_NumAppPat (@PKID INT)
RETURNS INT
AS
BEGIN
  DECLARE @RET INT =
    (SELECT COUNT (A.AppointmentID)
    FROM tblPATIENT P
      JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID
    WHERE P.PatientID = @PKID)
RETURN @RET
END
GO

-- Adds a column to the patient table using the above function
ALTER TABLE tblPATIENT
ADD NumAppointments
AS (dbo.fn_NumAppPat(PatientID))
GO

-- Creates function to find the total price of an order
-- Written by Rebecca
CREATE FUNCTION fn_CalcOrderTotal(@PKID INT)
RETURNS NUMERIC(7,2)
AS
BEGIN
	DECLARE @Ret NUMERIC(7,2) = 
		(SELECT SUM(M.MedicinePrice)
		FROM tblORDER O
			JOIN tblPRESCRIPTION P ON O.OrderID = P.OrderID
			JOIN tblMEDICINE M ON P.MedicineID = M.MedicineID
		WHERE O.OrderID = @PKID)
RETURN @Ret
END
GO

-- Adds a column to the order table using the above function
ALTER TABLE tblORDER
ADD TotalPrice
AS (dbo.fn_CalcOrderTotal(OrderID))
GO

-- Creates function to find the number of brands of a medicine type
-- Written by Rebecca
CREATE FUNCTION fn_CalcNumBrandsMedType(@PKID INT)
RETURNS INT
AS
BEGIN
	DECLARE @Ret INT = 
		(SELECT COUNT(DISTINCT B.BrandID)
		FROM tblMEDICINE_TYPE MT
			JOIN tblMEDICINE M ON MT.MedicineTypeID = M.MedicineTypeID
			JOIN tblBRAND B ON M.BrandID = B.BrandID
		WHERE MT.MedicineTypeID = @PKID)
RETURN @Ret
END
GO

-- Adds a column to the medicine type table using the above function
ALTER TABLE tblMEDICINE_TYPE
ADD NumBrands
AS (dbo.fn_CalcNumBrandsMedType(MedicineTypeID))
GO

-- Creates function to find the number of labs run on the current day of a lab type
-- Written by Anish
CREATE FUNCTION fn_CalcNumLabsOfType(@L_ID INT)
RETURNS INT
AS
BEGIN
   RETURN (
       SELECT COUNT(DISTINCT LabID)
       FROM tblLAB_TYPE LT
	    JOIN tblLab L ON LT.LabTypeID = L.LabTypeID
       WHERE LabID = @L_ID 
	   AND LabDate = GetDate()
   )
END
GO

-- Adds a column to the lab type table using the above function
ALTER TABLE tblLAB_TYPE
ADD NumLabsToday 
AS dbo.fn_CalcNumLabsOfType(LabTypeID)
GO

-- Creates function to find the number of patients that have had an appointment in a hospital in the last year
-- Written by Anish
CREATE FUNCTION fn_CalcNumPatientsHospital(@H_ID INT)
RETURNS INT
AS
BEGIN
   RETURN (
       SELECT COUNT(DISTINCT P.PatientID)
       FROM tblPatient P
			JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID
			JOIN tblDEPARTMENT D ON A.DepartmentID = D.DepartmentID
			JOIN tblHOSPITAL H ON D.HospitalID = H.HospitalID
		WHERE H.HospitalID = @H_ID
		AND A.AppointmentDateTime BETWEEN DateAdd(year, -1, GETDATE()) AND GETDATE()
   )
END
GO

-- Adds a column to the hospital table using the above function
ALTER TABLE tblHOSPITAL
ADD NumPatients 
AS dbo.fn_CalcNumPatientsHospital(HospitalID)
GO

--------------------
-- Creating Views --
--------------------

/*
Creates a view that provides the number of patients that have each type of frequency of appointments:
>=50 in the last year: Extreme
20-49: Frequent
10-19: Mild
3-9: Semi Normal
<3: Normal
*/
-- Written by Damita
CREATE VIEW AppointmentFrequencyView
AS
SELECT (CASE
	WHEN NumofAppointments >= 50
		THEN 'Extreme'
	WHEN NumofAppointments BETWEEN 20 AND 49
		THEN 'Frequent'
	WHEN NumofAppointments BETWEEN 10 AND 19
		THEN 'Mild'
	WHEN NumofAppointments BETWEEN 3 AND 9
		THEN 'Semi-Normal'
	ELSE 'Normal'
END) AS AppointmentFreq, COUNT(*) NumPatients
FROM (
	SELECT P.PatientID, COUNT(A.AppointmentID) AS NumofAppointments
	FROM tblAPPOINTMENT A
	   JOIN tblPATIENT P ON A.PatientID = P.PatientID
	WHERE A.AppointmentDatetime BETWEEN DateAdd(year, -1, GETDATE()) AND GETDATE()
	GROUP BY P.PatientID) AS subq1
GROUP BY (CASE
WHEN NumofAppointments >= 50
	THEN 'Extreme'
WHEN NumofAppointments BETWEEN 20 AND 49
	THEN 'Frequent'
WHEN NumofAppointments BETWEEN 10 AND 19
	THEN 'Mild'
WHEN NumofAppointments BETWEEN 3 AND 9
	THEN 'Semi-Normal'
ELSE 'Normal'
END)
GO

-- Creates a view to rank the frequency of diagnoses connected to each medicine type partitioned by hospital
-- Written by Damita
CREATE VIEW Diagnosis_MedicineType_Hospital
AS
SELECT MT.MedicineTypeID, MT.MedicineTypeName, H.HospitalName, DN.DiagnosisName, COUNT(DN.DiagnosisID) AS DiagnosisCount,
	RANK() OVER (
	   PARTITION BY H.HospitalID
	   ORDER BY COUNT(DN.DiagnosisID) DESC
	) AS DiagnosisFreqRank
FROM tblHOSPITAL H
	JOIN tblDEPARTMENT D ON H.HospitalID = D.HospitalID
	JOIN tblAPPOINTMENT A ON D.DepartmentID = A.DepartmentID
	JOIN tblAPPOINTMENT_DIAGNOSIS AD ON A.AppointmentID = AD.AppointmentID
	JOIN tblDIAGNOSIS DN ON AD.DiagnosisID = DN.DiagnosisID
	JOIN tblORDER O ON A.AppointmentID = O.AppointmentID
	JOIN tblPRESCRIPTION P ON O.OrderID = P.OrderID
	JOIN tblMEDICINE M ON P.MedicineID = M.MedicineID
	JOIN tblMEDICINE_TYPE MT ON M.MedicineTypeID = MT.MedicineTypeID
	GROUP BY MT.MedicineTypeID, MT.MedicineTypeName, H.HospitalID, H.HospitalName, DN.DiagnosisName
GO

-- Creates a view for patients, appointments, and insurance that have more than 3 diagnosis
-- Written by Zhi
CREATE VIEW AppointmentsByPatientInsuranceMoreThan3Diagnosis AS
SELECT 
P.PatientFirstName, P.PatientLastName, P.PatientDOB, 
A.AppointmentDateTime, IP.InsurancePlanName, IP.InsuranceDesc
From tblAPPOINTMENT A
  JOIN tblPATIENT P ON A.PatientID = P.PatientID
  JOIN tblPATIENT_INSURANCE_PLAN PIP ON P.PatientID = PIP.PatientID
  JOIN tblINSURANCE_PLAN IP ON PIP.InsurancePlanID = IP.InsurancePlanID 
  JOIN (
    SELECT A.AppointmentID
    FROM tblAPPOINTMENT A
    JOIN tblAPPOINTMENT_DIAGNOSIS AD ON A.AppointmentID = AD.AppointmentID
    JOIN tblDIAGNOSIS D ON AD.DiagnosisID = D.DiagnosisID
    GROUP BY A.AppointmentID
    HAVING COUNT(D.DiagnosisID) > 3
  ) AS subq1 ON A.AppointmentID = subq1.AppointmentID
GO

-- Creates a view showing number of appointments each staff member (who has more than 1) 
-- has had in each department as well as their first and last appointment
-- Written by Zhi
CREATE VIEW StaffAppointmentsByDepartment AS
SELECT H.HospitalName, D.DepartmentName, S.StaffFirstName, S.StaffLastName, S.StaffDOB, 
COUNT(A.AppointmentID) AS NumApp, MIN(A.AppointmentDateTime) As FirstApp, MAX(A.AppointmentDateTime) As LastApp
FROM tblHOSPITAL H
  JOIN tblDEPARTMENT D ON H.HospitalID = D.HospitalID
  JOIN tblAPPOINTMENT A ON D.DepartmentID = A.DepartmentID
  JOIN tblPATIENT P ON A.PatientID = P.PatientID
  JOIN tblAPPOINTMENT_STAFF APS ON A.AppointmentID = APS.AppointmentID
  JOIN tblSTAFF S ON APS.StaffID = S.StaffID
GROUP BY H.HospitalName, D.DepartmentName, S.StaffFirstName, S.StaffLastName, S.StaffDOB
HAVING COUNT(A.AppointmentID) > 1
GO

-- Creates a view of all appointments scheduled for today
-- Written by Rebecca
CREATE VIEW StaffAppointmentSchedule AS
SELECT  A.AppointmentDateTime, S.StaffFirstName, S.StaffLastName, P.PatientFirstName, 
P.PatientLastName, P.PatientDOB, APT.AppointmentTypeName, D.DepartmentName,
ROW_NUMBER() OVER (
	   PARTITION BY S.StaffID
	   ORDER BY A.AppointmentDateTime
	) AS AppointmentOrder
FROM tblSTAFF S
	JOIN tblAPPOINTMENT_STAFF APS ON S.StaffID = APS.StaffID
	JOIN tblAPPOINTMENT A ON APS.AppointmentID = A.AppointmentID
	JOIN tblPATIENT P ON A.PatientID = P.PatientID
	JOIN tblAPPOINTMENT_TYPE APT ON A.AppointmentTypeID = APT.AppointmentTypeID
	JOIN tblDEPARTMENT D ON A.DepartmentID = D.DepartmentID
WHERE A.AppointmentDateTime = GETDATE()
GO

-- Creates view of all orders from the last 3 days
-- Written by Rebecca
CREATE VIEW OrderReport AS
SELECT O.OrderID, P.PatientID, IC.InsuranceCompName, I.InsurancePlanName, 
M.MedicineName, MT.MedicineTypeName, MF.MedicineFormName, PR.PrescriptionDosage, PR.PrescriptionRefills
FROM tblINSURANCE_COMP IC
	JOIN tblINSURANCE_PLAN I ON IC.InsuranceCompID = I.InsuranceCompID
	JOIN tblPATIENT_INSURANCE_PLAN PIP ON I.InsurancePlanID = PIP.InsurancePlanID
	JOIN tblPATIENT P ON PIP.PatientID = P. PatientID
	JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID
	JOIN tblORDER O ON A.AppointmentID = O.AppointmentID
	JOIN tblPRESCRIPTION PR ON O.OrderID = PR.OrderID
	JOIN tblMEDICINE M ON PR.MedicineID = M.MedicineID
	JOIN tblMEDICINE_TYPE MT ON M.MedicineTypeID = MT.MedicineTypeID
	JOIN tblMEDICINE_FORM MF ON M.MedicineFormID = MF.MedicineFormID
WHERE O.OrderDate BETWEEN DATEADD(day, -3, GETDATE()) AND GETDATE()
GO

-- Creates a view to rank the frequency of diagnoses connected to each symptom partitioned by hospital
-- Written by Anish
CREATE VIEW DiagnosisSymptom
AS
SELECT S.SymptomID, S.SymptomName, H.HospitalID, H.HospitalName, DN.DiagnosisName, COUNT(DN.DiagnosisID) AS DiagnosisCount,
	RANK() OVER (
	   PARTITION BY H.HospitalID
	   ORDER BY COUNT(DN.DiagnosisID) DESC
	) AS DiagnosisFreqRank
FROM tblHOSPITAL H
	JOIN tblDEPARTMENT D ON H.HospitalID = D.HospitalID
	JOIN tblAPPOINTMENT A ON D.DepartmentID = A.DepartmentID
	JOIN tblAPPOINTMENT_DIAGNOSIS AD ON A.AppointmentID = AD.AppointmentID
	JOIN tblDIAGNOSIS DN ON AD.DiagnosisID = DN.DiagnosisID
	JOIN tblAPPOINTMENT_SYMPTOM ASS ON ASS.AppointmentID = A.AppointmentID
	JOIN tblSymptom S ON S.SymptomID = ASS.SymptomID
GROUP BY S.SymptomID, S.SymptomName, H.HospitalID, H.HospitalName, DN.DiagnosisName
GO

---------------------
-- Additional code --
---------------------

/*
GetID stored procedures
*/

-- Creates 'GetID' SPROC for MedicineTypeID
CREATE PROCEDURE uspGetMedicineTypeID
@MT_Name2 NVARCHAR(100),
@MT_ID2 INT OUTPUT
AS 
SET @MT_ID2 = 
	(SELECT MedicineTypeID 
	FROM tblMEDICINE_TYPE 
	WHERE MedicineTypeName = @MT_Name2)
GO

-- Creates 'GetID' SPROC for BrandID
CREATE PROCEDURE uspGetBrandID
@MB_Name2 NVARCHAR(100),
@MB_ID2 int Output
AS 
SET @MB_ID2 = 
	(SELECT BrandID 
	FROM tblBRAND 
	WHERE BrandName = @MB_Name2)
GO

-- Creates 'GetID' SPROC for MedicineFormID
CREATE PROCEDURE uspGetMedicineFormID
@MF_Name2 NVARCHAR(100),
@MF_ID2 INT OUTPUT
AS
SET @MF_ID2 = 
	(SELECT MedicineFormID 
	FROM tblMEDICINE_FORM 
	WHERE MedicineFormName = @MF_Name2)
GO

-- Creates 'GetID' SPROC for PatientID
CREATE PROCEDURE uspGetPatientID
@PatientFname2 NVARCHAR(35),
@PatientLname2 NVARCHAR(35),
@PatientDOB2 DATE,
@P_ID2 INT OUTPUT
AS 
SET @P_ID2 = 
	(Select PatientID 
	From tblPATIENT 
	Where PatientFirstName = @PatientFname2 
	AND PatientLastName = @PatientLname2 
	AND PatientDOB = @PatientDOB2)
GO

-- Creates 'GetID' SPROC for DepartmentID
CREATE PROCEDURE uspGetDepartmentID
@D_Name2 NVARCHAR(100),
@H_ID2 INT,
@D_ID2 INT OUTPUT
AS 
SET @D_ID2 = 
	(SELECT DepartmentID 
	FROM tblDEPARTMENT 
	WHERE DepartmentName = @D_Name2 
	AND HospitalID = @H_ID2)
GO

-- Creates 'GetID' SPROC for HospitalID
CREATE PROCEDURE uspGetHospitalID
@H_Name2 NVARCHAR(100),
@H_ID2 INT OUTPUT
AS 
SET @H_ID2 = 
	(SELECT HospitalID 
	FROM tblHOSPITAL 
	WHERE HospitalName = @H_Name2)
GO

-- Creates 'GetID' SPROC for AppointmentTypeID
CREATE PROCEDURE uspGetAppointmentTypeID
@AT_Name2 NVARCHAR(100),
@AT_ID2 INT OUTPUT
AS 
SET @AT_ID2 = 
	(SELECT AppointmentTypeID 
	FROM tblAPPOINTMENT_TYPE 
	WHERE AppointmentTypeName = @AT_Name2)
GO

-- Creates 'GetID' SPROC for AppointmentID
CREATE PROCEDURE uspGetAppointmentID
@PatientFname3 NVARCHAR(35),
@PatientLname3 NVARCHAR(35),
@PatientDOB3 DATE,
@AppointmentDateTime3 DATETIME,
@A_ID3 INT OUTPUT
AS

DECLARE @P_ID INT

Exec uspGetPatientID
@PatientFname2 = @PatientFname3,
@PatientLname2 = @PatientLname3,
@PatientDOB2 = @PatientDOB3, 
@P_ID2 = @P_ID OUTPUT

IF @P_ID IS NULL
	BEGIN
		PRINT 'Could not find patient. Check spelling of @PatientFirstName, @PatientLastName, @PatientDOB';
		THROW 560001, 'Null value will fail', 1;
	END

SET @A_ID3 =
	(SELECT AppointmentID
	FROM tblAPPOINTMENT
	WHERE PatientID = @P_ID
	AND AppointmentDateTime = @AppointmentDateTime3)
GO

-- Creates 'GetID' SPROC for SeverityID
CREATE PROCEDURE uspGetSeverityID
@SeverityName2 NVARCHAR(100),
@Sev_ID2 INT OUTPUT
AS
SET @Sev_ID2 =
	(SELECT SeverityID
	FROM tblSEVERITY
	WHERE SeverityName = @SeverityName2)
GO

-- Creates 'GetID' SPROC for SymptomID
CREATE PROCEDURE uspGetSymptomID
@SymptomName2 NVARCHAR(100),
@Sym_ID2 INT OUTPUT
AS
SET @Sym_ID2 =
	(SELECT SymptomID
	FROM tblSYMPTOM
	WHERE SymptomName = @SymptomName2)
GO

-- Creates 'GetID' SPROC for OrderID
CREATE PROCEDURE uspGetOrderID
@PatientFname4 NVARCHAR(35),
@PatientLname4 NVARCHAR(35),
@PatientDOB4 DATE,
@AppointmentDateTime4 DATETIME,
@OrderDate4 DATE,
@O_ID4 INT OUTPUT
AS

DECLARE @A_ID4 INT

Exec uspGetAppointmentID
@PatientFname3 = @PatientFname4,
@PatientLname3 = @PatientLname4,
@PatientDOB3 = @PatientDOB4, 
@AppointmentDateTime3 = @AppointmentDateTime4,
@A_ID3 = @A_ID4 OUTPUT

IF @A_ID4 IS NULL
	BEGIN
		PRINT 'Could not find appointment. Check that patient and @AppointmentDateTime are correct';
		THROW 560001, 'Null value will fail', 1;
	END

SET @O_ID4 =
	(SELECT OrderID
	FROM tblORDER
	WHERE AppointmentID = @A_ID4
	AND OrderDate = @OrderDate4)
GO

-- Creates 'GetID' SPROC for MedicineID
CREATE PROCEDURE uspGetMedicineID
@MedicineName2 NVARCHAR(100),
@M_ID2 INT OUTPUT
AS
SET @M_ID2 =
	(SELECT MedicineID
	FROM tblMEDICINE
	WHERE MedicineName = @MedicineName2)
GO

-- Creates 'GetID' SPROC for StaffID
CREATE PROCEDURE uspGetStaffID
@StaffFname2 NVARCHAR(35),
@StaffLname2 NVARCHAR(35),
@StaffDOB2 DATE,
@ST_ID2 INT OUTPUT
AS
SET @ST_ID2 = 
	(SELECT StaffID 
	FROM tblSTAFF 
	WHERE StaffFirstName = @StaffFname2 
	AND StaffLastName = @StaffLname2 
	AND StaffDOB = @StaffDOB2)
GO

-- Creates 'GetID' SPROC for DiagnosisID
CREATE PROCEDURE uspGetDiagnosisID
@DiagnosisName2 NVARCHAR(100),
@DiagnosisID2 INT OUTPUT
AS
SET @DiagnosisID2 = 
	(SELECT DiagnosisID 
	FROM tblDIAGNOSIS 
	WHERE DiagnosisName = @DiagnosisName2)
GO

-- Creates 'GetID' SPROC for LabTypeID
CREATE PROCEDURE uspGetLabTypeID
@LabTypeName2 NVARCHAR(100),
@LT_ID2 INT OUTPUT
AS
SET @LT_ID2 = 
	(SELECT LabTypeID 
	FROM tblLAB_TYPE
	WHERE LabTypeName = @LabTypeName2)
GO

-- Creates 'GetID' SPROC for InsurancePlanID
CREATE PROCEDURE uspGetIP_ID
@InsurancePlanName2 NVARCHAR(100),
@IP_ID2 INT OUTPUT
AS 
BEGIN
SET @IP_ID2 = 
	(SELECT InsurancePlanID 
	FROM tblINSURANCE_PLAN 
	WHERE InsurancePlanName = @InsurancePlanName2)
END
GO

/*
Wrappers to populate tables
*/

-- Creates wrapper for inserting into tblAPPOINTMENT
CREATE PROCEDURE uspWRAPPER_InsAppointment
@Run INT
AS

DECLARE @PFN NVARCHAR(35), @PLN NVARCHAR(35), @PDOB DATE, @DN NVARCHAR(100), @HN NVARCHAR(100), @ATN NVARCHAR(100), @ADT DATETIME

DECLARE @PatCount INT = (SELECT COUNT(*) FROM tblPATIENT)
DECLARE @DCount INT = (SELECT COUNT(*) FROM tblDEPARTMENT)
DECLARE @ATCount INT = (SELECT COUNT(*) FROM tblAPPOINTMENT_TYPE)

DECLARE @PatPK INT
DECLARE @D_PK INT
DECLARE @AT_PK INT

DECLARE @RAND INT

WHILE @Run > 0
BEGIN
SET @PatPK = (SELECT RAND() * @PatCount + 1)
SET @PFN = (SELECT PatientFirstName FROM tblPATIENT WHERE PatientID = @PatPK)
SET @PLN = (SELECT PatientLastName FROM tblPATIENT WHERE PatientID = @PatPK)
SET @PDOB = (SELECT PatientDOB FROM tblPATIENT WHERE PatientID = @PatPK)

SET @D_PK = (SELECT RAND() * @DCount + 1)
SET @DN = (SELECT DepartmentName FROM tblDEPARTMENT WHERE DepartmentID = @D_PK)

SET @HN = (SELECT HospitalName FROM tblHOSPITAL H JOIN tblDEPARTMENT D ON H.HospitalID = D.HospitalID WHERE D.DepartmentID = @D_PK)

SET @AT_PK = (SELECT RAND() * @ATCount + 1)
SET @ATN = (SELECT AppointmentTypeName FROM tblAPPOINTMENT_TYPE WHERE AppointmentTypeID = @AT_PK)

SET @RAND = (SELECT RAND() * 1000)
SET @ADT = (SELECT GetDate() - @RAND)

EXEC uspInsAppointment
@PatientFname = @PFN,
@PatientLname = @PLN,
@PatientDOB = @PDOB,
@D_Name = @DN,
@H_Name = @HN,
@AT_Name = @ATN,
@AppointmentDateTime = @ADT

SET @Run = @Run -1
END
GO

-- Creates wrapper for inserting into tblPRESCRIPTION with first half being new Orders
CREATE PROCEDURE wapper_popPrescription
@Run INT
AS

DECLARE @Half INT = @Run / 2
DECLARE @FN NVARCHAR(35), @LN NVARCHAR(35), @DOB DATE, @ADate DATETIME, @ODate DATE, 
		@Med NVARCHAR(100), @Dose NVARCHAR(100), @Refills INT, @Expiration DATE
DECLARE @App_PK INT, @Ord_PK INT, @Med_PK INT
DECLARE @AppCount INT = (SELECT COUNT(*) FROM tblAPPOINTMENT)
DECLARE @MedCount INT = (SELECT COUNT(*) FROM tblMEDICINE)
DECLARE @Rand INT

WHILE @Run > @Half
BEGIN
	
	SET @App_PK = (SELECT RAND() * @AppCount + 1)
	SET @Med_PK = (SELECT RAND() * @MedCount + 1)

	SET @FN = (SELECT P.PatientFirstName FROM tblPATIENT P JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID WHERE A.AppointmentID = @App_PK)
	SET @LN = (SELECT PatientLastName FROM tblPATIENT P JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID WHERE A.AppointmentID = @App_PK)
	SET @DOB = (SELECT PatientDOB FROM tblPATIENT P JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID WHERE A.AppointmentID = @App_PK)
	SET @ADate = (SELECT AppointmentDateTime FROM tblAPPOINTMENT WHERE AppointmentID = @App_PK)
	SET @Med = (SELECT MedicineName FROM tblMEDICINE WHERE MedicineID = @Med_PK)
	SET @Rand = (SELECT RAND() * 10)
	SET @Dose = (CASE
		WHEN @Rand < 3
			THEN '250mg'
		WHEN @Rand BETWEEN 3 AND 5
			THEN '1 capsule'
		WHEN @Rand BETWEEN 6 AND 7
			THEN '100mg'
		ELSE '2 drops'
		END)
	SET @Refills = (SELECT CAST((SELECT RAND() * 5) AS INT))
	SET @Expiration = (SELECT DATEADD(month, CAST((SELECT RAND() * 5) AS INT), GETDATE()))

	EXEC uspAddPrescription
	@PatientFirstName = @FN,
	@PatientLastName = @LN,
	@PatientDOB = @DOB,
	@AppointmentDateTime = @ADate,
	@OrderDate = NULL,
	@MedicineName = @Med,
	@PrescriptionDosage = @Dose,
	@PrescriptionRefills = @Refills,
	@PrescriptionExpiration = @Expiration

	SET @Run = @Run - 1
END

DECLARE @OrdCount INT = (SELECT COUNT(*) FROM tblORDER)

WHILE @Run > 0
BEGIN
	
	SET @Ord_PK = (SELECT RAND() * @OrdCount + 1)
	SET @Med_PK = (SELECT RAND() * @MedCount + 1)

	SET @FN = (SELECT P.PatientFirstName FROM tblPATIENT P JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID JOIN tblORDER O ON A.AppointmentID = O.AppointmentID WHERE O.OrderID = @Ord_PK)
	SET @LN = (SELECT PatientLastName FROM tblPATIENT P JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID JOIN tblORDER O ON A.AppointmentID = O.AppointmentID WHERE O.OrderID = @Ord_PK)
	SET @DOB = (SELECT PatientDOB FROM tblPATIENT P JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID JOIN tblORDER O ON A.AppointmentID = O.AppointmentID WHERE O.OrderID = @Ord_PK)
	SET @ADate = (SELECT AppointmentDateTime FROM tblAPPOINTMENT A JOIN tblORDER O ON A.AppointmentID = O.AppointmentID WHERE O.OrderID = @Ord_PK)
	SET @ODate = (SELECT OrderDate FROM tblORDER WHERE OrderID = @Ord_PK)
	SET @Med = (SELECT MedicineName FROM tblMEDICINE WHERE MedicineID = @Med_PK)
	SET @Rand = (SELECT RAND() * 10)
	SET @Dose = (CASE
		WHEN @Rand < 3
			THEN '250mg'
		WHEN @Rand BETWEEN 3 AND 5
			THEN '1 capsule'
		WHEN @Rand BETWEEN 6 AND 7
			THEN '100mg'
		ELSE '2 drops'
		END)
	SET @Refills = (SELECT CAST((SELECT RAND() * 5) AS INT))
	SET @Expiration = (SELECT DATEADD(month, CAST((SELECT RAND() * 5) AS INT), GETDATE()))

	EXEC uspAddPrescription
	@PatientFirstName = @FN,
	@PatientLastName = @LN,
	@PatientDOB = @DOB,
	@AppointmentDateTime = @ADate,
	@OrderDate = @ODate,
	@MedicineName = @Med,
	@PrescriptionDosage = @Dose,
	@PrescriptionRefills = @Refills,
	@PrescriptionExpiration = @Expiration

	SET @Run = @Run - 1
END
GO

-- Creates wrapper for inserting into tblLAB and tblLAB RESULTS
CREATE PROCEDURE wrapper_popLabAndResults
@Run INT
AS

DECLARE @FN NVARCHAR(35), @LN NVARCHAR(35), @DOB DATE, @ADate DATETIME, @LTN NVARCHAR(100), @LDate DATE
DECLARE @App_PK INT, @LT_PK INT, @L_PK INT
DECLARE @AppCount INT = (SELECT COUNT(*) FROM tblAPPOINTMENT)
DECLARE @LTCount INT = (SELECT COUNT(*) FROM tblLAB_TYPE)

WHILE @Run > 0
BEGIN
	
	SET @App_PK = (SELECT RAND() * @AppCount + 1)
	SET @LT_PK = (SELECT RAND() * @LTCount + 1)

	SET @FN = (SELECT P.PatientFirstName FROM tblPATIENT P JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID WHERE A.AppointmentID = @App_PK)
	SET @LN = (SELECT PatientLastName FROM tblPATIENT P JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID WHERE A.AppointmentID = @App_PK)
	SET @DOB = (SELECT PatientDOB FROM tblPATIENT P JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID WHERE A.AppointmentID = @App_PK)
	SET @ADate = (SELECT AppointmentDateTime FROM tblAPPOINTMENT WHERE AppointmentID = @App_PK)
	SET @LTN = (SELECT LabTypeName FROM tblLAB_TYPE WHERE LabTypeID = @LT_PK)
	SET @LDate = (SELECT DATEADD(day, CAST((SELECT RAND() * 15) AS INT), GETDATE()))

	EXEC uspInstblLAB
	@PatientFname = @FN,
	@PatientLname = @LN,
	@PatientDOB = @DOB,
	@AppointmentDate = @ADate,
	@LT_name = @LTN,
	@DATE = @LDate

	SET @L_PK = (SELECT COUNT(*) FROM tblLAB)

	INSERT INTO tblLAB_RESULTS (LabID, LabResults)
	VALUES(@L_PK, (SELECT CONVERT(VARBINARY(MAX), '')))

	SET @Run = @Run - 1
END
GO

-- Creates wrapper for inserting into tblMESSAGE
CREATE PROCEDURE wrapper_uspInsMessage
@Run INT
AS
DECLARE @P_First NVARCHAR(35), @P_Last NVARCHAR(35), @P_Birth DATE, @S_First NVARCHAR(35), @S_Last NVARCHAR(35), @S_Birth DATE, @MText NVARCHAR(500), @MDate DATE
DECLARE @PatientCount INT = (SELECT COUNT(*) FROM tblPATIENT)
DECLARE @StaffCount INT = (SELECT COUNT(*) FROM tblSTAFF)
DECLARE @PatientPK INT, @StaffPK INT
DECLARE @RAND INT

WHILE @Run > 0
BEGIN
   SET @PatientPK = (SELECT RAND() * @PatientCount + 6)
   SET @P_First = (SELECT PatientFirstName FROM tblPATIENT WHERE PatientID = @PatientPK)
   SET @P_Last = (SELECT PatientLastName FROM tblPATIENT WHERE PatientID = @PatientPK)
   SET @P_Birth = (SELECT PatientDOB FROM tblPATIENT WHERE PatientID = @PatientPK)
   SET @StaffPK = (SELECT RAND() * @StaffCount + 1)
   SET @S_First = (SELECT StaffFirstName FROM tblSTAFF WHERE StaffID = @StaffPK)
   SET @S_Last = (SELECT StaffLastName FROM tblSTAFF WHERE StaffID = @StaffPK)
   SET @S_Birth = (SELECT StaffDOB FROM tblSTAFF WHERE StaffID = @StaffPK)
   SET @RAND = (SELECT RAND() * 1000)
   SET @MDate = (SELECT GETDATE() - @RAND)
   SET @MText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
   tempor incididunt ut labore et dolore magna aliqua.'

   EXEC uspInsMessage
   @PatF = @P_First,
   @PatL = @P_Last,
   @PatDOB = @P_Birth,
   @StaffF = @S_First,
   @StaffL = @S_Last,
   @StaffBirth = @S_Birth,
   @MsgTxt = @MText,
   @MsgDate = @MDate

   SET @Run = @Run - 1
END
GO

-- Creates wrapper for inserting into tblPATIENT_INSURANCE_PLAN
CREATE PROCEDURE uspWRAPPER_InsPatientInsurancePlan
@Run INT
AS

DECLARE @PFN NVARCHAR(35), @PLN NVARCHAR(35), @PDOB DATE, @IPN NVARCHAR(100)

DECLARE @PatCount INT = (SELECT COUNT(*) FROM tblPATIENT)
DECLARE @IPCount INT = (SELECT COUNT(*) FROM tblINSURANCE_PLAN)

DECLARE @PatPK INT
DECLARE @IP_PK INT

WHILE @Run > 0
BEGIN
SET @PatPK = (SELECT RAND() * @PatCount + 6)
SET @PFN = (SELECT PatientFirstName FROM tblPATIENT WHERE PatientID = @PatPK)
SET @PLN = (SELECT PatientLastName FROM tblPATIENT WHERE PatientID = @PatPK)
SET @PDOB = (SELECT PatientDOB FROM tblPATIENT WHERE PatientID = @PatPK)

SET @IP_PK = (SELECT RAND() * @IPCount + 1)
SET @IPN = (SELECT InsurancePlanName FROM tblINSURANCE_PLAN WHERE InsurancePlanID = @IP_PK)

EXEC uspInsPatientInsurancePlan
@PatientFname = @PFN,
@PatientLname = @PLN,
@PatientDOB = @PDOB,
@InsurancePlanName = @IPN

SET @Run = @Run - 1

END
GO

-- Creates wrapper for inserting into tblAPPOINTMENT_DIAGNOSIS
CREATE PROCEDURE wrapper_uspInsAppDiagnosis
@Run INT
AS

DECLARE @P_FName NVARCHAR(35), @P_LName NVARCHAR(35), @P_Birth DATE, @App_Date DATETIME, @D_Name NVARCHAR(100)
DECLARE @AppointmentCount INT = (SELECT COUNT(*) FROM tblAPPOINTMENT)
DECLARE @DiagnosisCount INT = (SELECT COUNT(*) FROM tblDIAGNOSIS)
DECLARE @AppointmentPK INT
DECLARE @DiagnosisPK INT
DECLARE @RAND INT

WHILE @Run > 0
BEGIN
   SET @AppointmentPK = (SELECT RAND() * @AppointmentCount + 1)
   SET @P_FName = (
       SELECT PatientFirstName
       FROM tblPATIENT P
       JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID
       WHERE A.AppointmentID = @AppointmentPK
   )
   SET @P_LName = (
       SELECT PatientLastName
       FROM tblPATIENT P
       JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID
       WHERE A.AppointmentID = @AppointmentPK
   )
   SET @P_Birth = (
       SELECT PatientDOB
       FROM tblPATIENT P JOIN tblAPPOINTMENT A
       ON P.PatientID = A.PatientID
       WHERE A.AppointmentID = @AppointmentPK
   )
   SET @App_Date = (SELECT AppointmentDateTime FROM tblAPPOINTMENT WHERE AppointmentID = @AppointmentPK)
   SET @DiagnosisPK = (SELECT RAND() * @DiagnosisCount + 1)
   SET @D_Name = (SELECT DiagnosisName FROM tblDIAGNOSIS WHERE DiagnosisID = @DiagnosisPK)

   EXEC uspInsAppDiagnosis
   @Patient_FName = @P_FName,
   @Patient_LName = @P_LName,
   @Patient_DOB = @P_Birth,
   @AppDate = @App_Date,
   @Diagnosis_Name = @D_Name

   SET @Run = @Run - 1
END
GO

-- Creates wrapper for inserting into tblAPPOINTMENT_SYMPTOM
CREATE PROCEDURE uspWRAPPER_InsAppointment_Symptom
@Run INT
AS

DECLARE @PFN NVARCHAR(35), @PLN NVARCHAR(35), @PDOB DATE, @ADate DATETIME, @SymN NVARCHAR(100), @SevN NVARCHAR(100)

DECLARE @AppCount INT = (SELECT COUNT(*) FROM tblAPPOINTMENT)
DECLARE @SymCount INT = (SELECT COUNT(*) FROM tblSYMPTOM)
DECLARE @SevCount INT = (SELECT COUNT(*) FROM tblSEVERITY)

DECLARE @App_PK INT
DECLARE @Sym_PK INT
DECLARE @Sev_PK INT

DECLARE @RAND INT

WHILE @Run > 0
BEGIN

SET @App_PK = (SELECT RAND() * @AppCount + 1)
SET @Sym_PK = (SELECT RAND() * @SymCount + 1)
SET @Sev_PK = (SELECT RAND() * @SevCount + 2)

SET @PFN = (SELECT P.PatientFirstName FROM tblPATIENT P JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID WHERE A.AppointmentID = @App_PK)
SET @PLN = (SELECT PatientLastName FROM tblPATIENT P JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID WHERE A.AppointmentID = @App_PK)
SET @PDOB = (SELECT PatientDOB FROM tblPATIENT P JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID WHERE A.AppointmentID = @App_PK)
SET @ADate = (SELECT AppointmentDateTime FROM tblAPPOINTMENT WHERE AppointmentID = @App_PK)

SET @SymN = (SELECT SymptomName FROM tblSYMPTOM WHERE SymptomID = @Sym_PK)
SET @SevN = (SELECT SeverityName FROM tblSEVERITY WHERE SeverityID = @Sev_PK)

EXEC uspInsAppointment_Symptom
@PatientFirstName = @PFN,
@PatientLastName = @PLN,
@PatientDOB = @PDOB,
@AppointmentDateTime = @ADate,
@Sym_Name = @SymN,
@Sev_Name = @SevN

SET @Run = @Run -1
END
GO

-- Creates wrapper for inserting into tblAPPOINTMENT_PROCEDURE
CREATE PROCEDURE uspWRAPPER_InsAPPOINTMENT_PROCEDURE
@Run INT
AS

DECLARE @PFN NVARCHAR(35), @PLN NVARCHAR(35), @PDOB DATE, @ADate DATETIME,
        @SFN NVARCHAR(100), @SLN NVARCHAR(100), @SDOB DATE, 
        @ProceN NVARCHAR(100), @ProRes NVARCHAR(500), @ProNotes NVARCHAR(500)

DECLARE @AppCount INT = (SELECT COUNT(*) FROM tblAPPOINTMENT)
DECLARE @SCount INT = (SELECT COUNT(*) FROM tblSTAFF)
DECLARE @ProCount INT = (SELECT COUNT(*) FROM tblPROCEDURE)

DECLARE @App_PK INT
DECLARE @S_PK INT
DECLARE @Pro_PK INT

DECLARE @RAND INT

WHILE @Run > 0
BEGIN

SET @App_PK = (SELECT RAND() * @AppCount + 1)
SET @S_PK = (SELECT TOP 1 StaffID FROM tblAPPOINTMENT_STAFF WHERE AppointmentID = @App_PK)

WHILE @S_PK IS NULL
	BEGIN
		SET @App_PK = (SELECT RAND() * @AppCount + 1)
		SET @S_PK = (SELECT TOP 1 StaffID FROM tblAPPOINTMENT_STAFF WHERE AppointmentID = @App_PK)
	END

SET @Pro_PK = (SELECT RAND() * @ProCount + 1)

SET @PFN = (SELECT P.PatientFirstName FROM tblPATIENT P JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID WHERE A.AppointmentID = @App_PK)
SET @PLN = (SELECT PatientLastName FROM tblPATIENT P JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID WHERE A.AppointmentID = @App_PK)
SET @PDOB = (SELECT PatientDOB FROM tblPATIENT P JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID WHERE A.AppointmentID = @App_PK)
SET @ADate = (SELECT AppointmentDateTime FROM tblAPPOINTMENT WHERE AppointmentID = @App_PK)

SET @SFN = (SELECT StaffFirstName FROM tblSTAFF WHERE StaffID = @S_PK)
SET @SLN = (SELECT StaffLastName FROM tblSTAFF WHERE StaffID = @S_PK)
SET @SDOB = (SELECT StaffDOB FROM tblSTAFF WHERE StaffID = @S_PK)

SET @ProceN = (SELECT ProcedureName FROM tblPROCEDURE WHERE ProcedureID = @Pro_PK)

SET @Rand = (SELECT RAND() * 10)

SET @ProRes = (CASE
  WHEN @Rand < 3
    THEN 'Unsucessful'
  WHEN @Rand BETWEEN 3 AND 5
    THEN 'Good and bad news'
  WHEN @Rand BETWEEN 6 AND 7
    THEN 'Very sucessful'
  ELSE 'Successful'
  END)

SET @ProNotes = (CASE
  WHEN @Rand < 3
    THEN 'The procedure was unsucessful'
  WHEN @Rand BETWEEN 3 AND 5
    THEN 'Good and bad news about the procedure'
  WHEN @Rand BETWEEN 6 AND 7
    THEN 'The procedure was very sucessful'
  ELSE 'The procedure was successful'
  END)

EXEC uspInsAPPOINTMENT_PROCEDURE
@PatientFirstName = @PFN,
@PatientLastName = @PLN,
@PatientDOB = @PDOB,
@AppointmentDateTime = @ADate,
@StaffFname = @SFN ,
@StaffLname = @SLN ,
@StaffDOB = @SDOB,
@Pro_Name = @ProceN,
@ProcedureResults = @ProRes,
@ProcedureNotes = @ProNotes

SET @Run = @Run -1
END
GO

-- Creates wrapper for inserting into tblAPPOINTMENT_STAFF 
CREATE PROCEDURE uspWRAPPER_InsAppointment_Staff
@Run INT
AS

DECLARE @PFN NVARCHAR(100), @PLN NVARCHAR(100), @PDOB DATE, @ADate DATETIME,
        @SFN NVARCHAR(100), @SLN NVARCHAR(100), @SDOB DATE, @AN NVARCHAR(500)

DECLARE @AppCount INT = (SELECT COUNT(*) FROM tblAPPOINTMENT)
DECLARE @SCount INT = (SELECT COUNT(*) FROM tblSTAFF)

DECLARE @App_PK INT
DECLARE @S_PK INT

DECLARE @RAND INT

WHILE @Run > 0
BEGIN

SET @App_PK = (SELECT RAND() * @AppCount + 1)
SET @S_PK = (SELECT RAND() * @SCount + 1)

SET @PFN = (SELECT P.PatientFirstName FROM tblPATIENT P JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID WHERE A.AppointmentID = @App_PK)
SET @PLN = (SELECT PatientLastName FROM tblPATIENT P JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID WHERE A.AppointmentID = @App_PK)
SET @PDOB = (SELECT PatientDOB FROM tblPATIENT P JOIN tblAPPOINTMENT A ON P.PatientID = A.PatientID WHERE A.AppointmentID = @App_PK)
SET @ADate = (SELECT AppointmentDateTime FROM tblAPPOINTMENT WHERE AppointmentID = @App_PK)

SET @SFN = (SELECT StaffFirstName FROM tblSTAFF WHERE StaffID = @S_PK)
SET @SLN = (SELECT StaffLastName FROM tblSTAFF WHERE StaffID = @S_PK)
SET @SDOB = (SELECT StaffDOB FROM tblSTAFF WHERE StaffID = @S_PK)

SET @Rand = (SELECT RAND() * 10)

SET @AN = (CASE
  WHEN @Rand < 3
    THEN 'Patient has also asked to check their rash condition'
  WHEN @Rand BETWEEN 3 AND 5
    THEN 'Patient has also asked for a physical exam'
  WHEN @Rand BETWEEN 6 AND 7
    THEN 'Patient has also mentioned they have slight shoulder pain'
  ELSE 'No additional concerns'
  END)

EXEC uspInsAppointment_Staff
@PatientFirstName = @PFN,
@PatientLastName = @PLN,
@PatientDOB = @PDOB,
@AppointmentDateTime = @ADate,
@StaffFname = @SFN ,
@StaffLname = @SLN ,
@StaffDOB = @SDOB,
@AppointmentNotes = @AN

SET @Run = @Run -1
END
GO

