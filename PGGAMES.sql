USE [master]
GO
/****** Object:  Database [PGGaames]    Script Date: 8/06/2020 9:15:27 p. m. ******/
CREATE DATABASE [PGGaames]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PGGaames', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PGGaames.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PGGaames_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PGGaames_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PGGaames] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PGGaames].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PGGaames] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PGGaames] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PGGaames] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PGGaames] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PGGaames] SET ARITHABORT OFF 
GO
ALTER DATABASE [PGGaames] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PGGaames] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PGGaames] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PGGaames] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PGGaames] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PGGaames] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PGGaames] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PGGaames] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PGGaames] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PGGaames] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PGGaames] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PGGaames] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PGGaames] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PGGaames] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PGGaames] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PGGaames] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PGGaames] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PGGaames] SET RECOVERY FULL 
GO
ALTER DATABASE [PGGaames] SET  MULTI_USER 
GO
ALTER DATABASE [PGGaames] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PGGaames] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PGGaames] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PGGaames] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PGGaames] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PGGaames] SET QUERY_STORE = OFF
GO
USE [PGGaames]
GO
/****** Object:  Table [dbo].[tbDetalle]    Script Date: 8/06/2020 9:15:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbDetalle](
	[id_Detalle] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[id_Factura] [int] NOT NULL,
	[id_Juego] [uniqueidentifier] NOT NULL,
	[Costo] [varchar](25) NOT NULL,
 CONSTRAINT [PK_tbDetalle] PRIMARY KEY CLUSTERED 
(
	[id_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbFactura]    Script Date: 8/06/2020 9:15:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbFactura](
	[id_Factura] [int] IDENTITY(1,1) NOT NULL,
	[id_Usuario] [uniqueidentifier] NOT NULL,
	[Fecha] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tbFactura] PRIMARY KEY CLUSTERED 
(
	[id_Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbJuego]    Script Date: 8/06/2020 9:15:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbJuego](
	[id_Juego] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Genero] [varchar](15) NOT NULL,
	[Precio] [varchar](15) NOT NULL,
	[Estado_Lanzamiento] [varchar](20) NOT NULL,
	[imgURL] [varchar](max) NULL,
	[nJuego] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tbJuego] PRIMARY KEY CLUSTERED 
(
	[id_Juego] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbUsuario]    Script Date: 8/06/2020 9:15:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbUsuario](
	[id_Usuario] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Apellido] [varchar](20) NOT NULL,
	[Cedula] [varchar](15) NOT NULL,
	[Correo] [varchar](70) NOT NULL,
	[Telefono] [varchar](15) NULL,
	[Tipo] [varchar](1) NOT NULL,
	[Contraseña] [varchar](15) NOT NULL,
	[OlvidoCon] [varchar](2) NULL,
 CONSTRAINT [PK_tbUsuario] PRIMARY KEY CLUSTERED 
(
	[id_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'9df73797-eb20-4df3-96b0-00a2588e56ff', 23, N'be4a419c-6e23-463e-a97e-eec3903e0e90', N'150.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'a3a58b55-160c-4876-9ff2-055e7671aea9', 27, N'adf04991-f624-47ff-bcb7-e9188c8e4031', N'60.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'06afd463-0c40-42d3-8dda-07e494b88411', 19, N'31a2aac8-ec76-49f6-9637-984191cdf9ee', N'120.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'2b20ce2a-68f5-4725-a022-0a910db37fd8', 18, N'b86332c7-d66d-492f-9954-7cae9dea52ec', N'120.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'e130445e-e317-48bc-bee7-0d7e28bf9568', 25, N'be4a419c-6e23-463e-a97e-eec3903e0e90', N'150.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'4a30aafd-fbeb-4558-98bc-0f639bcda8cf', 23, N'31a2aac8-ec76-49f6-9637-984191cdf9ee', N'120.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'b047fc82-b89e-48bd-af75-1f11d2cefd47', 19, N'0b9fd3cf-8925-4ed6-8970-c1b397613d4e', N'90.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'a50db7e7-2a38-4345-af06-26fdc0b1baeb', 18, N'0b9fd3cf-8925-4ed6-8970-c1b397613d4e', N'90.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'0c73d24b-a008-4d5a-a905-3311afb186e2', 20, N'41d79ffe-3f60-419b-ba1e-1d1590cb39c8', N'90.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'65b47600-603a-4b23-84f3-41f4b8f008d7', 24, N'be4a419c-6e23-463e-a97e-eec3903e0e90', N'150.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'c74d39b6-ef83-4647-a8a5-4394a45ae3d7', 18, N'41d79ffe-3f60-419b-ba1e-1d1590cb39c8', N'90.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'bf5ec116-abaa-4960-a2af-463b9402bc3a', 19, N'28c57cde-676a-45db-ade7-b6464779555d', N'95.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'fd4f3300-cc56-4f95-93ca-48303d5d6451', 28, N'b86332c7-d66d-492f-9954-7cae9dea52ec', N'120.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'e6bc303d-61a5-4936-a40d-4fbacdd81dc3', 18, N'1a257403-d703-4475-9d45-32cd72e18cfe', N'70.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'171a8966-15fd-4097-ac03-504c0267a91d', 25, N'e071670e-6578-4da6-ba7e-47d05780e472', N'100.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'6c527e7b-3ce7-412c-b497-5de6f5ad5cc1', 26, N'df69da5d-488f-4047-b702-9de8f016058b', N'60.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'1d03d37d-1470-450c-8ab7-7894cd4178e4', 28, N'457a5df2-ab0f-4ffd-950f-0a746dd34b31', N'120.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'3e124dc8-f882-4cd7-a95e-808ffc824e2e', 24, N'31a2aac8-ec76-49f6-9637-984191cdf9ee', N'120.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'4ee7206a-7a76-4500-8b52-8c04129cb4b3', 27, N'be4a419c-6e23-463e-a97e-eec3903e0e90', N'150.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'cfd71ca6-a7ff-4ee7-8c4b-8c06b42fb479', 27, N'0b9fd3cf-8925-4ed6-8970-c1b397613d4e', N'90.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'3d7dc833-def7-4074-b3b8-91f0349acbeb', 24, N'e071670e-6578-4da6-ba7e-47d05780e472', N'100.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'ba185aac-dc22-446b-878a-aaee626eedc0', 23, N'e071670e-6578-4da6-ba7e-47d05780e472', N'100.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'c9082db7-a255-469b-b1c4-aff474675c95', 28, N'41d79ffe-3f60-419b-ba1e-1d1590cb39c8', N'90.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'ca9b385a-b8b2-4284-b001-b3370c5c045f', 20, N'457a5df2-ab0f-4ffd-950f-0a746dd34b31', N'120.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'd712abab-ded9-4c7b-8952-b755d9c25fe4', 26, N'0c00ae90-786a-4b9a-9c36-784740c703e8', N'35.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'009c0ef1-bd7a-4c9d-87fd-c32ea8b850f4', 20, N'b86332c7-d66d-492f-9954-7cae9dea52ec', N'120.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'904d20d7-4da5-4d7c-96ad-c3e1674e20a0', 18, N'457a5df2-ab0f-4ffd-950f-0a746dd34b31', N'120.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'9b3bf5b1-0c7a-4f8c-85a2-cee868415347', 17, N'0b9fd3cf-8925-4ed6-8970-c1b397613d4e', N'90.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'd58edb56-8fc9-45b1-b643-d66d7abc8e3c', 18, N'136028e1-7e42-413d-9b2c-7b8161a74962', N'100.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'6688df67-43d5-4845-b8a5-d8682c749431', 17, N'be4a419c-6e23-463e-a97e-eec3903e0e90', N'150.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'00f589b8-3e87-4043-9b99-da92bc6782ed', 24, N'0b9fd3cf-8925-4ed6-8970-c1b397613d4e', N'90.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'd675b925-26e0-4fb1-8052-dc1845c0baac', 27, N'df69da5d-488f-4047-b702-9de8f016058b', N'60.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'c3739200-d297-4d6f-81ea-dc7d0af1acc9', 17, N'31a2aac8-ec76-49f6-9637-984191cdf9ee', N'120.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'db4ca505-3709-46bd-8b07-deed0ad1c42e', 18, N'e071670e-6578-4da6-ba7e-47d05780e472', N'100.000')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'6bfef10d-fcfe-4495-aa61-edffed037221', 26, N'29e5e1f9-1826-421d-9199-7c9164dae957', N'0')
INSERT [dbo].[tbDetalle] ([id_Detalle], [id_Factura], [id_Juego], [Costo]) VALUES (N'9afe05cc-5e09-4568-9c5a-fe5d15339dbc', 23, N'28c57cde-676a-45db-ade7-b6464779555d', N'95.000')
GO
SET IDENTITY_INSERT [dbo].[tbFactura] ON 

INSERT [dbo].[tbFactura] ([id_Factura], [id_Usuario], [Fecha]) VALUES (17, N'9f64863b-0b9d-4c99-9c6d-986a66ee4ba2', N'08/06/2020')
INSERT [dbo].[tbFactura] ([id_Factura], [id_Usuario], [Fecha]) VALUES (18, N'9f64863b-0b9d-4c99-9c6d-986a66ee4ba2', N'08/06/2020')
INSERT [dbo].[tbFactura] ([id_Factura], [id_Usuario], [Fecha]) VALUES (19, N'9f64863b-0b9d-4c99-9c6d-986a66ee4ba2', N'08/06/2020')
INSERT [dbo].[tbFactura] ([id_Factura], [id_Usuario], [Fecha]) VALUES (20, N'9f64863b-0b9d-4c99-9c6d-986a66ee4ba2', N'08/06/2020')
INSERT [dbo].[tbFactura] ([id_Factura], [id_Usuario], [Fecha]) VALUES (23, N'9f64863b-0b9d-4c99-9c6d-986a66ee4ba2', N'08/06/2020')
INSERT [dbo].[tbFactura] ([id_Factura], [id_Usuario], [Fecha]) VALUES (24, N'9f64863b-0b9d-4c99-9c6d-986a66ee4ba2', N'08/06/2020')
INSERT [dbo].[tbFactura] ([id_Factura], [id_Usuario], [Fecha]) VALUES (25, N'9f64863b-0b9d-4c99-9c6d-986a66ee4ba2', N'08/06/2020')
INSERT [dbo].[tbFactura] ([id_Factura], [id_Usuario], [Fecha]) VALUES (26, N'9f64863b-0b9d-4c99-9c6d-986a66ee4ba2', N'08/06/2020')
INSERT [dbo].[tbFactura] ([id_Factura], [id_Usuario], [Fecha]) VALUES (27, N'9f64863b-0b9d-4c99-9c6d-986a66ee4ba2', N'08/06/2020')
INSERT [dbo].[tbFactura] ([id_Factura], [id_Usuario], [Fecha]) VALUES (28, N'9f64863b-0b9d-4c99-9c6d-986a66ee4ba2', N'08/06/2020')
SET IDENTITY_INSERT [dbo].[tbFactura] OFF
GO
SET IDENTITY_INSERT [dbo].[tbJuego] ON 

INSERT [dbo].[tbJuego] ([id_Juego], [Nombre], [Genero], [Precio], [Estado_Lanzamiento], [imgURL], [nJuego]) VALUES (N'457a5df2-ab0f-4ffd-950f-0a746dd34b31', N'The Division 2', N'Acción', N'120.000', N'Comprar', N'/Assets/imgs/Catalogo/TheDivision2.jpg', 1)
INSERT [dbo].[tbJuego] ([id_Juego], [Nombre], [Genero], [Precio], [Estado_Lanzamiento], [imgURL], [nJuego]) VALUES (N'41d79ffe-3f60-419b-ba1e-1d1590cb39c8', N'Ghost Recon Wildlands', N'Acción', N'90.000', N'Comprar', N'/Assets/imgs/Catalogo/GhostRecon-Wildlands.jpg', 2)
INSERT [dbo].[tbJuego] ([id_Juego], [Nombre], [Genero], [Precio], [Estado_Lanzamiento], [imgURL], [nJuego]) VALUES (N'ab27c4fa-9440-471f-998e-29afcf15a75f', N'Fortnite', N'Acción', N'0', N'Comprar', N'/Assets/imgs/Catalogo/fortnite.jpg', 13)
INSERT [dbo].[tbJuego] ([id_Juego], [Nombre], [Genero], [Precio], [Estado_Lanzamiento], [imgURL], [nJuego]) VALUES (N'1a257403-d703-4475-9d45-32cd72e18cfe', N'RainbowSix Siege', N'Acción', N'70.000', N'Comprar', N'/Assets/imgs/Catalogo/Rainbowsix-Siege.jpg', 3)
INSERT [dbo].[tbJuego] ([id_Juego], [Nombre], [Genero], [Precio], [Estado_Lanzamiento], [imgURL], [nJuego]) VALUES (N'e071670e-6578-4da6-ba7e-47d05780e472', N'Watch Dogs 2', N'Aventura', N'100.000', N'Comprar', N'/Assets/imgs/Catalogo/WatchDogs-2.jpg', 11)
INSERT [dbo].[tbJuego] ([id_Juego], [Nombre], [Genero], [Precio], [Estado_Lanzamiento], [imgURL], [nJuego]) VALUES (N'bc583fe8-1f46-49cb-9f3b-4e945c850371', N'Call Of Duty World War 2', N'Acción', N'80.000', N'Comprar', N'/Assets/imgs/Catalogo/caratula_call_duty_wwII.png', 15)
INSERT [dbo].[tbJuego] ([id_Juego], [Nombre], [Genero], [Precio], [Estado_Lanzamiento], [imgURL], [nJuego]) VALUES (N'0c00ae90-786a-4b9a-9c36-784740c703e8', N'Call Of Duty Modern Warfare 2', N'Acción', N'35.000', N'Comprar', N'/Assets/imgs/Catalogo/hipertextual-call-of-duty-modern-warfare-2-remastered-es-real-se-filtra-su-primera-imagen-2020296416.jpg', 14)
INSERT [dbo].[tbJuego] ([id_Juego], [Nombre], [Genero], [Precio], [Estado_Lanzamiento], [imgURL], [nJuego]) VALUES (N'136028e1-7e42-413d-9b2c-7b8161a74962', N'Far Cry 5', N'Acción', N'100.000', N'Comprar', N'/Assets/imgs/Catalogo/FarCry-5.jpg', 4)
INSERT [dbo].[tbJuego] ([id_Juego], [Nombre], [Genero], [Precio], [Estado_Lanzamiento], [imgURL], [nJuego]) VALUES (N'29e5e1f9-1826-421d-9199-7c9164dae957', N'Valorant', N'Acción', N'0', N'Comprar', N'/Assets/imgs/Catalogo/valorant.jpg', 18)
INSERT [dbo].[tbJuego] ([id_Juego], [Nombre], [Genero], [Precio], [Estado_Lanzamiento], [imgURL], [nJuego]) VALUES (N'b86332c7-d66d-492f-9954-7cae9dea52ec', N'Assasins Creed Origins', N'Aventura', N'120.000', N'Comprar', N'/Assets/imgs/Catalogo/AssasinsCreed-Origins.jpg', 5)
INSERT [dbo].[tbJuego] ([id_Juego], [Nombre], [Genero], [Precio], [Estado_Lanzamiento], [imgURL], [nJuego]) VALUES (N'435b1336-34ed-43b6-a50d-8b263ed70bc9', N'Assasins Creed Odyssey', N'Aventura', N'110.000', N'Comprar', N'/Assets/imgs/Catalogo/AssasinsCreed-Odyssey.jpg', 6)
INSERT [dbo].[tbJuego] ([id_Juego], [Nombre], [Genero], [Precio], [Estado_Lanzamiento], [imgURL], [nJuego]) VALUES (N'31a2aac8-ec76-49f6-9637-984191cdf9ee', N'Far Cry New Dawn', N'Acción', N'120.000', N'Comprar', N'/Assets/imgs/Catalogo/FarCry-NewDawn.jpg', 7)
INSERT [dbo].[tbJuego] ([id_Juego], [Nombre], [Genero], [Precio], [Estado_Lanzamiento], [imgURL], [nJuego]) VALUES (N'df69da5d-488f-4047-b702-9de8f016058b', N'Counter Strike', N'Acción', N'60.000', N'Comprar', N'/Assets/imgs/Catalogo/counterStrike.jpg', 17)
INSERT [dbo].[tbJuego] ([id_Juego], [Nombre], [Genero], [Precio], [Estado_Lanzamiento], [imgURL], [nJuego]) VALUES (N'c0a9a49d-a9a7-43a9-9214-a76801750066', N'Apex Legends', N'Acción', N'0', N'Comprar', N'/Assets/imgs/Catalogo/apex.jpg', 19)
INSERT [dbo].[tbJuego] ([id_Juego], [Nombre], [Genero], [Precio], [Estado_Lanzamiento], [imgURL], [nJuego]) VALUES (N'28c57cde-676a-45db-ade7-b6464779555d', N'For Honor', N'Acción', N'100.000', N'Comprar', N'/Assets/imgs/Catalogo/ForHonor.jpg', 8)
INSERT [dbo].[tbJuego] ([id_Juego], [Nombre], [Genero], [Precio], [Estado_Lanzamiento], [imgURL], [nJuego]) VALUES (N'0b9fd3cf-8925-4ed6-8970-c1b397613d4e', N'The Crew 2', N'Acción', N'90.000', N'Comprar', N'/Assets/imgs/Catalogo/TheCrew-2.jpg', 12)
INSERT [dbo].[tbJuego] ([id_Juego], [Nombre], [Genero], [Precio], [Estado_Lanzamiento], [imgURL], [nJuego]) VALUES (N'f5452e13-3ac6-42b7-8b94-dffce0af26e4', N'Assasins Creed Syndicate', N'Aventura', N'100.000', N'Comprar', N'/Assets/imgs/Catalogo/AssasinsCreed-Syndicate.jpg', 9)
INSERT [dbo].[tbJuego] ([id_Juego], [Nombre], [Genero], [Precio], [Estado_Lanzamiento], [imgURL], [nJuego]) VALUES (N'adf04991-f624-47ff-bcb7-e9188c8e4031', N'Call Of Duty Infinite Warfare', N'Acción', N'60.000', N'Comprar', N'/Assets/imgs/Catalogo/call-duty-infinite-warfare-caratula.jpg', 16)
INSERT [dbo].[tbJuego] ([id_Juego], [Nombre], [Genero], [Precio], [Estado_Lanzamiento], [imgURL], [nJuego]) VALUES (N'be4a419c-6e23-463e-a97e-eec3903e0e90', N'Assasins Creed Valhalla', N'Aventura', N'150.000', N'Reservar', N'/Assets/imgs/Catalogo/AssasinsCreed-Valhalla.jpg', 10)
SET IDENTITY_INSERT [dbo].[tbJuego] OFF
GO
INSERT [dbo].[tbUsuario] ([id_Usuario], [Nombre], [Apellido], [Cedula], [Correo], [Telefono], [Tipo], [Contraseña], [OlvidoCon]) VALUES (N'd1bb70f1-f5e4-4122-bd64-0871f3448226', N'Cristian', N'Osorio', N'789456123', N'caosoriog@uao.edu.co', N'', N'0', N'Cosorio1', N'no')
INSERT [dbo].[tbUsuario] ([id_Usuario], [Nombre], [Apellido], [Cedula], [Correo], [Telefono], [Tipo], [Contraseña], [OlvidoCon]) VALUES (N'9dba1be4-ddc4-4a9e-b199-2a37c2073632', N'Pedro', N'Alcachofa', N'7494', N'alcacho@hotmail.com', N'', N'0', N'Chechonito14', N'no')
INSERT [dbo].[tbUsuario] ([id_Usuario], [Nombre], [Apellido], [Cedula], [Correo], [Telefono], [Tipo], [Contraseña], [OlvidoCon]) VALUES (N'8ab61f32-3d44-4291-9bab-417a8ece6fc4', N'Nicolas', N'adasd', N'1006107087', N'56464@hotmail.com', N'', N'1', N'Chechonito14', N'no')
INSERT [dbo].[tbUsuario] ([id_Usuario], [Nombre], [Apellido], [Cedula], [Correo], [Telefono], [Tipo], [Contraseña], [OlvidoCon]) VALUES (N'0800ad92-8899-4564-8b36-49e2c403a534', N'lolita', N'lamaso', N'979494', N'lamaso@hotmail.com', N'', N'0', N'Chechonito14', N'no')
INSERT [dbo].[tbUsuario] ([id_Usuario], [Nombre], [Apellido], [Cedula], [Correo], [Telefono], [Tipo], [Contraseña], [OlvidoCon]) VALUES (N'b86b0654-3479-4a1a-9f4c-4c5f8efedcda', N'Nicolas', N'Escobar', N'5495641', N'nicolasescobar@gmail.com', N'41564165', N'1', N'Chechonito14', N'no')
INSERT [dbo].[tbUsuario] ([id_Usuario], [Nombre], [Apellido], [Cedula], [Correo], [Telefono], [Tipo], [Contraseña], [OlvidoCon]) VALUES (N'c814284c-5fad-4e88-8888-7eab597eef46', N'Ricardo', N'Escobar', N'6646213', N'ricardocreativo@hotmail.com', N'3206934342', N'1', N'Martinico79', N'no')
INSERT [dbo].[tbUsuario] ([id_Usuario], [Nombre], [Apellido], [Cedula], [Correo], [Telefono], [Tipo], [Contraseña], [OlvidoCon]) VALUES (N'9f64863b-0b9d-4c99-9c6d-986a66ee4ba2', N'Martin', N'Escobar', N'1193581153', N'martinale4@hotmail.com', N'3158857986', N'0', N'Nicolas5528', N'no')
INSERT [dbo].[tbUsuario] ([id_Usuario], [Nombre], [Apellido], [Cedula], [Correo], [Telefono], [Tipo], [Contraseña], [OlvidoCon]) VALUES (N'ad5b7aa4-a233-493d-9b8e-c6bb6d2dc747', N'Juan', N'Rivera', N'123456789', N'juanpari1766@gmail.com', N'123456789', N'0', N'juan0507', N'no')
INSERT [dbo].[tbUsuario] ([id_Usuario], [Nombre], [Apellido], [Cedula], [Correo], [Telefono], [Tipo], [Contraseña], [OlvidoCon]) VALUES (N'7f2df6fc-f434-4701-8bab-d22a0e7535d5', N'chicha', N'mfpdkj', N'5441', N'chicha@hotmail.com', N'656144', N'1', N'Chechonito14', N'no')
GO
ALTER TABLE [dbo].[tbDetalle] ADD  CONSTRAINT [DF_tbDetalle_id_Detalle]  DEFAULT (newid()) FOR [id_Detalle]
GO
ALTER TABLE [dbo].[tbJuego] ADD  CONSTRAINT [DF_tbJuego_id_Juego]  DEFAULT (newid()) FOR [id_Juego]
GO
ALTER TABLE [dbo].[tbUsuario] ADD  CONSTRAINT [DF_tbUsuario_id_Usuario]  DEFAULT (newid()) FOR [id_Usuario]
GO
ALTER TABLE [dbo].[tbDetalle]  WITH CHECK ADD  CONSTRAINT [FKtbDetalle_tbFactura] FOREIGN KEY([id_Factura])
REFERENCES [dbo].[tbFactura] ([id_Factura])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbDetalle] CHECK CONSTRAINT [FKtbDetalle_tbFactura]
GO
ALTER TABLE [dbo].[tbDetalle]  WITH CHECK ADD  CONSTRAINT [FKtbDetalle_tbJuego] FOREIGN KEY([id_Juego])
REFERENCES [dbo].[tbJuego] ([id_Juego])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbDetalle] CHECK CONSTRAINT [FKtbDetalle_tbJuego]
GO
ALTER TABLE [dbo].[tbFactura]  WITH CHECK ADD  CONSTRAINT [FKtbFactura_tbUsuario] FOREIGN KEY([id_Usuario])
REFERENCES [dbo].[tbUsuario] ([id_Usuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbFactura] CHECK CONSTRAINT [FKtbFactura_tbUsuario]
GO
USE [master]
GO
ALTER DATABASE [PGGaames] SET  READ_WRITE 
GO
