USE [master]
GO
/****** Object:  Database [QLPhongKS]    Script Date: 2018-05-16 16:40:21 ******/
CREATE DATABASE [QLPhongKS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLPhongKS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLPhongKS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLPhongKS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLPhongKS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLPhongKS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLPhongKS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLPhongKS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLPhongKS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLPhongKS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLPhongKS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLPhongKS] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLPhongKS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLPhongKS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLPhongKS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLPhongKS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLPhongKS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLPhongKS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLPhongKS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLPhongKS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLPhongKS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLPhongKS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLPhongKS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLPhongKS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLPhongKS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLPhongKS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLPhongKS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLPhongKS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLPhongKS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLPhongKS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLPhongKS] SET  MULTI_USER 
GO
ALTER DATABASE [QLPhongKS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLPhongKS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLPhongKS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLPhongKS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLPhongKS] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QLPhongKS]
GO
/****** Object:  Table [dbo].[DatPhong]    Script Date: 2018-05-16 16:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatPhong](
	[IDDatPhong] [int] IDENTITY(1,1) NOT NULL,
	[TuNgay] [date] NULL,
	[DenNgay] [date] NULL,
	[IDPhong] [int] NULL,
	[SoNgay] [int] NULL,
	[TrangThai] [nvarchar](50) NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SoNguoi] [int] NULL,
	[Vetify] [nvarchar](50) NULL,
	[HSD] [datetime] NULL,
	[NgayTao] [datetime] NULL,
	[XuLiLuc] [datetime] NULL,
	[NguoiXuLi] [int] NULL,
 CONSTRAINT [PK_DatPhong] PRIMARY KEY CLUSTERED 
(
	[IDDatPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 2018-05-16 16:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[IDDichVu] [int] IDENTITY(1,1) NOT NULL,
	[TenDichVu] [nvarchar](50) NULL,
	[Active] [bit] NULL,
	[Delete] [bit] NULL,
	[MoTa] [nvarchar](3000) NULL,
	[GiaTien] [decimal](18, 0) NULL,
 CONSTRAINT [PK_DichVu] PRIMARY KEY CLUSTERED 
(
	[IDDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiaPhong]    Script Date: 2018-05-16 16:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaPhong](
	[IDGiaPhong] [int] IDENTITY(1,1) NOT NULL,
	[IDPhong] [int] NULL,
	[TenLoai] [nvarchar](50) NULL,
	[GiaDem] [decimal](18, 0) NULL,
	[CuoiTuan] [decimal](18, 0) NULL,
	[Tuan] [decimal](18, 0) NULL,
	[Thang] [decimal](18, 0) NULL,
	[NgayLe] [decimal](18, 0) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_GiaPhong] PRIMARY KEY CLUSTERED 
(
	[IDGiaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GioiThieu]    Script Date: 2018-05-16 16:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioiThieu](
	[IDGioiThieu] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](500) NULL,
	[HinhAnh] [nvarchar](500) NULL,
	[HinhAnh2] [nvarchar](500) NULL,
	[HinhAnh3] [nvarchar](500) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[ThuTu] [tinyint] NULL,
 CONSTRAINT [PK_GioiThieu] PRIMARY KEY CLUSTERED 
(
	[IDGioiThieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ImagePhong]    Script Date: 2018-05-16 16:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImagePhong](
	[IDImageHome] [int] IDENTITY(1,1) NOT NULL,
	[Rank] [tinyint] NULL,
	[Link] [nvarchar](500) NULL,
	[Active] [bit] NULL,
	[IDPhong] [int] NULL,
	[TieuDe] [nvarchar](500) NULL,
 CONSTRAINT [PK_ImageHome] PRIMARY KEY CLUSTERED 
(
	[IDImageHome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phong]    Script Date: 2018-05-16 16:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[IDPhong] [int] IDENTITY(1,1) NOT NULL,
	[TenPhong] [nvarchar](50) NULL,
	[TomTat] [nvarchar](2000) NULL,
	[Anh] [nvarchar](500) NULL,
	[Active] [bit] NULL,
	[Delete] [bit] NULL,
	[GiaCoBan] [decimal](18, 0) NULL,
	[SoNguoiToiDa] [int] NULL,
	[DienTich] [float] NULL,
	[KhungCanh] [nvarchar](50) NULL,
	[Giuong] [nvarchar](50) NULL,
 CONSTRAINT [PK_Phong] PRIMARY KEY CLUSTERED 
(
	[IDPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SuKien]    Script Date: 2018-05-16 16:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuKien](
	[IDSuKien] [int] IDENTITY(1,1) NOT NULL,
	[AnhNen] [nvarchar](500) NULL,
	[TieuDe] [nvarchar](500) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[NgayToChuc] [datetime] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_SuKien] PRIMARY KEY CLUSTERED 
(
	[IDSuKien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 2018-05-16 16:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[IDTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Avatar] [nvarchar](500) NULL,
	[FullName] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[Adress] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[POSITION] [nvarchar](50) NULL,
	[Active] [bit] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[IDTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[DichVu] ON 

INSERT [dbo].[DichVu] ([IDDichVu], [TenDichVu], [Active], [Delete], [MoTa], [GiaTien]) VALUES (1, N'PACKAGE STANDAR', 1, 0, N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.', CAST(330 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([IDDichVu], [TenDichVu], [Active], [Delete], [MoTa], [GiaTien]) VALUES (2, N'PACKAGE STANDAR', NULL, NULL, N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.', CAST(330 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([IDDichVu], [TenDichVu], [Active], [Delete], [MoTa], [GiaTien]) VALUES (3, N'PACKAGE STANDAR', NULL, NULL, N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.', CAST(330 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([IDDichVu], [TenDichVu], [Active], [Delete], [MoTa], [GiaTien]) VALUES (4, N'PACKAGE STANDAR', NULL, NULL, N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.', CAST(330 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[DichVu] OFF
SET IDENTITY_INSERT [dbo].[GiaPhong] ON 

INSERT [dbo].[GiaPhong] ([IDGiaPhong], [IDPhong], [TenLoai], [GiaDem], [CuoiTuan], [Tuan], [Thang], [NgayLe], [Active]) VALUES (1, 5, N'Cơ bản', CAST(123 AS Decimal(18, 0)), CAST(23 AS Decimal(18, 0)), CAST(123 AS Decimal(18, 0)), CAST(123 AS Decimal(18, 0)), CAST(123 AS Decimal(18, 0)), 1)
INSERT [dbo].[GiaPhong] ([IDGiaPhong], [IDPhong], [TenLoai], [GiaDem], [CuoiTuan], [Tuan], [Thang], [NgayLe], [Active]) VALUES (2, 5, N'Mùa hè', CAST(123 AS Decimal(18, 0)), CAST(123 AS Decimal(18, 0)), CAST(123 AS Decimal(18, 0)), CAST(123 AS Decimal(18, 0)), CAST(123 AS Decimal(18, 0)), 1)
INSERT [dbo].[GiaPhong] ([IDGiaPhong], [IDPhong], [TenLoai], [GiaDem], [CuoiTuan], [Tuan], [Thang], [NgayLe], [Active]) VALUES (4, 6, N'3', CAST(3 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[GiaPhong] OFF
SET IDENTITY_INSERT [dbo].[GioiThieu] ON 

INSERT [dbo].[GioiThieu] ([IDGioiThieu], [TieuDe], [HinhAnh], [HinhAnh2], [HinhAnh3], [NoiDung], [ThuTu]) VALUES (1, N'WHY GUEST CHOOSE SKYLINE HOTEL?', N'/Content/Upload/05052018014432_about-3.jpg', N'/Content/Upload/05052018014432_about-3.jpg', N'/Content/Upload/05052018014432_about-3.jpg', N'<p>Contrary to popular belief, Lorem isn&rsquo;t simply random text. It has roots in a of classical Latin literature from 45 BC, making it over 2000 years old. Avalon&rsquo;s leading hotels with gracious island hospitality, thoughtful amenities and distinctive Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage ...</p>
', NULL)
INSERT [dbo].[GioiThieu] ([IDGioiThieu], [TieuDe], [HinhAnh], [HinhAnh2], [HinhAnh3], [NoiDung], [ThuTu]) VALUES (2, N'1', N'/Content/Upload/05052018014219_about-3.jpg', N'/Content/Upload/05052018014219_about-3.jpg', N'/Content/Upload/05052018014219_about-3.jpg', N'<p>Contrary to popular belief, Lorem isn&rsquo;t simply random text. It has roots in a of classical Latin literature from 45 BC, making it over 2000 years old. Avalon&rsquo;s leading hotels with gracious island hospitality, thoughtful amenities and distinctive Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage ...</p>
', NULL)
INSERT [dbo].[GioiThieu] ([IDGioiThieu], [TieuDe], [HinhAnh], [HinhAnh2], [HinhAnh3], [NoiDung], [ThuTu]) VALUES (3, N'3', N'/Content/Upload/05052018015508_Ok_40px.png', N'/Content/Upload/05052018015508_Bed_64px.png', N'/Content/Upload/05052018015508_Ok_40px.png', N'<p>3</p>
', NULL)
SET IDENTITY_INSERT [dbo].[GioiThieu] OFF
SET IDENTITY_INSERT [dbo].[ImagePhong] ON 

INSERT [dbo].[ImagePhong] ([IDImageHome], [Rank], [Link], [Active], [IDPhong], [TieuDe]) VALUES (1, NULL, N'/Content/Upload/05052018023831_marshmello-sd-1920x1080.jpg', 1, 5, N'Phòng đẹp')
INSERT [dbo].[ImagePhong] ([IDImageHome], [Rank], [Link], [Active], [IDPhong], [TieuDe]) VALUES (2, 2, N'/images/About/about-2.jpg', 1, 5, N'Phòng đẹp')
INSERT [dbo].[ImagePhong] ([IDImageHome], [Rank], [Link], [Active], [IDPhong], [TieuDe]) VALUES (3, 3, N'/images/About/about-2.jpg', 1, 5, N'Phòng đẹp')
INSERT [dbo].[ImagePhong] ([IDImageHome], [Rank], [Link], [Active], [IDPhong], [TieuDe]) VALUES (4, 4, N'/images/About/about-2.jpg', 1, 5, N'Phòng đẹp')
INSERT [dbo].[ImagePhong] ([IDImageHome], [Rank], [Link], [Active], [IDPhong], [TieuDe]) VALUES (5, 5, N'/images/About/about-2.jpg', 1, 5, N'Phòng đẹp')
INSERT [dbo].[ImagePhong] ([IDImageHome], [Rank], [Link], [Active], [IDPhong], [TieuDe]) VALUES (6, NULL, N'/Content/Upload/05052018023901_vinacomin.ico', NULL, 6, NULL)
SET IDENTITY_INSERT [dbo].[ImagePhong] OFF
SET IDENTITY_INSERT [dbo].[Phong] ON 

INSERT [dbo].[Phong] ([IDPhong], [TenPhong], [TomTat], [Anh], [Active], [Delete], [GiaCoBan], [SoNguoiToiDa], [DienTich], [KhungCanh], [Giuong]) VALUES (5, N'FAMILY ROOM', N'Located in the heart of Aspen with a unique blend of contemporary luxury and historic heritage, deluxe accommodations, superb amenities, genuine hospitality and dedicated service for an elevated experience in the Rocky Mountains.', N'/Content/Upload/05052018023844_Error_40px.png', 1, 0, CAST(330 AS Decimal(18, 0)), 2, 2, N'2', N'Giường đôi và giường đơn')
INSERT [dbo].[Phong] ([IDPhong], [TenPhong], [TomTat], [Anh], [Active], [Delete], [GiaCoBan], [SoNguoiToiDa], [DienTich], [KhungCanh], [Giuong]) VALUES (6, N'FAMILY ROOM', N'Located in the heart of Aspen with a unique blend of contemporary luxury and historic heritage, deluxe accommodations, superb amenities, genuine hospitality and dedicated service for an elevated experience in the Rocky Mountains.', N'/Content/Upload/05052018023910_27992937_1006276009546544_3137537314182050887_o.jpg', 1, 0, CAST(330 AS Decimal(18, 0)), 4, 4, N'4', N'4')
INSERT [dbo].[Phong] ([IDPhong], [TenPhong], [TomTat], [Anh], [Active], [Delete], [GiaCoBan], [SoNguoiToiDa], [DienTich], [KhungCanh], [Giuong]) VALUES (7, N'FAMILY ROOM', N'Located in the heart of Aspen with a unique blend of contemporary luxury and historic heritage, deluxe accommodations, superb amenities, genuine hospitality and dedicated service for an elevated experience in the Rocky Mountains.', N'http://landing.engotheme.com/html/skyline/demo/images/Room/room.jpg', 1, 0, CAST(330 AS Decimal(18, 0)), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Phong] OFF
SET IDENTITY_INSERT [dbo].[SuKien] ON 

INSERT [dbo].[SuKien] ([IDSuKien], [AnhNen], [TieuDe], [NoiDung], [NgayToChuc], [Active]) VALUES (1, N'/Content/Upload/05052018013714_27992937_1006276009546544_3137537314182050887_o.jpg', N'1', N'1', CAST(N'2018-05-05 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[SuKien] OFF
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([IDTaiKhoan], [Username], [Password], [Avatar], [FullName], [Birthday], [Adress], [Phone], [Email], [POSITION], [Active], [Description]) VALUES (1, N'admin', N'admin', N'/Content/Upload/img/09591302052018_setting48.png', N'Quản lý', CAST(N'1990-01-01' AS Date), N'Hà Nội', N'0987654321', N'QuanLy@gmail.com', N'ADMIN', 1, NULL)
INSERT [dbo].[TaiKhoan] ([IDTaiKhoan], [Username], [Password], [Avatar], [FullName], [Birthday], [Adress], [Phone], [Email], [POSITION], [Active], [Description]) VALUES (2, N'1', N'admin', N'/Content/Upload/img/04472528032018_heart.png', N'1', CAST(N'2018-03-28' AS Date), N'11', N'1', N'1@gmail.com', N'USER', NULL, N'1')
INSERT [dbo].[TaiKhoan] ([IDTaiKhoan], [Username], [Password], [Avatar], [FullName], [Birthday], [Adress], [Phone], [Email], [POSITION], [Active], [Description]) VALUES (3, N'1', N'1', N'1', N'12', CAST(N'1990-01-01' AS Date), N'11', N'1', N'1@gmail.com', N'1', 1, N'1')
INSERT [dbo].[TaiKhoan] ([IDTaiKhoan], [Username], [Password], [Avatar], [FullName], [Birthday], [Adress], [Phone], [Email], [POSITION], [Active], [Description]) VALUES (4, N'1', N'1', NULL, N'1', CAST(N'2018-05-02' AS Date), N'1', N'1', N'1@gmail.com', N'ADMIN', NULL, N'1')
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
ALTER TABLE [dbo].[DatPhong]  WITH CHECK ADD  CONSTRAINT [FK_DatPhong_Phong] FOREIGN KEY([IDPhong])
REFERENCES [dbo].[Phong] ([IDPhong])
GO
ALTER TABLE [dbo].[DatPhong] CHECK CONSTRAINT [FK_DatPhong_Phong]
GO
ALTER TABLE [dbo].[DatPhong]  WITH CHECK ADD  CONSTRAINT [FK_DatPhong_TaiKhoan] FOREIGN KEY([NguoiXuLi])
REFERENCES [dbo].[TaiKhoan] ([IDTaiKhoan])
GO
ALTER TABLE [dbo].[DatPhong] CHECK CONSTRAINT [FK_DatPhong_TaiKhoan]
GO
ALTER TABLE [dbo].[GiaPhong]  WITH CHECK ADD  CONSTRAINT [FK_GiaPhong_Phong] FOREIGN KEY([IDPhong])
REFERENCES [dbo].[Phong] ([IDPhong])
GO
ALTER TABLE [dbo].[GiaPhong] CHECK CONSTRAINT [FK_GiaPhong_Phong]
GO
ALTER TABLE [dbo].[ImagePhong]  WITH CHECK ADD  CONSTRAINT [FK_ImagePhong_Phong] FOREIGN KEY([IDPhong])
REFERENCES [dbo].[Phong] ([IDPhong])
GO
ALTER TABLE [dbo].[ImagePhong] CHECK CONSTRAINT [FK_ImagePhong_Phong]
GO
USE [master]
GO
ALTER DATABASE [QLPhongKS] SET  READ_WRITE 
GO
