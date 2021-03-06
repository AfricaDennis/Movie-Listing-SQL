USE [master]
GO
/****** Object:  Database [Film-listing]    Script Date: 18/05/2022 11:48:46 ******/
CREATE DATABASE [Film-listing]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Film-listing', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Film-listing.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Film-listing_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Film-listing_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Film-listing] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Film-listing].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Film-listing] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Film-listing] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Film-listing] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Film-listing] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Film-listing] SET ARITHABORT OFF 
GO
ALTER DATABASE [Film-listing] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Film-listing] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Film-listing] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Film-listing] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Film-listing] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Film-listing] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Film-listing] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Film-listing] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Film-listing] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Film-listing] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Film-listing] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Film-listing] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Film-listing] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Film-listing] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Film-listing] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Film-listing] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Film-listing] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Film-listing] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Film-listing] SET  MULTI_USER 
GO
ALTER DATABASE [Film-listing] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Film-listing] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Film-listing] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Film-listing] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Film-listing] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Film-listing] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Film-listing] SET QUERY_STORE = OFF
GO
USE [Film-listing]
GO
/****** Object:  User [scuser]    Script Date: 18/05/2022 11:48:46 ******/
CREATE USER [scuser] FOR LOGIN [scuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [scuser]
GO
/****** Object:  Table [dbo].[Actor]    Script Date: 18/05/2022 11:48:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actor](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Image] [nvarchar](650) NOT NULL,
 CONSTRAINT [PK_Actor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 18/05/2022 11:48:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[ReleaseDate] [date] NOT NULL,
	[Duration] [bigint] NOT NULL,
	[Synopsis] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](600) NOT NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieActor]    Script Date: 18/05/2022 11:48:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieActor](
	[MovieID] [bigint] NOT NULL,
	[ActorID] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieProducer]    Script Date: 18/05/2022 11:48:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieProducer](
	[MovieID] [bigint] NOT NULL,
	[ProducerID] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 18/05/2022 11:48:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[FundationDate] [date] NOT NULL,
	[Image] [nvarchar](650) NOT NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Actor] ON 

INSERT [dbo].[Actor] ([ID], [Name], [BirthDate], [Image]) VALUES (1, N'Tom Holland', CAST(N'1996-05-30' AS Date), N'#')
INSERT [dbo].[Actor] ([ID], [Name], [BirthDate], [Image]) VALUES (2, N'Jude Law', CAST(N'1972-12-29' AS Date), N'#')
INSERT [dbo].[Actor] ([ID], [Name], [BirthDate], [Image]) VALUES (4, N'Tom Holland', CAST(N'1996-06-01' AS Date), N'#')
INSERT [dbo].[Actor] ([ID], [Name], [BirthDate], [Image]) VALUES (5, N'Rosalie Chiang', CAST(N'2005-10-01' AS Date), N'#')
INSERT [dbo].[Actor] ([ID], [Name], [BirthDate], [Image]) VALUES (6, N'Robert Pattinson', CAST(N'1986-05-13' AS Date), N'#')
INSERT [dbo].[Actor] ([ID], [Name], [BirthDate], [Image]) VALUES (9, N'Jason Momoa', CAST(N'1979-08-01' AS Date), N'')
INSERT [dbo].[Actor] ([ID], [Name], [BirthDate], [Image]) VALUES (10, N'Leonardo DiCaprio', CAST(N'1974-11-11' AS Date), N'')
INSERT [dbo].[Actor] ([ID], [Name], [BirthDate], [Image]) VALUES (11, N'Avan Jogia', CAST(N'1992-02-09' AS Date), N'')
SET IDENTITY_INSERT [dbo].[Actor] OFF
GO
SET IDENTITY_INSERT [dbo].[Movie] ON 

INSERT [dbo].[Movie] ([ID], [Name], [ReleaseDate], [Duration], [Synopsis], [Image]) VALUES (2, N'Phantastische Tierwesen: Dumbledores Geheimnisse', CAST(N'2022-04-06' AS Date), 142, N'Albus Dumbelore entrusts the magizoologist Newt Scamander with the task of stopping the dark magician Grindelwald.', N'#')
INSERT [dbo].[Movie] ([ID], [Name], [ReleaseDate], [Duration], [Synopsis], [Image]) VALUES (3, N'The Batman', CAST(N'2022-03-03' AS Date), 176, N'In his second year on the crime scene, billionaire masked avenger Batman explores corruption in Gotham and specifically how it may be connected to his own family.', N'#')
INSERT [dbo].[Movie] ([ID], [Name], [ReleaseDate], [Duration], [Synopsis], [Image]) VALUES (4, N'Uncharted ', CAST(N'2022-02-07' AS Date), 116, N'Brothers Sam and Nathan "Nate" Drake are caught by museum security trying to steal the first map made after the Magellan expedition. The orphanage that houses both boys kicks Sam out. Before he leaves, Sam promises his return to Nate, and leaves him a ring with the inscription "Sic Parvis Magna".', N'#')
INSERT [dbo].[Movie] ([ID], [Name], [ReleaseDate], [Duration], [Synopsis], [Image]) VALUES (8, N'Red 2 ', CAST(N'2022-02-21' AS Date), 100, N'In 2002, Meilin "Mei" Lee is a 13-year-old Chinese-Canadian girl living in Toronto. She helps take care of the family''s temple dedicated to their ancestor, Sun Yee, and works to make her strict, overprotective mother Ming proud.', N'#')
INSERT [dbo].[Movie] ([ID], [Name], [ReleaseDate], [Duration], [Synopsis], [Image]) VALUES (18, N'Acuaman', CAST(N'2018-12-20' AS Date), 143, N'In 1985 Maine, lighthouse keeper Thomas Curry rescues Atlanna, the queen of the underwater kingdom of Atlantis, during a storm. They fall in love and have a son named Arthur, who has the power to communicate with sea creatures. ', N'')
INSERT [dbo].[Movie] ([ID], [Name], [ReleaseDate], [Duration], [Synopsis], [Image]) VALUES (19, N'Don''t Look Up', CAST(N'2021-12-04' AS Date), 138, N'Kate Dibiasky, a Michigan State University astronomy Ph.D. candidate, discovers a previously unknown comet. ', N'')
INSERT [dbo].[Movie] ([ID], [Name], [ReleaseDate], [Duration], [Synopsis], [Image]) VALUES (21, N'Resident Evil: Welcome to Raccoon City', CAST(N'2021-11-22' AS Date), 107, N'In the 1980s, Claire Redfield and her older brother Chris are children living at the Raccoon City Orphanage. ', N'')
SET IDENTITY_INSERT [dbo].[Movie] OFF
GO
INSERT [dbo].[MovieActor] ([MovieID], [ActorID]) VALUES (8, 5)
INSERT [dbo].[MovieActor] ([MovieID], [ActorID]) VALUES (18, 9)
INSERT [dbo].[MovieActor] ([MovieID], [ActorID]) VALUES (2, 2)
INSERT [dbo].[MovieActor] ([MovieID], [ActorID]) VALUES (3, 6)
INSERT [dbo].[MovieActor] ([MovieID], [ActorID]) VALUES (4, 4)
INSERT [dbo].[MovieActor] ([MovieID], [ActorID]) VALUES (19, 10)
INSERT [dbo].[MovieActor] ([MovieID], [ActorID]) VALUES (21, 11)
GO
INSERT [dbo].[MovieProducer] ([MovieID], [ProducerID]) VALUES (8, 5)
INSERT [dbo].[MovieProducer] ([MovieID], [ProducerID]) VALUES (18, 12)
INSERT [dbo].[MovieProducer] ([MovieID], [ProducerID]) VALUES (2, 2)
INSERT [dbo].[MovieProducer] ([MovieID], [ProducerID]) VALUES (3, 3)
INSERT [dbo].[MovieProducer] ([MovieID], [ProducerID]) VALUES (4, 4)
INSERT [dbo].[MovieProducer] ([MovieID], [ProducerID]) VALUES (19, 13)
INSERT [dbo].[MovieProducer] ([MovieID], [ProducerID]) VALUES (21, 14)
GO
SET IDENTITY_INSERT [dbo].[Producer] ON 

INSERT [dbo].[Producer] ([ID], [Name], [FundationDate], [Image]) VALUES (1, N'Walt Disney Pictures', CAST(N'1923-10-14' AS Date), N'#')
INSERT [dbo].[Producer] ([ID], [Name], [FundationDate], [Image]) VALUES (2, N'Heyday Films', CAST(N'1996-10-10' AS Date), N'#')
INSERT [dbo].[Producer] ([ID], [Name], [FundationDate], [Image]) VALUES (3, N'DC Films', CAST(N'2016-05-17' AS Date), N'#')
INSERT [dbo].[Producer] ([ID], [Name], [FundationDate], [Image]) VALUES (4, N'Columbia Pictures', CAST(N'1924-01-10' AS Date), N'#')
INSERT [dbo].[Producer] ([ID], [Name], [FundationDate], [Image]) VALUES (5, N'Walt Disney Pictures', CAST(N'1923-10-16' AS Date), N'#')
INSERT [dbo].[Producer] ([ID], [Name], [FundationDate], [Image]) VALUES (12, N'Warner Bros. Pictures', CAST(N'1970-01-01' AS Date), N'')
INSERT [dbo].[Producer] ([ID], [Name], [FundationDate], [Image]) VALUES (13, N'Hyperobject Industries', CAST(N'2019-10-02' AS Date), N'')
INSERT [dbo].[Producer] ([ID], [Name], [FundationDate], [Image]) VALUES (14, N'Sony Pictures Motion Picture Group', CAST(N'1998-01-01' AS Date), N'')
SET IDENTITY_INSERT [dbo].[Producer] OFF
GO
ALTER TABLE [dbo].[MovieActor]  WITH CHECK ADD  CONSTRAINT [FK_MovieActor_Actor] FOREIGN KEY([ActorID])
REFERENCES [dbo].[Actor] ([ID])
GO
ALTER TABLE [dbo].[MovieActor] CHECK CONSTRAINT [FK_MovieActor_Actor]
GO
ALTER TABLE [dbo].[MovieActor]  WITH CHECK ADD  CONSTRAINT [FK_MovieActor_Movie] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movie] ([ID])
GO
ALTER TABLE [dbo].[MovieActor] CHECK CONSTRAINT [FK_MovieActor_Movie]
GO
ALTER TABLE [dbo].[MovieProducer]  WITH CHECK ADD  CONSTRAINT [FK_MovieProducer_Movie] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movie] ([ID])
GO
ALTER TABLE [dbo].[MovieProducer] CHECK CONSTRAINT [FK_MovieProducer_Movie]
GO
ALTER TABLE [dbo].[MovieProducer]  WITH CHECK ADD  CONSTRAINT [FK_MovieProducer_Producer] FOREIGN KEY([ProducerID])
REFERENCES [dbo].[Producer] ([ID])
GO
ALTER TABLE [dbo].[MovieProducer] CHECK CONSTRAINT [FK_MovieProducer_Producer]
GO
USE [master]
GO
ALTER DATABASE [Film-listing] SET  READ_WRITE 
GO
