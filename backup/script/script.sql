/*    ==Параметры сценариев==

    Версия исходного сервера : SQL Server 2017 (14.0.1000)
    Выпуск исходного ядра СУБД : Выпуск Microsoft SQL Server Express Edition
    Тип исходного ядра СУБД : Изолированный SQL Server

    Версия целевого сервера : SQL Server 2017
    Выпуск целевого ядра СУБД : Выпуск Microsoft SQL Server Standard Edition
    Тип целевого ядра СУБД : Изолированный SQL Server
*/
USE [master]
GO
/****** Object:  Database [touristCompany]    Script Date: 11.12.2018 17:19:54 ******/
CREATE DATABASE [touristCompany]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'touristCompany', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\touristCompany.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'touristCompany_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\touristCompany_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [touristCompany] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [touristCompany].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [touristCompany] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [touristCompany] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [touristCompany] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [touristCompany] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [touristCompany] SET ARITHABORT OFF 
GO
ALTER DATABASE [touristCompany] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [touristCompany] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [touristCompany] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [touristCompany] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [touristCompany] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [touristCompany] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [touristCompany] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [touristCompany] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [touristCompany] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [touristCompany] SET  ENABLE_BROKER 
GO
ALTER DATABASE [touristCompany] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [touristCompany] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [touristCompany] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [touristCompany] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [touristCompany] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [touristCompany] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [touristCompany] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [touristCompany] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [touristCompany] SET  MULTI_USER 
GO
ALTER DATABASE [touristCompany] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [touristCompany] SET DB_CHAINING OFF 
GO
ALTER DATABASE [touristCompany] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [touristCompany] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [touristCompany] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [touristCompany] SET QUERY_STORE = OFF
GO
USE [touristCompany]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [touristCompany]
GO
/****** Object:  Table [dbo].[tClients]    Script Date: 11.12.2018 17:19:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tClients](
	[ID_Client] [int] IDENTITY(1,1) NOT NULL,
	[sName] [nvarchar](40) NOT NULL,
	[sSurname] [nvarchar](40) NOT NULL,
	[sPatronymic] [nvarchar](40) NULL,
	[Photo] [nvarchar](50) NULL,
	[Bithday] [date] NULL,
	[sDoc] [nvarchar](40) NULL,
	[Series] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[sDocIssue] [nvarchar](325) NULL,
	[DateIssue] [date] NULL,
	[AbroadDoc] [bit] NULL,
 CONSTRAINT [PK__tClients__B5AE4EC8565BF2D3] PRIMARY KEY CLUSTERED 
(
	[ID_Client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__tClients__78A1A19D6D2EE96E] UNIQUE NONCLUSTERED 
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tGroups]    Script Date: 11.12.2018 17:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tGroups](
	[ID_Group] [int] IDENTITY(1,1) NOT NULL,
	[sName] [nvarchar](30) NOT NULL,
	[sCount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tGroupsClients]    Script Date: 11.12.2018 17:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tGroupsClients](
	[ID_GroupsClients] [int] IDENTITY(1,1) NOT NULL,
	[ID_Group] [int] NULL,
	[ID_Client] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_GroupsClients] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tGroupsRoutes]    Script Date: 11.12.2018 17:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tGroupsRoutes](
	[ID_GroupsRoutes] [int] IDENTITY(1,1) NOT NULL,
	[ID_Group] [int] NULL,
	[ID_Route] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_GroupsRoutes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPuncts]    Script Date: 11.12.2018 17:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPuncts](
	[ID_Punct] [int] IDENTITY(1,1) NOT NULL,
	[sCountry] [nvarchar](30) NOT NULL,
	[sPunct] [nvarchar](40) NOT NULL,
	[sHotel] [nvarchar](40) NOT NULL,
	[dateStart] [date] NULL,
	[dateEnd] [date] NULL,
	[class] [int] NULL,
	[sExcurse] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Punct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tRoutes]    Script Date: 11.12.2018 17:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tRoutes](
	[ID_Route] [int] IDENTITY(1,1) NOT NULL,
	[sNameOfRoute] [nvarchar](30) NOT NULL,
	[sCountry] [nvarchar](30) NOT NULL,
	[sDays] [int] NULL,
	[ID_Worker] [int] NULL,
	[Price] [int] NULL,
	[Sale] [int] NULL,
	[sReturn] [int] NULL,
	[DayStart] [date] NULL,
 CONSTRAINT [PK__tRoutes__338A6C3438CADF08] PRIMARY KEY CLUSTERED 
(
	[ID_Route] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__tRoutes__79DF59597BD34D0A] UNIQUE NONCLUSTERED 
(
	[sNameOfRoute] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tRoutesPuncts]    Script Date: 11.12.2018 17:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tRoutesPuncts](
	[ID_RoutesPuncts] [int] IDENTITY(1,1) NOT NULL,
	[ID_Route] [int] NOT NULL,
	[ID_Punct] [int] NOT NULL,
 CONSTRAINT [PK__tRoutesP__4C9835B1F4418429] PRIMARY KEY CLUSTERED 
(
	[ID_RoutesPuncts] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tUser]    Script Date: 11.12.2018 17:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tUser](
	[ID_User] [int] IDENTITY(1,1) NOT NULL,
	[sLog] [nvarchar](50) NOT NULL,
	[sPassword] [nvarchar](50) NOT NULL,
	[sRole] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tWorkers]    Script Date: 11.12.2018 17:19:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tWorkers](
	[ID_Worker] [int] IDENTITY(1,1) NOT NULL,
	[sName] [nvarchar](40) NOT NULL,
	[sSurname] [nvarchar](40) NOT NULL,
	[sPatronymic] [nvarchar](40) NULL,
	[Photo] [nvarchar](50) NULL,
	[Bithday] [date] NULL,
	[AbroadDoc] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Worker] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tGroupsClients]  WITH CHECK ADD  CONSTRAINT [FK__tGroupsCl__ID_Cl__46B27FE2] FOREIGN KEY([ID_Client])
REFERENCES [dbo].[tClients] ([ID_Client])
GO
ALTER TABLE [dbo].[tGroupsClients] CHECK CONSTRAINT [FK__tGroupsCl__ID_Cl__46B27FE2]
GO
ALTER TABLE [dbo].[tGroupsClients]  WITH CHECK ADD FOREIGN KEY([ID_Group])
REFERENCES [dbo].[tGroups] ([ID_Group])
GO
ALTER TABLE [dbo].[tGroupsRoutes]  WITH CHECK ADD FOREIGN KEY([ID_Group])
REFERENCES [dbo].[tGroups] ([ID_Group])
GO
ALTER TABLE [dbo].[tGroupsRoutes]  WITH CHECK ADD FOREIGN KEY([ID_Route])
REFERENCES [dbo].[tRoutes] ([ID_Route])
GO
ALTER TABLE [dbo].[tRoutes]  WITH CHECK ADD  CONSTRAINT [FK__tRoutes__ID_Work__5DCAEF64] FOREIGN KEY([ID_Worker])
REFERENCES [dbo].[tWorkers] ([ID_Worker])
GO
ALTER TABLE [dbo].[tRoutes] CHECK CONSTRAINT [FK__tRoutes__ID_Work__5DCAEF64]
GO
ALTER TABLE [dbo].[tRoutesPuncts]  WITH CHECK ADD  CONSTRAINT [FK__tRoutesPu__ID_Pu__3F115E1A] FOREIGN KEY([ID_Punct])
REFERENCES [dbo].[tPuncts] ([ID_Punct])
GO
ALTER TABLE [dbo].[tRoutesPuncts] CHECK CONSTRAINT [FK__tRoutesPu__ID_Pu__3F115E1A]
GO
ALTER TABLE [dbo].[tRoutesPuncts]  WITH CHECK ADD  CONSTRAINT [FK__tRoutesPu__ID_Ro__3E1D39E1] FOREIGN KEY([ID_Route])
REFERENCES [dbo].[tRoutes] ([ID_Route])
GO
ALTER TABLE [dbo].[tRoutesPuncts] CHECK CONSTRAINT [FK__tRoutesPu__ID_Ro__3E1D39E1]
GO
USE [master]
GO
ALTER DATABASE [touristCompany] SET  READ_WRITE 
GO
