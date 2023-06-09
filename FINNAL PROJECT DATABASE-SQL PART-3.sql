USE [master]
GO
/****** Object:  Database [KPNssIncDB]    Script Date: 3/9/2023 6:56:38 PM ******/
CREATE DATABASE [KPNssIncDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KPNssIncDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER2019\MSSQL\DATA\KPNssIncDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KPNssIncDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER2019\MSSQL\DATA\KPNssIncDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [KPNssIncDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KPNssIncDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KPNssIncDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KPNssIncDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KPNssIncDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KPNssIncDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KPNssIncDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [KPNssIncDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [KPNssIncDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KPNssIncDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KPNssIncDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KPNssIncDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KPNssIncDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KPNssIncDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KPNssIncDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KPNssIncDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KPNssIncDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [KPNssIncDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KPNssIncDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KPNssIncDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KPNssIncDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KPNssIncDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KPNssIncDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KPNssIncDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KPNssIncDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KPNssIncDB] SET  MULTI_USER 
GO
ALTER DATABASE [KPNssIncDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KPNssIncDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KPNssIncDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KPNssIncDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KPNssIncDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KPNssIncDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [KPNssIncDB] SET QUERY_STORE = OFF
GO
USE [KPNssIncDB]
GO
/****** Object:  Table [dbo].[LogIn]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogIn](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegID] [int] NULL,
	[Name] [varchar](32) NULL,
	[Email] [varchar](32) NULL,
	[Password] [varchar](32) NULL,
	[Role] [varchar](32) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fudf_GetEmployee]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fudf_GetEmployee]()  
RETURNS TABLE  
AS  
 RETURN (SELECT * FROM Login) 
GO
/****** Object:  Table [dbo].[AccountMng]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountMng](
	[Id] [int] IDENTITY(200,1) NOT NULL,
	[Name] [varchar](32) NULL,
	[MobileNo] [varchar](16) NULL,
	[DOB] [varchar](16) NULL,
	[Email] [varchar](32) NULL,
	[Password] [varchar](16) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AdId] [int] IDENTITY(1,1) NOT NULL,
	[state] [varchar](25) NULL,
	[Dist] [varchar](32) NULL,
	[PinCode] [varchar](16) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(10,1) NOT NULL,
	[Name] [varchar](32) NULL,
	[MobileNo] [varchar](16) NULL,
	[DOB] [varchar](16) NULL,
	[Email] [varchar](32) NULL,
	[Password] [varchar](16) NULL,
	[AdId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClaimsTable]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaimsTable](
	[Id] [uniqueidentifier] NOT NULL,
	[Empid] [int] NULL,
	[Role] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Destination] [varchar](50) NULL,
	[DateofApply] [date] NULL,
	[Days] [varchar](10) NULL,
	[Reason] [varchar](255) NULL,
	[Transport] [varchar](55) NULL,
	[Personal] [varchar](50) NULL,
	[CostSpend] [money] NULL,
	[Dateofdone] [date] NULL,
	[Status] [varchar](20) NULL,
	[feedback] [varchar](255) NULL,
	[payment] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpClaimsTable]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpClaimsTable](
	[Id] [uniqueidentifier] NOT NULL,
	[Empid] [int] NULL,
	[Role] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Destination] [varchar](50) NULL,
	[DateofApply] [date] NULL,
	[Days] [varchar](10) NULL,
	[Reason] [varchar](255) NULL,
	[Transport] [varchar](55) NULL,
	[CostSpend] [money] NULL,
	[Dateofdone] [date] NULL,
	[MStatus] [varchar](20) NULL,
	[feedback] [varchar](255) NULL,
	[AcSStatus] [varchar](20) NULL,
	[paymentStatus] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(5001,1) NOT NULL,
	[Name] [varchar](32) NULL,
	[MobileNo] [varchar](16) NULL,
	[DOB] [varchar](16) NULL,
	[Email] [varchar](32) NULL,
	[Password] [varchar](16) NULL,
	[DateOfJoin] [varchar](32) NULL,
	[Salary] [int] NULL,
	[AdId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MAddress]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MAddress](
	[AdId] [int] IDENTITY(1,1) NOT NULL,
	[state] [varchar](25) NULL,
	[City] [varchar](25) NULL,
	[Dist] [varchar](32) NULL,
	[PinCode] [varchar](16) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[Id] [int] IDENTITY(1001,1) NOT NULL,
	[Name] [varchar](32) NULL,
	[MobileNo] [varchar](16) NULL,
	[DOB] [varchar](16) NULL,
	[Email] [varchar](32) NULL,
	[Password] [varchar](16) NULL,
	[DateOfJoin] [varchar](32) NULL,
	[Salary] [int] NULL,
	[AdId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MgAddress]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MgAddress](
	[AdId] [int] IDENTITY(1,1) NOT NULL,
	[state] [varchar](25) NULL,
	[City] [varchar](25) NULL,
	[Dist] [varchar](32) NULL,
	[PinCode] [varchar](16) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MRole]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MRole](
	[RId] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](32) NULL,
PRIMARY KEY CLUSTERED 
(
	[RId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trans]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trans](
	[tid] [int] IDENTITY(1,1) NOT NULL,
	[Transport] [varchar](30) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([AdId], [state], [Dist], [PinCode]) VALUES (1, N'up', N'GKp', N'521003')
INSERT [dbo].[Address] ([AdId], [state], [Dist], [PinCode]) VALUES (2, N'up', N'Ghz', N'275201')
INSERT [dbo].[Address] ([AdId], [state], [Dist], [PinCode]) VALUES (3, N'up', N'mau', N'ggg234')
INSERT [dbo].[Address] ([AdId], [state], [Dist], [PinCode]) VALUES (4, N'HP', N'Baddi', N'b34454')
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Id], [Name], [MobileNo], [DOB], [Email], [Password], [AdId]) VALUES (10, N'SANDEEP', N'88677877', N'10/02/2000', N'SANDEEP@GMAIL.COM', N'Sa@123', 1)
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
INSERT [dbo].[ClaimsTable] ([Id], [Empid], [Role], [Name], [Destination], [DateofApply], [Days], [Reason], [Transport], [Personal], [CostSpend], [Dateofdone], [Status], [feedback], [payment]) VALUES (N'bfb37327-7df8-40e2-b591-9da91f2d02a6', 401, N'manager', N'sss', N'gurugram', CAST(N'2023-03-03' AS Date), N'one day', N'party', N'cab', NULL, 1500.0000, CAST(N'2023-03-03' AS Date), N'Approved', N'not the proper reasion', N'pending pay')
GO
INSERT [dbo].[EmpClaimsTable] ([Id], [Empid], [Role], [Name], [Destination], [DateofApply], [Days], [Reason], [Transport], [CostSpend], [Dateofdone], [MStatus], [feedback], [AcSStatus], [paymentStatus]) VALUES (N'9554f1a6-10ae-42aa-9b42-54b77582186f', 5001, N'employee', N'kajal', N'Gr.Noida', CAST(N'2023-10-01' AS Date), N'one days', N'development', N'Cab', 2000.0000, CAST(N'2023-03-09' AS Date), N'Approved', NULL, N'Reject', N'Not Success')
INSERT [dbo].[EmpClaimsTable] ([Id], [Empid], [Role], [Name], [Destination], [DateofApply], [Days], [Reason], [Transport], [CostSpend], [Dateofdone], [MStatus], [feedback], [AcSStatus], [paymentStatus]) VALUES (N'0654a964-1988-49f4-af5b-6e90f8902186', 1001, N'Manager', N'Narendra chauhan', N'Agra', CAST(N'2023-03-07' AS Date), N'12', N'solve error', N'cab', 2000.0000, CAST(N'2023-03-09' AS Date), N'Approved', NULL, N'Reject', N'Not Success')
INSERT [dbo].[EmpClaimsTable] ([Id], [Empid], [Role], [Name], [Destination], [DateofApply], [Days], [Reason], [Transport], [CostSpend], [Dateofdone], [MStatus], [feedback], [AcSStatus], [paymentStatus]) VALUES (N'fabe4f63-bd21-4619-9b26-90c4b48580c5', 1001, N'Manager', N'Narendra', N'Goa', CAST(N'2023-03-23' AS Date), N'12', N'Office work', N'fight,cab', 125000.0000, CAST(N'2023-03-09' AS Date), N'Approved', NULL, NULL, NULL)
INSERT [dbo].[EmpClaimsTable] ([Id], [Empid], [Role], [Name], [Destination], [DateofApply], [Days], [Reason], [Transport], [CostSpend], [Dateofdone], [MStatus], [feedback], [AcSStatus], [paymentStatus]) VALUES (N'7950af28-1eb8-4ae3-8e41-bc74b5b47cc1', 5002, N'employee', N'naren', N'delhi', CAST(N'2023-10-01' AS Date), N'two days', N'seminar', N'metro', 2500.0000, CAST(N'2023-03-09' AS Date), N'Approved', NULL, N'Approved', N'Success')
INSERT [dbo].[EmpClaimsTable] ([Id], [Empid], [Role], [Name], [Destination], [DateofApply], [Days], [Reason], [Transport], [CostSpend], [Dateofdone], [MStatus], [feedback], [AcSStatus], [paymentStatus]) VALUES (N'64682dc2-7a7c-412d-8ea6-f660d5ee8493', 401, N'Manager', N'SSS', N'Gr.Noida', CAST(N'2023-10-01' AS Date), N'one days', N'development', N'Car', 2500.0000, CAST(N'2023-03-09' AS Date), N'Reject', N'No proper reason Declined by Admin', N'Pending', N'Not Success')
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [Name], [MobileNo], [DOB], [Email], [Password], [DateOfJoin], [Salary], [AdId]) VALUES (5001, N'kajal', N'456328971', N'10/02/2025', N'kk@gmail.com', N'k@123', N'kpnss', 25000, 1)
INSERT [dbo].[Employees] ([Id], [Name], [MobileNo], [DOB], [Email], [Password], [DateOfJoin], [Salary], [AdId]) VALUES (5002, N'Naren', N'456328971', N'10/02/2025', N'Na@gmail.com', N'nn@123', N'kpnss', 25000, 2)
INSERT [dbo].[Employees] ([Id], [Name], [MobileNo], [DOB], [Email], [Password], [DateOfJoin], [Salary], [AdId]) VALUES (5003, N'abhisek', N'225558125', N'12/02/2002', N'abhi@gmail.com', N'Ab@123', N'2023-02-01T00:00:00', 5414, 3)
INSERT [dbo].[Employees] ([Id], [Name], [MobileNo], [DOB], [Email], [Password], [DateOfJoin], [Salary], [AdId]) VALUES (5004, N'Rohan chauhan', N'25541255141', N'12/02/2002', N'Rohan@gmail.com', N'R@123', N'0001-01-01T00:00:00', 21554, 4)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[LogIn] ON 

INSERT [dbo].[LogIn] ([Id], [RegID], [Name], [Email], [Password], [Role]) VALUES (1, 10, N'SANDEEP', N'SANDEEP@GMAIL.COM', N'Sa@123', N'Admin')
INSERT [dbo].[LogIn] ([Id], [RegID], [Name], [Email], [Password], [Role]) VALUES (3, 1001, N'Narendra', N'Narendra@GMAIL.COM', N'Na@123', N'Manager')
INSERT [dbo].[LogIn] ([Id], [RegID], [Name], [Email], [Password], [Role]) VALUES (4, 1002, N'sandeep', N'das@GMAIL.COM', N'sad@123', N'Manager')
INSERT [dbo].[LogIn] ([Id], [RegID], [Name], [Email], [Password], [Role]) VALUES (5, 5001, N'kajal', N'kk@gmail.com', N'k@123', N'Employee')
INSERT [dbo].[LogIn] ([Id], [RegID], [Name], [Email], [Password], [Role]) VALUES (6, 5002, N'Naren', N'Na@gmail.com', N'nn@123', N'Employee')
INSERT [dbo].[LogIn] ([Id], [RegID], [Name], [Email], [Password], [Role]) VALUES (10, 1006, N'Das', N'das@gmail.com', N'Das@123', N'Manager')
INSERT [dbo].[LogIn] ([Id], [RegID], [Name], [Email], [Password], [Role]) VALUES (11, 5003, N'abhisek', N'abhi@gmail.com', N'Ab@123', N'Employee')
INSERT [dbo].[LogIn] ([Id], [RegID], [Name], [Email], [Password], [Role]) VALUES (12, 10001, N'Sandeep Kumar', N'Sandeepkk@gmail.com', N'San@123', N'Accountent')
INSERT [dbo].[LogIn] ([Id], [RegID], [Name], [Email], [Password], [Role]) VALUES (13, 1007, N'shreya yadav', N'yshreya2000@gmail.com', N'yys@006', N'Manager')
INSERT [dbo].[LogIn] ([Id], [RegID], [Name], [Email], [Password], [Role]) VALUES (14, 5004, N'Rohan chauhan', N'Rohan@gmail.com', N'R@123', N'Employee')
INSERT [dbo].[LogIn] ([Id], [RegID], [Name], [Email], [Password], [Role]) VALUES (15, 1008, N'kanha', N'kanha@gmail.com', N'12867', N'Manager')
SET IDENTITY_INSERT [dbo].[LogIn] OFF
GO
SET IDENTITY_INSERT [dbo].[MAddress] ON 

INSERT [dbo].[MAddress] ([AdId], [state], [City], [Dist], [PinCode]) VALUES (1, N'UP', N'NOIDA', N'NO', N'JH945')
SET IDENTITY_INSERT [dbo].[MAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[Manager] ON 

INSERT [dbo].[Manager] ([Id], [Name], [MobileNo], [DOB], [Email], [Password], [DateOfJoin], [Salary], [AdId]) VALUES (1001, N'Narendra', N'88677877', N'10/02/2000', N'Narendra@GMAIL.COM', N'Na@123', N'kpnss', 12355, 1)
INSERT [dbo].[Manager] ([Id], [Name], [MobileNo], [DOB], [Email], [Password], [DateOfJoin], [Salary], [AdId]) VALUES (1002, N'sandeep', N'456328971', N'10/02/2025', N'das@GMAIL.COM', N'sad@123', N'kpnss', 25000, 2)
INSERT [dbo].[Manager] ([Id], [Name], [MobileNo], [DOB], [Email], [Password], [DateOfJoin], [Salary], [AdId]) VALUES (1006, N'Das', N'01452369870', N'12/02/2001', N'das@gmail.com', N'Das@123', N'2023-02-01T00:00:00', 5414, 6)
INSERT [dbo].[Manager] ([Id], [Name], [MobileNo], [DOB], [Email], [Password], [DateOfJoin], [Salary], [AdId]) VALUES (1007, N'shreya yadav', N'739759030', N'06/09/2000', N'yshreya2000@gmail.com', N'yys@006', N'0001-01-01T00:00:00', 2200000, 7)
INSERT [dbo].[Manager] ([Id], [Name], [MobileNo], [DOB], [Email], [Password], [DateOfJoin], [Salary], [AdId]) VALUES (1008, N'kanha', N'6388447075', N'25/06/2002', N'kanha@gmail.com', N'12867', N'0001-01-01T00:00:00', 400000, 8)
SET IDENTITY_INSERT [dbo].[Manager] OFF
GO
SET IDENTITY_INSERT [dbo].[MgAddress] ON 

INSERT [dbo].[MgAddress] ([AdId], [state], [City], [Dist], [PinCode]) VALUES (1, N'UP', N'NOIDA', N'Mamura', N'mm322')
INSERT [dbo].[MgAddress] ([AdId], [state], [City], [Dist], [PinCode]) VALUES (2, N'UP', N'Delhi', N'Ashok Nager', N'A-34')
INSERT [dbo].[MgAddress] ([AdId], [state], [City], [Dist], [PinCode]) VALUES (6, N'up', NULL, N'deoria', N'96958585558')
INSERT [dbo].[MgAddress] ([AdId], [state], [City], [Dist], [PinCode]) VALUES (7, N'UP', N'Bhadohi', N'Bhadohi', N'221401')
INSERT [dbo].[MgAddress] ([AdId], [state], [City], [Dist], [PinCode]) VALUES (8, N'up', N'pashupati nagar', N'kanpur', N'6677789')
SET IDENTITY_INSERT [dbo].[MgAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[Trans] ON 

INSERT [dbo].[Trans] ([tid], [Transport]) VALUES (1, N'Cab')
INSERT [dbo].[Trans] ([tid], [Transport]) VALUES (2, N'Bus')
INSERT [dbo].[Trans] ([tid], [Transport]) VALUES (3, N'Metro')
INSERT [dbo].[Trans] ([tid], [Transport]) VALUES (4, N'Auto')
INSERT [dbo].[Trans] ([tid], [Transport]) VALUES (5, N'Bike')
SET IDENTITY_INSERT [dbo].[Trans] OFF
GO
ALTER TABLE [dbo].[ClaimsTable] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[EmpClaimsTable] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD FOREIGN KEY([AdId])
REFERENCES [dbo].[MAddress] ([AdId])
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([AdId])
REFERENCES [dbo].[Address] ([AdId])
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD FOREIGN KEY([AdId])
REFERENCES [dbo].[MgAddress] ([AdId])
GO
/****** Object:  StoredProcedure [dbo].[AApproved]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  
  proc [dbo].[AApproved](@Id int)
as 
begin
update EmpClaimsTable set MStatus='Approved',Dateofdone=GETDATE(),feedback=null where Empid=@Id
end;
GO
/****** Object:  StoredProcedure [dbo].[AcSandBack]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  
 proc [dbo].[AcSandBack](@Id int)
as 
begin
update EmpClaimsTable set AcSStatus='Pending',Dateofdone=GETDATE(),feedback='Please Provide Full Information',paymentStatus='Not Success' where Empid=@Id
end;
GO
/****** Object:  StoredProcedure [dbo].[AdApproved]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AdApproved](@Id int)
as 
begin
update EmpClaimsTable set MStatus='Approved',Dateofdone=GETDATE(),feedback=null where Empid=@Id
end;
GO
/****** Object:  StoredProcedure [dbo].[AdReject]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  
 proc [dbo].[AdReject](@Id int)
as 
begin
update EmpClaimsTable set MStatus='Reject',Dateofdone=GETDATE(),feedback='No proper reason Declined by Admin' where Empid=@Id
end;
GO
/****** Object:  StoredProcedure [dbo].[AdSandBack]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AdSandBack](@Id int)
as 
begin
update EmpClaimsTable set MStatus='Pending',Dateofdone=GETDATE(),feedback='Please Provide Full Information' where Empid=@Id
end;
GO
/****** Object:  StoredProcedure [dbo].[AllEmployees]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create 
  proc [dbo].[AllEmployees]
As
begin 
 
select e.Id,e.Name,e.MobileNo,e.Dob,e.Email,e.Password,d.State,d.Dist,d.pinCode,ll.Role from Employees as e 
inner join address as d on  e.adid=d.adid inner join LogIn as ll on e.Id=ll.RegID
 Union
select m.Id,m.Name,m.MobileNo,m.Dob,m.Email,m.Password,dm.State ,dm.Dist,dm.pinCode,ll.Role from Admin as m 
inner join MAddress as dm on  m.adid=dm.adid inner join LogIn as ll on m.Id=ll.RegID
 Union
select mm.Id,mm.Name,mm.MobileNo,mm.Dob,mm.Email,mm.Password,mg.State,mg.Dist,mg.pinCode,ll.Role from Manager as mm 
inner join MgAddress as mg on  mm.adid=mg.adid inner join LogIn as ll on mm.Id=ll.RegID  
end
GO
/****** Object:  StoredProcedure [dbo].[Approved]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  
  proc [dbo].[Approved](@Id int)
as 
begin
update ClaimsTable set Status='Approved',Dateofdone=GETDATE() where Empid=@Id
end;
GO
/****** Object:  StoredProcedure [dbo].[ASApproved]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  
  proc [dbo].[ASApproved](@Id int)
as 
begin
update EmpClaimsTable set AcSStatus='Approved',Dateofdone=GETDATE(),feedback=null,paymentStatus='Success' where Empid=@Id
end;
GO
/****** Object:  StoredProcedure [dbo].[ASReject]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ASReject](@Id int)
as 
begin
update EmpClaimsTable set AcSStatus='Reject',Dateofdone=GETDATE(),feedback='No proper reason Declined by Accountent',paymentStatus='Not Success' where Empid=@Id
end;
GO
/****** Object:  StoredProcedure [dbo].[GetAllData]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[GetAllData]
As
begin
Select * from EmpClaimsTable
end
GO
/****** Object:  StoredProcedure [dbo].[GetAllEmployee]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAllEmployee]
As
begin 
 
select e.Id,e.Name,e.MobileNo,e.Dob,e.Email,e.Password,d.State,d.Dist,d.pinCode,ll.Role from Employees as e 
inner join address as d on  e.adid=d.adid inner join LogIn as ll on e.Id=ll.RegID
 Union
select m.Id,m.Name,m.MobileNo,m.Dob,m.Email,m.Password,dm.State ,dm.Dist,dm.pinCode,ll.Role from Admin as m 
inner join MAddress as dm on  m.adid=dm.adid inner join LogIn as ll on m.Id=ll.RegID
 Union
select mm.Id,mm.Name,mm.MobileNo,mm.Dob,mm.Email,mm.Password,mg.State,mg.Dist,mg.pinCode,ll.Role from Manager as mm 
inner join MgAddress as mg on  mm.adid=mg.adid inner join LogIn as ll on mm.Id=ll.RegID  
end
GO
/****** Object:  StoredProcedure [dbo].[GetDatawithID]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetDatawithID](@Empid int)
As
Begin
Select*from EmpClaimsTable where Empid=@Empid
end;
GO
/****** Object:  StoredProcedure [dbo].[GetDataWRole]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[GetDataWRole](@Role varchar(25))
As
begin
Select * from EmpClaimsTable where Role=@Role
end
GO
/****** Object:  StoredProcedure [dbo].[GetLogData]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetLogData](@Email varchar(25),@Password varchar(25),@Role varchar(25))
As
Begin
Select*from LogIn where email=@Email And password=@Password And role=@Role 
end;
GO
/****** Object:  StoredProcedure [dbo].[GetStatus]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create 
  proc [dbo].[GetStatus](@Empid int,@Role varchar(25),@Name varchar(25))
As
Begin
Select*from EmpClaimsTable where Empid=@Empid and Role=@Role and Name=@Name
end;
GO
/****** Object:  StoredProcedure [dbo].[InsertAdmin]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create
  proc [dbo].[InsertAdmin](@Name varchar(50),@Email varchar(25),@Password varchar(15),@Dob varchar(25),
@MobileNo varchar(20),@State varchar(25),@City Varchar(25),
@Dist Varchar(25),@ZipCode varchar(15))
As
Begin 
declare @AdId int
 insert into MAddress(state,City, Dist,PinCode)
values( @State,@City,@Dist,@ZipCode)
--//for find addid ue use
select top(1) @AdId = AdId from MAddress order by AdId desc
  
insert into Employees(Name,Email,Password,Dob,
MobileNo,AdId) 
values(@Name ,@Email  ,@Password ,@Dob,
@MobileNo,@AdId)
End;
GO
/****** Object:  StoredProcedure [dbo].[InsertClaims]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[InsertClaims](@Id int,
@Role varchar(25),
@Name varchar (50),
@Destination varchar(50),
@DateofApply date ,
@Days varchar(10),
@Reason varchar(255),
@Transport varchar(55), 
@CostSpend money ,
@Dateofdone date ,
@MStatus varchar(20),
@feedback varchar(255),
@AcSStatus varchar(20),
@paymentStatus varchar(50))
As
Begin 
insert into EmpClaimsTable(Empid,
Role, Name,Destination ,DateofApply ,
Days ,Reason ,Transport , CostSpend ,
Dateofdone ,MStatus  ,feedback ,AcSStatus  ,
paymentStatus)
values(@Id ,@Role ,
@Name,@Destination ,@DateofApply ,
@Days ,@Reason,@Transport, @CostSpend,
@Dateofdone,@MStatus ,@feedback ,@AcSStatus ,
@paymentStatus) 
End;
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployees]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create
  proc [dbo].[InsertEmployees](@Name varchar(50),@Email varchar(25),@Password varchar(15),@Dob varchar(25),
@MobileNo varchar(20),@DateofJoin varchar(20),@Salary int,@State varchar(25),
@Dist Varchar(25),@ZipCode varchar(15))
As
Begin 
declare @AdId int
 insert into Address(state,Dist,PinCode)
values( @State,@Dist,@ZipCode)
--//for find addid ue use
select top(1) @AdId = AdId from Address order by AdId desc
  
insert into Employees(Name,Email,Password,Dob,
MobileNo,DateofJoin,Salary,AdId) 
values(@Name ,@Email  ,@Password ,@Dob,
@MobileNo  ,@DateofJoin ,@Salary ,@AdId)
End;
GO
/****** Object:  StoredProcedure [dbo].[InsertManager]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertManager](@Name varchar(50),@Email varchar(25),@Password varchar(15),@Dob varchar(25),
@MobileNo varchar(20),@DateofJoin varchar(20),@Salary int,@State varchar(25),@City Varchar(25),
@Dist Varchar(25),@ZipCode varchar(15))
As
Begin 
declare @AdId int
 insert into MgAddress(state,City,Dist,PinCode)
values( @State  ,@City ,@Dist,@ZipCode)
--//for find addid ue use
select top(1) @AdId = AdId from MgAddress order by AdId desc
  
insert into Manager(Name,Email,Password,Dob,
MobileNo,DateofJoin,Salary,AdId) 
values(@Name ,@Email  ,@Password ,@Dob,
@MobileNo  ,@DateofJoin ,@Salary ,@AdId)
End;
GO
/****** Object:  StoredProcedure [dbo].[MApproved]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MApproved](@Id int)
as 
begin
update EmpClaimsTable set MStatus='Approved',Dateofdone=GETDATE(),feedback=null where Empid=@Id
end;
GO
/****** Object:  StoredProcedure [dbo].[MgSandBack]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create  
  proc [dbo].[MgSandBack](@Id int)
as 
begin
update EmpClaimsTable set MStatus='Pending',Dateofdone=GETDATE(),feedback='Please Provide Full Information' where Empid=@Id
end;
GO
/****** Object:  StoredProcedure [dbo].[MReject]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MReject](@Id int)
as 
begin
update EmpClaimsTable set MStatus='Reject',Dateofdone=GETDATE(),feedback='No proper reason Declined by Manager' where Empid=@Id
end;
GO
/****** Object:  StoredProcedure [dbo].[Reject]    Script Date: 3/9/2023 6:56:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Reject](@Id int)
as 
begin
update ClaimsTable set Status='Reject',Dateofdone=GETDATE(),feedback='not the proper reasion' where Empid=@Id
end;
GO
USE [master]
GO
ALTER DATABASE [KPNssIncDB] SET  READ_WRITE 
GO
