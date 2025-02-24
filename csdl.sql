USE [master]
GO
/****** Object:  Database [QlCoffee]    Script Date: 05/12/2022 9:44:09 am ******/
CREATE DATABASE [QlCoffee]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QlCoffee', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QlCoffee.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QlCoffee_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QlCoffee_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QlCoffee] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QlCoffee].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QlCoffee] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QlCoffee] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QlCoffee] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QlCoffee] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QlCoffee] SET ARITHABORT OFF 
GO
ALTER DATABASE [QlCoffee] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QlCoffee] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QlCoffee] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QlCoffee] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QlCoffee] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QlCoffee] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QlCoffee] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QlCoffee] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QlCoffee] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QlCoffee] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QlCoffee] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QlCoffee] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QlCoffee] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QlCoffee] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QlCoffee] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QlCoffee] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QlCoffee] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QlCoffee] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QlCoffee] SET  MULTI_USER 
GO
ALTER DATABASE [QlCoffee] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QlCoffee] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QlCoffee] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QlCoffee] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QlCoffee] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QlCoffee] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QlCoffee] SET QUERY_STORE = OFF
GO
USE [QlCoffee]
GO
/****** Object:  Table [dbo].[Ban]    Script Date: 05/12/2022 9:44:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ban](
	[MaBan] [int] NOT NULL,
	[MaKhuVuc] [int] NOT NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CaLamViec]    Script Date: 05/12/2022 9:44:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaLamViec](
	[MaCaLV] [int] IDENTITY(1,1) NOT NULL,
	[BatDau] [nvarchar](50) NOT NULL,
	[KetThuc] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](255) NOT NULL,
	[TenCaLV] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCaLV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 05/12/2022 9:44:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaNhanVien] [int] NULL,
	[MaBan] [int] NULL,
	[GhiChu] [nvarchar](255) NOT NULL,
	[TrangThai] [bit] NULL,
	[NgayThanhToan] [date] NULL,
	[ThanhTien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonChiTiet]    Script Date: 05/12/2022 9:44:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonChiTiet](
	[MaHoaDonCT] [int] IDENTITY(1,1) NOT NULL,
	[MaHoaDon] [int] NULL,
	[SoLuongSP] [int] NOT NULL,
	[MaSanPham] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDonCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhoHang]    Script Date: 05/12/2022 9:44:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoHang](
	[MaKhoHang] [int] IDENTITY(1,1) NOT NULL,
	[MaSanPham] [int] NULL,
	[NgayNhap] [date] NOT NULL,
	[MaNhanVien] [int] NULL,
	[SoLuong] [int] NULL,
	[GhiChu] [nvarchar](255) NULL,
	[HanSuDung] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhoHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuVuc]    Script Date: 05/12/2022 9:44:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuVuc](
	[MaKhuVuc] [int] IDENTITY(1,1) NOT NULL,
	[TenKhuVuc] [nvarchar](50) NOT NULL,
	[ViTri] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhuVuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 05/12/2022 9:44:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSP] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiSP] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 05/12/2022 9:44:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
	[VaiTro] [bit] NULL,
	[NgaySinh] [date] NOT NULL,
	[GioiTinh] [bit] NULL,
	[Email] [nvarchar](50) NOT NULL,
	[DienThoai] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](255) NULL,
	[MaCaLV] [int] NULL,
	[SoNgayLV] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 05/12/2022 9:44:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](50) NOT NULL,
	[MaLoaiSP] [int] NOT NULL,
	[GiaBan] [float] NOT NULL,
	[TrangThai] [bit] NULL,
	[GhiChu] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Ban] ([MaBan], [MaKhuVuc], [TrangThai]) VALUES (13, 2, 1)
INSERT [dbo].[Ban] ([MaBan], [MaKhuVuc], [TrangThai]) VALUES (14, 3, 1)
INSERT [dbo].[Ban] ([MaBan], [MaKhuVuc], [TrangThai]) VALUES (15, 4, 0)
INSERT [dbo].[Ban] ([MaBan], [MaKhuVuc], [TrangThai]) VALUES (16, 5, 0)
INSERT [dbo].[Ban] ([MaBan], [MaKhuVuc], [TrangThai]) VALUES (19, 1, 0)
INSERT [dbo].[Ban] ([MaBan], [MaKhuVuc], [TrangThai]) VALUES (28, 5, 0)
GO
SET IDENTITY_INSERT [dbo].[CaLamViec] ON 

INSERT [dbo].[CaLamViec] ([MaCaLV], [BatDau], [KetThuc], [GhiChu], [TenCaLV]) VALUES (1, N'00:00', N'00:00', N'', N'Full')
INSERT [dbo].[CaLamViec] ([MaCaLV], [BatDau], [KetThuc], [GhiChu], [TenCaLV]) VALUES (2, N'7.00', N'11.30', N'Lam Chuyen Can', N'Ca1')
INSERT [dbo].[CaLamViec] ([MaCaLV], [BatDau], [KetThuc], [GhiChu], [TenCaLV]) VALUES (3, N'13.00', N'15.30', N'Lam Dung Gio', N'Ca2')
INSERT [dbo].[CaLamViec] ([MaCaLV], [BatDau], [KetThuc], [GhiChu], [TenCaLV]) VALUES (4, N'7.00', N'11.30', N'Lam Dung Gio', N'Ca3')
INSERT [dbo].[CaLamViec] ([MaCaLV], [BatDau], [KetThuc], [GhiChu], [TenCaLV]) VALUES (5, N'7.00', N'11.30', N'Lam Rat Tot', N'Ca4')
INSERT [dbo].[CaLamViec] ([MaCaLV], [BatDau], [KetThuc], [GhiChu], [TenCaLV]) VALUES (6, N'13.00', N'15.30', N'Lam Nhiet Tinh', N'Ca5')
SET IDENTITY_INSERT [dbo].[CaLamViec] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNhanVien], [MaBan], [GhiChu], [TrangThai], [NgayThanhToan], [ThanhTien]) VALUES (8, 4, 13, N'Chua ODER', 0, CAST(N'2022-07-11' AS Date), 4546)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNhanVien], [MaBan], [GhiChu], [TrangThai], [NgayThanhToan], [ThanhTien]) VALUES (9, 4, 14, N'Da ODER', 0, CAST(N'2022-07-11' AS Date), 546546)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNhanVien], [MaBan], [GhiChu], [TrangThai], [NgayThanhToan], [ThanhTien]) VALUES (10, 4, 15, N'Da ODER', 0, CAST(N'2022-08-11' AS Date), 54654)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNhanVien], [MaBan], [GhiChu], [TrangThai], [NgayThanhToan], [ThanhTien]) VALUES (11, 4, 16, N'Da ODER', 0, CAST(N'2022-08-11' AS Date), 65655)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNhanVien], [MaBan], [GhiChu], [TrangThai], [NgayThanhToan], [ThanhTien]) VALUES (12, 4, 19, N'Da ODER', 0, CAST(N'2022-09-11' AS Date), 54654)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNhanVien], [MaBan], [GhiChu], [TrangThai], [NgayThanhToan], [ThanhTien]) VALUES (13, 2, 28, N'', 1, CAST(N'2022-12-05' AS Date), 20)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDonChiTiet] ON 

INSERT [dbo].[HoaDonChiTiet] ([MaHoaDonCT], [MaHoaDon], [SoLuongSP], [MaSanPham]) VALUES (6, 8, 3, 1)
INSERT [dbo].[HoaDonChiTiet] ([MaHoaDonCT], [MaHoaDon], [SoLuongSP], [MaSanPham]) VALUES (7, 9, 2, 4)
INSERT [dbo].[HoaDonChiTiet] ([MaHoaDonCT], [MaHoaDon], [SoLuongSP], [MaSanPham]) VALUES (8, 10, 7, 5)
INSERT [dbo].[HoaDonChiTiet] ([MaHoaDonCT], [MaHoaDon], [SoLuongSP], [MaSanPham]) VALUES (9, 11, 5, 3)
INSERT [dbo].[HoaDonChiTiet] ([MaHoaDonCT], [MaHoaDon], [SoLuongSP], [MaSanPham]) VALUES (10, 12, 4, 2)
INSERT [dbo].[HoaDonChiTiet] ([MaHoaDonCT], [MaHoaDon], [SoLuongSP], [MaSanPham]) VALUES (11, 13, 2, 1)
SET IDENTITY_INSERT [dbo].[HoaDonChiTiet] OFF
GO
SET IDENTITY_INSERT [dbo].[KhoHang] ON 

INSERT [dbo].[KhoHang] ([MaKhoHang], [MaSanPham], [NgayNhap], [MaNhanVien], [SoLuong], [GhiChu], [HanSuDung]) VALUES (1, 1, CAST(N'2022-10-10' AS Date), 4, 98, N'kho hang moi nhap', CAST(N'2022-10-11' AS Date))
INSERT [dbo].[KhoHang] ([MaKhoHang], [MaSanPham], [NgayNhap], [MaNhanVien], [SoLuong], [GhiChu], [HanSuDung]) VALUES (2, 2, CAST(N'2022-07-09' AS Date), 4, 100, N'kho hang moi nhap', CAST(N'2022-07-10' AS Date))
INSERT [dbo].[KhoHang] ([MaKhoHang], [MaSanPham], [NgayNhap], [MaNhanVien], [SoLuong], [GhiChu], [HanSuDung]) VALUES (3, 3, CAST(N'2022-06-05' AS Date), 5, 0, N'kho hang moi nhap', CAST(N'2022-06-06' AS Date))
INSERT [dbo].[KhoHang] ([MaKhoHang], [MaSanPham], [NgayNhap], [MaNhanVien], [SoLuong], [GhiChu], [HanSuDung]) VALUES (4, 4, CAST(N'2022-11-10' AS Date), 5, 0, N'kho hang moi nhap', CAST(N'2022-10-10' AS Date))
INSERT [dbo].[KhoHang] ([MaKhoHang], [MaSanPham], [NgayNhap], [MaNhanVien], [SoLuong], [GhiChu], [HanSuDung]) VALUES (5, 5, CAST(N'2022-06-09' AS Date), 5, 0, N'kho hang moi nhap', CAST(N'2022-06-10' AS Date))
INSERT [dbo].[KhoHang] ([MaKhoHang], [MaSanPham], [NgayNhap], [MaNhanVien], [SoLuong], [GhiChu], [HanSuDung]) VALUES (6, 1, CAST(N'2022-10-10' AS Date), 4, 0, N'kho hang moi nhap', CAST(N'2022-10-11' AS Date))
INSERT [dbo].[KhoHang] ([MaKhoHang], [MaSanPham], [NgayNhap], [MaNhanVien], [SoLuong], [GhiChu], [HanSuDung]) VALUES (7, 2, CAST(N'2022-07-09' AS Date), 4, 0, N'kho hang moi nhap', CAST(N'2022-07-10' AS Date))
INSERT [dbo].[KhoHang] ([MaKhoHang], [MaSanPham], [NgayNhap], [MaNhanVien], [SoLuong], [GhiChu], [HanSuDung]) VALUES (8, 3, CAST(N'2022-06-05' AS Date), 5, 0, N'kho hang moi nhap', CAST(N'2022-06-06' AS Date))
INSERT [dbo].[KhoHang] ([MaKhoHang], [MaSanPham], [NgayNhap], [MaNhanVien], [SoLuong], [GhiChu], [HanSuDung]) VALUES (9, 4, CAST(N'2022-11-10' AS Date), 5, 0, N'kho hang moi nhap', CAST(N'2022-10-10' AS Date))
INSERT [dbo].[KhoHang] ([MaKhoHang], [MaSanPham], [NgayNhap], [MaNhanVien], [SoLuong], [GhiChu], [HanSuDung]) VALUES (10, 5, CAST(N'2022-06-09' AS Date), 5, 0, N'kho hang moi nhap', CAST(N'2022-06-10' AS Date))
INSERT [dbo].[KhoHang] ([MaKhoHang], [MaSanPham], [NgayNhap], [MaNhanVien], [SoLuong], [GhiChu], [HanSuDung]) VALUES (11, 1, CAST(N'2022-10-10' AS Date), 4, 0, N'kho hang moi nhap', CAST(N'2022-10-11' AS Date))
INSERT [dbo].[KhoHang] ([MaKhoHang], [MaSanPham], [NgayNhap], [MaNhanVien], [SoLuong], [GhiChu], [HanSuDung]) VALUES (12, 2, CAST(N'2022-07-09' AS Date), 4, 0, N'kho hang moi nhap', CAST(N'2022-07-10' AS Date))
INSERT [dbo].[KhoHang] ([MaKhoHang], [MaSanPham], [NgayNhap], [MaNhanVien], [SoLuong], [GhiChu], [HanSuDung]) VALUES (13, 3, CAST(N'2022-06-05' AS Date), 5, 0, N'kho hang moi nhap', CAST(N'2022-06-06' AS Date))
INSERT [dbo].[KhoHang] ([MaKhoHang], [MaSanPham], [NgayNhap], [MaNhanVien], [SoLuong], [GhiChu], [HanSuDung]) VALUES (14, 4, CAST(N'2022-11-10' AS Date), 5, 0, N'kho hang moi nhap', CAST(N'2022-10-10' AS Date))
INSERT [dbo].[KhoHang] ([MaKhoHang], [MaSanPham], [NgayNhap], [MaNhanVien], [SoLuong], [GhiChu], [HanSuDung]) VALUES (15, 5, CAST(N'2022-06-09' AS Date), 5, 0, N'kho hang moi nhap', CAST(N'2022-06-10' AS Date))
INSERT [dbo].[KhoHang] ([MaKhoHang], [MaSanPham], [NgayNhap], [MaNhanVien], [SoLuong], [GhiChu], [HanSuDung]) VALUES (16, 1, CAST(N'2022-10-10' AS Date), 4, 0, N'kho hang moi nhap', CAST(N'2022-10-11' AS Date))
INSERT [dbo].[KhoHang] ([MaKhoHang], [MaSanPham], [NgayNhap], [MaNhanVien], [SoLuong], [GhiChu], [HanSuDung]) VALUES (17, 2, CAST(N'2022-07-09' AS Date), 4, 0, N'kho hang moi nhap', CAST(N'2022-07-10' AS Date))
INSERT [dbo].[KhoHang] ([MaKhoHang], [MaSanPham], [NgayNhap], [MaNhanVien], [SoLuong], [GhiChu], [HanSuDung]) VALUES (18, 3, CAST(N'2022-06-05' AS Date), 5, 0, N'kho hang moi nhap', CAST(N'2022-06-06' AS Date))
INSERT [dbo].[KhoHang] ([MaKhoHang], [MaSanPham], [NgayNhap], [MaNhanVien], [SoLuong], [GhiChu], [HanSuDung]) VALUES (19, 4, CAST(N'2022-11-10' AS Date), 5, 0, N'kho hang moi nhap', CAST(N'2022-10-10' AS Date))
INSERT [dbo].[KhoHang] ([MaKhoHang], [MaSanPham], [NgayNhap], [MaNhanVien], [SoLuong], [GhiChu], [HanSuDung]) VALUES (20, 5, CAST(N'2022-06-09' AS Date), 5, 0, N'kho hang moi nhap', CAST(N'2022-06-10' AS Date))
SET IDENTITY_INSERT [dbo].[KhoHang] OFF
GO
SET IDENTITY_INSERT [dbo].[KhuVuc] ON 

INSERT [dbo].[KhuVuc] ([MaKhuVuc], [TenKhuVuc], [ViTri], [GhiChu]) VALUES (1, N'KhuA', N'ViTri', N'Khu Vip')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [TenKhuVuc], [ViTri], [GhiChu]) VALUES (2, N'KhuB', N'ViTri', N'Khu Dan Gia')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [TenKhuVuc], [ViTri], [GhiChu]) VALUES (3, N'KhuC', N'ViTri', N'Khu Vip')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [TenKhuVuc], [ViTri], [GhiChu]) VALUES (4, N'KhuD', N'ViTri', N'Khu Vip')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [TenKhuVuc], [ViTri], [GhiChu]) VALUES (5, N'KhuE', N'ViTri', N'Khu Dan Gia')
SET IDENTITY_INSERT [dbo].[KhuVuc] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON 

INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (2, N'Bobapop')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (5, N'Ding Tea')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (4, N'Gong Cha')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (9, N'KOI')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (3, N'The Alley')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (1, N'Tocotoco')
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [MatKhau], [VaiTro], [NgaySinh], [GioiTinh], [Email], [DienThoai], [GhiChu], [MaCaLV], [SoNgayLV]) VALUES (2, N'Nguyen Van Anh', N'111', 0, CAST(N'2000-10-10' AS Date), 0, N'Anh@Gmail.com', N'01639656985', N'nhan vien dang ky lam viec', 1, 0)
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [MatKhau], [VaiTro], [NgaySinh], [GioiTinh], [Email], [DienThoai], [GhiChu], [MaCaLV], [SoNgayLV]) VALUES (3, N'Tran Quoc Toan', N'222', 0, CAST(N'1999-01-05' AS Date), 0, N'Toan@Gmail.com', N'09686532145', N'nhan vien dang ky lam viec', 2, 0)
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [MatKhau], [VaiTro], [NgaySinh], [GioiTinh], [Email], [DienThoai], [GhiChu], [MaCaLV], [SoNgayLV]) VALUES (4, N'Phan Tran Hung', N'333', 0, CAST(N'1998-09-12' AS Date), 0, N'Hung@Gmail.com', N'0987696585', N'nhan vien dang ky lam viec', 3, 0)
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [MatKhau], [VaiTro], [NgaySinh], [GioiTinh], [Email], [DienThoai], [GhiChu], [MaCaLV], [SoNgayLV]) VALUES (5, N'Ly Thanh Long', N'444', 0, CAST(N'2000-03-05' AS Date), 0, N'Long@Gmail.com', N'01624545454', N'nhan vien dang ky lam viec', 4, 0)
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [MatKhau], [VaiTro], [NgaySinh], [GioiTinh], [Email], [DienThoai], [GhiChu], [MaCaLV], [SoNgayLV]) VALUES (6, N'Luong Son Ba', N'555', 0, CAST(N'1998-07-01' AS Date), 0, N'Ba@Gmail.com', N'01635696857', N'nhan vien dang ky lam viec', 5, 0)
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [MatKhau], [VaiTro], [NgaySinh], [GioiTinh], [Email], [DienThoai], [GhiChu], [MaCaLV], [SoNgayLV]) VALUES (8, N'huyen', N'huyen', 0, CAST(N'2000-06-23' AS Date), 1, N'huyenlethi05@gmail.com', N'0987654334', N'ko co', 1, 0)
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [MatKhau], [VaiTro], [NgaySinh], [GioiTinh], [Email], [DienThoai], [GhiChu], [MaCaLV], [SoNgayLV]) VALUES (9, N'hieu', N'hieu', 1, CAST(N'2000-12-12' AS Date), 0, N'hieu@gmail.com', N'0847763378', N'', 1, 0)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaLoaiSP], [GiaBan], [TrangThai], [GhiChu]) VALUES (1, N'Trà sữa chân châu', 1, 10, 0, N'Con Hang')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaLoaiSP], [GiaBan], [TrangThai], [GhiChu]) VALUES (2, N'Trà sữa chân châu đường đen', 3, 10, 0, N'Het Hang')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaLoaiSP], [GiaBan], [TrangThai], [GhiChu]) VALUES (3, N'Trà sữa vị đào', 4, 10, 0, N'Con Hang')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaLoaiSP], [GiaBan], [TrangThai], [GhiChu]) VALUES (4, N'Trà sữa vị dưa hấu', 2, 10, 0, N'Con Hang')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaLoaiSP], [GiaBan], [TrangThai], [GhiChu]) VALUES (5, N'Trà sữa vị cam', 5, 10, 0, N'Con Hang')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaLoaiSP], [GiaBan], [TrangThai], [GhiChu]) VALUES (6, N'Trà sữa vị trái cây', 1, 10, 0, N'Con Hang')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaLoaiSP], [GiaBan], [TrangThai], [GhiChu]) VALUES (7, N'Trà sữa vị táo', 3, 10, 0, N'Het Hang')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaLoaiSP], [GiaBan], [TrangThai], [GhiChu]) VALUES (8, N'Trà nhài', 4, 10, 0, N'Con Hang')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaLoaiSP], [GiaBan], [TrangThai], [GhiChu]) VALUES (9, N'Ca Phe', 2, 10, 0, N'Con Hang')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaLoaiSP], [GiaBan], [TrangThai], [GhiChu]) VALUES (10, N'Tra Sua', 5, 10, 0, N'Con Hang')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaLoaiSP], [GiaBan], [TrangThai], [GhiChu]) VALUES (11, N'Trà sữa Phúc Long', 1, 10, 0, N'Con Hang')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaLoaiSP], [GiaBan], [TrangThai], [GhiChu]) VALUES (12, N'Trà sữa thạch trái cây', 3, 10, 0, N'Het Hang')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaLoaiSP], [GiaBan], [TrangThai], [GhiChu]) VALUES (13, N'Trà sữa mật ong', 4, 10, 0, N'Con Hang')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaLoaiSP], [GiaBan], [TrangThai], [GhiChu]) VALUES (14, N'Trà sữa trà xanh', 2, 10, 0, N'Con Hang')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaLoaiSP], [GiaBan], [TrangThai], [GhiChu]) VALUES (15, N'Trà sữa socola', 5, 10, 0, N'Con Hang')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaLoaiSP], [GiaBan], [TrangThai], [GhiChu]) VALUES (16, N'Trà sữa Olong', 1, 10, 0, N'Con Hang')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaLoaiSP], [GiaBan], [TrangThai], [GhiChu]) VALUES (17, N'Trà sữa chanh dây', 3, 10, 0, N'Het Hang')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaLoaiSP], [GiaBan], [TrangThai], [GhiChu]) VALUES (18, N'Trà sữa vị xoài', 4, 10, 0, N'Con Hang')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaLoaiSP], [GiaBan], [TrangThai], [GhiChu]) VALUES (19, N'Trà sữa dâu', 2, 10, 0, N'Con Hang')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaLoaiSP], [GiaBan], [TrangThai], [GhiChu]) VALUES (20, N'Trà sữa nguyên bản', 5, 10, 0, N'Con Hang')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CaLamVie__6725804FE1CCE03D]    Script Date: 05/12/2022 9:44:10 am ******/
ALTER TABLE [dbo].[CaLamViec] ADD UNIQUE NONCLUSTERED 
(
	[TenCaLV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KhuVuc__258A8CB3CE9D0F3D]    Script Date: 05/12/2022 9:44:10 am ******/
ALTER TABLE [dbo].[KhuVuc] ADD UNIQUE NONCLUSTERED 
(
	[TenKhuVuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__LoaiSanP__F434DB4972A77FDD]    Script Date: 05/12/2022 9:44:10 am ******/
ALTER TABLE [dbo].[LoaiSanPham] ADD UNIQUE NONCLUSTERED 
(
	[TenLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NhanVien__1F031876909450E5]    Script Date: 05/12/2022 9:44:10 am ******/
ALTER TABLE [dbo].[NhanVien] ADD UNIQUE NONCLUSTERED 
(
	[DienThoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NhanVien__A9D10534715384D2]    Script Date: 05/12/2022 9:44:10 am ******/
ALTER TABLE [dbo].[NhanVien] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ban] ADD  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[KhoHang] ADD  DEFAULT ((0)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[NhanVien] ADD  DEFAULT ((0)) FOR [VaiTro]
GO
ALTER TABLE [dbo].[NhanVien] ADD  DEFAULT ((0)) FOR [GioiTinh]
GO
ALTER TABLE [dbo].[NhanVien] ADD  DEFAULT ((0)) FOR [SoNgayLV]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[Ban]  WITH CHECK ADD FOREIGN KEY([MaKhuVuc])
REFERENCES [dbo].[KhuVuc] ([MaKhuVuc])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([MaBan])
REFERENCES [dbo].[Ban] ([MaBan])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[KhoHang]  WITH CHECK ADD FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[KhoHang]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD FOREIGN KEY([MaCaLV])
REFERENCES [dbo].[CaLamViec] ([MaCaLV])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSP])
GO
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD CHECK  (([SoLuongSP]>=(0)))
GO
ALTER TABLE [dbo].[KhoHang]  WITH CHECK ADD CHECK  (([SoLuong]>=(0)))
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([GiaBan]>=(0)))
GO
/****** Object:  StoredProcedure [dbo].[sp_ThongKeDoanhThu]    Script Date: 05/12/2022 9:44:10 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ThongKeDoanhThu]
AS BEGIN
SELECT
	YEAR(NgayThanhToan),
	SUM(ThanhTien)
	from HoaDon 
	Group by YEAR(NgayThanhToan)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ThongKeDoanhThuTheoThang]    Script Date: 05/12/2022 9:44:10 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_ThongKeDoanhThuTheoThang]
AS BEGIN
SELECT
	NgayThanhToan,
	SUM(ThanhTien)
	from HoaDon 
	Group by NgayThanhToan
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ThongKeKhoHang]    Script Date: 05/12/2022 9:44:10 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ThongKeKhoHang]
AS BEGIN
SELECT 
MaSanPham, 
SUM(SoLuongSP) 
FROM HoaDonChiTiet 
GROUP BY MaSanPham
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ThongKeNhanVien]    Script Date: 05/12/2022 9:44:10 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_ThongKeNhanVien]
AS BEGIN
SELECT 
HoTen, 
SoNgayLV, 
VaiTro, 
MaCaLV 
FROM NhanVien
END
GO
USE [master]
GO
ALTER DATABASE [QlCoffee] SET  READ_WRITE 
GO
