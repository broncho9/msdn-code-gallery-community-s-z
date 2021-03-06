USE [master]
GO
/****** Object:  Database [SalesSystem]    Script Date: 02/10/2014 12:05:29 ******/
CREATE DATABASE [SalesSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SalesSystem', FILENAME = N'D:\Biz\sqlServerData\MSSQL11.MSSQLSERVER\MSSQL\DATA\SalesSystem.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SalesSystem_log', FILENAME = N'D:\Biz\sqlServerData\MSSQL11.MSSQLSERVER\MSSQL\DATA\SalesSystem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SalesSystem] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SalesSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SalesSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SalesSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SalesSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SalesSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SalesSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [SalesSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SalesSystem] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SalesSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SalesSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SalesSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SalesSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SalesSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SalesSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SalesSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SalesSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SalesSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SalesSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SalesSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SalesSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SalesSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SalesSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SalesSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SalesSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SalesSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [SalesSystem] SET  MULTI_USER 
GO
ALTER DATABASE [SalesSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SalesSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SalesSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SalesSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SalesSystem', N'ON'
GO
USE [SalesSystem]
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](50) NULL,
	[Address1] [varchar](80) NULL,
	[Address2] [varchar](80) NULL,
	[Address3] [varchar](80) NULL,
	[TownCity] [varchar](50) NULL,
	[PostCode] [varchar](8) NULL,
	[CreditLimit] [money] NULL,
	[Outstanding] [money] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderLines]    Script Date: 29/10/2014 12:16:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLines](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[OrderLineNo] [smallint] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_OrderLines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 29/10/2014 12:16:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryDate] [datetime] NULL,
	[CustomerId] [int] NULL,
	[TotalPrice] [money] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 29/10/2014 12:16:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductShortName] [varchar](16) NULL,
	[Weight] [decimal](6, 2) NULL,
	[BarCode] [varchar](12) NULL,
	[PricePer] [money] NULL,
 CONSTRAINT [PK_Products_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [CustomerName], [Address1], [Address2], [Address3], [TownCity], [PostCode], [CreditLimit], [Outstanding]) VALUES (2, N'Petes Place', N'3 High Street', N'Upper wossname', N'', N'Bolton', N'BL19 6NY', 50000.0000, 40000.0000)
INSERT [dbo].[Customers] ([Id], [CustomerName], [Address1], [Address2], [Address3], [TownCity], [PostCode], [CreditLimit], [Outstanding]) VALUES (3, N'Big Al''s', N'47 Outer Rd', N'Wombley', NULL, N'London', N'EC1 2PO', 30000.0000, 37000.0000)
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[OrderLines] ON 

INSERT [dbo].[OrderLines] ([Id], [OrderId], [OrderLineNo], [ProductId], [Quantity], [Price]) VALUES (1, 1, 1, 1, 6, NULL)
INSERT [dbo].[OrderLines] ([Id], [OrderId], [OrderLineNo], [ProductId], [Quantity], [Price]) VALUES (2, 1, 2, 2, 9, NULL)
INSERT [dbo].[OrderLines] ([Id], [OrderId], [OrderLineNo], [ProductId], [Quantity], [Price]) VALUES (3, 1, 3, 3, 22, NULL)
INSERT [dbo].[OrderLines] ([Id], [OrderId], [OrderLineNo], [ProductId], [Quantity], [Price]) VALUES (4, 2, 1, 4, 3, NULL)
INSERT [dbo].[OrderLines] ([Id], [OrderId], [OrderLineNo], [ProductId], [Quantity], [Price]) VALUES (5, 2, 2, 5, 8, NULL)
INSERT [dbo].[OrderLines] ([Id], [OrderId], [OrderLineNo], [ProductId], [Quantity], [Price]) VALUES (6, 3, 1, 6, 2, NULL)
INSERT [dbo].[OrderLines] ([Id], [OrderId], [OrderLineNo], [ProductId], [Quantity], [Price]) VALUES (7, 4, 1, 2, 34, NULL)
INSERT [dbo].[OrderLines] ([Id], [OrderId], [OrderLineNo], [ProductId], [Quantity], [Price]) VALUES (8, 5, 1, 6, 8, NULL)
INSERT [dbo].[OrderLines] ([Id], [OrderId], [OrderLineNo], [ProductId], [Quantity], [Price]) VALUES (9, 6, 1, 3, 56, NULL)
SET IDENTITY_INSERT [dbo].[OrderLines] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [DeliveryDate], [CustomerId], [TotalPrice]) VALUES (1, CAST(0x0000A39700000000 AS DateTime), 2, NULL)
INSERT [dbo].[Orders] ([Id], [DeliveryDate], [CustomerId], [TotalPrice]) VALUES (2, CAST(0x0000A39800000000 AS DateTime), 2, NULL)
INSERT [dbo].[Orders] ([Id], [DeliveryDate], [CustomerId], [TotalPrice]) VALUES (3, CAST(0x0000A39900000000 AS DateTime), 2, NULL)
INSERT [dbo].[Orders] ([Id], [DeliveryDate], [CustomerId], [TotalPrice]) VALUES (4, CAST(0x0000A39900000000 AS DateTime), 2, NULL)
INSERT [dbo].[Orders] ([Id], [DeliveryDate], [CustomerId], [TotalPrice]) VALUES (5, CAST(0x0000A39A00000000 AS DateTime), 2, NULL)
INSERT [dbo].[Orders] ([Id], [DeliveryDate], [CustomerId], [TotalPrice]) VALUES (6, CAST(0x0000A39600000000 AS DateTime), 3, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [ProductShortName], [Weight], [BarCode], [PricePer]) VALUES (1, N'Apples', CAST(0.05 AS Decimal(6, 2)), N'8721358763', 0.2400)
INSERT [dbo].[Products] ([Id], [ProductShortName], [Weight], [BarCode], [PricePer]) VALUES (2, N'Pears', CAST(0.05 AS Decimal(6, 2)), N'0987145879', 0.8900)
INSERT [dbo].[Products] ([Id], [ProductShortName], [Weight], [BarCode], [PricePer]) VALUES (3, N'Oranges', CAST(0.05 AS Decimal(6, 2)), N'1243545451', 0.4500)
INSERT [dbo].[Products] ([Id], [ProductShortName], [Weight], [BarCode], [PricePer]) VALUES (4, N'Potatoes', CAST(2.25 AS Decimal(6, 2)), N'9898726456', 1.9800)
INSERT [dbo].[Products] ([Id], [ProductShortName], [Weight], [BarCode], [PricePer]) VALUES (5, N'Rice', CAST(0.50 AS Decimal(6, 2)), N'8976342876', 1.7900)
INSERT [dbo].[Products] ([Id], [ProductShortName], [Weight], [BarCode], [PricePer]) VALUES (6, N'Rice Sack', CAST(25.00 AS Decimal(6, 2)), N'2487634876', 19.9900)
INSERT [dbo].[Products] ([Id], [ProductShortName], [Weight], [BarCode], [PricePer]) VALUES (7, N'Peanuts', CAST(0.02 AS Decimal(6, 2)), N'0987098090', 2.8700)
SET IDENTITY_INSERT [dbo].[Products] OFF
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_Orders]
GO
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
