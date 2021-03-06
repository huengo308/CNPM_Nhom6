USE [master]
GO
/****** Object:  Database [ATMsql]    Script Date: 03/03/2022 16:16:05 ******/
CREATE DATABASE [ATMsql] ON  PRIMARY 
( NAME = N'ATMsql', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESSE\MSSQL\DATA\ATMsql.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ATMsql_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESSE\MSSQL\DATA\ATMsql_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ATMsql] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ATMsql].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ATMsql] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ATMsql] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ATMsql] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ATMsql] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ATMsql] SET ARITHABORT OFF
GO
ALTER DATABASE [ATMsql] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ATMsql] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ATMsql] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ATMsql] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ATMsql] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ATMsql] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ATMsql] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ATMsql] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ATMsql] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ATMsql] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ATMsql] SET  DISABLE_BROKER
GO
ALTER DATABASE [ATMsql] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ATMsql] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ATMsql] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ATMsql] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ATMsql] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ATMsql] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ATMsql] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ATMsql] SET  READ_WRITE
GO
ALTER DATABASE [ATMsql] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ATMsql] SET  MULTI_USER
GO
ALTER DATABASE [ATMsql] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ATMsql] SET DB_CHAINING OFF
GO
USE [ATMsql]
GO
/****** Object:  Table [dbo].[nhanvien]    Script Date: 03/03/2022 16:16:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nhanvien](
	[manv] [int] IDENTITY(1,1) NOT NULL,
	[hoten] [nvarchar](50) NULL,
	[taikhoan] [char](10) NULL,
	[matkhau] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[manv] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Khachhang]    Script Date: 03/03/2022 16:16:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Khachhang](
	[SoTK] [char](15) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[SoCMT] [char](10) NOT NULL,
	[SoDT] [char](10) NOT NULL,
	[Diachi] [nvarchar](50) NOT NULL,
	[SoDu] [float] NOT NULL,
	[gioitinh] [nvarchar](10) NULL,
	[ngaysinh] [date] NULL,
	[manv] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SoTK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[The]    Script Date: 03/03/2022 16:16:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[The](
	[Sothe] [char](10) NOT NULL,
	[SoTK] [char](15) NOT NULL,
	[PIN] [char](6) NOT NULL,
	[ngaytao] [date] NULL,
	[ngayhethan] [date] NULL,
 CONSTRAINT [PK_The] PRIMARY KEY CLUSTERED 
(
	[Sothe] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Giaodich]    Script Date: 03/03/2022 16:16:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Giaodich](
	[ID_GD] [int] IDENTITY(1,1) NOT NULL,
	[SoTK] [char](15) NOT NULL,
	[Loai_GD] [nvarchar](50) NOT NULL,
	[SoTien] [float] NOT NULL,
	[Ngay_GD] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_GD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK__Khachhang__manv__276EDEB3]    Script Date: 03/03/2022 16:16:05 ******/
ALTER TABLE [dbo].[Khachhang]  WITH CHECK ADD FOREIGN KEY([manv])
REFERENCES [dbo].[nhanvien] ([manv])
GO
/****** Object:  ForeignKey [FK__The__SoTK__20C1E124]    Script Date: 03/03/2022 16:16:05 ******/
ALTER TABLE [dbo].[The]  WITH CHECK ADD FOREIGN KEY([SoTK])
REFERENCES [dbo].[Khachhang] ([SoTK])
GO
/****** Object:  ForeignKey [FK__Giaodich__SoTK__117F9D94]    Script Date: 03/03/2022 16:16:05 ******/
ALTER TABLE [dbo].[Giaodich]  WITH CHECK ADD FOREIGN KEY([SoTK])
REFERENCES [dbo].[Khachhang] ([SoTK])
GO
