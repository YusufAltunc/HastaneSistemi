USE [master]
GO
/****** Object:  Database [HastaneProje]    Script Date: 27.02.2023 00:25:35 ******/
CREATE DATABASE [HastaneProje]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HastaneProje', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\HastaneProje.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HastaneProje_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\HastaneProje_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HastaneProje] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HastaneProje].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HastaneProje] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HastaneProje] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HastaneProje] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HastaneProje] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HastaneProje] SET ARITHABORT OFF 
GO
ALTER DATABASE [HastaneProje] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HastaneProje] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HastaneProje] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HastaneProje] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HastaneProje] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HastaneProje] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HastaneProje] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HastaneProje] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HastaneProje] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HastaneProje] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HastaneProje] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HastaneProje] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HastaneProje] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HastaneProje] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HastaneProje] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HastaneProje] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HastaneProje] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HastaneProje] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HastaneProje] SET  MULTI_USER 
GO
ALTER DATABASE [HastaneProje] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HastaneProje] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HastaneProje] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HastaneProje] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HastaneProje] SET DELAYED_DURABILITY = DISABLED 
GO
USE [HastaneProje]
GO
/****** Object:  Table [dbo].[Tbl_Branslar]    Script Date: 27.02.2023 00:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Branslar](
	[Bransid] [tinyint] IDENTITY(1,1) NOT NULL,
	[Bransad] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Doktorlar]    Script Date: 27.02.2023 00:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Doktorlar](
	[Doktorid] [tinyint] IDENTITY(1,1) NOT NULL,
	[Doktorad] [varchar](10) NULL,
	[Doktorsoyad] [varchar](10) NULL,
	[Doktorbrans] [varchar](30) NULL,
	[Doktortc] [char](11) NULL,
	[Doktorsifre] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Duyurular]    Script Date: 27.02.2023 00:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Duyurular](
	[Duyuruid] [smallint] IDENTITY(1,1) NOT NULL,
	[Duyuru] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Hastalar]    Script Date: 27.02.2023 00:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Hastalar](
	[Hastaid] [smallint] IDENTITY(1,1) NOT NULL,
	[Hastaad] [varchar](10) NULL,
	[Hastasoyad] [varchar](10) NULL,
	[Hastatc] [char](11) NULL,
	[Hastatelefon] [varchar](15) NULL,
	[Hastasifre] [varchar](10) NULL,
	[Hastacinsiyet] [varchar](5) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Randevular]    Script Date: 27.02.2023 00:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Randevular](
	[Randevuid] [int] IDENTITY(1,1) NOT NULL,
	[Randevutarih] [varchar](10) NULL,
	[Randevusaat] [varchar](5) NULL,
	[Randevubrans] [varchar](30) NULL,
	[Randevudoktor] [varchar](20) NULL,
	[Randevudurum] [bit] NULL CONSTRAINT [DF_Tbl_Randevular_Randevudurum]  DEFAULT ((0)),
	[Hastatc] [char](11) NULL,
	[Hastasikayet] [varchar](250) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Sekreter]    Script Date: 27.02.2023 00:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Sekreter](
	[Sekreterid] [tinyint] IDENTITY(1,1) NOT NULL,
	[Sekreteradsoyad] [varchar](20) NULL,
	[Sekretertc] [char](11) NULL,
	[Sekretersifre] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Branslar] ON 

INSERT [dbo].[Tbl_Branslar] ([Bransid], [Bransad]) VALUES (1, N'Dahiliye')
INSERT [dbo].[Tbl_Branslar] ([Bransid], [Bransad]) VALUES (2, N'Göz')
INSERT [dbo].[Tbl_Branslar] ([Bransid], [Bransad]) VALUES (3, N'kulak burun bogaz')
INSERT [dbo].[Tbl_Branslar] ([Bransid], [Bransad]) VALUES (6, N'Fizik Tedavi')
SET IDENTITY_INSERT [dbo].[Tbl_Branslar] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Doktorlar] ON 

INSERT [dbo].[Tbl_Doktorlar] ([Doktorid], [Doktorad], [Doktorsoyad], [Doktorbrans], [Doktortc], [Doktorsifre]) VALUES (1, N'Mehmet', N'Yucedag', N'Dahiliye', N'33333333333', N'33333')
INSERT [dbo].[Tbl_Doktorlar] ([Doktorid], [Doktorad], [Doktorsoyad], [Doktorbrans], [Doktortc], [Doktorsifre]) VALUES (2, N'Akın', N'Yıldız', N'Dahiliye', N'11111111112', N'0011')
INSERT [dbo].[Tbl_Doktorlar] ([Doktorid], [Doktorad], [Doktorsoyad], [Doktorbrans], [Doktortc], [Doktorsifre]) VALUES (5, N'Yusuf', N'Altunç', N'Göz', N'44444444444', N'4444')
INSERT [dbo].[Tbl_Doktorlar] ([Doktorid], [Doktorad], [Doktorsoyad], [Doktorbrans], [Doktortc], [Doktorsifre]) VALUES (4, N'Şerif', N'Yılmaz', N'Fizik Tedavi', N'88888888888', N'8888')
SET IDENTITY_INSERT [dbo].[Tbl_Doktorlar] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Duyurular] ON 

INSERT [dbo].[Tbl_Duyurular] ([Duyuruid], [Duyuru]) VALUES (1, N'Saat 21:00 de acil karşısında toplantı olacak.')
INSERT [dbo].[Tbl_Duyurular] ([Duyuruid], [Duyuru]) VALUES (2, N'Tüm hemşireler yeni giriş kartları icin gişeye ugrayıp imzalarını atarak kartlarını alsınlar.')
SET IDENTITY_INSERT [dbo].[Tbl_Duyurular] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Hastalar] ON 

INSERT [dbo].[Tbl_Hastalar] ([Hastaid], [Hastaad], [Hastasoyad], [Hastatc], [Hastatelefon], [Hastasifre], [Hastacinsiyet]) VALUES (1, N'Baran', N'Yucedag', N'11111111111', N'(111) 111-1111', N'1111', N'Erkek')
INSERT [dbo].[Tbl_Hastalar] ([Hastaid], [Hastaad], [Hastasoyad], [Hastatc], [Hastatelefon], [Hastasifre], [Hastacinsiyet]) VALUES (2, N'Ayşe ', N'Ozturk', N'34567892345', N'(543) 657-8654', N'1234', N'Kadın')
INSERT [dbo].[Tbl_Hastalar] ([Hastaid], [Hastaad], [Hastasoyad], [Hastatc], [Hastatelefon], [Hastasifre], [Hastacinsiyet]) VALUES (102, N'yusuf', N'altunc', N'12345634323', N'(423) 874-2243', N'5555', N'Erkek')
SET IDENTITY_INSERT [dbo].[Tbl_Hastalar] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Randevular] ON 

INSERT [dbo].[Tbl_Randevular] ([Randevuid], [Randevutarih], [Randevusaat], [Randevubrans], [Randevudoktor], [Randevudurum], [Hastatc], [Hastasikayet]) VALUES (1, N'28.10.2017', N'14:00', N'Dahiliye', N'Mehmet Yucedag', 0, NULL, NULL)
INSERT [dbo].[Tbl_Randevular] ([Randevuid], [Randevutarih], [Randevusaat], [Randevubrans], [Randevudoktor], [Randevudurum], [Hastatc], [Hastasikayet]) VALUES (2, N'29.10.2017', N'12:00', N'Göz', N'Akın Yıldız', 0, NULL, NULL)
INSERT [dbo].[Tbl_Randevular] ([Randevuid], [Randevutarih], [Randevusaat], [Randevubrans], [Randevudoktor], [Randevudurum], [Hastatc], [Hastasikayet]) VALUES (3, N'28.10.2017', N'13:00', N'Dahiliye', N'Mehmet Yucedag', 0, NULL, NULL)
INSERT [dbo].[Tbl_Randevular] ([Randevuid], [Randevutarih], [Randevusaat], [Randevubrans], [Randevudoktor], [Randevudurum], [Hastatc], [Hastasikayet]) VALUES (4, N'28.10.2017', N'14:00', N'Dahiliye', N'Mehmet Yucedag', 0, NULL, NULL)
INSERT [dbo].[Tbl_Randevular] ([Randevuid], [Randevutarih], [Randevusaat], [Randevubrans], [Randevudoktor], [Randevudurum], [Hastatc], [Hastasikayet]) VALUES (5, N'28.10.2017', N'13:00', N'Dahiliye', N'Akın Yıldız', 0, NULL, NULL)
INSERT [dbo].[Tbl_Randevular] ([Randevuid], [Randevutarih], [Randevusaat], [Randevubrans], [Randevudoktor], [Randevudurum], [Hastatc], [Hastasikayet]) VALUES (6, N'28.10.2017', N'14:00', N'Dahiliye', N'Akın Yıldız', 0, NULL, NULL)
INSERT [dbo].[Tbl_Randevular] ([Randevuid], [Randevutarih], [Randevusaat], [Randevubrans], [Randevudoktor], [Randevudurum], [Hastatc], [Hastasikayet]) VALUES (7, N'28.10.2017', N'15:00', N'Dahiliye', N'Akın Yıldız', 1, N'11111111111', N'karnım agrıyor.')
INSERT [dbo].[Tbl_Randevular] ([Randevuid], [Randevutarih], [Randevusaat], [Randevubrans], [Randevudoktor], [Randevudurum], [Hastatc], [Hastasikayet]) VALUES (8, N'28.10.2017', N'13:00', N'Fizik Tedavi', N'Şerif Yılmaz', 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Tbl_Randevular] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Sekreter] ON 

INSERT [dbo].[Tbl_Sekreter] ([Sekreterid], [Sekreteradsoyad], [Sekretertc], [Sekretersifre]) VALUES (1, N'Emel Özturk', N'55555555555', N'5555')
INSERT [dbo].[Tbl_Sekreter] ([Sekreterid], [Sekreteradsoyad], [Sekretertc], [Sekretersifre]) VALUES (2, N'Ali Gunes', N'66666666666', N'6666')
SET IDENTITY_INSERT [dbo].[Tbl_Sekreter] OFF
USE [master]
GO
ALTER DATABASE [HastaneProje] SET  READ_WRITE 
GO
