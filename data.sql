USE [master]
GO
/****** Object:  Database [projectWeb]    Script Date: 04/12/2022 7:05:35 PM ******/
CREATE DATABASE [projectWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'projectWeb', FILENAME = N'D:\finalprojectweb\AnimeWeb\projectWeb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'projectWeb_log', FILENAME = N'D:\finalprojectweb\AnimeWeb\projectWeb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [projectWeb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [projectWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [projectWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [projectWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [projectWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [projectWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [projectWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [projectWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [projectWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [projectWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [projectWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [projectWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [projectWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [projectWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [projectWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [projectWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [projectWeb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [projectWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [projectWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [projectWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [projectWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [projectWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [projectWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [projectWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [projectWeb] SET RECOVERY FULL 
GO
ALTER DATABASE [projectWeb] SET  MULTI_USER 
GO
ALTER DATABASE [projectWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [projectWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [projectWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [projectWeb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [projectWeb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [projectWeb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'projectWeb', N'ON'
GO
ALTER DATABASE [projectWeb] SET QUERY_STORE = OFF
GO
USE [projectWeb]
GO
/****** Object:  Table [dbo].[account]    Script Date: 04/12/2022 7:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[UserName] [nvarchar](24) NOT NULL,
	[PassW] [nvarchar](24) NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
	[avatar] [nvarchar](50) NULL,
	[isAdmin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[blog]    Script Date: 04/12/2022 7:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blog](
	[idBlog] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](200) NOT NULL,
	[folder] [nvarchar](20) NOT NULL,
	[datePost] [nvarchar](20) NOT NULL,
	[avt] [nvarchar](20) NULL,
	[dayDebut] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idBlog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[blogComment]    Script Date: 04/12/2022 7:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blogComment](
	[idBlog] [int] NULL,
	[idCmt] [int] IDENTITY(1,1) NOT NULL,
	[mess] [nvarchar](200) NOT NULL,
	[UserName] [nvarchar](24) NULL,
	[dateCmt] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCmt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chapter]    Script Date: 04/12/2022 7:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chapter](
	[idMovie] [int] NOT NULL,
	[stt] [int] NOT NULL,
	[opening] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idMovie] ASC,
	[stt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 04/12/2022 7:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[UserName] [nvarchar](24) NULL,
	[mess] [nvarchar](100) NULL,
	[idMovie] [int] NULL,
	[timecomment] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[follow]    Script Date: 04/12/2022 7:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[follow](
	[UserName] [nvarchar](24) NULL,
	[idMovie] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movie]    Script Date: 04/12/2022 7:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie](
	[idMovie] [int] IDENTITY(1,1) NOT NULL,
	[nameMovie] [nvarchar](100) NULL,
	[genre] [nvarchar](30) NULL,
	[currentEpisode] [int] NULL,
	[totalEpisodes] [int] NULL,
	[viewer] [int] NULL,
	[avatar] [nvarchar](100) NULL,
	[descriptionit] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[idMovie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rate]    Script Date: 04/12/2022 7:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rate](
	[idMovie] [int] NULL,
	[UserName] [nvarchar](24) NULL,
	[score] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[replyComment]    Script Date: 04/12/2022 7:05:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[replyComment](
	[idBlog] [int] NULL,
	[idCmt] [int] NULL,
	[UserNameCmt] [nvarchar](24) NULL,
	[UserNameReply] [nvarchar](24) NULL,
	[mess] [nvarchar](200) NULL,
	[daycmt] [nvarchar](20) NULL,
	[sttCmt] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sttCmt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[account] ([UserName], [PassW], [Email], [avatar], [isAdmin]) VALUES (N'27092002', N'Linh0986607878', N'goblinslayer27092002@gmail.com', N'defaultavatar.jpg', 0)
INSERT [dbo].[account] ([UserName], [PassW], [Email], [avatar], [isAdmin]) VALUES (N'admin', N'1234567', N'linhchauhoa113@gmail.com', N'adminavatar.png', 1)
INSERT [dbo].[account] ([UserName], [PassW], [Email], [avatar], [isAdmin]) VALUES (N'bagia123', N'27092002', N'okbagia@gmail.com', N'bagia123avatar.jpg', 0)
INSERT [dbo].[account] ([UserName], [PassW], [Email], [avatar], [isAdmin]) VALUES (N'hacknhanpham51', N'Linh0986607878', N'maganeckji@gmail.com', N'hacknhanpham51avatar.jpg', 0)
INSERT [dbo].[account] ([UserName], [PassW], [Email], [avatar], [isAdmin]) VALUES (N'linhchauhoa113', N'27092002', N'maganeckji@gmail.com', N'linhchauhoa113avatar.jpg', 0)
INSERT [dbo].[account] ([UserName], [PassW], [Email], [avatar], [isAdmin]) VALUES (N'nhatlinh123', N'27092002', N'nhatlinh123@gmail.com', N'defaultavatar.jpg', 0)
GO
SET IDENTITY_INSERT [dbo].[blog] ON 


SET IDENTITY_INSERT [dbo].[blog] OFF
GO
INSERT [dbo].[chapter] ([idMovie], [stt], [opening]) VALUES (2, 1, 1)
INSERT [dbo].[chapter] ([idMovie], [stt], [opening]) VALUES (2, 2, 2)
GO

INSERT [dbo].[follow] ([UserName], [idMovie]) VALUES (N'admin', 4)
GO
SET IDENTITY_INSERT [dbo].[movie] ON 


SET IDENTITY_INSERT [dbo].[movie] OFF
GO

GO
ALTER TABLE [dbo].[blogComment]  WITH CHECK ADD FOREIGN KEY([idBlog])
REFERENCES [dbo].[blog] ([idBlog])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[blogComment]  WITH CHECK ADD FOREIGN KEY([UserName])
REFERENCES [dbo].[account] ([UserName])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[chapter]  WITH CHECK ADD FOREIGN KEY([idMovie])
REFERENCES [dbo].[movie] ([idMovie])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD FOREIGN KEY([idMovie])
REFERENCES [dbo].[movie] ([idMovie])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD FOREIGN KEY([UserName])
REFERENCES [dbo].[account] ([UserName])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[follow]  WITH CHECK ADD FOREIGN KEY([idMovie])
REFERENCES [dbo].[movie] ([idMovie])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[follow]  WITH CHECK ADD FOREIGN KEY([UserName])
REFERENCES [dbo].[account] ([UserName])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[rate]  WITH CHECK ADD FOREIGN KEY([idMovie])
REFERENCES [dbo].[movie] ([idMovie])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[rate]  WITH CHECK ADD FOREIGN KEY([UserName])
REFERENCES [dbo].[account] ([UserName])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[replyComment]  WITH CHECK ADD FOREIGN KEY([idBlog])
REFERENCES [dbo].[blog] ([idBlog])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[replyComment]  WITH CHECK ADD FOREIGN KEY([idCmt])
REFERENCES [dbo].[blogComment] ([idCmt])
GO
ALTER TABLE [dbo].[replyComment]  WITH CHECK ADD FOREIGN KEY([UserNameCmt])
REFERENCES [dbo].[account] ([UserName])
GO
ALTER TABLE [dbo].[replyComment]  WITH CHECK ADD FOREIGN KEY([UserNameReply])
REFERENCES [dbo].[account] ([UserName])
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD CHECK  (([isAdmin]=(1) OR [isAdmin]=(0)))
GO
USE [master]
GO
ALTER DATABASE [projectWeb] SET  READ_WRITE 
GO
go
alter table movie
alter column descriptionit nvarchar(4000)
alter table account
alter column PassW nvarchar(4000)