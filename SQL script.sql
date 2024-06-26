USE [master]
GO
/****** Object:  Database [AutoServiceDB]    Script Date: 29.05.2024 12:45:37 ******/
CREATE DATABASE [AutoServiceDB]
GO
ALTER DATABASE [AutoServiceDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AutoServiceDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AutoServiceDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AutoServiceDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AutoServiceDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AutoServiceDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AutoServiceDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AutoServiceDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AutoServiceDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AutoServiceDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AutoServiceDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AutoServiceDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AutoServiceDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AutoServiceDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AutoServiceDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AutoServiceDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AutoServiceDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AutoServiceDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AutoServiceDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AutoServiceDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AutoServiceDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AutoServiceDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AutoServiceDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AutoServiceDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AutoServiceDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AutoServiceDB] SET  MULTI_USER 
GO
ALTER DATABASE [AutoServiceDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AutoServiceDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AutoServiceDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AutoServiceDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AutoServiceDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AutoServiceDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AutoServiceDB] SET QUERY_STORE = OFF
GO
USE [AutoServiceDB]
GO
/****** Object:  Table [dbo].[order]    Script Date: 29.05.2024 12:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreation] [date] NULL,
	[OrderStatus] [nvarchar](50) NULL,
	[PaymentStatus] [nvarchar](50) NULL,
	[CarElement] [nvarchar](50) NULL,
	[Details] [nvarchar](50) NULL,
	[AmountDamage] [int] NULL,
	[Liquids] [nvarchar](50) NULL,
 CONSTRAINT [order_pk] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderuserlist]    Script Date: 29.05.2024 12:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderuserlist](
	[OrderUserListId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [orderuserlist_pk] PRIMARY KEY CLUSTERED 
(
	[OrderUserListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shift]    Script Date: 29.05.2024 12:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shift](
	[ShiftId] [int] IDENTITY(1,1) NOT NULL,
	[DateStart] [date] NULL,
	[DateEnd] [date] NULL,
 CONSTRAINT [shift_pk] PRIMARY KEY CLUSTERED 
(
	[ShiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 29.05.2024 12:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[UserRoleId] [int] NULL,
 CONSTRAINT [user_pk] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userlist]    Script Date: 29.05.2024 12:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userlist](
	[UserListId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[ShiftId] [int] NULL,
 CONSTRAINT [userlist_pk] PRIMARY KEY CLUSTERED 
(
	[UserListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userrole]    Script Date: 29.05.2024 12:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userrole](
	[UserRoleId] [int] IDENTITY(1,1) NOT NULL,
	[NameRole] [nvarchar](50) NULL,
 CONSTRAINT [userrole_pk] PRIMARY KEY CLUSTERED 
(
	[UserRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[orderuserlist]  WITH CHECK ADD  CONSTRAINT [orderuserlist___fk] FOREIGN KEY([UserId])
REFERENCES [dbo].[user] ([UserId])
GO
ALTER TABLE [dbo].[orderuserlist] CHECK CONSTRAINT [orderuserlist___fk]
GO
ALTER TABLE [dbo].[orderuserlist]  WITH CHECK ADD  CONSTRAINT [orderuserlist___fk_2] FOREIGN KEY([OrderId])
REFERENCES [dbo].[order] ([OrderId])
GO
ALTER TABLE [dbo].[orderuserlist] CHECK CONSTRAINT [orderuserlist___fk_2]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [user___fk] FOREIGN KEY([UserRoleId])
REFERENCES [dbo].[userrole] ([UserRoleId])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [user___fk]
GO
ALTER TABLE [dbo].[userlist]  WITH CHECK ADD  CONSTRAINT [userlist___fk] FOREIGN KEY([UserId])
REFERENCES [dbo].[user] ([UserId])
GO
ALTER TABLE [dbo].[userlist] CHECK CONSTRAINT [userlist___fk]
GO
ALTER TABLE [dbo].[userlist]  WITH CHECK ADD  CONSTRAINT [userlist___fk_2] FOREIGN KEY([ShiftId])
REFERENCES [dbo].[shift] ([ShiftId])
GO
ALTER TABLE [dbo].[userlist] CHECK CONSTRAINT [userlist___fk_2]
GO
USE [master]
GO
ALTER DATABASE [AutoServiceDB] SET  READ_WRITE 
GO
