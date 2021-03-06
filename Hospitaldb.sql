USE [master]
GO
/****** Object:  Database [Hospitaldb]    Script Date: 8/23/2021 2:32:45 PM ******/
CREATE DATABASE [Hospitaldb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hospitaldb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Hospitaldb.mdf' , SIZE = 102400KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Hospitaldb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Hospitaldb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Hospitaldb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hospitaldb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hospitaldb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hospitaldb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hospitaldb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hospitaldb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hospitaldb] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hospitaldb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hospitaldb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Hospitaldb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hospitaldb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hospitaldb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hospitaldb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hospitaldb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hospitaldb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hospitaldb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hospitaldb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hospitaldb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hospitaldb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hospitaldb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hospitaldb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hospitaldb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hospitaldb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hospitaldb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hospitaldb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hospitaldb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hospitaldb] SET  MULTI_USER 
GO
ALTER DATABASE [Hospitaldb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hospitaldb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hospitaldb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hospitaldb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Hospitaldb]
GO
/****** Object:  Table [dbo].[EmployeeInfo]    Script Date: 8/23/2021 2:32:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeInfo](
	[EmpID] [varchar](10) NOT NULL,
	[EmpName] [varchar](100) NOT NULL,
	[Address] [varchar](40) NOT NULL,
	[Phone] [int] NOT NULL,
	[Role] [varchar](15) NOT NULL,
	[Username] [varchar](15) NOT NULL,
	[Password] [varchar](20) NOT NULL,
 CONSTRAINT [PK_EmployeeInfo] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExamInfo]    Script Date: 8/23/2021 2:32:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExamInfo](
	[ItemID] [varchar](10) NOT NULL,
	[ItemName] [varchar](60) NOT NULL,
	[Rate] [float] NOT NULL,
 CONSTRAINT [PK_ExamInfo] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Material]    Script Date: 8/23/2021 2:32:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Material](
	[ItemID] [varchar](15) NOT NULL,
	[ItemName] [varchar](80) NOT NULL,
	[ItemDescription] [varchar](180) NULL,
	[QtyInStock] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[TotalPrice] [float] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MedicineInfo]    Script Date: 8/23/2021 2:32:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MedicineInfo](
	[MedicineID] [varchar](20) NOT NULL,
	[MedicineName] [varchar](90) NOT NULL,
	[MedicineDescription] [varchar](180) NULL,
	[QuantityInStock] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[TotalPrice] [float] NOT NULL,
 CONSTRAINT [PK_MedicineInfo] PRIMARY KEY CLUSTERED 
(
	[MedicineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientAdmission]    Script Date: 8/23/2021 2:32:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PatientAdmission](
	[RegID] [varchar](20) NOT NULL,
	[RegName] [varchar](90) NOT NULL,
	[Age] [int] NOT NULL,
	[DOB] [date] NOT NULL,
	[BloodGroup] [varchar](10) NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[MaritalStatus] [varchar](15) NOT NULL,
	[Occupation] [varchar](30) NOT NULL,
	[FatherName] [varchar](90) NOT NULL,
	[MotherName] [varchar](90) NOT NULL,
	[NID] [int] NOT NULL,
	[Phone] [int] NOT NULL,
	[Address] [varchar](40) NOT NULL,
	[RefdDoctor] [varchar](90) NOT NULL,
	[DutyDoctor] [varchar](90) NOT NULL,
	[BedName] [varchar](20) NOT NULL,
	[BedId] [varchar](10) NOT NULL,
	[TotalAmount] [float] NOT NULL,
	[PaidAmount] [float] NOT NULL,
 CONSTRAINT [PK_PatientAdmission] PRIMARY KEY CLUSTERED 
(
	[RegID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientInfo]    Script Date: 8/23/2021 2:32:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PatientInfo](
	[InvoiceID] [varchar](10) NOT NULL,
	[PatientName] [varchar](90) NOT NULL,
	[Address] [varchar](40) NOT NULL,
	[Age] [int] NOT NULL,
	[DOB] [date] NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[ContactNo] [int] NOT NULL,
	[RefdBy] [varchar](20) NOT NULL,
	[DeliveryDate] [date] NOT NULL,
	[ItemTotal] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalBill] [float] NOT NULL,
	[PaidAmount] [float] NOT NULL,
	[DueAmount] [float] NOT NULL,
	[PaymentStatus] [varchar](10) NOT NULL,
 CONSTRAINT [PK_PatientInfo] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[EmployeeInfo] ([EmpID], [EmpName], [Address], [Phone], [Role], [Username], [Password]) VALUES (N'E-001', N'Md. Aktarul Islam', N'Chapainawabganj', 1786193272, N'Admin', N'Sony123', N'sony00')
INSERT [dbo].[EmployeeInfo] ([EmpID], [EmpName], [Address], [Phone], [Role], [Username], [Password]) VALUES (N'E-002', N'Nion', N'Shibganj', 1791949535, N'Manager', N'Nion123', N'nion00')
INSERT [dbo].[EmployeeInfo] ([EmpID], [EmpName], [Address], [Phone], [Role], [Username], [Password]) VALUES (N'E-003', N'Noman', N'Barisal', 4576456, N'Receptionist', N'Noman123', N'noman00')
INSERT [dbo].[EmployeeInfo] ([EmpID], [EmpName], [Address], [Phone], [Role], [Username], [Password]) VALUES (N'E-004', N'Hasnat', N'Dhaka', 14784644, N'Pharmacist', N'Hasan123', N'1122')
INSERT [dbo].[ExamInfo] ([ItemID], [ItemName], [Rate]) VALUES (N'B-0001', N'CBC', 450)
INSERT [dbo].[ExamInfo] ([ItemID], [ItemName], [Rate]) VALUES (N'B-0002', N'Blood Grouping', 100)
INSERT [dbo].[ExamInfo] ([ItemID], [ItemName], [Rate]) VALUES (N'B-0003', N'TC (Auto)', 150)
INSERT [dbo].[ExamInfo] ([ItemID], [ItemName], [Rate]) VALUES (N'B-0004', N'DC(Auto)', 150)
INSERT [dbo].[ExamInfo] ([ItemID], [ItemName], [Rate]) VALUES (N'B-0005', N'ESR (Auto)', 150)
INSERT [dbo].[ExamInfo] ([ItemID], [ItemName], [Rate]) VALUES (N'B-0006', N'Platelate Count (Auto)', 150)
INSERT [dbo].[ExamInfo] ([ItemID], [ItemName], [Rate]) VALUES (N'B-0007', N'FBS', 100)
INSERT [dbo].[ExamInfo] ([ItemID], [ItemName], [Rate]) VALUES (N'B-0008', N'RBS with CUS', 150)
INSERT [dbo].[ExamInfo] ([ItemID], [ItemName], [Rate]) VALUES (N'B-0009', N'PPBS', 200)
INSERT [dbo].[ExamInfo] ([ItemID], [ItemName], [Rate]) VALUES (N'B-0010', N'S.Creatinine', 350)
INSERT [dbo].[ExamInfo] ([ItemID], [ItemName], [Rate]) VALUES (N'B-0011', N'T3', 800)
INSERT [dbo].[ExamInfo] ([ItemID], [ItemName], [Rate]) VALUES (N'B-0012', N'T4', 800)
INSERT [dbo].[ExamInfo] ([ItemID], [ItemName], [Rate]) VALUES (N'B-0013', N'TSH', 800)
INSERT [dbo].[ExamInfo] ([ItemID], [ItemName], [Rate]) VALUES (N'B-0014', N'FSH', 1000)
INSERT [dbo].[ExamInfo] ([ItemID], [ItemName], [Rate]) VALUES (N'B-0015', N'E.C.G', 300)
INSERT [dbo].[ExamInfo] ([ItemID], [ItemName], [Rate]) VALUES (N'B-0016', N'Urine R/E', 100)
INSERT [dbo].[ExamInfo] ([ItemID], [ItemName], [Rate]) VALUES (N'B-0017', N'X-Ray (Filz Size 10X14)', 500)
INSERT [dbo].[Material] ([ItemID], [ItemName], [ItemDescription], [QtyInStock], [Price], [TotalPrice]) VALUES (N'Item-0001', N'Fan', N'', 10, 2500, 25000)
INSERT [dbo].[Material] ([ItemID], [ItemName], [ItemDescription], [QtyInStock], [Price], [TotalPrice]) VALUES (N'Item-0002', N'Desk', N'', 4, 7500, 30000)
INSERT [dbo].[Material] ([ItemID], [ItemName], [ItemDescription], [QtyInStock], [Price], [TotalPrice]) VALUES (N'Item-0003', N'Chair', N'1', 25, 450, 11250)
INSERT [dbo].[MedicineInfo] ([MedicineID], [MedicineName], [MedicineDescription], [QuantityInStock], [Price], [TotalPrice]) VALUES (N'MI-00001', N'Napa 500mg', N'', 100, 4, 400)
INSERT [dbo].[MedicineInfo] ([MedicineID], [MedicineName], [MedicineDescription], [QuantityInStock], [Price], [TotalPrice]) VALUES (N'MI-00002', N'Losectil', N'For Gastric', 50, 8, 400)
INSERT [dbo].[MedicineInfo] ([MedicineID], [MedicineName], [MedicineDescription], [QuantityInStock], [Price], [TotalPrice]) VALUES (N'MI-0003', N'Sergel (20mg)', N'', 100, 7, 700)
INSERT [dbo].[MedicineInfo] ([MedicineID], [MedicineName], [MedicineDescription], [QuantityInStock], [Price], [TotalPrice]) VALUES (N'MI-0004', N'Napa Extend 650mg', N'', 200, 3, 600)
INSERT [dbo].[PatientAdmission] ([RegID], [RegName], [Age], [DOB], [BloodGroup], [Gender], [MaritalStatus], [Occupation], [FatherName], [MotherName], [NID], [Phone], [Address], [RefdDoctor], [DutyDoctor], [BedName], [BedId], [TotalAmount], [PaidAmount]) VALUES (N'P-001', N'Noman', 20, CAST(N'1999-08-20' AS Date), N'A+', N'Male', N'Single', N'Student', N'Ansar Ali', N'Shamsunnahar', 54548444, 17846566, N'Sirajganj', N'Dr. Nurul', N'Dr. Shuvo', N'Cabin', N'403', 200, 200)
INSERT [dbo].[PatientAdmission] ([RegID], [RegName], [Age], [DOB], [BloodGroup], [Gender], [MaritalStatus], [Occupation], [FatherName], [MotherName], [NID], [Phone], [Address], [RefdDoctor], [DutyDoctor], [BedName], [BedId], [TotalAmount], [PaidAmount]) VALUES (N'R-002', N'Nion', 21, CAST(N'2000-07-20' AS Date), N'A+', N'Male', N'Single', N'Student', N'Motiur Rahman', N'Bilkis Banu', 155448764, 1791949535, N'Shibgnaj', N'Dr. Masum', N'Dr. Sharmin', N'Cabin', N'405', 200, 200)
INSERT [dbo].[PatientAdmission] ([RegID], [RegName], [Age], [DOB], [BloodGroup], [Gender], [MaritalStatus], [Occupation], [FatherName], [MotherName], [NID], [Phone], [Address], [RefdDoctor], [DutyDoctor], [BedName], [BedId], [TotalAmount], [PaidAmount]) VALUES (N'R-003', N'gfgfgh', 54, CAST(N'2021-08-12' AS Date), N'A+', N'Male', N'Single', N'ftyhftdyh', N'fghutyhr', N'tyityu', 32154, 5675, N'bnmvbhj', N'hjgyj', N'ghjs', N'Ward (Female)', N'56', 90, 90)
INSERT [dbo].[PatientAdmission] ([RegID], [RegName], [Age], [DOB], [BloodGroup], [Gender], [MaritalStatus], [Occupation], [FatherName], [MotherName], [NID], [Phone], [Address], [RefdDoctor], [DutyDoctor], [BedName], [BedId], [TotalAmount], [PaidAmount]) VALUES (N'R-004', N'dfgh', 56, CAST(N'2021-08-02' AS Date), N'A+', N'Male', N'Single', N'fdghf', N'fghdfg', N'fghfg', 546456, 54654, N'cvhjg', N'fghfg', N'fhfgh', N'Ward (Male)', N'45', 90, 90)
INSERT [dbo].[PatientAdmission] ([RegID], [RegName], [Age], [DOB], [BloodGroup], [Gender], [MaritalStatus], [Occupation], [FatherName], [MotherName], [NID], [Phone], [Address], [RefdDoctor], [DutyDoctor], [BedName], [BedId], [TotalAmount], [PaidAmount]) VALUES (N'R-005', N'gghdfggh', 45, CAST(N'2021-08-04' AS Date), N'A+', N'Male', N'Single', N'fgh', N'fghfgh', N'fghfgh', 54645, 456, N'fghfgh', N'fghfgh', N'fghfh', N'Ward (Male)', N'5', 68, 68)
INSERT [dbo].[PatientAdmission] ([RegID], [RegName], [Age], [DOB], [BloodGroup], [Gender], [MaritalStatus], [Occupation], [FatherName], [MotherName], [NID], [Phone], [Address], [RefdDoctor], [DutyDoctor], [BedName], [BedId], [TotalAmount], [PaidAmount]) VALUES (N'R-006', N'Abdullah', 28, CAST(N'1994-01-11' AS Date), N'A+', N'Male', N'Single', N'Business', N'Karim', N'Nurjahan', 1547893321, 1745879657, N'Rahanpur', N'Dr. Shahidul Islam Khan', N'Dr. Tarek Aziz', N'Cabin', N'405', 200, 200)
INSERT [dbo].[PatientAdmission] ([RegID], [RegName], [Age], [DOB], [BloodGroup], [Gender], [MaritalStatus], [Occupation], [FatherName], [MotherName], [NID], [Phone], [Address], [RefdDoctor], [DutyDoctor], [BedName], [BedId], [TotalAmount], [PaidAmount]) VALUES (N'R-007', N'1', 1, CAST(N'2021-08-23' AS Date), N'A+', N'Male', N'Single', N'1', N'1', N'1', 1, 1, N'1', N'1', N'1', N'Cabin', N'1', 300, 300)
INSERT [dbo].[PatientInfo] ([InvoiceID], [PatientName], [Address], [Age], [DOB], [Gender], [ContactNo], [RefdBy], [DeliveryDate], [ItemTotal], [Discount], [TotalBill], [PaidAmount], [DueAmount], [PaymentStatus]) VALUES (N'V-0001', N'Noman', N'Sirajganj', 21, CAST(N'1998-04-21' AS Date), N'Male', 1745896742, N'Self', CAST(N'2021-08-21' AS Date), 500, 100, 400, 400, 0, N'PAID')
INSERT [dbo].[PatientInfo] ([InvoiceID], [PatientName], [Address], [Age], [DOB], [Gender], [ContactNo], [RefdBy], [DeliveryDate], [ItemTotal], [Discount], [TotalBill], [PaidAmount], [DueAmount], [PaymentStatus]) VALUES (N'V-0002', N'Nion', N'Shibganj', 20, CAST(N'1999-07-15' AS Date), N'Male', 1745548774, N'Self', CAST(N'2021-08-21' AS Date), 400, 100, 300, 300, 0, N'PAID')
INSERT [dbo].[PatientInfo] ([InvoiceID], [PatientName], [Address], [Age], [DOB], [Gender], [ContactNo], [RefdBy], [DeliveryDate], [ItemTotal], [Discount], [TotalBill], [PaidAmount], [DueAmount], [PaymentStatus]) VALUES (N'V-0003', N'Tehan', N'Sylhet', 22, CAST(N'1999-08-13' AS Date), N'Male', 1745877785, N'Self', CAST(N'2021-08-21' AS Date), 600, 100, 550, 400, 150, N'DUE')
INSERT [dbo].[PatientInfo] ([InvoiceID], [PatientName], [Address], [Age], [DOB], [Gender], [ContactNo], [RefdBy], [DeliveryDate], [ItemTotal], [Discount], [TotalBill], [PaidAmount], [DueAmount], [PaymentStatus]) VALUES (N'V-0004', N'Hasnat', N'Dhaka', 25, CAST(N'1992-08-13' AS Date), N'Male', 17887444, N'Self', CAST(N'2021-08-21' AS Date), 300, 100, 200, 200, 0, N'PAID')
INSERT [dbo].[PatientInfo] ([InvoiceID], [PatientName], [Address], [Age], [DOB], [Gender], [ContactNo], [RefdBy], [DeliveryDate], [ItemTotal], [Discount], [TotalBill], [PaidAmount], [DueAmount], [PaymentStatus]) VALUES (N'V-0005', N'Abdullah', N'Bholahat', 25, CAST(N'1996-08-22' AS Date), N'Male', 1748795636, N'Self', CAST(N'2021-08-22' AS Date), 1400, 200, 1200, 1200, 0, N'PAID')
INSERT [dbo].[PatientInfo] ([InvoiceID], [PatientName], [Address], [Age], [DOB], [Gender], [ContactNo], [RefdBy], [DeliveryDate], [ItemTotal], [Discount], [TotalBill], [PaidAmount], [DueAmount], [PaymentStatus]) VALUES (N'V-0006', N'Aktarul', N'Bashundhara', 22, CAST(N'1999-08-19' AS Date), N'Male', 1478495545, N'Self', CAST(N'2021-08-22' AS Date), 450, 0, 450, 400, 50, N'DUE')
INSERT [dbo].[PatientInfo] ([InvoiceID], [PatientName], [Address], [Age], [DOB], [Gender], [ContactNo], [RefdBy], [DeliveryDate], [ItemTotal], [Discount], [TotalBill], [PaidAmount], [DueAmount], [PaymentStatus]) VALUES (N'V-0007', N'sony', N'dfgdfg', 23, CAST(N'1999-08-01' AS Date), N'Male', 34533434, N'Self', CAST(N'1900-01-01' AS Date), 600, 0, 600, 400, 200, N'DUE')
INSERT [dbo].[PatientInfo] ([InvoiceID], [PatientName], [Address], [Age], [DOB], [Gender], [ContactNo], [RefdBy], [DeliveryDate], [ItemTotal], [Discount], [TotalBill], [PaidAmount], [DueAmount], [PaymentStatus]) VALUES (N'V-0008', N'Sony', N'1', 1, CAST(N'2021-08-23' AS Date), N'Male', 1, N'Self', CAST(N'2021-08-23' AS Date), 450, 50, 400, 400, 0, N'PAID')
USE [master]
GO
ALTER DATABASE [Hospitaldb] SET  READ_WRITE 
GO
