USE [master]
GO
/****** Object:  Database [Ataturk_Airport]    Script Date: 15.12.2019 22:28:31 ******/
CREATE DATABASE [Ataturk_Airport]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ataturk_Airport', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Ataturk_Airport.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ataturk_Airport_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Ataturk_Airport_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Ataturk_Airport] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ataturk_Airport].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ataturk_Airport] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ataturk_Airport] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ataturk_Airport] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ataturk_Airport] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ataturk_Airport] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ataturk_Airport] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ataturk_Airport] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ataturk_Airport] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ataturk_Airport] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ataturk_Airport] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ataturk_Airport] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ataturk_Airport] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ataturk_Airport] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ataturk_Airport] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ataturk_Airport] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Ataturk_Airport] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ataturk_Airport] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ataturk_Airport] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ataturk_Airport] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ataturk_Airport] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ataturk_Airport] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ataturk_Airport] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ataturk_Airport] SET RECOVERY FULL 
GO
ALTER DATABASE [Ataturk_Airport] SET  MULTI_USER 
GO
ALTER DATABASE [Ataturk_Airport] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ataturk_Airport] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ataturk_Airport] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ataturk_Airport] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ataturk_Airport] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Ataturk_Airport', N'ON'
GO
ALTER DATABASE [Ataturk_Airport] SET QUERY_STORE = OFF
GO
USE [Ataturk_Airport]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[TCKN] [numeric](11, 0) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[Street] [varchar](15) NULL,
	[City] [varchar](15) NULL,
 CONSTRAINT [Person_PK] PRIMARY KEY CLUSTERED 
