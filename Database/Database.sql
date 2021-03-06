USE [master]
GO
/****** Object:  Database [CarBrokerageSystem]    Script Date: 18/12/2017 04:18:21 AM ******/
CREATE DATABASE [CarBrokerageSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarBrokerageSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CarBrokerageSystem.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CarBrokerageSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CarBrokerageSystem_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CarBrokerageSystem] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarBrokerageSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarBrokerageSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarBrokerageSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarBrokerageSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarBrokerageSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarBrokerageSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarBrokerageSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarBrokerageSystem] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CarBrokerageSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarBrokerageSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarBrokerageSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarBrokerageSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarBrokerageSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarBrokerageSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarBrokerageSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarBrokerageSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarBrokerageSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarBrokerageSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarBrokerageSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarBrokerageSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarBrokerageSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarBrokerageSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarBrokerageSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarBrokerageSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarBrokerageSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CarBrokerageSystem] SET  MULTI_USER 
GO
ALTER DATABASE [CarBrokerageSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarBrokerageSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarBrokerageSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarBrokerageSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CarBrokerageSystem]
GO
/****** Object:  StoredProcedure [dbo].[search]    Script Date: 18/12/2017 04:18:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[search] (@price decimal)
AS
	DECLARE @maxSeat int
	SELECT @maxSeat = MAX(Seat) FROM [Car]
	IF (@price <= @maxSeat)
		SELECT DISTINCT CarID, CarName, Price, CarImage = (select top 1 CarImage from [FiveElement] where CarID = CarID)
		FROM [Car]
		WHERE Seat = @price
	else
		SELECT DISTINCT CarID, CarName, Price, CarImage = (select top 1 CarImage from [FiveElement] where CarID = CarID)
		FROM [Car] 
		WHERE Price <= @price
GO
/****** Object:  Table [dbo].[Car]    Script Date: 18/12/2017 04:18:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[CarID] [uniqueidentifier] NOT NULL,
	[CarName] [nvarchar](100) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Warranty] [nvarchar](250) NOT NULL,
	[ProducerID] [uniqueidentifier] NOT NULL,
	[StyleCarID] [uniqueidentifier] NOT NULL,
	[TypeCarID] [uniqueidentifier] NOT NULL,
	[CarHighlight] [bit] NULL,
	[TypeHighlight] [bit] NULL,
	[Size] [nvarchar](250) NOT NULL,
	[Wheelbase] [nvarchar](250) NOT NULL,
	[Weight] [nvarchar](250) NOT NULL,
	[MaxWeight] [nvarchar](250) NOT NULL,
	[EngineType] [nvarchar](250) NOT NULL,
	[Torque] [nvarchar](250) NOT NULL,
	[EnginePower] [nvarchar](250) NOT NULL,
	[TopSpeed] [nvarchar](250) NOT NULL,
	[FuelTankCapacity] [nvarchar](250) NULL,
	[Fuel] [nvarchar](250) NOT NULL,
	[FuelConsumption] [nvarchar](250) NULL,
	[EmissionStandard] [nvarchar](250) NULL,
	[Gear] [nvarchar](250) NOT NULL,
	[FrontBrake] [nvarchar](250) NOT NULL,
	[RearBrake] [nvarchar](250) NOT NULL,
	[FrontFoglamp] [nvarchar](250) NOT NULL,
	[RearFoglamp] [nvarchar](250) NOT NULL,
	[RearviewMirrorOutside] [nvarchar](250) NOT NULL,
	[WinscreenWiper] [nvarchar](250) NOT NULL,
	[Antenna] [nvarchar](250) NULL,
	[DoorHandle] [nvarchar](250) NULL,
	[AirConditioner] [nvarchar](250) NULL,
	[RearviewMirrorInside] [nvarchar](250) NOT NULL,
	[Sunroof] [nvarchar](250) NULL,
	[SeatType] [nvarchar](250) NULL,
	[Seat] [int] NOT NULL,
	[Sunshade] [nvarchar](250) NULL,
	[CupHolder] [nvarchar](250) NULL,
	[SpeakerType] [nvarchar](250) NULL,
	[Dics] [nvarchar](250) NULL,
	[NumberSpeaker] [nvarchar](250) NULL,
	[Usb] [nvarchar](250) NULL,
	[Bluetooth] [nvarchar](250) NULL,
	[ElectronicStabilityControl] [nvarchar](250) NOT NULL,
	[Brakelight] [nvarchar](250) NULL,
	[ChildSafetyLock] [nvarchar](250) NULL,
	[SeatBelt] [nvarchar](250) NOT NULL,
	[Airbag] [nvarchar](250) NOT NULL,
	[Safe] [float] NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FiveElement]    Script Date: 18/12/2017 04:18:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FiveElement](
	[CarID] [uniqueidentifier] NOT NULL,
	[Color] [nvarchar](50) NOT NULL,
	[CarImage] [nvarchar](max) NOT NULL,
	[CarBanner] [nvarchar](max) NULL,
	[Metal] [bit] NULL,
	[Water] [bit] NULL,
	[Fire] [bit] NULL,
	[Earth] [bit] NULL,
	[Wood] [bit] NULL,
 CONSTRAINT [PK_FiveElements_1] PRIMARY KEY CLUSTERED 
(
	[CarID] ASC,
	[Color] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FollowCar]    Script Date: 18/12/2017 04:18:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FollowCar](
	[UserName] [varchar](50) NOT NULL,
	[CarID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FollowCar] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC,
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 18/12/2017 04:18:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [uniqueidentifier] NOT NULL,
	[Orderer] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[Address] [nvarchar](250) NULL,
	[OrderDate] [date] NOT NULL,
	[CarID] [uniqueidentifier] NOT NULL,
	[Seen] [bit] NOT NULL,
	[Contacted] [bit] NOT NULL,
	[UserName] [varchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 18/12/2017 04:18:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[ProducerID] [uniqueidentifier] NOT NULL,
	[ProducerName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[ProducerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StyleCar]    Script Date: 18/12/2017 04:18:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StyleCar](
	[StyleCarID] [uniqueidentifier] NOT NULL,
	[StyleCar] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StyleCar] PRIMARY KEY CLUSTERED 
(
	[StyleCarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TypeCar]    Script Date: 18/12/2017 04:18:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TypeCar](
	[TypeCarID] [uniqueidentifier] NOT NULL,
	[TypeCar] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TypeCar] PRIMARY KEY CLUSTERED 
(
	[TypeCarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 18/12/2017 04:18:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Type] [varchar](10) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[Address] [nvarchar](250) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [TypeHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag], [Safe]) VALUES (N'21efab49-6eb4-4198-a685-23252b44d4ab', N'Audi A3', CAST(2460000000 AS Decimal(18, 0)), N'3 năm', N'59afffa0-36e3-44c0-b87f-a04ef5301505', N'b3bda3fe-4e2a-4be7-a4b2-cdab79cd8f95', N'2d5a9957-60c8-4c3c-8f2d-e43e42459d98', 0, 1, N'4620mm x 1775mm x 1460mm', N'2550mmm', N'1070 kg', N'2665 kg', N'2GR-FE,3.5L, 6 xy lanh chữ V, 24 Van, DOHC kèm VVTi kép', N'4000 vòng/phút', N'6200 vòng/phút', N'200 Km/h', N'55 lít', N'Xăng', N'10.5 lít / 100km', N'Euro 4', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Thường', 6, N'Có', N'Có', N'Loại thường', N'Có', N'4 loa', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', NULL)
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [TypeHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag], [Safe]) VALUES (N'9aa319f7-4c52-4787-85b0-24751579eb76', N'Camry 2.5Q', CAST(1302000000 AS Decimal(18, 0)), N'3 năm', N'59afffa0-36e3-44c0-b87f-a04ef5301505', N'a28c5377-954e-4d65-944a-6f2bbc905692', N'237b6630-248c-4650-b905-27ace141cad3', 1, 1, N'4850mm x 1825mm x 1470mm', N'2775mm', N'1498 kg', N'2000 kg', N'2AR-FE, 4 xy lanh thẳng hàng, 16 van, DOHC, VVT-i kép, ACIS', N'4100 vòng/phút', N'6000 vòng/phút', N'200 Km/h', N'70 lít', N'Xăng không chì', N'7.8 lít / 100km', N'Euro 4', N'Tự động 6 cấp', N'Đĩa tản nhiệt', N'Đĩa đặc', N'Có', N'Có', N'Có', N'Gián đoạn, điều chỉnh thời gian', N'Kính sau', N'Mạ crôm', N'Có', N'Chống chói tự động', N'-', N'Thường', 5, N'Có', N'Có', N'-', N'DVD 1 đĩa', N'6 loa', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', NULL)
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [TypeHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag], [Safe]) VALUES (N'b8db07dd-a77b-4933-ae44-259651a06bf5', N'Audi Q5', CAST(2360000000 AS Decimal(18, 0)), N'3 năm', N'59afffa0-36e3-44c0-b87f-a04ef5301505', N'b3bda3fe-4e2a-4be7-a4b2-cdab79cd8f95', N'2d5a9957-60c8-4c3c-8f2d-e43e42459d98', 1, 1, N'4.663mm x 1.893mm x 1.659mm', N'2819mm', N'1250kg', N'1690kg', N'xăng 2.0L tăng áp (công suất 252 mã lực, mô-men xoắn cực đại 370 Nm)', N'4000 vòng/phút', N'6200 vòng/phút', N'200 Km/h', N'55 lít', N'Xăng', N'10.5 lít / 100km', N'Euro 4', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'-', N'Thường', 5, N'Có', N'Có', N'Thường', N'DVD', N'5 loa', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', NULL)
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [TypeHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag], [Safe]) VALUES (N'aa5a073c-250f-4549-ac47-35a59d11c522', N'Alphard', CAST(3533000000 AS Decimal(18, 0)), N'3 năm', N'190c9c49-d6c7-4461-af7e-495e68efbd33', N'a28c5377-954e-4d65-944a-6f2bbc905692', N'e0ee425f-7fab-434c-95e0-c218ac132f0f', 0, 1, N'4915 mm x 1850 mm x 1890 mm', N'3000mm', N'2140 kg', N'2665 kg', N'2GR-FE,3.5L, 6 xy lanh chữ V, 24 Van, DOHC kèm VVTi kép', N'4700 vòng/phút', N'6200 vòng/phút ', N'200 Km/h', N'75 lít', N'Xăng', N'10.5 lít / 100km', N'Euro 4', N'Tự động 6 cấp', N'Đĩa tản nhiệt', N'Đĩa tản nhiệt', N'LED', N'LED', N'Có', N'Gián đoạn, cảm biến mưa', N'Tích hợp vào kính sau', N'Mạ crôm', N'Có', N'Chống chói tự động', N'Trước/Sau', N'Thường', 7, N'Có', N'Có', N'JBL', N'DVD/CD/MP3', N'17 loa', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', NULL)
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [TypeHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag], [Safe]) VALUES (N'70ad1374-92b0-46d6-8ddf-5691006ff26e', N'Hilux 2.4E 4x2 AT', CAST(673000000 AS Decimal(18, 0)), N'3 năm', N'190c9c49-d6c7-4461-af7e-495e68efbd33', N'f42b5112-1cb6-454d-b402-0dc6988660e6', N'47b5d089-7ce5-44c2-83c4-ffaf04ee2fcc', 0, 1, N'4620mm x 1775mm x 1460mm', N'2550mmm', N'1070 kg', N'2665 kg', N'2GR-FE,3.5L, 6 xy lanh chữ V, 24 Van, DOHC kèm VVTi kép', N'4000 vòng/phút', N'6000 vòng/phút', N'200 Km/h', N'55 lít', N'Xăng', N'10.5 lít / 100km', N'-', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Thường', 8, N'Có', N'Có', N'Thường', N'DVD', N'5 loa', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', NULL)
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [TypeHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag], [Safe]) VALUES (N'dd18c654-2495-40aa-9997-7ca9dc1cbfe8', N'Audi Q3', CAST(1800000000 AS Decimal(18, 0)), N'3 năm', N'59afffa0-36e3-44c0-b87f-a04ef5301505', N'a28c5377-954e-4d65-944a-6f2bbc905692', N'e0ee425f-7fab-434c-95e0-c218ac132f0f', 0, 1, N'4388mmx2019mmx1068mm', N'2603mm', N'1200kg', N'1640kg', N'Động cơ 4 xi lanh thẳng hàng với hệ thống phun nhiên liệu trực tiếp và turbo tăng áp', N'1500-4400 vòng/phút', N'6200 vòng/phút', N'64 lít', N'64 lít', N'Dầu diesel', N'5.8 lít / 100km', N'Euro 4', N'S tronic cấp 7', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Mạ crôm', N'Có', N'Có', N'-', N'Thường', 4, N'Có', N'Có', N'DVD', N'Có', N'4 loa', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', NULL)
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [TypeHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag], [Safe]) VALUES (N'1a3af566-4f38-4e01-aa8e-839c4b38476a', N'Fortuner 2.7V 4x4', CAST(1308000000 AS Decimal(18, 0)), N'3 năm', N'190c9c49-d6c7-4461-af7e-495e68efbd33', N'a28c5377-954e-4d65-944a-6f2bbc905692', N'e0ee425f-7fab-434c-95e0-c218ac132f0f', 1, 1, N'4795mm x 1855mm x 1835mm', N'2745mm', N'2030 kg', N'2620 kg', N'2TR-FE, 4 xy lanh, thẳng hàng, Dual VVT-i', N'4000 vòng/phút', N'5200 vòng/phút', N'190 Km/h', N'85 lít', N'Xăng', N'11.1 lít / 100km', N'Euro 4', N'Tự động 6 cấp', N'Tang trống', N'Tang trống', N'Có', N'Có', N'Có', N'Gián đoạn, điều chỉnh thời gian', N'Dạng vây cá mập', N'Mạ crôm', N'Có', N'2 chế độ ngày/đêm', N'-', N'Da', 7, N'Có', N'Có', N'Loại thường', N'DVD - Có màn hình cảm ứng 7 inchs', N'6 loa', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', NULL)
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [TypeHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag], [Safe]) VALUES (N'5cd2e489-7f8d-4979-a09a-cce61d0a90d2', N'Corolla Altis 2.0V Sport', CAST(905000000 AS Decimal(18, 0)), N'3 năm', N'190c9c49-d6c7-4461-af7e-495e68efbd33', N'b86c09a0-df65-4ece-9817-f8f036e96f07', N'237b6630-248c-4650-b905-27ace141cad3', 1, 1, N'4620mm x 1775mm x 1460mm', N'2700mm', N'1290 kg', N'1685 kg', N'4 xy lanh thẳng hàng, 16 van DOHC, VVT-i kép, ACIS', N'3600 vòng/phút', N'6200 vòng/phút', N'200 Km/h', N'55 lít', N'Xăng', N'6.8 lít / 100km', N'Euro 4', N'Số tự động vô cấp', N'-', N'-', N'Có', N'Có', N'Có', N'Gạt mưa tự động (Phía trước)', N'In trên kính hậu', N'-', N'Có', N'Chống chói tự động, tích hợp màn hình camera lùi', N'-', N'Thể thao', 5, N'Có', N'Có', N'loại thường', N'DVD 1 đĩa, màn hình cảm ứng 7 inch', N'6 loa', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', NULL)
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [TypeHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag], [Safe]) VALUES (N'554310cc-6c2c-436f-af0c-d1e6d02546b7', N'Yaris E CVT', CAST(592000000 AS Decimal(18, 0)), N'3 năm', N'190c9c49-d6c7-4461-af7e-495e68efbd33', N'edb837e1-5671-41f6-b522-27bb7b6316a7', N'237b6630-248c-4650-b905-27ace141cad3', 1, 1, N'4115 mm x 1700 mm x 1475 mm', N'2550mmm', N'1070 kg', N'1500 kg', N'2 NR-FE, 4 kỳ, 4 xy lanh thẳng hàng, 16 van DOHC, VTT-i kép', N'4200 vòng/phút', N'6000 vòng/phút', N'200 Km/h', N'42lít', N'Xăng', N'5.7 lít / 100km', N'Euro 4', N'Hộp số vô cấp với 7 cấp ảo', N'Đĩa thông gió', N'Đĩa đặc', N'Có', N'Có', N'Có', N'Gián đoạn, điều chỉnh thời gian', N'Dạng cột', N'Cùng màu thân xe', N'Có', N'Có', N'-', N'Thường', 5, N'Có', N'Có', N'Loại thường', N'CD 1 đĩa', N'4 loa', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', NULL)
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [TypeHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag], [Safe]) VALUES (N'267e5a92-6519-4adb-b6b0-e190dc2dda1b', N' Innova Venturer', CAST(855000000 AS Decimal(18, 0)), N'3 năm', N'190c9c49-d6c7-4461-af7e-495e68efbd33', N'22007987-2e3b-4a37-bc04-f85eafad7da2', N'237b6630-248c-4650-b905-27ace141cad3', 1, 1, N'4735mm x 1830mm x 1795mm', N'2750 mm', N'1735 kg', N'2360 kg', N'Động cơ xăng, VVT-i kép, 4 xy lanh thẳng hàng, 16 van DOHC', N'4000 vòng/phút', N'5600 vòng/phút', N'180 Km/h', N'55 lít', N'Xăng', N'-', N'Euro 4', N'Tự động 6 cấp', N'Đĩa thông gió', N'Đĩa', N'Có', N'Có', N'Có', N'Gián đoạn, điều chỉnh thời gian', N'Dạng vây cá', N'Cùng màu thân xe', N'Có', N'2 chế độ ngày/đêm', N'-', N'Nỉ cao cấp', 8, N'Có', N'Có', N'Loại thường', N'DVD 1 đĩa, màn hình cảm ứng 7 inch', N'6 loa', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', NULL)
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [TypeHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag], [Safe]) VALUES (N'90b2197c-2970-41b1-8b01-f54f6f7892d5', N'Audi A4', CAST(677000000 AS Decimal(18, 0)), N'3 năm', N'59afffa0-36e3-44c0-b87f-a04ef5301505', N'b3bda3fe-4e2a-4be7-a4b2-cdab79cd8f95', N'47b5d089-7ce5-44c2-83c4-ffaf04ee2fcc', 0, 1, N'4620mm x 1775mm x 1460mm', N'2550mmm', N'1070 kg', N'2665 kg', N'2GR-FE,3.5L, 6 xy lanh chữ V, 24 Van, DOHC kèm VVTi kép', N'4000 vòng/phút', N'6000 vòng/phút', N'200 Km/h', N'55 lít', N'Xăng', N'10.5 lít / 100km', N'Euro 4', N'Tự động 6 cấp', N'Đĩa thông gió', N'Đĩa đặc', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Thường', 6, N'Có', N'Có', N'Thường', N'Có', N'5 loa', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', N'Có', NULL)
INSERT [dbo].[FiveElement] ([CarID], [Color], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'21efab49-6eb4-4198-a685-23252b44d4ab', N'Nâu', N'c1.png', N'', 0, 0, 0, 1, 0)
INSERT [dbo].[FiveElement] ([CarID], [Color], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'9aa319f7-4c52-4787-85b0-24751579eb76', N'Đen', N'a13.png', N'camry 2.5 Qbaner.png', 1, 0, 0, 0, 0)
INSERT [dbo].[FiveElement] ([CarID], [Color], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'b8db07dd-a77b-4933-ae44-259651a06bf5', N'Xanh dương', N'a4.png', N'', 0, 1, 0, 0, 0)
INSERT [dbo].[FiveElement] ([CarID], [Color], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'aa5a073c-250f-4549-ac47-35a59d11c522', N'Trắng', N'alphard.png', N'alphard.png', 1, 0, 0, 0, 0)
INSERT [dbo].[FiveElement] ([CarID], [Color], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'70ad1374-92b0-46d6-8ddf-5691006ff26e', N'Bạc', N'a12.png', N'', 0, 0, 0, 1, 0)
INSERT [dbo].[FiveElement] ([CarID], [Color], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'dd18c654-2495-40aa-9997-7ca9dc1cbfe8', N'Trắng', N'alphard.png', N'', 1, 0, 0, 0, 0)
INSERT [dbo].[FiveElement] ([CarID], [Color], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'1a3af566-4f38-4e01-aa8e-839c4b38476a', N'Nâu', N'fortuner.png', N'fortuner-banner.png', 0, 0, 0, 0, 1)
INSERT [dbo].[FiveElement] ([CarID], [Color], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'5cd2e489-7f8d-4979-a09a-cce61d0a90d2', N'Nâu', N'corolla 2.0 V Sport.png', N'corolla 2.0 V sport - banner.jpg', 0, 0, 0, 0, 1)
INSERT [dbo].[FiveElement] ([CarID], [Color], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'554310cc-6c2c-436f-af0c-d1e6d02546b7', N'Đỏ', N'Yaris E CVT.png', N'Yaris E CVT baner.jpg', 0, 0, 1, 0, 0)
INSERT [dbo].[FiveElement] ([CarID], [Color], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'267e5a92-6519-4adb-b6b0-e190dc2dda1b', N'Đỏ tươi', N'innova ventuner.png', N'innova ventuner baner.jpg', 0, 0, 1, 0, 0)
INSERT [dbo].[FiveElement] ([CarID], [Color], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'90b2197c-2970-41b1-8b01-f54f6f7892d5', N'Xanh dương', N'a4.png', N'', 0, 1, 0, 0, 0)
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'c622ea0a-cbe8-427c-b7ca-0324aee7d72f', N'Suzuki')
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'7398a197-cef5-4322-a81c-21ceb9262739', N'Mazda')
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'c1b8b3b0-cf72-439a-9cbb-45521d4d8398', N'Ford')
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'190c9c49-d6c7-4461-af7e-495e68efbd33', N'Toyota')
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'08766dcf-a211-45f7-80fc-649dd449cbf1', N'Mitsubishi')
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'd46e3f8b-5eff-4b5f-9639-69e13ee010a5', N'Honda')
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'b94ddc20-1c25-494c-a965-77ed2ae7a4dd', N'Hyundai')
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'3a3b9018-a384-4727-99b4-817001e710dc', N'Mercedes-Ben')
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'59afffa0-36e3-44c0-b87f-a04ef5301505', N'Audi')
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'8612d80d-405c-4c5c-b888-c588aaa7e293', N'Nissan')
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'0af6fb02-0446-4e84-9798-dbae6b3a7304', N'Lexus')
INSERT [dbo].[StyleCar] ([StyleCarID], [StyleCar]) VALUES (N'f42b5112-1cb6-454d-b402-0dc6988660e6', N'Hillux
')
INSERT [dbo].[StyleCar] ([StyleCarID], [StyleCar]) VALUES (N'edb837e1-5671-41f6-b522-27bb7b6316a7', N'Yaris')
INSERT [dbo].[StyleCar] ([StyleCarID], [StyleCar]) VALUES (N'd504bd0d-dd9c-4f16-9bde-291623039a97', N'Vios
')
INSERT [dbo].[StyleCar] ([StyleCarID], [StyleCar]) VALUES (N'708379f6-2186-4043-8976-36045ca930d5', N'Fotuner
')
INSERT [dbo].[StyleCar] ([StyleCarID], [StyleCar]) VALUES (N'a28c5377-954e-4d65-944a-6f2bbc905692', N'Alphard')
INSERT [dbo].[StyleCar] ([StyleCarID], [StyleCar]) VALUES (N'be6f090c-ddc6-4778-9719-ace1f79bae1a', N'Land Cruiser
')
INSERT [dbo].[StyleCar] ([StyleCarID], [StyleCar]) VALUES (N'b3bda3fe-4e2a-4be7-a4b2-cdab79cd8f95', N'Audi
')
INSERT [dbo].[StyleCar] ([StyleCarID], [StyleCar]) VALUES (N'd5251137-01b6-4a7c-80e8-d971501d4ed5', N'Camry')
INSERT [dbo].[StyleCar] ([StyleCarID], [StyleCar]) VALUES (N'22007987-2e3b-4a37-bc04-f85eafad7da2', N'Innova')
INSERT [dbo].[StyleCar] ([StyleCarID], [StyleCar]) VALUES (N'b86c09a0-df65-4ece-9817-f8f036e96f07', N'Altis')
INSERT [dbo].[TypeCar] ([TypeCarID], [TypeCar]) VALUES (N'237b6630-248c-4650-b905-27ace141cad3', N'Hatchback')
INSERT [dbo].[TypeCar] ([TypeCarID], [TypeCar]) VALUES (N'e0ee425f-7fab-434c-95e0-c218ac132f0f', N'SUV')
INSERT [dbo].[TypeCar] ([TypeCarID], [TypeCar]) VALUES (N'2d5a9957-60c8-4c3c-8f2d-e43e42459d98', N'Sedan')
INSERT [dbo].[TypeCar] ([TypeCarID], [TypeCar]) VALUES (N'47b5d089-7ce5-44c2-83c4-ffaf04ee2fcc', N'Pickup')
INSERT [dbo].[User] ([UserName], [Password], [Type], [FullName], [Email], [PhoneNumber], [Address]) VALUES (N'CongHuong', N'huong123', N'0', N'Nguyễn Công Hường', N'Revenge.Victor@gmail.com', N'01264423424', N'K57/15 Dũng Sĩ Thanh Khê')
INSERT [dbo].[User] ([UserName], [Password], [Type], [FullName], [Email], [PhoneNumber], [Address]) VALUES (N'Hung', N'huong123', N'1', N'Phan Bá Huy', N'huy@gmail.com', N'01225546584', NULL)
INSERT [dbo].[User] ([UserName], [Password], [Type], [FullName], [Email], [PhoneNumber], [Address]) VALUES (N'King', N'huong123', N'1', N'Nguyễn Văn Huy', N'huy_dn94@gmail.com', N'01264458756', NULL)
INSERT [dbo].[User] ([UserName], [Password], [Type], [FullName], [Email], [PhoneNumber], [Address]) VALUES (N'MyLove', N'huong123', N'1', N'Nguyễn Hương', N'huongNguyen@gmail.com', N'01264425458', N'K59/20 Dũng Sĩ Thanh Khê')
ALTER TABLE [dbo].[Car] ADD  CONSTRAINT [DF_Car_CarID]  DEFAULT (newid()) FOR [CarID]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_OrderID]  DEFAULT (newid()) FOR [OrderID]
GO
ALTER TABLE [dbo].[Producer] ADD  CONSTRAINT [DF_Producer_ProducerID]  DEFAULT (newid()) FOR [ProducerID]
GO
ALTER TABLE [dbo].[StyleCar] ADD  CONSTRAINT [DF_StyleCar_StyleCarID]  DEFAULT (newid()) FOR [StyleCarID]
GO
ALTER TABLE [dbo].[TypeCar] ADD  CONSTRAINT [DF_TypeCar_TypeCarID]  DEFAULT (newid()) FOR [TypeCarID]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_Producer] FOREIGN KEY([ProducerID])
REFERENCES [dbo].[Producer] ([ProducerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_Producer]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_StyleCar] FOREIGN KEY([StyleCarID])
REFERENCES [dbo].[StyleCar] ([StyleCarID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_StyleCar]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_TypeCar] FOREIGN KEY([TypeCarID])
REFERENCES [dbo].[TypeCar] ([TypeCarID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_TypeCar]
GO
ALTER TABLE [dbo].[FiveElement]  WITH CHECK ADD  CONSTRAINT [FK_FiveElements_Car] FOREIGN KEY([CarID])
REFERENCES [dbo].[Car] ([CarID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FiveElement] CHECK CONSTRAINT [FK_FiveElements_Car]
GO
ALTER TABLE [dbo].[FollowCar]  WITH CHECK ADD  CONSTRAINT [FK_FollowCar_Car] FOREIGN KEY([CarID])
REFERENCES [dbo].[Car] ([CarID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FollowCar] CHECK CONSTRAINT [FK_FollowCar_Car]
GO
ALTER TABLE [dbo].[FollowCar]  WITH CHECK ADD  CONSTRAINT [FK_FollowCar_User] FOREIGN KEY([UserName])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[FollowCar] CHECK CONSTRAINT [FK_FollowCar_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Car] FOREIGN KEY([CarID])
REFERENCES [dbo].[Car] ([CarID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Car]
GO
USE [master]
GO
ALTER DATABASE [CarBrokerageSystem] SET  READ_WRITE 
GO
