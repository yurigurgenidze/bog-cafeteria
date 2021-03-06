USE [master]
GO
/****** Object:  Database [ygurDB]    Script Date: 10/16/2018 3:13:02 AM ******/
CREATE DATABASE [ygurDB]



ALTER DATABASE [ygurDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ygurDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ygurDB] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [ygurDB] SET ANSI_NULLS ON 
GO
ALTER DATABASE [ygurDB] SET ANSI_PADDING ON 
GO
ALTER DATABASE [ygurDB] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [ygurDB] SET ARITHABORT ON 
GO
ALTER DATABASE [ygurDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ygurDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ygurDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ygurDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ygurDB] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [ygurDB] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [ygurDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ygurDB] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [ygurDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ygurDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ygurDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ygurDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ygurDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ygurDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ygurDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ygurDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ygurDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ygurDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ygurDB] SET  MULTI_USER 
GO
ALTER DATABASE [ygurDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ygurDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ygurDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ygurDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ygurDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ygurDB] SET QUERY_STORE = OFF
GO
USE [ygurDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ygurDB]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 10/16/2018 3:13:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [int] NOT NULL,
	[Company] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[Comment] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentType]    Script Date: 10/16/2018 3:13:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 10/16/2018 3:13:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Type] [int] NOT NULL,
	[Logo] [varchar](300) NOT NULL,
	[Average Price] [int] NOT NULL,
	[Description] [varchar](200) NULL,
	[RegisterDate] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyType]    Script Date: 10/16/2018 3:13:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 10/16/2018 3:13:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Product] [int] NOT NULL,
	[Category] [int] NOT NULL,
	[Time] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Company] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriceRange]    Script Date: 10/16/2018 3:13:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceRange](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PriceRange] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/16/2018 3:13:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 10/16/2018 3:13:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 10/16/2018 3:13:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Company] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[Rating] [int] NULL,
	[User] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Company] ADD  DEFAULT (sysdatetime()) FOR [RegisterDate]
GO
ALTER TABLE [dbo].[Sale] ADD  DEFAULT (sysdatetime()) FOR [Date]
GO
ALTER TABLE [dbo].[Sale] ADD  DEFAULT ((5)) FOR [Rating]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([Company])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([Type])
REFERENCES [dbo].[CommentType] ([Id])
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD FOREIGN KEY([Average Price])
REFERENCES [dbo].[PriceRange] ([Id])
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD FOREIGN KEY([Type])
REFERENCES [dbo].[CompanyType] ([Id])
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD FOREIGN KEY([Category])
REFERENCES [dbo].[ProductType] ([Id])
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD FOREIGN KEY([Company])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD FOREIGN KEY([Company])
REFERENCES [dbo].[Company] ([Id])
GO
USE [master]
GO
ALTER DATABASE [ygurDB] SET  READ_WRITE 
GO
