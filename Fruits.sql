USE [master]
GO
/****** Object:  Database [Fruit_Storage.FruitsContext]    Script Date: 17/6/2024 12:50:11 AM ******/
CREATE DATABASE [Fruit_Storage.FruitsContext]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Fruit_Storage.FruitsContext', FILENAME = N'C:\Users\vojdn\Fruit_Storage.FruitsContext.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Fruit_Storage.FruitsContext_log', FILENAME = N'C:\Users\vojdn\Fruit_Storage.FruitsContext_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fruit_Storage.FruitsContext].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET ARITHABORT OFF 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET  MULTI_USER 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET QUERY_STORE = OFF
GO
USE [Fruit_Storage.FruitsContext]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 17/6/2024 12:50:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fruit]    Script Date: 17/6/2024 12:50:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fruit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[FruitTypeId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Fruit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FruitType]    Script Date: 17/6/2024 12:50:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FruitType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.FruitType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_FruitTypeId]    Script Date: 17/6/2024 12:50:11 AM ******/
CREATE NONCLUSTERED INDEX [IX_FruitTypeId] ON [dbo].[Fruit]
(
	[FruitTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Fruit]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Fruit_dbo.FruitType_FruitTypeId] FOREIGN KEY([FruitTypeId])
REFERENCES [dbo].[FruitType] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Fruit] CHECK CONSTRAINT [FK_dbo.Fruit_dbo.FruitType_FruitTypeId]
GO
USE [master]
GO
ALTER DATABASE [Fruit_Storage.FruitsContext] SET  READ_WRITE 
GO