(
	[TCKN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passenger]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passenger](
	[PassengerTCKN] [numeric](11, 0) NOT NULL,
	[Gender] [char](1) NULL,
	[LuggageWeight] [int] NULL,
 CONSTRAINT [Passenger_PK] PRIMARY KEY CLUSTERED 
(
	[PassengerTCKN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[TicketID] [varchar](6) NOT NULL,
	[price] [money] NULL,
	[TicketPassengerTCKN] [numeric](11, 0) NULL,
	[TicketType] [varchar](20) NULL,
 CONSTRAINT [Ticket_PK] PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PassengerDetail]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PassengerDetail]
AS
SELECT Person.City,Passenger.Gender, Passenger.LuggageWeight, Ticket.price, Ticket.TicketType
FROM     Person INNER JOIN Passenger ON Person.TCKN = Passenger.PassengerTCKN INNER JOIN
                  Ticket ON Passenger.PassengerTCKN = Ticket.TicketPassengerTCKN AND Ticket.TicketType = 'First Class';
GO
/****** Object:  Table [dbo].[Car_Park]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car_Park](
	[SpaceNumber] [int] NOT NULL,
	[ArrivalTime] [time](7) NOT NULL,
	[LeavingTime] [time](7) NOT NULL,
	[ParkingLotAirportID] [varchar](3) NULL,
 CONSTRAINT [CarPark_PK] PRIMARY KEY CLUSTERED 
(
	[SpaceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[PlateNumber] [varchar](11) NOT NULL,
	[CarVehicleID] [int] NULL,
	[DailyPrice] [money] NULL,
	[CarSpaceNumber] [int] NULL,
 CONSTRAINT [Car_PK] PRIMARY KEY CLUSTERED 
(
	[PlateNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Park]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Park]
as
select Car.PlateNumber,Car.DailyPrice,Car_Park.SpaceNumber,Car_Park.ArrivalTime,Car_Park.LeavingTime
from Car INNER JOIN Car_Park ON Car.CarSpaceNumber = Car_Park.SpaceNumber
where Car.DailyPrice > 75;
GO
/****** Object:  Table [dbo].[Airport]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airport](
	[AirportID] [varchar](3) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[City] [varchar](20) NULL,
 CONSTRAINT [Airport_PK] PRIMARY KEY CLUSTERED 
(
	[AirportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airport_Store]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airport_Store](
	[BlockNumber] [int] NOT NULL,
	[name] [varchar](15) NOT NULL,
	[ContractDate] [date] NULL,
	[StoreAirportID] [varchar](3) NULL,
 CONSTRAINT [Airport_Store_PK] PRIMARY KEY CLUSTERED 
(
	[BlockNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[AirportDetail]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[AirportDetail]
as
SELECT Airport.AirportID, Airport.name, Airport.City, Airport_Store.name AS expr1, Airport_Store.ContractDate
FROM     Airport INNER JOIN Airport_Store ON Airport.AirportID = Airport_Store.StoreAirportID
GO
/****** Object:  Table [dbo].[Airport_Vehicle]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airport_Vehicle](
	[PlateNumber] [varchar](9) NOT NULL,
	[Vehicle_Type] [varchar](30) NULL,
	[AirportVehicleSpaceNumber] [int] NULL,
	[AirportVehicleID] [int] NULL,
 CONSTRAINT [Airport_Vehicle_PK] PRIMARY KEY CLUSTERED 
(
	[PlateNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apron]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apron](
	[ApronNumber] [int] NOT NULL,
	[ArrivalTime] [time](7) NOT NULL,
	[LeavingTime] [time](7) NOT NULL,
	[ApronAirportID] [varchar](3) NULL,
 CONSTRAINT [Apron_PK] PRIMARY KEY CLUSTERED 
(
	[ApronNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cargo_Flight]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo_Flight](
	[CFlightID] [varchar](7) NOT NULL,
	[NumberOfCargo] [int] NULL,
 CONSTRAINT [Cargo_Flight_PK] PRIMARY KEY CLUSTERED 
(
	[CFlightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Emergency_Service]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emergency_Service](
	[EmergecnyEmployeeID] [int] NOT NULL,
	[EmergencyServicetype] [varchar](20) NULL,
	[EmergencyNumber] [numeric](3, 0) NULL,
	[ManagerID] [int] NOT NULL,
 CONSTRAINT [Emergency_Service_PK] PRIMARY KEY CLUSTERED 
(
	[EmergecnyEmployeeID] ASC,
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[Salary] [money] NULL,
	[EmployeeTCKN] [numeric](11, 0) NULL,
	[EmployeeAirportID] [varchar](3) NULL,
	[HireDate] [date] NULL,
 CONSTRAINT [Employee_PK] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Certificate]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Certificate](
	[CertificateNumber] [int] NOT NULL,
	[CEmployeeID] [int] NULL,
	[DateCompleted] [date] NULL,
 CONSTRAINT [Employee_Certificate_PK] PRIMARY KEY CLUSTERED 
(
	[CertificateNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flies]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flies](
	[PassengerTCKN] [numeric](11, 0) NOT NULL,
	[PFlightID] [varchar](7) NOT NULL,
 CONSTRAINT [Flies_PK] PRIMARY KEY CLUSTERED 
(
	[PassengerTCKN] ASC,
	[PFlightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[FlightID] [varchar](7) NOT NULL,
	[Flight_date] [date] NULL,
	[FlightTime] [time](7) NULL,
	[GoesTo] [varchar](3) NULL,
	[ComesFrom] [varchar](3) NULL,
	[FAirportID] [varchar](3) NULL,
	[FPilotID] [int] NULL,
 CONSTRAINT [Flight_PK] PRIMARY KEY CLUSTERED 
(
	[FlightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[ManagerEmployeeID] [int] NOT NULL,
	[Department] [varchar](10) NULL,
 CONSTRAINT [Manager_PK] PRIMARY KEY CLUSTERED 
(
	[ManagerEmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passenger_Flight]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passenger_Flight](
	[PFlightID] [varchar](7) NOT NULL,
	[NumberOfSeat] [int] NULL,
	[NumberOfCabinAttendant] [int] NULL,
 CONSTRAINT [Passenger_Flight_PK] PRIMARY KEY CLUSTERED 
(
	[PFlightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person_Phone_Number]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person_Phone_Number](
	[TCKN] [numeric](11, 0) NOT NULL,
	[phoneNumber] [numeric](11, 0) NOT NULL,
 CONSTRAINT [Person_Phone_Number_PK] PRIMARY KEY CLUSTERED 
(
	[TCKN] ASC,
	[phoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pilot]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pilot](
	[PilotID] [int] NOT NULL,
	[PTCKN] [numeric](11, 0) NULL,
 CONSTRAINT [Pilot_PK] PRIMARY KEY CLUSTERED 
(
	[PilotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pilot_Certificate]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pilot_Certificate](
	[CertificateNumber] [int] NOT NULL,
	[CPilotID] [int] NOT NULL,
	[DateCompleted] [date] NOT NULL,
 CONSTRAINT [Pilot_Certificate_PK] PRIMARY KEY CLUSTERED 
(
	[CertificateNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plane]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plane](
	[PlaneID] [varchar](7) NOT NULL,
	[Capacity] [int] NULL,
	[PlaneType] [varchar](30) NULL,
	[HourlyPrice] [money] NULL,
	[DailyPrice] [money] NULL,
	[ApronNumber] [int] NULL,
	[PlaneVehicleID] [int] NULL,
 CONSTRAINT [Plane_PK] PRIMARY KEY CLUSTERED 
(
	[PlaneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] NOT NULL,
	[name] [varchar](20) NULL,
	[district] [varchar](15) NULL,
	[city] [varchar](10) NULL,
 CONSTRAINT [Supplier_PK] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplies]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplies](
	[SSupplierID] [int] NOT NULL,
	[SBlockNumber] [int] NOT NULL,
	[UnitPrice] [int] NULL,
	[ProductType] [varchar](20) NULL,
 CONSTRAINT [Supplies_PK] PRIMARY KEY CLUSTERED 
(
	[SBlockNumber] ASC,
	[SSupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Technician]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Technician](
	[TechnicEmployeeID] [int] NOT NULL,
	[Field] [varchar](20) NULL,
	[ManagerID] [int] NOT NULL,
 CONSTRAINT [Technician_Controller_PK] PRIMARY KEY CLUSTERED 
(
	[TechnicEmployeeID] ASC,
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Traffic_Controller]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Traffic_Controller](
	[ControlEmployeeID] [int] NOT NULL,
	[ControllerLocation] [varchar](20) NULL,
	[ManagerID] [int] NOT NULL,
 CONSTRAINT [Traffic_Controller_PK] PRIMARY KEY CLUSTERED 
(
	[ControlEmployeeID] ASC,
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[VehicleID] [int] NOT NULL,
	[Model] [int] NULL,
	[Color] [varchar](15) NULL,
 CONSTRAINT [Vehicle_PK] PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Airport] ([AirportID], [name], [City]) VALUES (N'ADB', N'Adnan Menderes Airport', N'Izmir')
GO
INSERT [dbo].[Airport] ([AirportID], [name], [City]) VALUES (N'AMS', N'Amsterdam Schiphol Airport', N'Amsterdam')
GO
INSERT [dbo].[Airport] ([AirportID], [name], [City]) VALUES (N'AYT', N'Antalya Airport', N'Antalya')
GO
INSERT [dbo].[Airport] ([AirportID], [name], [City]) VALUES (N'BCN', N'Barcelona Airport', N'Barcelona')
GO
INSERT [dbo].[Airport] ([AirportID], [name], [City]) VALUES (N'BRU', N'Brussel Airport', N'Brussel')
GO
INSERT [dbo].[Airport] ([AirportID], [name], [City]) VALUES (N'BUD', N'Budapest Ferenc Liszt Airport', N'Budapest')
GO
INSERT [dbo].[Airport] ([AirportID], [name], [City]) VALUES (N'CDG', N'Paris Charles Gualle Airport', N'Paris')
GO
INSERT [dbo].[Airport] ([AirportID], [name], [City]) VALUES (N'CIA', N'Ciampino Airport', N'Rome')
GO
INSERT [dbo].[Airport] ([AirportID], [name], [City]) VALUES (N'DLM', N'Dalaman Airport', N'Mugla')
GO
INSERT [dbo].[Airport] ([AirportID], [name], [City]) VALUES (N'ESB', N'Esenboga Airport', N'Ankara')
GO
INSERT [dbo].[Airport] ([AirportID], [name], [City]) VALUES (N'IST', N'Istanbul Airport', N'Istanbul')
GO
INSERT [dbo].[Airport] ([AirportID], [name], [City]) VALUES (N'JFK', N'John F. Keneddy Airport', N'New York')
GO
INSERT [dbo].[Airport] ([AirportID], [name], [City]) VALUES (N'LGW', N'London Gatwick Airport', N'London')
GO
INSERT [dbo].[Airport] ([AirportID], [name], [City]) VALUES (N'NAP', N'Naples Airport', N'Napels')
GO
INSERT [dbo].[Airport] ([AirportID], [name], [City]) VALUES (N'PRG', N'Vaclav Havel Airport', N'Prague')
GO
INSERT [dbo].[Airport] ([AirportID], [name], [City]) VALUES (N'SGK', N'Selanik Airport', N'Selanik')
GO
INSERT [dbo].[Airport] ([AirportID], [name], [City]) VALUES (N'STR', N'Stuttgard Airport', N'Stuttgard')
GO
INSERT [dbo].[Airport] ([AirportID], [name], [City]) VALUES (N'SXF', N'Berlin Schonefeld', N'Berlin')
GO
INSERT [dbo].[Airport] ([AirportID], [name], [City]) VALUES (N'TZX', N'Trabzon Airport', N'Trabzon')
GO
INSERT [dbo].[Airport] ([AirportID], [name], [City]) VALUES (N'VIE', N'Vienna Airport', N'Vienna')
GO
INSERT [dbo].[Airport] ([AirportID], [name], [City]) VALUES (N'WAW', N'Varsaw Chopin Airport', N'Warsaw')
GO
INSERT [dbo].[Airport_Store] ([BlockNumber], [name], [ContractDate], [StoreAirportID]) VALUES (1, N'Free Shop', CAST(N'2029-01-01' AS Date), N'IST')
GO
INSERT [dbo].[Airport_Store] ([BlockNumber], [name], [ContractDate], [StoreAirportID]) VALUES (2, N'Starbucks', CAST(N'2030-01-01' AS Date), N'IST')
GO
INSERT [dbo].[Airport_Store] ([BlockNumber], [name], [ContractDate], [StoreAirportID]) VALUES (3, N'McDonalds', CAST(N'2035-01-01' AS Date), N'IST')
GO
INSERT [dbo].[Airport_Store] ([BlockNumber], [name], [ContractDate], [StoreAirportID]) VALUES (4, N'Burger King', CAST(N'2040-01-01' AS Date), N'IST')
GO
INSERT [dbo].[Airport_Store] ([BlockNumber], [name], [ContractDate], [StoreAirportID]) VALUES (5, N'Shake Shake', CAST(N'2025-01-01' AS Date), N'IST')
GO
INSERT [dbo].[Airport_Store] ([BlockNumber], [name], [ContractDate], [StoreAirportID]) VALUES (6, N'Szimpla Kert', CAST(N'2019-01-01' AS Date), N'IST')
GO
INSERT [dbo].[Airport_Store] ([BlockNumber], [name], [ContractDate], [StoreAirportID]) VALUES (7, N'Morrisons', CAST(N'2024-01-01' AS Date), N'IST')
GO
INSERT [dbo].[Airport_Store] ([BlockNumber], [name], [ContractDate], [StoreAirportID]) VALUES (8, N'Instant', CAST(N'2031-01-01' AS Date), N'IST')
GO
INSERT [dbo].[Airport_Store] ([BlockNumber], [name], [ContractDate], [StoreAirportID]) VALUES (9, N'Pontoon', CAST(N'2050-01-01' AS Date), N'IST')
GO
INSERT [dbo].[Airport_Store] ([BlockNumber], [name], [ContractDate], [StoreAirportID]) VALUES (10, N'Grange', CAST(N'2011-01-01' AS Date), N'IST')
GO
INSERT [dbo].[Airport_Vehicle] ([PlateNumber], [Vehicle_Type], [AirportVehicleSpaceNumber], [AirportVehicleID]) VALUES (N'34 INS 90', N'Pushback tug', 21, 21)
GO
INSERT [dbo].[Airport_Vehicle] ([PlateNumber], [Vehicle_Type], [AirportVehicleSpaceNumber], [AirportVehicleID]) VALUES (N'34 INS 91', N'Apron bus', 22, 22)
GO
INSERT [dbo].[Airport_Vehicle] ([PlateNumber], [Vehicle_Type], [AirportVehicleSpaceNumber], [AirportVehicleID]) VALUES (N'34 INS 92', N'Apron bus', 23, 23)
GO
INSERT [dbo].[Airport_Vehicle] ([PlateNumber], [Vehicle_Type], [AirportVehicleSpaceNumber], [AirportVehicleID]) VALUES (N'34 INS 93', N'Container loader', 24, 24)
GO
INSERT [dbo].[Airport_Vehicle] ([PlateNumber], [Vehicle_Type], [AirportVehicleSpaceNumber], [AirportVehicleID]) VALUES (N'34 INS 94', N'Refuel truck', 25, 25)
GO
INSERT [dbo].[Airport_Vehicle] ([PlateNumber], [Vehicle_Type], [AirportVehicleSpaceNumber], [AirportVehicleID]) VALUES (N'34 INS 95', N'Fire truck', 26, 26)
GO
INSERT [dbo].[Airport_Vehicle] ([PlateNumber], [Vehicle_Type], [AirportVehicleSpaceNumber], [AirportVehicleID]) VALUES (N'34 INS 96', N'Ambulance', 27, 27)
GO
INSERT [dbo].[Airport_Vehicle] ([PlateNumber], [Vehicle_Type], [AirportVehicleSpaceNumber], [AirportVehicleID]) VALUES (N'34 INS 97', N'Belt loader', 28, 28)
GO
INSERT [dbo].[Airport_Vehicle] ([PlateNumber], [Vehicle_Type], [AirportVehicleSpaceNumber], [AirportVehicleID]) VALUES (N'34 INS 98', N'Refuel truck', 29, 29)
GO
INSERT [dbo].[Airport_Vehicle] ([PlateNumber], [Vehicle_Type], [AirportVehicleSpaceNumber], [AirportVehicleID]) VALUES (N'34 INS 99', N'Belt loader', 30, 30)
GO
INSERT [dbo].[Apron] ([ApronNumber], [ArrivalTime], [LeavingTime], [ApronAirportID]) VALUES (11, CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Apron] ([ApronNumber], [ArrivalTime], [LeavingTime], [ApronAirportID]) VALUES (12, CAST(N'04:00:00' AS Time), CAST(N'09:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Apron] ([ApronNumber], [ArrivalTime], [LeavingTime], [ApronAirportID]) VALUES (13, CAST(N'05:00:00' AS Time), CAST(N'10:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Apron] ([ApronNumber], [ArrivalTime], [LeavingTime], [ApronAirportID]) VALUES (14, CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Apron] ([ApronNumber], [ArrivalTime], [LeavingTime], [ApronAirportID]) VALUES (15, CAST(N'09:45:00' AS Time), CAST(N'19:15:00' AS Time), N'IST')
GO
INSERT [dbo].[Apron] ([ApronNumber], [ArrivalTime], [LeavingTime], [ApronAirportID]) VALUES (16, CAST(N'12:15:00' AS Time), CAST(N'18:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Apron] ([ApronNumber], [ArrivalTime], [LeavingTime], [ApronAirportID]) VALUES (17, CAST(N'16:45:00' AS Time), CAST(N'18:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Apron] ([ApronNumber], [ArrivalTime], [LeavingTime], [ApronAirportID]) VALUES (18, CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Apron] ([ApronNumber], [ArrivalTime], [LeavingTime], [ApronAirportID]) VALUES (19, CAST(N'18:00:00' AS Time), CAST(N'20:45:00' AS Time), N'IST')
GO
INSERT [dbo].[Apron] ([ApronNumber], [ArrivalTime], [LeavingTime], [ApronAirportID]) VALUES (20, CAST(N'16:20:00' AS Time), CAST(N'09:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Car] ([PlateNumber], [CarVehicleID], [DailyPrice], [CarSpaceNumber]) VALUES (N'01 OCK 1998', 1, 80.0000, 1)
GO
INSERT [dbo].[Car] ([PlateNumber], [CarVehicleID], [DailyPrice], [CarSpaceNumber]) VALUES (N'03 SCK 766', 4, 90.0000, 4)
GO
INSERT [dbo].[Car] ([PlateNumber], [CarVehicleID], [DailyPrice], [CarSpaceNumber]) VALUES (N'10 HAZ 1998', 8, 80.0000, 8)
GO
INSERT [dbo].[Car] ([PlateNumber], [CarVehicleID], [DailyPrice], [CarSpaceNumber]) VALUES (N'16 ERT 34', 3, 70.0000, 3)
GO
INSERT [dbo].[Car] ([PlateNumber], [CarVehicleID], [DailyPrice], [CarSpaceNumber]) VALUES (N'34 BJK 1903', 10, 70.0000, 10)
GO
INSERT [dbo].[Car] ([PlateNumber], [CarVehicleID], [DailyPrice], [CarSpaceNumber]) VALUES (N'34 GS 1905', 9, 65.0000, 9)
GO
INSERT [dbo].[Car] ([PlateNumber], [CarVehicleID], [DailyPrice], [CarSpaceNumber]) VALUES (N'34 RMN 654', 5, 50.0000, 5)
GO
INSERT [dbo].[Car] ([PlateNumber], [CarVehicleID], [DailyPrice], [CarSpaceNumber]) VALUES (N'77 TTR 8465', 6, 100.0000, 6)
GO
INSERT [dbo].[Car] ([PlateNumber], [CarVehicleID], [DailyPrice], [CarSpaceNumber]) VALUES (N'77 YLV 1998', 2, 60.0000, 2)
GO
INSERT [dbo].[Car] ([PlateNumber], [CarVehicleID], [DailyPrice], [CarSpaceNumber]) VALUES (N'82 BRN 3636', 7, 70.0000, 7)
GO
INSERT [dbo].[Car_Park] ([SpaceNumber], [ArrivalTime], [LeavingTime], [ParkingLotAirportID]) VALUES (1, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Car_Park] ([SpaceNumber], [ArrivalTime], [LeavingTime], [ParkingLotAirportID]) VALUES (2, CAST(N'16:00:00' AS Time), CAST(N'19:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Car_Park] ([SpaceNumber], [ArrivalTime], [LeavingTime], [ParkingLotAirportID]) VALUES (3, CAST(N'11:00:00' AS Time), CAST(N'15:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Car_Park] ([SpaceNumber], [ArrivalTime], [LeavingTime], [ParkingLotAirportID]) VALUES (4, CAST(N'13:00:00' AS Time), CAST(N'17:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Car_Park] ([SpaceNumber], [ArrivalTime], [LeavingTime], [ParkingLotAirportID]) VALUES (5, CAST(N'09:00:00' AS Time), CAST(N'19:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Car_Park] ([SpaceNumber], [ArrivalTime], [LeavingTime], [ParkingLotAirportID]) VALUES (6, CAST(N'11:30:00' AS Time), CAST(N'18:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Car_Park] ([SpaceNumber], [ArrivalTime], [LeavingTime], [ParkingLotAirportID]) VALUES (7, CAST(N'19:00:00' AS Time), CAST(N'22:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Car_Park] ([SpaceNumber], [ArrivalTime], [LeavingTime], [ParkingLotAirportID]) VALUES (8, CAST(N'20:00:00' AS Time), CAST(N'01:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Car_Park] ([SpaceNumber], [ArrivalTime], [LeavingTime], [ParkingLotAirportID]) VALUES (9, CAST(N'18:00:00' AS Time), CAST(N'21:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Car_Park] ([SpaceNumber], [ArrivalTime], [LeavingTime], [ParkingLotAirportID]) VALUES (10, CAST(N'12:20:00' AS Time), CAST(N'15:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Car_Park] ([SpaceNumber], [ArrivalTime], [LeavingTime], [ParkingLotAirportID]) VALUES (21, CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Car_Park] ([SpaceNumber], [ArrivalTime], [LeavingTime], [ParkingLotAirportID]) VALUES (22, CAST(N'04:00:00' AS Time), CAST(N'09:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Car_Park] ([SpaceNumber], [ArrivalTime], [LeavingTime], [ParkingLotAirportID]) VALUES (23, CAST(N'05:00:00' AS Time), CAST(N'10:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Car_Park] ([SpaceNumber], [ArrivalTime], [LeavingTime], [ParkingLotAirportID]) VALUES (24, CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Car_Park] ([SpaceNumber], [ArrivalTime], [LeavingTime], [ParkingLotAirportID]) VALUES (25, CAST(N'09:45:00' AS Time), CAST(N'19:15:00' AS Time), N'IST')
GO
INSERT [dbo].[Car_Park] ([SpaceNumber], [ArrivalTime], [LeavingTime], [ParkingLotAirportID]) VALUES (26, CAST(N'12:15:00' AS Time), CAST(N'18:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Car_Park] ([SpaceNumber], [ArrivalTime], [LeavingTime], [ParkingLotAirportID]) VALUES (27, CAST(N'16:45:00' AS Time), CAST(N'18:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Car_Park] ([SpaceNumber], [ArrivalTime], [LeavingTime], [ParkingLotAirportID]) VALUES (28, CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Car_Park] ([SpaceNumber], [ArrivalTime], [LeavingTime], [ParkingLotAirportID]) VALUES (29, CAST(N'18:00:00' AS Time), CAST(N'20:15:00' AS Time), N'IST')
GO
INSERT [dbo].[Car_Park] ([SpaceNumber], [ArrivalTime], [LeavingTime], [ParkingLotAirportID]) VALUES (30, CAST(N'16:20:00' AS Time), CAST(N'09:00:00' AS Time), N'IST')
GO
INSERT [dbo].[Cargo_Flight] ([CFlightID], [NumberOfCargo]) VALUES (N'PGT5342', 840)
GO
INSERT [dbo].[Cargo_Flight] ([CFlightID], [NumberOfCargo]) VALUES (N'PGT7985', 630)
GO
INSERT [dbo].[Cargo_Flight] ([CFlightID], [NumberOfCargo]) VALUES (N'PGT8052', 490)
GO
INSERT [dbo].[Cargo_Flight] ([CFlightID], [NumberOfCargo]) VALUES (N'THY2342', 830)
GO
INSERT [dbo].[Cargo_Flight] ([CFlightID], [NumberOfCargo]) VALUES (N'THY2348', 430)
GO
INSERT [dbo].[Cargo_Flight] ([CFlightID], [NumberOfCargo]) VALUES (N'THY2448', 530)
GO
INSERT [dbo].[Cargo_Flight] ([CFlightID], [NumberOfCargo]) VALUES (N'THY2550', 630)
GO
INSERT [dbo].[Cargo_Flight] ([CFlightID], [NumberOfCargo]) VALUES (N'THY5462', 830)
GO
INSERT [dbo].[Emergency_Service] ([EmergecnyEmployeeID], [EmergencyServicetype], [EmergencyNumber], [ManagerID]) VALUES (31, N'Fire', CAST(110 AS Numeric(3, 0)), 7)
GO
INSERT [dbo].[Emergency_Service] ([EmergecnyEmployeeID], [EmergencyServicetype], [EmergencyNumber], [ManagerID]) VALUES (32, N'Fire', CAST(110 AS Numeric(3, 0)), 7)
GO
INSERT [dbo].[Emergency_Service] ([EmergecnyEmployeeID], [EmergencyServicetype], [EmergencyNumber], [ManagerID]) VALUES (33, N'Fire', CAST(110 AS Numeric(3, 0)), 7)
GO
INSERT [dbo].[Emergency_Service] ([EmergecnyEmployeeID], [EmergencyServicetype], [EmergencyNumber], [ManagerID]) VALUES (34, N'Ambulance', CAST(112 AS Numeric(3, 0)), 7)
GO
INSERT [dbo].[Emergency_Service] ([EmergecnyEmployeeID], [EmergencyServicetype], [EmergencyNumber], [ManagerID]) VALUES (35, N'Ambulance', CAST(112 AS Numeric(3, 0)), 8)
GO
INSERT [dbo].[Emergency_Service] ([EmergecnyEmployeeID], [EmergencyServicetype], [EmergencyNumber], [ManagerID]) VALUES (36, N'Ambulance', CAST(112 AS Numeric(3, 0)), 8)
GO
INSERT [dbo].[Emergency_Service] ([EmergecnyEmployeeID], [EmergencyServicetype], [EmergencyNumber], [ManagerID]) VALUES (37, N'Ambulance', CAST(112 AS Numeric(3, 0)), 8)
GO
INSERT [dbo].[Emergency_Service] ([EmergecnyEmployeeID], [EmergencyServicetype], [EmergencyNumber], [ManagerID]) VALUES (38, N'Security', CAST(155 AS Numeric(3, 0)), 9)
GO
INSERT [dbo].[Emergency_Service] ([EmergecnyEmployeeID], [EmergencyServicetype], [EmergencyNumber], [ManagerID]) VALUES (39, N'Security', CAST(155 AS Numeric(3, 0)), 9)
GO
INSERT [dbo].[Emergency_Service] ([EmergecnyEmployeeID], [EmergencyServicetype], [EmergencyNumber], [ManagerID]) VALUES (40, N'Security', CAST(155 AS Numeric(3, 0)), 9)
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (1, 6000.0000, CAST(12345678910 AS Numeric(11, 0)), N'IST', CAST(N'2018-10-12' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (2, 6000.0000, CAST(12345678911 AS Numeric(11, 0)), N'IST', CAST(N'2013-05-10' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (3, 6000.0000, CAST(12345678912 AS Numeric(11, 0)), N'IST', CAST(N'2014-04-23' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (4, 6000.0000, CAST(12345678913 AS Numeric(11, 0)), N'IST', CAST(N'2003-04-05' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (5, 6000.0000, CAST(12345678914 AS Numeric(11, 0)), N'IST', CAST(N'2003-11-24' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (6, 6000.0000, CAST(12345678915 AS Numeric(11, 0)), N'IST', CAST(N'2007-10-24' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (7, 6000.0000, CAST(12345678916 AS Numeric(11, 0)), N'IST', CAST(N'2009-09-14' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (8, 6000.0000, CAST(12345678917 AS Numeric(11, 0)), N'IST', CAST(N'2017-05-02' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (9, 6000.0000, CAST(12345678918 AS Numeric(11, 0)), N'IST', CAST(N'2012-08-07' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (10, 6000.0000, CAST(12345678919 AS Numeric(11, 0)), N'IST', CAST(N'2013-06-08' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (11, 3000.0000, CAST(12345678920 AS Numeric(11, 0)), N'IST', CAST(N'2003-04-05' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (12, 3000.0000, CAST(12345678921 AS Numeric(11, 0)), N'IST', CAST(N'2017-07-21' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (13, 3000.0000, CAST(12345678922 AS Numeric(11, 0)), N'IST', CAST(N'2016-05-31' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (14, 3000.0000, CAST(12345678923 AS Numeric(11, 0)), N'IST', CAST(N'2013-03-21' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (15, 3000.0000, CAST(12345678924 AS Numeric(11, 0)), N'IST', CAST(N'2013-07-30' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (16, 3000.0000, CAST(12345678925 AS Numeric(11, 0)), N'IST', CAST(N'2012-08-23' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (17, 3000.0000, CAST(12345678926 AS Numeric(11, 0)), N'IST', CAST(N'2015-12-23' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (18, 3000.0000, CAST(12345678927 AS Numeric(11, 0)), N'IST', CAST(N'2011-12-22' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (19, 3000.0000, CAST(12345678928 AS Numeric(11, 0)), N'IST', CAST(N'2011-11-24' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (20, 3000.0000, CAST(12345678929 AS Numeric(11, 0)), N'IST', CAST(N'2009-11-14' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (21, 3000.0000, CAST(12345678930 AS Numeric(11, 0)), N'IST', CAST(N'2011-05-23' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (22, 3000.0000, CAST(12345678931 AS Numeric(11, 0)), N'IST', CAST(N'2010-05-29' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (23, 3000.0000, CAST(12345678932 AS Numeric(11, 0)), N'IST', CAST(N'2009-06-28' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (24, 3000.0000, CAST(12345678933 AS Numeric(11, 0)), N'IST', CAST(N'2008-07-21' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (25, 3000.0000, CAST(12345678934 AS Numeric(11, 0)), N'IST', CAST(N'2007-12-23' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (26, 3000.0000, CAST(12345678935 AS Numeric(11, 0)), N'IST', CAST(N'2007-12-31' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (27, 3000.0000, CAST(12345678936 AS Numeric(11, 0)), N'IST', CAST(N'2006-10-24' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (28, 3000.0000, CAST(12345678937 AS Numeric(11, 0)), N'IST', CAST(N'2005-12-01' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (29, 3000.0000, CAST(12345678938 AS Numeric(11, 0)), N'IST', CAST(N'2004-02-14' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (30, 3000.0000, CAST(12345678939 AS Numeric(11, 0)), N'IST', CAST(N'2003-03-14' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (31, 3000.0000, CAST(12345678940 AS Numeric(11, 0)), N'IST', CAST(N'2013-04-07' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (32, 3000.0000, CAST(12345678941 AS Numeric(11, 0)), N'IST', CAST(N'2013-04-21' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (33, 3000.0000, CAST(12345678942 AS Numeric(11, 0)), N'IST', CAST(N'2013-03-12' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (34, 3000.0000, CAST(12345678943 AS Numeric(11, 0)), N'IST', CAST(N'2013-06-21' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (35, 3000.0000, CAST(12345678944 AS Numeric(11, 0)), N'IST', CAST(N'2013-12-20' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (36, 3000.0000, CAST(12345678945 AS Numeric(11, 0)), N'IST', CAST(N'2019-12-29' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (37, 3000.0000, CAST(12345678946 AS Numeric(11, 0)), N'IST', CAST(N'2013-12-31' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (38, 3000.0000, CAST(12345678947 AS Numeric(11, 0)), N'IST', CAST(N'2011-02-11' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (39, 3000.0000, CAST(12345678948 AS Numeric(11, 0)), N'IST', CAST(N'2019-01-10' AS Date))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [EmployeeTCKN], [EmployeeAirportID], [HireDate]) VALUES (40, 3000.0000, CAST(12345678949 AS Numeric(11, 0)), N'IST', CAST(N'2013-09-01' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (1, 1, CAST(N'1968-01-14' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (2, 2, CAST(N'1978-02-24' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (3, 3, CAST(N'1964-03-23' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (4, 4, CAST(N'1965-11-30' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (5, 5, CAST(N'1956-09-21' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (6, 6, CAST(N'1979-07-11' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (7, 7, CAST(N'1961-08-03' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (8, 8, CAST(N'1972-09-05' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (9, 9, CAST(N'1973-12-07' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (10, 10, CAST(N'1974-01-06' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (11, 11, CAST(N'1978-12-16' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (12, 12, CAST(N'1978-03-13' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (13, 13, CAST(N'1988-04-12' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (14, 14, CAST(N'1982-02-12' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (15, 15, CAST(N'1983-05-21' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (16, 16, CAST(N'1983-06-24' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (17, 17, CAST(N'1984-01-31' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (18, 18, CAST(N'1985-07-21' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (19, 19, CAST(N'1986-09-11' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (20, 20, CAST(N'1987-11-11' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (21, 21, CAST(N'1980-03-25' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (22, 22, CAST(N'1981-04-24' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (23, 23, CAST(N'1982-06-28' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (24, 24, CAST(N'1983-08-27' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (25, 25, CAST(N'1984-09-17' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (26, 26, CAST(N'1977-10-17' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (27, 27, CAST(N'1975-11-15' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (28, 28, CAST(N'1979-02-15' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (29, 29, CAST(N'1980-05-21' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (30, 30, CAST(N'1980-08-11' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (31, 31, CAST(N'1982-11-20' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (32, 32, CAST(N'1983-11-23' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (33, 33, CAST(N'1989-10-17' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (34, 34, CAST(N'1988-12-10' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (35, 35, CAST(N'1987-12-17' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (36, 36, CAST(N'1988-04-03' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (37, 37, CAST(N'1989-05-02' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (38, 38, CAST(N'1990-08-07' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (39, 39, CAST(N'1990-09-06' AS Date))
GO
INSERT [dbo].[Employee_Certificate] ([CertificateNumber], [CEmployeeID], [DateCompleted]) VALUES (40, 40, CAST(N'1990-02-05' AS Date))
GO
INSERT [dbo].[Flies] ([PassengerTCKN], [PFlightID]) VALUES (CAST(12345678900 AS Numeric(11, 0)), N'THY2545')
GO
INSERT [dbo].[Flies] ([PassengerTCKN], [PFlightID]) VALUES (CAST(12345678901 AS Numeric(11, 0)), N'PGT5342')
GO
INSERT [dbo].[Flies] ([PassengerTCKN], [PFlightID]) VALUES (CAST(12345678902 AS Numeric(11, 0)), N'PGT9185')
GO
INSERT [dbo].[Flies] ([PassengerTCKN], [PFlightID]) VALUES (CAST(12345678915 AS Numeric(11, 0)), N'THY2348')
GO
INSERT [dbo].[Flies] ([PassengerTCKN], [PFlightID]) VALUES (CAST(12345678916 AS Numeric(11, 0)), N'THY1458')
GO
INSERT [dbo].[Flies] ([PassengerTCKN], [PFlightID]) VALUES (CAST(12345678917 AS Numeric(11, 0)), N'THY5672')
GO
INSERT [dbo].[Flies] ([PassengerTCKN], [PFlightID]) VALUES (CAST(12345678922 AS Numeric(11, 0)), N'PGT8052')
GO
INSERT [dbo].[Flies] ([PassengerTCKN], [PFlightID]) VALUES (CAST(12345678923 AS Numeric(11, 0)), N'THY1994')
GO
INSERT [dbo].[Flies] ([PassengerTCKN], [PFlightID]) VALUES (CAST(12345678934 AS Numeric(11, 0)), N'PGT1478')
GO
INSERT [dbo].[Flies] ([PassengerTCKN], [PFlightID]) VALUES (CAST(12345678945 AS Numeric(11, 0)), N'THY5462')
GO
INSERT [dbo].[Flight] ([FlightID], [Flight_date], [FlightTime], [GoesTo], [ComesFrom], [FAirportID], [FPilotID]) VALUES (N'PGT1478', CAST(N'2020-01-17' AS Date), CAST(N'13:00:00' AS Time), NULL, N'STR', N'IST', 4)
GO
INSERT [dbo].[Flight] ([FlightID], [Flight_date], [FlightTime], [GoesTo], [ComesFrom], [FAirportID], [FPilotID]) VALUES (N'PGT5312', CAST(N'2020-06-16' AS Date), CAST(N'14:30:00' AS Time), N'JFK', NULL, N'IST', 5)
GO
INSERT [dbo].[Flight] ([FlightID], [Flight_date], [FlightTime], [GoesTo], [ComesFrom], [FAirportID], [FPilotID]) VALUES (N'PGT5342', CAST(N'2019-08-12' AS Date), CAST(N'19:00:00' AS Time), N'AMS', NULL, N'IST', 5)
GO
INSERT [dbo].[Flight] ([FlightID], [Flight_date], [FlightTime], [GoesTo], [ComesFrom], [FAirportID], [FPilotID]) VALUES (N'PGT7985', CAST(N'2020-07-28' AS Date), CAST(N'22:30:00' AS Time), NULL, N'BRU', N'IST', 10)
GO
INSERT [dbo].[Flight] ([FlightID], [Flight_date], [FlightTime], [GoesTo], [ComesFrom], [FAirportID], [FPilotID]) VALUES (N'PGT8052', CAST(N'2020-02-14' AS Date), CAST(N'18:00:00' AS Time), NULL, N'BCN', N'IST', 4)
GO
INSERT [dbo].[Flight] ([FlightID], [Flight_date], [FlightTime], [GoesTo], [ComesFrom], [FAirportID], [FPilotID]) VALUES (N'PGT9185', CAST(N'2020-08-31' AS Date), CAST(N'11:00:00' AS Time), NULL, N'DLM', N'IST', 10)
GO
INSERT [dbo].[Flight] ([FlightID], [Flight_date], [FlightTime], [GoesTo], [ComesFrom], [FAirportID], [FPilotID]) VALUES (N'THY1148', CAST(N'2020-09-09' AS Date), CAST(N'14:00:00' AS Time), NULL, N'AYT', N'IST', 8)
GO
INSERT [dbo].[Flight] ([FlightID], [Flight_date], [FlightTime], [GoesTo], [ComesFrom], [FAirportID], [FPilotID]) VALUES (N'THY1458', CAST(N'2019-12-30' AS Date), CAST(N'08:15:00' AS Time), NULL, N'NAP', N'IST', 2)
GO
INSERT [dbo].[Flight] ([FlightID], [Flight_date], [FlightTime], [GoesTo], [ComesFrom], [FAirportID], [FPilotID]) VALUES (N'THY1564', CAST(N'2019-12-15' AS Date), CAST(N'16:30:00' AS Time), NULL, N'ESB', N'IST', 6)
GO
INSERT [dbo].[Flight] ([FlightID], [Flight_date], [FlightTime], [GoesTo], [ComesFrom], [FAirportID], [FPilotID]) VALUES (N'THY1994', CAST(N'2020-02-14' AS Date), CAST(N'06:30:00' AS Time), N'CDG', NULL, N'IST', 1)
GO
INSERT [dbo].[Flight] ([FlightID], [Flight_date], [FlightTime], [GoesTo], [ComesFrom], [FAirportID], [FPilotID]) VALUES (N'THY2340', CAST(N'2020-08-03' AS Date), CAST(N'16:00:00' AS Time), NULL, N'CIA', N'IST', 2)
GO
INSERT [dbo].[Flight] ([FlightID], [Flight_date], [FlightTime], [GoesTo], [ComesFrom], [FAirportID], [FPilotID]) VALUES (N'THY2342', CAST(N'2020-10-11' AS Date), CAST(N'15:00:00' AS Time), N'SGK', NULL, N'IST', 1)
GO
INSERT [dbo].[Flight] ([FlightID], [Flight_date], [FlightTime], [GoesTo], [ComesFrom], [FAirportID], [FPilotID]) VALUES (N'THY2345', CAST(N'2020-01-20' AS Date), CAST(N'20:00:00' AS Time), NULL, N'PRG', N'IST', 6)
GO
INSERT [dbo].[Flight] ([FlightID], [Flight_date], [FlightTime], [GoesTo], [ComesFrom], [FAirportID], [FPilotID]) VALUES (N'THY2348', CAST(N'2019-12-30' AS Date), CAST(N'21:00:00' AS Time), N'VIE', NULL, N'IST', 7)
GO
INSERT [dbo].[Flight] ([FlightID], [Flight_date], [FlightTime], [GoesTo], [ComesFrom], [FAirportID], [FPilotID]) VALUES (N'THY2448', CAST(N'2020-04-17' AS Date), CAST(N'22:00:00' AS Time), NULL, N'WAW', N'IST', 8)
GO
INSERT [dbo].[Flight] ([FlightID], [Flight_date], [FlightTime], [GoesTo], [ComesFrom], [FAirportID], [FPilotID]) VALUES (N'THY2545', CAST(N'2019-11-28' AS Date), CAST(N'10:20:00' AS Time), N'LGW', NULL, N'IST', 3)
GO
INSERT [dbo].[Flight] ([FlightID], [Flight_date], [FlightTime], [GoesTo], [ComesFrom], [FAirportID], [FPilotID]) VALUES (N'THY2550', CAST(N'2020-05-21' AS Date), CAST(N'17:00:00' AS Time), N'SXF', NULL, N'IST', 3)
GO
INSERT [dbo].[Flight] ([FlightID], [Flight_date], [FlightTime], [GoesTo], [ComesFrom], [FAirportID], [FPilotID]) VALUES (N'THY3155', CAST(N'2019-12-01' AS Date), CAST(N'12:30:00' AS Time), N'ADB', NULL, N'IST', 7)
GO
INSERT [dbo].[Flight] ([FlightID], [Flight_date], [FlightTime], [GoesTo], [ComesFrom], [FAirportID], [FPilotID]) VALUES (N'THY5462', CAST(N'2020-06-10' AS Date), CAST(N'23:00:00' AS Time), N'BUD', NULL, N'IST', 9)
GO
INSERT [dbo].[Flight] ([FlightID], [Flight_date], [FlightTime], [GoesTo], [ComesFrom], [FAirportID], [FPilotID]) VALUES (N'THY5672', CAST(N'2061-06-01' AS Date), CAST(N'11:30:00' AS Time), N'TZX', NULL, N'IST', 9)
GO
INSERT [dbo].[Manager] ([ManagerEmployeeID], [Department]) VALUES (1, N'Technic')
GO
INSERT [dbo].[Manager] ([ManagerEmployeeID], [Department]) VALUES (2, N'Technic')
GO
INSERT [dbo].[Manager] ([ManagerEmployeeID], [Department]) VALUES (3, N'Technic')
GO
INSERT [dbo].[Manager] ([ManagerEmployeeID], [Department]) VALUES (4, N'Traffic')
GO
INSERT [dbo].[Manager] ([ManagerEmployeeID], [Department]) VALUES (5, N'Traffic')
GO
INSERT [dbo].[Manager] ([ManagerEmployeeID], [Department]) VALUES (6, N'Traffic')
GO
INSERT [dbo].[Manager] ([ManagerEmployeeID], [Department]) VALUES (7, N'Emergency')
GO
INSERT [dbo].[Manager] ([ManagerEmployeeID], [Department]) VALUES (8, N'Emergency')
GO
INSERT [dbo].[Manager] ([ManagerEmployeeID], [Department]) VALUES (9, N'Emergency')
GO
INSERT [dbo].[Manager] ([ManagerEmployeeID], [Department]) VALUES (10, N'Management')
GO
INSERT [dbo].[Passenger] ([PassengerTCKN], [Gender], [LuggageWeight]) VALUES (CAST(12345678900 AS Numeric(11, 0)), N'M', 25)
GO
INSERT [dbo].[Passenger] ([PassengerTCKN], [Gender], [LuggageWeight]) VALUES (CAST(12345678901 AS Numeric(11, 0)), N'M', 25)
GO
INSERT [dbo].[Passenger] ([PassengerTCKN], [Gender], [LuggageWeight]) VALUES (CAST(12345678902 AS Numeric(11, 0)), N'M', 28)
GO
INSERT [dbo].[Passenger] ([PassengerTCKN], [Gender], [LuggageWeight]) VALUES (CAST(12345678915 AS Numeric(11, 0)), N'F', 8)
GO
INSERT [dbo].[Passenger] ([PassengerTCKN], [Gender], [LuggageWeight]) VALUES (CAST(12345678916 AS Numeric(11, 0)), N'F', 10)
GO
INSERT [dbo].[Passenger] ([PassengerTCKN], [Gender], [LuggageWeight]) VALUES (CAST(12345678917 AS Numeric(11, 0)), N'F', 15)
GO
INSERT [dbo].[Passenger] ([PassengerTCKN], [Gender], [LuggageWeight]) VALUES (CAST(12345678922 AS Numeric(11, 0)), N'F', 27)
GO
INSERT [dbo].[Passenger] ([PassengerTCKN], [Gender], [LuggageWeight]) VALUES (CAST(12345678923 AS Numeric(11, 0)), N'F', 16)
GO
INSERT [dbo].[Passenger] ([PassengerTCKN], [Gender], [LuggageWeight]) VALUES (CAST(12345678934 AS Numeric(11, 0)), N'F', 5)
GO
INSERT [dbo].[Passenger] ([PassengerTCKN], [Gender], [LuggageWeight]) VALUES (CAST(12345678945 AS Numeric(11, 0)), N'F', 32)
GO
INSERT [dbo].[Passenger_Flight] ([PFlightID], [NumberOfSeat], [NumberOfCabinAttendant]) VALUES (N'PGT1478', 300, 3)
GO
INSERT [dbo].[Passenger_Flight] ([PFlightID], [NumberOfSeat], [NumberOfCabinAttendant]) VALUES (N'PGT5342', 180, 5)
GO
INSERT [dbo].[Passenger_Flight] ([PFlightID], [NumberOfSeat], [NumberOfCabinAttendant]) VALUES (N'PGT9185', 260, 6)
GO
INSERT [dbo].[Passenger_Flight] ([PFlightID], [NumberOfSeat], [NumberOfCabinAttendant]) VALUES (N'THY1148', 190, 8)
GO
INSERT [dbo].[Passenger_Flight] ([PFlightID], [NumberOfSeat], [NumberOfCabinAttendant]) VALUES (N'THY1458', 260, 5)
GO
INSERT [dbo].[Passenger_Flight] ([PFlightID], [NumberOfSeat], [NumberOfCabinAttendant]) VALUES (N'THY1564', 120, 6)
GO
INSERT [dbo].[Passenger_Flight] ([PFlightID], [NumberOfSeat], [NumberOfCabinAttendant]) VALUES (N'THY1994', 220, 6)
GO
INSERT [dbo].[Passenger_Flight] ([PFlightID], [NumberOfSeat], [NumberOfCabinAttendant]) VALUES (N'THY2348', 250, 7)
GO
INSERT [dbo].[Passenger_Flight] ([PFlightID], [NumberOfSeat], [NumberOfCabinAttendant]) VALUES (N'THY2545', 150, 7)
GO
INSERT [dbo].[Passenger_Flight] ([PFlightID], [NumberOfSeat], [NumberOfCabinAttendant]) VALUES (N'THY5672', 350, 4)
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678900 AS Numeric(11, 0)), N'Eray', N'Ali Çebi', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678901 AS Numeric(11, 0)), N'Ertuğrul', N'Volkan', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678902 AS Numeric(11, 0)), N'Evrim', N'Savaş', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678903 AS Numeric(11, 0)), N'Berk', N'Hürriyet', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678904 AS Numeric(11, 0)), N'Faruk', N'Milliyet', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678905 AS Numeric(11, 0)), N'Rahim', N'Atatürk', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678906 AS Numeric(11, 0)), N'Süleyman', N'Cumhuriyet', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678907 AS Numeric(11, 0)), N'Eren', N'Galatasaray', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678908 AS Numeric(11, 0)), N'Emre', N'Beşiktaş', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678909 AS Numeric(11, 0)), N'Kemal', N'Akdeniz', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678910 AS Numeric(11, 0)), N'Mete', N'Eğitim', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678911 AS Numeric(11, 0)), N'Abdullah', N'Mekez', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678912 AS Numeric(11, 0)), N'Semrin', N'Kent', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678913 AS Numeric(11, 0)), N'Beyza', N'Köy', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678914 AS Numeric(11, 0)), N'Büşra', N'Barış', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678915 AS Numeric(11, 0)), N'Çağla', N'Çağdaş', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678916 AS Numeric(11, 0)), N'Ezgi', N'Cumhuriyet', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678917 AS Numeric(11, 0)), N'Sevcan', N'Galatasaray', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678918 AS Numeric(11, 0)), N'Melis', N'Beşiktaş', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678919 AS Numeric(11, 0)), N'İrem', N'Akdeniz', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678920 AS Numeric(11, 0)), N'Miray', N'Ali Çebi', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678921 AS Numeric(11, 0)), N'Almila', N'Volkan', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678922 AS Numeric(11, 0)), N'Hicran', N'Savaş', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678923 AS Numeric(11, 0)), N'Didem', N'Hürriyet', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678924 AS Numeric(11, 0)), N'İmge', N'Milliyet', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678925 AS Numeric(11, 0)), N'Şevval', N'Atatürk', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678926 AS Numeric(11, 0)), N'Amporo', N'Cumhuriyet', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678927 AS Numeric(11, 0)), N'Simon', N'Galatasaray', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678928 AS Numeric(11, 0)), N'Coline', N'Beşiktaş', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678929 AS Numeric(11, 0)), N'Mary', N'Akdeniz', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678930 AS Numeric(11, 0)), N'Pierre', N'Ali Çebi', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678931 AS Numeric(11, 0)), N'Reka', N'Volkan', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678932 AS Numeric(11, 0)), N'Berfin', N'Savaş', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678933 AS Numeric(11, 0)), N'Berk', N'Hürriyet', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678934 AS Numeric(11, 0)), N'Gülşah', N'Milliyet', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678935 AS Numeric(11, 0)), N'Ayça', N'Atatürk', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678936 AS Numeric(11, 0)), N'Berre', N'Cumhuriyet', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678937 AS Numeric(11, 0)), N'Gülce', N'Galatasaray', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678938 AS Numeric(11, 0)), N'Melisa', N'Beşiktaş', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678939 AS Numeric(11, 0)), N'Ekin', N'Akdeniz', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678940 AS Numeric(11, 0)), N'Rabia', N'Ali Çebi', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678941 AS Numeric(11, 0)), N'Miray', N'Volkan', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678942 AS Numeric(11, 0)), N'Ekrem', N'Savaş', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678943 AS Numeric(11, 0)), N'Mervan', N'Hürriyet', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678944 AS Numeric(11, 0)), N'Hilal', N'Milliyet', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678945 AS Numeric(11, 0)), N'İzzy', N'Atatürk', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678946 AS Numeric(11, 0)), N'Demet', N'Cumhuriyet', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678947 AS Numeric(11, 0)), N'Kübra', N'Galatasaray', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678948 AS Numeric(11, 0)), N'Dilara', N'Beşiktaş', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678949 AS Numeric(11, 0)), N'Elif', N'Akdeniz', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678950 AS Numeric(11, 0)), N'Sena', N'Ali Çebi', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678951 AS Numeric(11, 0)), N'Ece', N'Volkan', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678952 AS Numeric(11, 0)), N'Orkun', N'Savaş', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678953 AS Numeric(11, 0)), N'Esra', N'Hürriyet', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678954 AS Numeric(11, 0)), N'Çağatay', N'Milliyet', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678955 AS Numeric(11, 0)), N'Hasan', N'Atatürk', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678956 AS Numeric(11, 0)), N'Dilruba', N'Cumhuriyet', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678957 AS Numeric(11, 0)), N'Elmas', N'Galatasaray', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678958 AS Numeric(11, 0)), N'Aleyna', N'Beşiktaş', N'İstanbul')
GO
INSERT [dbo].[Person] ([TCKN], [name], [Street], [City]) VALUES (CAST(12345678959 AS Numeric(11, 0)), N'Zeynep', N'Akdeniz', N'İstanbul')
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678900 AS Numeric(11, 0)), CAST(5345678900 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678901 AS Numeric(11, 0)), CAST(5345678901 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678902 AS Numeric(11, 0)), CAST(5345678902 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678903 AS Numeric(11, 0)), CAST(5345678903 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678904 AS Numeric(11, 0)), CAST(5345678904 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678905 AS Numeric(11, 0)), CAST(5345678905 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678906 AS Numeric(11, 0)), CAST(5345678906 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678907 AS Numeric(11, 0)), CAST(5345678907 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678908 AS Numeric(11, 0)), CAST(5345678908 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678909 AS Numeric(11, 0)), CAST(5345678909 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678910 AS Numeric(11, 0)), CAST(5345678910 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678911 AS Numeric(11, 0)), CAST(5345678911 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678912 AS Numeric(11, 0)), CAST(5345678912 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678913 AS Numeric(11, 0)), CAST(5345678913 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678914 AS Numeric(11, 0)), CAST(5345678914 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678915 AS Numeric(11, 0)), CAST(5345678915 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678916 AS Numeric(11, 0)), CAST(5345678916 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678917 AS Numeric(11, 0)), CAST(5345678917 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678918 AS Numeric(11, 0)), CAST(5345678918 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678919 AS Numeric(11, 0)), CAST(5345678919 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678921 AS Numeric(11, 0)), CAST(5345678920 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678921 AS Numeric(11, 0)), CAST(5345678921 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678922 AS Numeric(11, 0)), CAST(5345678922 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678923 AS Numeric(11, 0)), CAST(5345678923 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678924 AS Numeric(11, 0)), CAST(5345678924 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678925 AS Numeric(11, 0)), CAST(5345678925 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678926 AS Numeric(11, 0)), CAST(5345678926 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678927 AS Numeric(11, 0)), CAST(5345678927 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678928 AS Numeric(11, 0)), CAST(5345678928 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678929 AS Numeric(11, 0)), CAST(5345678929 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678930 AS Numeric(11, 0)), CAST(5345678930 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678931 AS Numeric(11, 0)), CAST(5345678931 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678932 AS Numeric(11, 0)), CAST(5345678932 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678933 AS Numeric(11, 0)), CAST(5345678933 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678934 AS Numeric(11, 0)), CAST(5345678934 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678935 AS Numeric(11, 0)), CAST(5345678935 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678936 AS Numeric(11, 0)), CAST(5345678936 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678937 AS Numeric(11, 0)), CAST(5345678937 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678938 AS Numeric(11, 0)), CAST(5345678938 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678939 AS Numeric(11, 0)), CAST(5345678939 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678940 AS Numeric(11, 0)), CAST(5345678940 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678941 AS Numeric(11, 0)), CAST(5345678941 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678942 AS Numeric(11, 0)), CAST(5345678942 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678943 AS Numeric(11, 0)), CAST(5345678943 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678944 AS Numeric(11, 0)), CAST(5345678944 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678945 AS Numeric(11, 0)), CAST(5345678945 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678946 AS Numeric(11, 0)), CAST(5345678946 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678947 AS Numeric(11, 0)), CAST(5345678947 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678948 AS Numeric(11, 0)), CAST(5345678948 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678949 AS Numeric(11, 0)), CAST(5345678949 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678950 AS Numeric(11, 0)), CAST(5345678950 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678951 AS Numeric(11, 0)), CAST(5345678951 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678952 AS Numeric(11, 0)), CAST(5345678952 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678953 AS Numeric(11, 0)), CAST(5345678953 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678954 AS Numeric(11, 0)), CAST(5345678954 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678955 AS Numeric(11, 0)), CAST(5345678955 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678956 AS Numeric(11, 0)), CAST(5345678956 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678957 AS Numeric(11, 0)), CAST(5345678957 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678958 AS Numeric(11, 0)), CAST(5345678958 AS Numeric(11, 0)))
GO
INSERT [dbo].[Person_Phone_Number] ([TCKN], [phoneNumber]) VALUES (CAST(12345678959 AS Numeric(11, 0)), CAST(5345678959 AS Numeric(11, 0)))
GO
INSERT [dbo].[Pilot] ([PilotID], [PTCKN]) VALUES (1, CAST(12345678950 AS Numeric(11, 0)))
GO
INSERT [dbo].[Pilot] ([PilotID], [PTCKN]) VALUES (2, CAST(12345678951 AS Numeric(11, 0)))
GO
INSERT [dbo].[Pilot] ([PilotID], [PTCKN]) VALUES (3, CAST(12345678952 AS Numeric(11, 0)))
GO
INSERT [dbo].[Pilot] ([PilotID], [PTCKN]) VALUES (4, CAST(12345678953 AS Numeric(11, 0)))
GO
INSERT [dbo].[Pilot] ([PilotID], [PTCKN]) VALUES (5, CAST(12345678954 AS Numeric(11, 0)))
GO
INSERT [dbo].[Pilot] ([PilotID], [PTCKN]) VALUES (6, CAST(12345678955 AS Numeric(11, 0)))
GO
INSERT [dbo].[Pilot] ([PilotID], [PTCKN]) VALUES (7, CAST(12345678956 AS Numeric(11, 0)))
GO
INSERT [dbo].[Pilot] ([PilotID], [PTCKN]) VALUES (8, CAST(12345678957 AS Numeric(11, 0)))
GO
INSERT [dbo].[Pilot] ([PilotID], [PTCKN]) VALUES (9, CAST(12345678958 AS Numeric(11, 0)))
GO
INSERT [dbo].[Pilot] ([PilotID], [PTCKN]) VALUES (10, CAST(12345678959 AS Numeric(11, 0)))
GO
INSERT [dbo].[Pilot_Certificate] ([CertificateNumber], [CPilotID], [DateCompleted]) VALUES (1, 1, CAST(N'1988-03-31' AS Date))
GO
INSERT [dbo].[Pilot_Certificate] ([CertificateNumber], [CPilotID], [DateCompleted]) VALUES (2, 2, CAST(N'1978-06-30' AS Date))
GO
INSERT [dbo].[Pilot_Certificate] ([CertificateNumber], [CPilotID], [DateCompleted]) VALUES (3, 3, CAST(N'1968-09-27' AS Date))
GO
INSERT [dbo].[Pilot_Certificate] ([CertificateNumber], [CPilotID], [DateCompleted]) VALUES (4, 4, CAST(N'1977-11-23' AS Date))
GO
INSERT [dbo].[Pilot_Certificate] ([CertificateNumber], [CPilotID], [DateCompleted]) VALUES (5, 5, CAST(N'1971-12-06' AS Date))
GO
INSERT [dbo].[Pilot_Certificate] ([CertificateNumber], [CPilotID], [DateCompleted]) VALUES (6, 6, CAST(N'1975-10-05' AS Date))
GO
INSERT [dbo].[Pilot_Certificate] ([CertificateNumber], [CPilotID], [DateCompleted]) VALUES (7, 7, CAST(N'1970-08-09' AS Date))
GO
INSERT [dbo].[Pilot_Certificate] ([CertificateNumber], [CPilotID], [DateCompleted]) VALUES (8, 8, CAST(N'1980-06-17' AS Date))
GO
INSERT [dbo].[Pilot_Certificate] ([CertificateNumber], [CPilotID], [DateCompleted]) VALUES (9, 9, CAST(N'1961-04-14' AS Date))
GO
INSERT [dbo].[Pilot_Certificate] ([CertificateNumber], [CPilotID], [DateCompleted]) VALUES (10, 10, CAST(N'1977-01-11' AS Date))
GO
INSERT [dbo].[Plane] ([PlaneID], [Capacity], [PlaneType], [HourlyPrice], [DailyPrice], [ApronNumber], [PlaneVehicleID]) VALUES (N'12-SAD', 260, N'Jumbo Passenger Jet', 30.0000, 450.0000, 20, 20)
GO
INSERT [dbo].[Plane] ([PlaneID], [Capacity], [PlaneType], [HourlyPrice], [DailyPrice], [ApronNumber], [PlaneVehicleID]) VALUES (N'5H-MAD', 200, N'Mid Size Passenger jet', 20.0000, 300.0000, 11, 11)
GO
INSERT [dbo].[Plane] ([PlaneID], [Capacity], [PlaneType], [HourlyPrice], [DailyPrice], [ApronNumber], [PlaneVehicleID]) VALUES (N'5S-DAD', 250, N'Mid Size Passenger jet', 20.0000, 300.0000, 12, 12)
GO
INSERT [dbo].[Plane] ([PlaneID], [Capacity], [PlaneType], [HourlyPrice], [DailyPrice], [ApronNumber], [PlaneVehicleID]) VALUES (N'5S-HGS', 200, N'Mid Size Passenger jet', 20.0000, 300.0000, 17, 17)
GO
INSERT [dbo].[Plane] ([PlaneID], [Capacity], [PlaneType], [HourlyPrice], [DailyPrice], [ApronNumber], [PlaneVehicleID]) VALUES (N'5Y-LOD', 220, N'Mid Size Passenger jet', 20.0000, 300.0000, 13, 13)
GO
INSERT [dbo].[Plane] ([PlaneID], [Capacity], [PlaneType], [HourlyPrice], [DailyPrice], [ApronNumber], [PlaneVehicleID]) VALUES (N'ASD-DA', 300, N'Jumbo Passenger Jet', 30.0000, 450.0000, 19, 19)
GO
INSERT [dbo].[Plane] ([PlaneID], [Capacity], [PlaneType], [HourlyPrice], [DailyPrice], [ApronNumber], [PlaneVehicleID]) VALUES (N'INS-OT', 120, N'Light Passenger Jet', 10.0000, 150.0000, 15, 15)
GO
INSERT [dbo].[Plane] ([PlaneID], [Capacity], [PlaneType], [HourlyPrice], [DailyPrice], [ApronNumber], [PlaneVehicleID]) VALUES (N'LMN-HZ', 260, N'Jumbo Passenger Jet', 30.0000, 450.0000, 18, 18)
GO
INSERT [dbo].[Plane] ([PlaneID], [Capacity], [PlaneType], [HourlyPrice], [DailyPrice], [ApronNumber], [PlaneVehicleID]) VALUES (N'SK-TOT', 100, N'Light Passenger Jet', 10.0000, 150.0000, 14, 14)
GO
INSERT [dbo].[Plane] ([PlaneID], [Capacity], [PlaneType], [HourlyPrice], [DailyPrice], [ApronNumber], [PlaneVehicleID]) VALUES (N'SOL-A', 160, N'Light Passenger Jet', 10.0000, 150.0000, 16, 16)
GO
INSERT [dbo].[Supplier] ([SupplierID], [name], [district], [city]) VALUES (1, N'Ertugrul', N'Kadikoy', N'Istanbul')
GO
INSERT [dbo].[Supplier] ([SupplierID], [name], [district], [city]) VALUES (2, N'Eray', N'Beylikduzu', N'Istanbul')
GO
INSERT [dbo].[Supplier] ([SupplierID], [name], [district], [city]) VALUES (3, N'Mete', N'Kadikoy', N'Istanbul')
GO
INSERT [dbo].[Supplier] ([SupplierID], [name], [district], [city]) VALUES (4, N'Furkan Kuse', N'Maltepe', N'Istanbul')
GO
INSERT [dbo].[Supplier] ([SupplierID], [name], [district], [city]) VALUES (5, N'Furkan Kemal', N'Maltepe', N'Istanbul')
GO
INSERT [dbo].[Supplier] ([SupplierID], [name], [district], [city]) VALUES (6, N'Faruk', N'Sancaktepe', N'Istanbul')
GO
INSERT [dbo].[Supplier] ([SupplierID], [name], [district], [city]) VALUES (7, N'Berk', N'Kadikoy', N'Istanbul')
GO
INSERT [dbo].[Supplier] ([SupplierID], [name], [district], [city]) VALUES (8, N'Rahim', N'Maltepe', N'Istanbul')
GO
INSERT [dbo].[Supplier] ([SupplierID], [name], [district], [city]) VALUES (9, N'Mahir', N'Mecidiyekoy', N'Istanbul')
GO
INSERT [dbo].[Supplier] ([SupplierID], [name], [district], [city]) VALUES (10, N'Erdal', N'Merter', N'Istanbul')
GO
INSERT [dbo].[Supplier] ([SupplierID], [name], [district], [city]) VALUES (11, N'Habibe', N'Beylikdüzü', N'Istanbul')
GO
INSERT [dbo].[Supplier] ([SupplierID], [name], [district], [city]) VALUES (12, N'Erdem', N'Beylikdüzü', N'Istanbul')
GO
INSERT [dbo].[Supplies] ([SSupplierID], [SBlockNumber], [UnitPrice], [ProductType]) VALUES (1, 1, 120, N'Technology')
GO
INSERT [dbo].[Supplies] ([SSupplierID], [SBlockNumber], [UnitPrice], [ProductType]) VALUES (2, 2, 130, N'Food')
GO
INSERT [dbo].[Supplies] ([SSupplierID], [SBlockNumber], [UnitPrice], [ProductType]) VALUES (3, 3, 140, N'Clothes')
GO
INSERT [dbo].[Supplies] ([SSupplierID], [SBlockNumber], [UnitPrice], [ProductType]) VALUES (4, 4, 200, N'Drinks')
GO
INSERT [dbo].[Supplies] ([SSupplierID], [SBlockNumber], [UnitPrice], [ProductType]) VALUES (5, 5, 400, N'Alcohol')
GO
INSERT [dbo].[Supplies] ([SSupplierID], [SBlockNumber], [UnitPrice], [ProductType]) VALUES (6, 6, 20, N'Cosmetic')
GO
INSERT [dbo].[Supplies] ([SSupplierID], [SBlockNumber], [UnitPrice], [ProductType]) VALUES (7, 7, 450, N'Tobacco')
GO
INSERT [dbo].[Supplies] ([SSupplierID], [SBlockNumber], [UnitPrice], [ProductType]) VALUES (8, 8, 800, N'Desserts')
GO
INSERT [dbo].[Supplies] ([SSupplierID], [SBlockNumber], [UnitPrice], [ProductType]) VALUES (9, 9, 20, N'Coffee')
GO
INSERT [dbo].[Supplies] ([SSupplierID], [SBlockNumber], [UnitPrice], [ProductType]) VALUES (10, 10, 20, N'Technology')
GO
INSERT [dbo].[Technician] ([TechnicEmployeeID], [Field], [ManagerID]) VALUES (11, N'Cargo', 1)
GO
INSERT [dbo].[Technician] ([TechnicEmployeeID], [Field], [ManagerID]) VALUES (12, N'Cargo', 1)
GO
INSERT [dbo].[Technician] ([TechnicEmployeeID], [Field], [ManagerID]) VALUES (13, N'Cargo', 1)
GO
INSERT [dbo].[Technician] ([TechnicEmployeeID], [Field], [ManagerID]) VALUES (14, N'Engine', 2)
GO
INSERT [dbo].[Technician] ([TechnicEmployeeID], [Field], [ManagerID]) VALUES (15, N'Engine', 2)
GO
INSERT [dbo].[Technician] ([TechnicEmployeeID], [Field], [ManagerID]) VALUES (16, N'Engine', 2)
GO
INSERT [dbo].[Technician] ([TechnicEmployeeID], [Field], [ManagerID]) VALUES (17, N'Maintanance', 3)
GO
INSERT [dbo].[Technician] ([TechnicEmployeeID], [Field], [ManagerID]) VALUES (18, N'Maintanance', 3)
GO
INSERT [dbo].[Technician] ([TechnicEmployeeID], [Field], [ManagerID]) VALUES (19, N'Maintanance', 3)
GO
INSERT [dbo].[Technician] ([TechnicEmployeeID], [Field], [ManagerID]) VALUES (20, N'Maintanance', 3)
GO
INSERT [dbo].[Ticket] ([TicketID], [price], [TicketPassengerTCKN], [TicketType]) VALUES (N'06KUSH', 1200.0000, CAST(12345678922 AS Numeric(11, 0)), N'Business')
GO
INSERT [dbo].[Ticket] ([TicketID], [price], [TicketPassengerTCKN], [TicketType]) VALUES (N'1GR100', 300.0000, CAST(12345678901 AS Numeric(11, 0)), N'Economy')
GO
INSERT [dbo].[Ticket] ([TicketID], [price], [TicketPassengerTCKN], [TicketType]) VALUES (N'3RD4AL', 440.0000, CAST(12345678915 AS Numeric(11, 0)), N'First Class')
GO
INSERT [dbo].[Ticket] ([TicketID], [price], [TicketPassengerTCKN], [TicketType]) VALUES (N'AMNE51', 900.0000, CAST(12345678917 AS Numeric(11, 0)), N'Economy')
GO
INSERT [dbo].[Ticket] ([TicketID], [price], [TicketPassengerTCKN], [TicketType]) VALUES (N'H0TB0X', 500.0000, CAST(12345678945 AS Numeric(11, 0)), N'Economy')
GO
INSERT [dbo].[Ticket] ([TicketID], [price], [TicketPassengerTCKN], [TicketType]) VALUES (N'L1MNHZ', 380.0000, CAST(12345678916 AS Numeric(11, 0)), N'First Class')
GO
INSERT [dbo].[Ticket] ([TicketID], [price], [TicketPassengerTCKN], [TicketType]) VALUES (N'MHR420', 700.0000, CAST(12345678902 AS Numeric(11, 0)), N'Economy')
GO
INSERT [dbo].[Ticket] ([TicketID], [price], [TicketPassengerTCKN], [TicketType]) VALUES (N'PRPLHZ', 150.0000, CAST(12345678923 AS Numeric(11, 0)), N'Economy')
GO
INSERT [dbo].[Ticket] ([TicketID], [price], [TicketPassengerTCKN], [TicketType]) VALUES (N'THC34L', 690.0000, CAST(12345678934 AS Numeric(11, 0)), N'First Class')
GO
INSERT [dbo].[Ticket] ([TicketID], [price], [TicketPassengerTCKN], [TicketType]) VALUES (N'ZKL930', 100.0000, CAST(12345678900 AS Numeric(11, 0)), N'Business')
GO
INSERT [dbo].[Traffic_Controller] ([ControlEmployeeID], [ControllerLocation], [ManagerID]) VALUES (21, N'Terminal traffic', 4)
GO
INSERT [dbo].[Traffic_Controller] ([ControlEmployeeID], [ControllerLocation], [ManagerID]) VALUES (22, N'Terminal traffic', 4)
GO
INSERT [dbo].[Traffic_Controller] ([ControlEmployeeID], [ControllerLocation], [ManagerID]) VALUES (23, N'Terminal traffic', 4)
GO
INSERT [dbo].[Traffic_Controller] ([ControlEmployeeID], [ControllerLocation], [ManagerID]) VALUES (24, N'Apron Traffic', 5)
GO
INSERT [dbo].[Traffic_Controller] ([ControlEmployeeID], [ControllerLocation], [ManagerID]) VALUES (25, N'Apron Traffic', 5)
GO
INSERT [dbo].[Traffic_Controller] ([ControlEmployeeID], [ControllerLocation], [ManagerID]) VALUES (26, N'Apron Traffic', 5)
GO
INSERT [dbo].[Traffic_Controller] ([ControlEmployeeID], [ControllerLocation], [ManagerID]) VALUES (27, N'Air Traffic', 6)
GO
INSERT [dbo].[Traffic_Controller] ([ControlEmployeeID], [ControllerLocation], [ManagerID]) VALUES (28, N'Air Traffic', 6)
GO
INSERT [dbo].[Traffic_Controller] ([ControlEmployeeID], [ControllerLocation], [ManagerID]) VALUES (29, N'Air Traffic', 6)
GO
INSERT [dbo].[Traffic_Controller] ([ControlEmployeeID], [ControllerLocation], [ManagerID]) VALUES (30, N'Air Traffic', 6)
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (1, 2019, N'Black')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (2, 2016, N'Yellow')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (3, 2012, N'Red')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (4, 2002, N'White')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (5, 2005, N'White')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (6, 2011, N'Blue')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (7, 2012, N'White')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (8, 2013, N'Purple')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (9, 2014, N'Gray')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (10, 1996, N'Green')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (11, 1975, N'Yellow')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (12, 2000, N'White')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (13, 2010, N'White')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (14, 2009, N'Yellow')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (15, 1993, N'Yellow')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (16, 2011, N'White')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (17, 2015, N'White')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (18, 2008, N'Purple')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (19, 2010, N'White')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (20, 1995, N'Purple')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (21, 2015, N'White')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (22, 2015, N'White')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (23, 2015, N'White')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (24, 2015, N'White')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (25, 2015, N'White')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (26, 2015, N'White')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (27, 2015, N'White')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (28, 2015, N'White')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (29, 2015, N'White')
GO
INSERT [dbo].[Vehicle] ([VehicleID], [Model], [Color]) VALUES (30, 2015, N'White')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CN_name]    Script Date: 15.12.2019 22:28:31 ******/
ALTER TABLE [dbo].[Airport] ADD  CONSTRAINT [CN_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CN_StoreName]    Script Date: 15.12.2019 22:28:31 ******/
ALTER TABLE [dbo].[Airport_Store] ADD  CONSTRAINT [CN_StoreName] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Airport_Store]  WITH CHECK ADD  CONSTRAINT [Airport_Store_FK1] FOREIGN KEY([StoreAirportID])
REFERENCES [dbo].[Airport] ([AirportID])
GO
ALTER TABLE [dbo].[Airport_Store] CHECK CONSTRAINT [Airport_Store_FK1]
GO
ALTER TABLE [dbo].[Airport_Vehicle]  WITH CHECK ADD  CONSTRAINT [Airport_Vehicle_FK1] FOREIGN KEY([AirportVehicleSpaceNumber])
REFERENCES [dbo].[Car_Park] ([SpaceNumber])
GO
ALTER TABLE [dbo].[Airport_Vehicle] CHECK CONSTRAINT [Airport_Vehicle_FK1]
GO
ALTER TABLE [dbo].[Airport_Vehicle]  WITH CHECK ADD  CONSTRAINT [Airport_Vehicle_FK2] FOREIGN KEY([AirportVehicleID])
REFERENCES [dbo].[Vehicle] ([VehicleID])
GO
ALTER TABLE [dbo].[Airport_Vehicle] CHECK CONSTRAINT [Airport_Vehicle_FK2]
GO
ALTER TABLE [dbo].[Apron]  WITH CHECK ADD  CONSTRAINT [Apron_FK] FOREIGN KEY([ApronAirportID])
REFERENCES [dbo].[Airport] ([AirportID])
GO
ALTER TABLE [dbo].[Apron] CHECK CONSTRAINT [Apron_FK]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [Car_FK1] FOREIGN KEY([CarSpaceNumber])
REFERENCES [dbo].[Car_Park] ([SpaceNumber])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [Car_FK1]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [Car_FK2] FOREIGN KEY([CarVehicleID])
REFERENCES [dbo].[Vehicle] ([VehicleID])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [Car_FK2]
GO
ALTER TABLE [dbo].[Car_Park]  WITH CHECK ADD  CONSTRAINT [CarPark_FK] FOREIGN KEY([ParkingLotAirportID])
REFERENCES [dbo].[Airport] ([AirportID])
GO
ALTER TABLE [dbo].[Car_Park] CHECK CONSTRAINT [CarPark_FK]
GO
ALTER TABLE [dbo].[Cargo_Flight]  WITH CHECK ADD  CONSTRAINT [Cargo_Flight_FK] FOREIGN KEY([CFlightID])
REFERENCES [dbo].[Flight] ([FlightID])
GO
ALTER TABLE [dbo].[Cargo_Flight] CHECK CONSTRAINT [Cargo_Flight_FK]
GO
ALTER TABLE [dbo].[Emergency_Service]  WITH CHECK ADD  CONSTRAINT [Emergency_Service_FK] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Manager] ([ManagerEmployeeID])
GO
ALTER TABLE [dbo].[Emergency_Service] CHECK CONSTRAINT [Emergency_Service_FK]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [Employee_FK1] FOREIGN KEY([EmployeeTCKN])
REFERENCES [dbo].[Person] ([TCKN])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [Employee_FK1]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [Employee_FK2] FOREIGN KEY([EmployeeAirportID])
REFERENCES [dbo].[Airport] ([AirportID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [Employee_FK2]
GO
ALTER TABLE [dbo].[Employee_Certificate]  WITH CHECK ADD  CONSTRAINT [Employee_Certificate_FK] FOREIGN KEY([CEmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employee_Certificate] CHECK CONSTRAINT [Employee_Certificate_FK]
GO
ALTER TABLE [dbo].[Flies]  WITH CHECK ADD  CONSTRAINT [Flies_FK1] FOREIGN KEY([PassengerTCKN])
REFERENCES [dbo].[Passenger] ([PassengerTCKN])
GO
ALTER TABLE [dbo].[Flies] CHECK CONSTRAINT [Flies_FK1]
GO
ALTER TABLE [dbo].[Flies]  WITH CHECK ADD  CONSTRAINT [Flies_FK2] FOREIGN KEY([PFlightID])
REFERENCES [dbo].[Flight] ([FlightID])
GO
ALTER TABLE [dbo].[Flies] CHECK CONSTRAINT [Flies_FK2]
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [Flight_FK1] FOREIGN KEY([FAirportID])
REFERENCES [dbo].[Airport] ([AirportID])
GO
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [Flight_FK1]
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [Flight_FK2] FOREIGN KEY([FPilotID])
REFERENCES [dbo].[Pilot] ([PilotID])
GO
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [Flight_FK2]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [Manager_FK] FOREIGN KEY([ManagerEmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [Manager_FK]
GO
ALTER TABLE [dbo].[Passenger]  WITH CHECK ADD  CONSTRAINT [Passenger_FK] FOREIGN KEY([PassengerTCKN])
REFERENCES [dbo].[Person] ([TCKN])
GO
ALTER TABLE [dbo].[Passenger] CHECK CONSTRAINT [Passenger_FK]
GO
ALTER TABLE [dbo].[Passenger_Flight]  WITH CHECK ADD  CONSTRAINT [Passenger_Flight_FK] FOREIGN KEY([PFlightID])
REFERENCES [dbo].[Flight] ([FlightID])
GO
ALTER TABLE [dbo].[Passenger_Flight] CHECK CONSTRAINT [Passenger_Flight_FK]
GO
ALTER TABLE [dbo].[Person_Phone_Number]  WITH CHECK ADD  CONSTRAINT [Person_Phone_Number_FK] FOREIGN KEY([TCKN])
REFERENCES [dbo].[Person] ([TCKN])
GO
ALTER TABLE [dbo].[Person_Phone_Number] CHECK CONSTRAINT [Person_Phone_Number_FK]
GO
ALTER TABLE [dbo].[Pilot]  WITH CHECK ADD  CONSTRAINT [Pilot_FK] FOREIGN KEY([PTCKN])
REFERENCES [dbo].[Person] ([TCKN])
GO
ALTER TABLE [dbo].[Pilot] CHECK CONSTRAINT [Pilot_FK]
GO
ALTER TABLE [dbo].[Pilot_Certificate]  WITH CHECK ADD  CONSTRAINT [Pilot_Certificate_FK] FOREIGN KEY([CPilotID])
REFERENCES [dbo].[Pilot] ([PilotID])
GO
ALTER TABLE [dbo].[Pilot_Certificate] CHECK CONSTRAINT [Pilot_Certificate_FK]
GO
ALTER TABLE [dbo].[Plane]  WITH CHECK ADD  CONSTRAINT [Plane_FK1] FOREIGN KEY([PlaneVehicleID])
REFERENCES [dbo].[Vehicle] ([VehicleID])
GO
ALTER TABLE [dbo].[Plane] CHECK CONSTRAINT [Plane_FK1]
GO
ALTER TABLE [dbo].[Plane]  WITH CHECK ADD  CONSTRAINT [Plane_FK2] FOREIGN KEY([ApronNumber])
REFERENCES [dbo].[Apron] ([ApronNumber])
GO
ALTER TABLE [dbo].[Plane] CHECK CONSTRAINT [Plane_FK2]
GO
ALTER TABLE [dbo].[Supplies]  WITH CHECK ADD  CONSTRAINT [Supplies_FK1] FOREIGN KEY([SSupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[Supplies] CHECK CONSTRAINT [Supplies_FK1]
GO
ALTER TABLE [dbo].[Supplies]  WITH CHECK ADD  CONSTRAINT [Supplies_FK2] FOREIGN KEY([SBlockNumber])
REFERENCES [dbo].[Airport_Store] ([BlockNumber])
GO
ALTER TABLE [dbo].[Supplies] CHECK CONSTRAINT [Supplies_FK2]
GO
ALTER TABLE [dbo].[Technician]  WITH CHECK ADD FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Manager] ([ManagerEmployeeID])
GO
ALTER TABLE [dbo].[Technician]  WITH CHECK ADD  CONSTRAINT [Technician_FK] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Manager] ([ManagerEmployeeID])
GO
ALTER TABLE [dbo].[Technician] CHECK CONSTRAINT [Technician_FK]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [Ticket_FK] FOREIGN KEY([TicketPassengerTCKN])
REFERENCES [dbo].[Passenger] ([PassengerTCKN])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [Ticket_FK]
GO
ALTER TABLE [dbo].[Traffic_Controller]  WITH CHECK ADD  CONSTRAINT [Traffic_Controller_FK] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Manager] ([ManagerEmployeeID])
GO
ALTER TABLE [dbo].[Traffic_Controller] CHECK CONSTRAINT [Traffic_Controller_FK]
GO
/****** Object:  StoredProcedure [dbo].[CarDetail]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CarDetail]
	@platenumber varchar(11)
as	
	select *
	from Vehicle v INNER JOIN Car c on v.VehicleID = c.CarVehicleID INNER JOIN Car_Park p on p.SpaceNumber=c.CarSpaceNumber
	where c.PlateNumber= @platenumber
GO
/****** Object:  StoredProcedure [dbo].[SalaryEmp]    Script Date: 15.12.2019 22:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SalaryEmp]
As
select Person.TCKN, Person.name,Person_Phone_Number.phoneNumber,Employee.Salary
from Person,Person_Phone_Number,Employee
where Person.TCKN = Employee.EmployeeTCKN AND Employee.EmployeeTCKN = Person_Phone_Number.TCKN AND Employee.Salary>4500;
GO
USE [master]
GO
ALTER DATABASE [Ataturk_Airport] SET  READ_WRITE 
GO
