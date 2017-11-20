USE [master]
GO
/****** Object:  Database [CarBrokerageSystem]    Script Date: 20/11/2017 04:29:22 PM ******/
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
/****** Object:  Table [dbo].[Car]    Script Date: 20/11/2017 04:29:22 PM ******/
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
	[StyleHighlight] [bit] NULL,
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
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FiveElement]    Script Date: 20/11/2017 04:29:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FiveElement](
	[CarID] [uniqueidentifier] NOT NULL,
	[CarColor] [nvarchar](50) NOT NULL,
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
	[CarColor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 20/11/2017 04:29:23 PM ******/
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
/****** Object:  Table [dbo].[Producer]    Script Date: 20/11/2017 04:29:23 PM ******/
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
/****** Object:  Table [dbo].[StyleCar]    Script Date: 20/11/2017 04:29:23 PM ******/
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
/****** Object:  Table [dbo].[TypeCar]    Script Date: 20/11/2017 04:29:23 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 20/11/2017 04:29:23 PM ******/
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
	[FullName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Address] [nvarchar](250) NULL,
	[PasswordEmail] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [StyleHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag]) VALUES (N'4ef11f8e-660b-4c3d-8dc3-0f40fd5905f8', N'Suzuki Swift 2017 ', CAST(1000000000 AS Decimal(18, 0)), N'1', N'04d8c5c3-ee42-4a72-aa43-004926a552a3', N'0d4a4b55-621a-49ae-b8a8-047e437a29cb', N'a1fdfdc0-efc4-419b-afc1-7e070f419dd7', 1, 0, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', 8, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0')
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [StyleHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag]) VALUES (N'8594f90d-8773-460d-9ae9-1f5bb844b32a', N'1', CAST(1 AS Decimal(18, 0)), N'1', N'04d8c5c3-ee42-4a72-aa43-004926a552a3', N'0d4a4b55-621a-49ae-b8a8-047e437a29cb', N'a1fdfdc0-efc4-419b-afc1-7e070f419dd7', NULL, NULL, N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'11', N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1', 1, N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1')
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [StyleHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag]) VALUES (N'056fa98e-db84-472a-860e-33dc65cefa42', N'Mitsubishi Outlander Sport 2017 CVT ', CAST(1000000000 AS Decimal(18, 0)), N'1', N'04d8c5c3-ee42-4a72-aa43-004926a552a3', N'0d4a4b55-621a-49ae-b8a8-047e437a29cb', N'a1fdfdc0-efc4-419b-afc1-7e070f419dd7', 0, 1, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', 8, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0')
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [StyleHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag]) VALUES (N'2b8d0e29-41ed-4283-b44c-38978bf5f7c5', N'Car 1', CAST(1000000000 AS Decimal(18, 0)), N'1', N'04d8c5c3-ee42-4a72-aa43-004926a552a3', N'0d4a4b55-621a-49ae-b8a8-047e437a29cb', N'a1fdfdc0-efc4-419b-afc1-7e070f419dd7', 1, 0, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', 6, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0')
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [StyleHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag]) VALUES (N'926e104d-5715-42c7-9347-48c7d5d2e5c3', N'Car 1', CAST(1000000000 AS Decimal(18, 0)), N'1', N'04d8c5c3-ee42-4a72-aa43-004926a552a3', N'0d4a4b55-621a-49ae-b8a8-047e437a29cb', N'a1fdfdc0-efc4-419b-afc1-7e070f419dd7', 1, 0, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', 4, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0')
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [StyleHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag]) VALUES (N'13398553-c2d9-4e49-ab32-5101302f3986', N'Mitsubishi Triton 4x4 AT MIVEC', CAST(1000000000 AS Decimal(18, 0)), N'1', N'be1ce289-4be9-4a52-985c-ac1e85939b07', N'0d4a4b55-621a-49ae-b8a8-047e437a29cb', N'a1fdfdc0-efc4-419b-afc1-7e070f419dd7', 1, 0, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', 4, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0')
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [StyleHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag]) VALUES (N'5de88f5d-39bb-4d38-9674-584dcca6e25d', N'Mitsubishi Triton 4x4 AT MIVEC', CAST(1000000000 AS Decimal(18, 0)), N'1', N'04d8c5c3-ee42-4a72-aa43-004926a552a3', N'0d4a4b55-621a-49ae-b8a8-047e437a29cb', N'a1fdfdc0-efc4-419b-afc1-7e070f419dd7', 1, 1, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', 8, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0')
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [StyleHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag]) VALUES (N'373298b8-0878-4d93-8a46-68b1c5898ba6', N'Mitsubishi Triton 4x4 AT MIVEC', CAST(1000000000 AS Decimal(18, 0)), N'1', N'04d8c5c3-ee42-4a72-aa43-004926a552a3', N'0d4a4b55-621a-49ae-b8a8-047e437a29cb', N'a1fdfdc0-efc4-419b-afc1-7e070f419dd7', 0, 1, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', 9, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0')
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [StyleHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag]) VALUES (N'b22e87b7-03bc-4b01-8a1a-6e1197606266', N'Car 1', CAST(1000000000 AS Decimal(18, 0)), N'1', N'be1ce289-4be9-4a52-985c-ac1e85939b07', N'0d4a4b55-621a-49ae-b8a8-047e437a29cb', N'a1fdfdc0-efc4-419b-afc1-7e070f419dd7', 0, 0, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', 4, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0')
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [StyleHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag]) VALUES (N'36d4fcbc-2cb2-4023-81be-790f177f5d6a', N'Car 1', CAST(1000000000 AS Decimal(18, 0)), N'1', N'be1ce289-4be9-4a52-985c-ac1e85939b07', N'0d4a4b55-621a-49ae-b8a8-047e437a29cb', N'a1fdfdc0-efc4-419b-afc1-7e070f419dd7', 0, 0, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', 4, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0')
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [StyleHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag]) VALUES (N'985b7af8-a3a1-4a8b-862c-8c7b4ee3f2c6', N'Car 1', CAST(1000000000 AS Decimal(18, 0)), N'1', N'be1ce289-4be9-4a52-985c-ac1e85939b07', N'0d4a4b55-621a-49ae-b8a8-047e437a29cb', N'a1fdfdc0-efc4-419b-afc1-7e070f419dd7', 0, 0, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', 4, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0')
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [StyleHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag]) VALUES (N'f5e9ad96-0d8b-429a-97a3-b78608e44632', N'Car 1', CAST(1000000000 AS Decimal(18, 0)), N'1', N'04d8c5c3-ee42-4a72-aa43-004926a552a3', N'0d4a4b55-621a-49ae-b8a8-047e437a29cb', N'a1fdfdc0-efc4-419b-afc1-7e070f419dd7', 0, 1, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', 4, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0')
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [StyleHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag]) VALUES (N'3fb97caf-5e24-4a9c-9773-d2f62a83a9f3', N'Car 1', CAST(1000000000 AS Decimal(18, 0)), N'1', N'be1ce289-4be9-4a52-985c-ac1e85939b07', N'0d4a4b55-621a-49ae-b8a8-047e437a29cb', N'a1fdfdc0-efc4-419b-afc1-7e070f419dd7', 0, 1, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', 4, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0')
INSERT [dbo].[Car] ([CarID], [CarName], [Price], [Warranty], [ProducerID], [StyleCarID], [TypeCarID], [CarHighlight], [StyleHighlight], [Size], [Wheelbase], [Weight], [MaxWeight], [EngineType], [Torque], [EnginePower], [TopSpeed], [FuelTankCapacity], [Fuel], [FuelConsumption], [EmissionStandard], [Gear], [FrontBrake], [RearBrake], [FrontFoglamp], [RearFoglamp], [RearviewMirrorOutside], [WinscreenWiper], [Antenna], [DoorHandle], [AirConditioner], [RearviewMirrorInside], [Sunroof], [SeatType], [Seat], [Sunshade], [CupHolder], [SpeakerType], [Dics], [NumberSpeaker], [Usb], [Bluetooth], [ElectronicStabilityControl], [Brakelight], [ChildSafetyLock], [SeatBelt], [Airbag]) VALUES (N'3002d24f-d704-4a9d-b58c-e149e6ecef3d', N'Car 1', CAST(1000000000 AS Decimal(18, 0)), N'1', N'04d8c5c3-ee42-4a72-aa43-004926a552a3', N'0d4a4b55-621a-49ae-b8a8-047e437a29cb', N'a1fdfdc0-efc4-419b-afc1-7e070f419dd7', 0, 1, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', 4, N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0')
INSERT [dbo].[FiveElement] ([CarID], [CarColor], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'4ef11f8e-660b-4c3d-8dc3-0f40fd5905f8', N'Do', N'1249074095507.jpeg', NULL, 0, 0, 1, 0, 0)
INSERT [dbo].[FiveElement] ([CarID], [CarColor], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'8594f90d-8773-460d-9ae9-1f5bb844b32a', N'Xanh', N'1249074095507.jpeg', NULL, 0, 1, 0, 0, 0)
INSERT [dbo].[FiveElement] ([CarID], [CarColor], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'056fa98e-db84-472a-860e-33dc65cefa42', N'Do', N'1249074095507.jpeg', NULL, 0, 0, 1, 0, 0)
INSERT [dbo].[FiveElement] ([CarID], [CarColor], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'2b8d0e29-41ed-4283-b44c-38978bf5f7c5', N'Do', N'1249074095507.jpeg', NULL, 0, 0, 1, 0, 0)
INSERT [dbo].[FiveElement] ([CarID], [CarColor], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'926e104d-5715-42c7-9347-48c7d5d2e5c3', N'Do', N'1249074095507.jpeg', NULL, 0, 0, 1, 0, 0)
INSERT [dbo].[FiveElement] ([CarID], [CarColor], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'13398553-c2d9-4e49-ab32-5101302f3986', N'Do', N'1249074095507.jpeg', NULL, 0, 0, 1, 0, 0)
INSERT [dbo].[FiveElement] ([CarID], [CarColor], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'5de88f5d-39bb-4d38-9674-584dcca6e25d', N'Do', N'1249074095507.jpeg', NULL, 0, 0, 1, 0, 0)
INSERT [dbo].[FiveElement] ([CarID], [CarColor], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'373298b8-0878-4d93-8a46-68b1c5898ba6', N'Do', N'1249074095507.jpeg', NULL, 0, 0, 1, 0, 0)
INSERT [dbo].[FiveElement] ([CarID], [CarColor], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'b22e87b7-03bc-4b01-8a1a-6e1197606266', N'Do', N'1249074095507.jpeg', NULL, 0, 0, 1, 0, 0)
INSERT [dbo].[FiveElement] ([CarID], [CarColor], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'36d4fcbc-2cb2-4023-81be-790f177f5d6a', N'Tim', N'1249074095513.jpeg', NULL, 1, 0, 0, 0, 0)
INSERT [dbo].[FiveElement] ([CarID], [CarColor], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'985b7af8-a3a1-4a8b-862c-8c7b4ee3f2c6', N'Do', N'1249074095507.jpeg', NULL, 0, 0, 1, 0, 0)
INSERT [dbo].[FiveElement] ([CarID], [CarColor], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'f5e9ad96-0d8b-429a-97a3-b78608e44632', N'Do', N'1249074095507.jpeg', NULL, 0, 0, 1, 0, 0)
INSERT [dbo].[FiveElement] ([CarID], [CarColor], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'3fb97caf-5e24-4a9c-9773-d2f62a83a9f3', N'Do', N'1249074095507.jpeg', NULL, 0, 0, 1, 0, 0)
INSERT [dbo].[FiveElement] ([CarID], [CarColor], [CarImage], [CarBanner], [Metal], [Water], [Fire], [Earth], [Wood]) VALUES (N'3002d24f-d704-4a9d-b58c-e149e6ecef3d', N'do', N'1249074095507.jpeg', NULL, 0, 0, 1, 0, 0)
INSERT [dbo].[Order] ([OrderID], [Orderer], [Email], [PhoneNumber], [Address], [OrderDate], [CarID], [Seen], [Contacted], [UserName]) VALUES (N'81a34df7-1672-4fcd-a318-b34753cdc216', N'nguyen cong huong', N'1', N'1', N'1', CAST(0x863D0B00 AS Date), N'8594f90d-8773-460d-9ae9-1f5bb844b32a', 1, 1, N'b')
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'04d8c5c3-ee42-4a72-aa43-004926a552a3', N'Mitsubishi')
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'ff95a44e-c983-4e28-bb53-009873f25e63', N'Ford')
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'40d90a55-9e2b-41b9-a473-1952cd5d21f5', N'Suzuki')
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'7ff93339-a12e-48cb-ade1-1a5d42c2d031', N'Toyota')
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'76753cfc-f99c-46f4-bbb9-23cbc33da45b', N'Bmw')
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'67d3fb32-0509-4c60-8a6d-307239e39a21', N'Nissan')
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'1762f197-f276-46ab-84be-3b5fa5a0a546', N'Mercedes-Ben')
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'022543e5-f34e-4842-99c7-5792742d8df2', N'Kia')
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'3404b1cb-3726-4a97-bd3e-585de092d4f6', N'Audi')
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'3d857aba-2c52-4456-aaa0-66481b682ac8', N'Lexus')
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'81bcd302-597e-48df-ac02-67002cd464a5', N'Mazda')
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'be1ce289-4be9-4a52-985c-ac1e85939b07', N'Hyundai')
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'bac8b101-9683-4d5e-8266-b0e50a47ffb9', N'Honda')
INSERT [dbo].[Producer] ([ProducerID], [ProducerName]) VALUES (N'6efd42eb-21b0-44c9-ad35-e300a8bb5259', N'Chevrolet')
INSERT [dbo].[StyleCar] ([StyleCarID], [StyleCar]) VALUES (N'0d4a4b55-621a-49ae-b8a8-047e437a29cb', N'Suv')
INSERT [dbo].[StyleCar] ([StyleCarID], [StyleCar]) VALUES (N'd5c7347a-0a0d-4e8a-999f-8daaf74bac06', N'Hatchback')
INSERT [dbo].[StyleCar] ([StyleCarID], [StyleCar]) VALUES (N'b42e63a2-4476-4cc5-b296-928b24149759', N'Truck')
INSERT [dbo].[StyleCar] ([StyleCarID], [StyleCar]) VALUES (N'b7987216-ef1a-4d9d-a5df-9ae1c3b30d31', N'Sedan')
INSERT [dbo].[StyleCar] ([StyleCarID], [StyleCar]) VALUES (N'a4749ff9-3bff-4b43-b5be-9db3fa19e92a', N'Van')
INSERT [dbo].[TypeCar] ([TypeCarID], [TypeCar]) VALUES (N'36d4b0e1-0882-483d-8bcf-6c6084df5ec3', N'd')
INSERT [dbo].[TypeCar] ([TypeCarID], [TypeCar]) VALUES (N'a1fdfdc0-efc4-419b-afc1-7e070f419dd7', N'a')
INSERT [dbo].[TypeCar] ([TypeCarID], [TypeCar]) VALUES (N'b7b05709-e2eb-4f20-af50-cedfe91e3396', N'c')
INSERT [dbo].[TypeCar] ([TypeCarID], [TypeCar]) VALUES (N'8117bf21-7b15-41a3-b372-da7cde4bfa82', N'b')
INSERT [dbo].[User] ([UserName], [Password], [Type], [FullName], [Email], [PhoneNumber], [Address], [PasswordEmail]) VALUES (N'a', N'a', N'0', N'Nguyễn Công Hường', N'songkiemsanh3@gmail.com', N'01264423424', NULL, N'chamwrrfpzbjwvbv')
INSERT [dbo].[User] ([UserName], [Password], [Type], [FullName], [Email], [PhoneNumber], [Address], [PasswordEmail]) VALUES (N'b', N'b', N'1', N'Nguyễn abc', NULL, NULL, NULL, NULL)
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
