USE [master]
GO
/****** Object:  Database ecommercenew    Script Date: 12/15/2022 8:47:17 PM ******/
CREATE DATABASE ecommercenew
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ecommerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ecommerce.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ecommerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ecommerce_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE ecommercenew SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC ecommercenew.[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE ecommercenew SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE ecommercenew SET ANSI_NULLS OFF 
GO
ALTER DATABASE ecommercenew SET ANSI_PADDING OFF 
GO
ALTER DATABASE ecommercenew SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE ecommercenew SET ARITHABORT OFF 
GO
ALTER DATABASE ecommercenew SET AUTO_CLOSE ON 
GO
ALTER DATABASE ecommercenew SET AUTO_SHRINK OFF 
GO
ALTER DATABASE ecommercenew SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE ecommercenew SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE ecommercenew SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE ecommercenew SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE ecommercenew SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE ecommercenew SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE ecommercenew SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE ecommercenew SET  ENABLE_BROKER 
GO
ALTER DATABASE ecommercenew SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE ecommercenew SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE ecommercenew SET TRUSTWORTHY OFF 
GO
ALTER DATABASE ecommercenew SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE ecommercenew SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE ecommercenew SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE ecommercenew SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE ecommercenew SET RECOVERY SIMPLE 
GO
ALTER DATABASE ecommercenew SET  MULTI_USER 
GO
ALTER DATABASE ecommercenew SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE ecommercenew SET DB_CHAINING OFF 
GO
ALTER DATABASE ecommercenew SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE ecommercenew SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE ecommercenew SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE ecommercenew SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE ecommercenew SET QUERY_STORE = OFF
GO
USE ecommercenew
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 12/15/2022 8:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[billId] [int] IDENTITY(1,1) NOT NULL,
	[total] [float] NULL,
	[date] [datetime] NULL,
	[cartId] [int] NULL,
	[userId] [int] NULL,
	[address] [nvarchar](500) NULL,
	[note] [nvarchar](500) NULL,
	[paymentmethod] [nvarchar](500) NULL,
	[fullname] [nvarchar](500) NULL,
	[email] [nvarchar](500) NULL,
	[phone] [nvarchar](500) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[billId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 12/15/2022 8:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cartId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[buyDate] [datetime] NULL,
	[status] [int] NULL,
	[storeId] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[cartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 12/15/2022 8:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[cartItemId] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[unitPrice] [float] NULL,
	[productId] [int] NULL,
	[cartId] [int] NULL,
 CONSTRAINT [PK_CartItem] PRIMARY KEY CLUSTERED 
(
	[cartItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/15/2022 8:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](200) NULL,
	[images] [nvarchar](500) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/15/2022 8:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](200) NULL,
	[productCode] [bigint] NULL,
	[categoryId] [int] NULL,
	[description] [nvarchar](500) NULL,
	[price] [float] NULL,
	[amount] [int] NULL,
	[stock] [int] NULL,
	[images] [nvarchar](500) NULL,
	[wishlist] [int] NULL,
	[status] [int] NULL,
	[createDate] [date] NULL,
	[storeId] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 12/15/2022 8:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[storeId] [int] IDENTITY(1,1) NOT NULL,
	[storeName] [nvarchar](50) NULL,
	[images] [nvarchar](500) NULL,
	[status] [int] NULL,
	[userId] [int] NULL,
 CONSTRAINT [PK_Seller] PRIMARY KEY CLUSTERED 
(
	[storeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 12/15/2022 8:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/15/2022 8:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[fullname] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[images] [nvarchar](500) NULL,
	[phone] [nvarchar](20) NULL,
	[status] [int] NULL,
	[code] [nvarchar](50) NULL,
	[roleId] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([categoryId], [categoryName], [images], [status]) VALUES (7, N'Thời Trang', N'https://cf.shopee.vn/file/687f3967b7c2fe6a134a2c11894eea4b_tn', 1)
INSERT [dbo].[Category] ([categoryId], [categoryName], [images], [status]) VALUES (8, N'Đồ Điện Tử', N'https://cf.shopee.vn/file/c3f3edfaa9f6dafc4825b77d8449999d_tn', 1)
INSERT [dbo].[Category] ([categoryId], [categoryName], [images], [status]) VALUES (9, N'Trang Sức', N'https://suckhoedoisong.qltns.mediacdn.vn/Images/bichvan/2017/01/25/bach-kim.png', 1)
INSERT [dbo].[Category] ([categoryId], [categoryName], [images], [status]) VALUES (10, N'Giày', N'https://cf.shopee.vn/file/74ca517e1fa74dc4d974e5d03c3139de_tn', 1)
INSERT [dbo].[Category] ([categoryId], [categoryName], [images], [status]) VALUES (11, N'Mẹ Và Bé', N'https://cf.shopee.vn/file/099edde1ab31df35bc255912bab54a5e_tn', 1)
INSERT [dbo].[Category] ([categoryId], [categoryName], [images], [status]) VALUES (12, N'Nhà Cửa Đời Sống', N'https://cf.shopee.vn/file/cd8e0d2e6c14c4904058ae20821d0763_tn', 1)
INSERT [dbo].[Category] ([categoryId], [categoryName], [images], [status]) VALUES (13, N'Sách', N'https://cf.shopee.vn/file/36013311815c55d303b0e6c62d6a8139_tn', 1)
INSERT [dbo].[Category] ([categoryId], [categoryName], [images], [status]) VALUES (14, N'Đồng Hồ', N'https://cf.shopee.vn/file/86c294aae72ca1db5f541790f7796260_tn', 1)
INSERT [dbo].[Category] ([categoryId], [categoryName], [images], [status]) VALUES (15, N'Máy Ảnh', N'https://cf.shopee.vn/file/ec14dd4fc238e676e43be2a911414d4d_tn', 1)
INSERT [dbo].[Category] ([categoryId], [categoryName], [images], [status]) VALUES (16, N'Xe Máy', N'https://cf.shopee.vn/file/3fb459e3449905545701b418e8220334_tn', 1)
INSERT [dbo].[Category] ([categoryId], [categoryName], [images], [status]) VALUES (17, N'Bánh Kẹo', N'https://cf.shopee.vn/file/c432168ee788f903f1ea024487f2c889_tn', 1)
INSERT [dbo].[Category] ([categoryId], [categoryName], [images], [status]) VALUES (18, N'Đồ Chơi', N'https://cf.shopee.vn/file/ce8f8abc726cafff671d0e5311caa684_tn', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (32, N'Áo Thun Cổ Tròn Thần Cổ Đại Anubis Ver11', 1, 7, N'', 120000, 10, 1, N'https://cdn2.yame.vn/pimg/ao-thun-co-tron-than-co-ai-anubis-ver11-0021761/89c49645-3f70-9d00-17cf-0019b5398189.jpg?w=540&h=756', 1, 1, CAST(N'2022-01-01' AS Date), 11)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (33, N'Áo Khoác Gile Y Nguyên Bản 18- Ver62', 2, 7, N'', 130000, 10, 1, N'https://cdn2.yame.vn/pimg/ao-khoac-gile-y-nguyen-ban-18--ver62-0021682/1224099b-8aa1-0200-a5e9-0019a4b03240.jpg?w=540&h=756', 1, 1, CAST(N'2022-01-01' AS Date), 11)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (34, N'Apple iPhone 13', 3, 8, NULL, 140000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/b7/ba/88/66059a54a3a139d45841d412379b1fe4.jpg.webp', 1, 1, CAST(N'2022-01-02' AS Date), 10)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (35, N'Laptop LG gram 14''''', 4, 8, NULL, 150000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/9d/b2/de/735d17158fa27e9ab548d9c415a0c010.png.webp', 1, 1, CAST(N'2022-01-02' AS Date), 10)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (36, N'Laptop Asus Vivobook A415EA', 5, 8, NULL, 160000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/9d/6d/7d/b839cea6885f2f0382d414df857b6fba.png.webp', 1, 1, CAST(N'2022-01-02' AS Date), 10)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (37, N'Smart Tivi Casper HD', 6, 8, NULL, 170000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/5f/9a/a7/2ad10132655e7d039fe0c5d7a5795295.png.webp', 1, 1, CAST(N'2022-01-02' AS Date), 10)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (38, N'Apple Watch Series 3 GPS Sport Band
', 7, 8, NULL, 180000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/media/catalog/producttmp/b2/0d/a8/4bcc99a1b3ada8856b2aa122c03b17bc.jpg.webp', 1, 1, CAST(N'2022-01-02' AS Date), 10)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (39, N'Chuột không dây bluetooth Logitech Signature M650', 8, 8, NULL, 190000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/5a/32/32/6cb651b40e04c1c6a4966a50f2540eaf.png.webp', 1, 1, CAST(N'2022-01-02' AS Date), 10)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (40, N'PKTT Nón Y Nguyên Bản Ver13', 9, 7, N'', 200000, 10, 1, N'https://cdn2.yame.vn/pimg/pktt-non-y-nguyen-ban-ver13-0021821/e8b6b5de-c01b-4401-1345-0019bac2f9ba.jpg?w=540&h=756', 1, 1, CAST(N'2022-01-05' AS Date), 11)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (41, N'Bàn Phím Cơ Bluetooth Không Dây K68BT Trục Cơ', 10, 8, NULL, 210000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/bc/47/6e/246762330d73dbac9bd53fa671637294.jpg.webp', 1, 1, CAST(N'2022-01-02' AS Date), 10)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (42, N'PKTT Nón Y Nguyên Bản Ver13', 11, 7, N'', 220000, 10, 1, N'https://cdn2.yame.vn/pimg/pktt-non-y-nguyen-ban-ver13-0021821/e8b6b5de-c01b-4401-1345-0019bac2f9ba.jpg?w=540&h=756', 1, 1, CAST(N'2022-01-05' AS Date), 11)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (43, N'Trang sức bạc nữ bộ trang sức nữ', 12, 9, NULL, 230000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/77/ab/2e/fb73b022d3ec688c83e57f90a3c76e84.png.webp', 1, 1, CAST(N'2022-01-05' AS Date), 11)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (44, N'Bộ trang sức 4 món lá mầm xanh', 13, 9, NULL, 240000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/7d/c7/f1/6532703f38d12114505ed43bca3d05b1.jpg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 11)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (45, N'Bộ Trang Sức Ngọc Trai TS24H NB2363 - Trắng', 14, 9, NULL, 250000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/2d/ed/7b/1c8dc17f821188fdf97f107daf2719ad.jpg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 11)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (46, N'Bộ trang sức 3 món trái tim BHB63', 15, 9, NULL, 260000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/b1/fa/b1/586960c9b80460b0410301b99634a4aa.jpg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 11)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (47, N'Bộ trang sức bạch kim pha lê giọt nước', 16, 9, NULL, 270000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/20/94/b7/a8aedfa9a1f5782ddb4ffde7bacde16e.jpg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 11)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (48, N'Lắc Tay Nữ Đính Đá Zircon Titan', 17, 9, NULL, 280000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/42/55/9a/2a7d46311d4950679770e21cdb96a11f.jpg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 11)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (49, N'Áo Khoác Hoodie Nút Bấm', 18, 7, NULL, 290000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/e5/3a/0a/0e4253a8ea73cf98a4d88c963ec129cb.jpg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 11)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (50, N'Áo Thun In Chữ Xanh Cực Chất tay lỡ form rộng', 19, 7, NULL, 300000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/61/60/7e/9fb2b4962ce7c866533c979220847bed.jpg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 11)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (51, N'Áo blazer nữ cộc tay, áo vest nữ chất', 20, 7, NULL, 310000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/98/61/79/1b114826a1cb202b52430f3d9a8a6873.jpg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 11)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (52, N'Quần jean Baggy ống suông, rộng nam', 21, 7, NULL, 320000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/52/7c/52/d14e0691511e2def1148d3b9ad86a42e.jpg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 11)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (53, N'NULLGiày thể thao nam đế êm nhẹ', 22, 10, NULL, 330000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/de/86/44/d9103a318261bd07f87e37adb0aa9c8e.jpg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 11)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (54, N'Giày thời trang nam Court Vision Low Next Nature', 23, 10, NULL, 340000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/9a/d3/e6/66c4a3c93462bd4cb8a84839105ebaf3.jpg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 11)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (55, N'Giày Sneaker Vải Canvas Unisex', 24, 10, NULL, 350000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/6c/4d/92/271fc1269a189dd1267b0bda706ebcb0.jpg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 11)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (56, N'Giày Nam, Giày Thể Thao Nam Cổ Thấp', 25, 10, NULL, 360000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/01/0c/36/a1efbce047d9451d2b3418dbaa00f6e1.jpg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 11)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (57, N'Giày sneaker nam New Balance 996 Lifestyle', 26, 10, NULL, 37000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/15/37/66/e8ff0b539578ce7292e88860f2669cc2.jpg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 11)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (58, N'Giày sneaker nam New Balance 327', 27, 10, NULL, 38000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/58/99/db/c36d950999740ac3eeafbd8d66952479.jpg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 11)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (59, N'Bộ quần áo sơ sinh cho bé vải sợi tre', 28, 11, NULL, 120000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/00/1a/cd/69f4edba25b3b4bd73b6896b904f7259.jpg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 10)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (60, N'Bộ 3 bình sữa nhựa PP', 29, 11, NULL, 130000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/e6/a3/6f/2ac532d1c78571c2cd4011a0340c1792.jpg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 10)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (61, N'Bộ sản phẩm hỗ trợ trẻ sơ sinh bú bình dòng', 30, 11, NULL, 140000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/3f/4f/c9/6dd2e05f86d67472376f7e26a1c2bfae.jpeg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 10)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (62, N'Combo Bình Sữa Comotomo', 31, 11, NULL, 150000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/20/0d/c5/e79c8359eb804e883371528d623e7721.jpg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 10)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (63, N'Giường Gấp Basic Khung To Tròn Cao Cấp', 32, 12, NULL, 160000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/08/fc/8d/a862a4c945b9aee13bc05784472a7fa5.jpg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 10)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (64, N'Giường Ngủ Gấp Đẹp Thông Minh Hiện Đại', 33, 12, NULL, 170000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/07/f5/82/8f92fec4a2fe4f89cec1abd6a169bd86.jpg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 10)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (65, N'Tủ để đồ nhà bếp nhiều ngăn VKS06B', 34, 12, NULL, 180000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/2d/7f/fd/dfb88c3632253b932ca9f768c9abc745.jpg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 10)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (66, N'Tủ Bếp, Chén Dĩa 3 Cánh - 3 Hộc Juno Sofa', 35, 12, NULL, 190000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/33/9c/aa/e1a217b8211f009af5ef1099a57d921d.jpg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 10)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (67, N'Kệ Đa Năng Để Lò Vi Sóng INOX', 36, 12, NULL, 200000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/af/98/3c/ebd0c90b81a04bffde75d9251283c12e.jpg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 10)
INSERT [dbo].[Product] ([productId], [productName], [productCode], [categoryId], [description], [price], [amount], [stock], [images], [wishlist], [status], [createDate], [storeId]) VALUES (68, N'Ghế Xoay Văn Phòng Ngồi Làm Việc Công Thái Học Deli', 37, 12, NULL, 210000, 10, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/ae/ec/55/64fc269af974828d2f04287521ee5fda.jpg.webp', 1, 1, CAST(N'2022-01-05' AS Date), 10)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Store] ON 

INSERT [dbo].[Store] ([storeId], [storeName], [images], [status], [userId]) VALUES (10, N'HT STORE', N'https://scontent.fsgn2-5.fna.fbcdn.net/v/t1.18169-9/20108389_102053523799192_4758984255865743867_n.jpg?stp=dst-jpg_s851x315&_nc_cat=106&ccb=1-7&_nc_sid=da31f3&_nc_ohc=R1s2w2RfD6oAX9wn13X&tn=BJfQ-y-JcutaE6Uo&_nc_ht=scontent.fsgn2-5.fna&oh=00_AfA0qB6Aa-KT5bNqLwkootUC4H2o6ijIjYJE6osxgKwUFg&oe=63C29B3D', 1, 7)
INSERT [dbo].[Store] ([storeId], [storeName], [images], [status], [userId]) VALUES (11, N'PC STORE', N'https://i.pinimg.com/474x/53/12/46/5312467adbb46b758ecd74bfed1426c8.jpg', 1, 6)
SET IDENTITY_INSERT [dbo].[Store] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([roleId], [roleName]) VALUES (1, N'admin')
INSERT [dbo].[UserRoles] ([roleId], [roleName]) VALUES (2, N'staff')
INSERT [dbo].[UserRoles] ([roleId], [roleName]) VALUES (3, N'user')
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([userId], [username], [email], [fullname], [password], [images], [phone], [status], [code], [roleId]) VALUES (1, N'tinh', N'20110576@student.hcmute.edu.vn', N'Nguyễn Nhật Tính', N'123', N'https://scontent.fsgn2-1.fna.fbcdn.net/v/t1.6435-9/121551737_918912865307549_6192207685971855402_n.jpg?stp=dst-jpg_s851x315&_nc_cat=105&ccb=1-7&_nc_sid=da31f3&_nc_ohc=Bln_euXgBHkAX-yvXLV&_nc_ht=scontent.fsgn2-1.fna&oh=00_AfAl7-nSoambSDD_DF4PeRXdUokr2TzkR_NOQ0xaw1EHSQ&oe=63C283CB', N'0708128879', 1, N'1', 1)
INSERT [dbo].[Users] ([userId], [username], [email], [fullname], [password], [images], [phone], [status], [code], [roleId]) VALUES (6, N'cong', N'20110447@student.hcmute.edu.vn', N'Nguyễn Phước Công', N'123', N'https://image.thanhnien.vn/w1024/Uploaded/2022/wsxrxqeiod/2022_12_14/messi-8083.jpg', N'0869154692', 1, N'6', 3)
INSERT [dbo].[Users] ([userId], [username], [email], [fullname], [password], [images], [phone], [status], [code], [roleId]) VALUES (7, N'truong', N'20110590@student.hcmute.edu.vn', N'Trần Nguyễn Huy Trường', N'123', N'https://scontent.fsgn2-6.fna.fbcdn.net/v/t1.6435-9/107578911_570950903576116_2432758108644443499_n.jpg?stp=c0.79.720.720a_dst-jpg_s851x315&_nc_cat=110&ccb=1-7&_nc_sid=da31f3&_nc_ohc=iYOlKR5FazAAX_VEHbT&_nc_ht=scontent.fsgn2-6.fna&oh=00_AfCHYk9aZIyfon-Gu9bv0wy-ZA_ZQU3UdHAzS3ARNxrs9Q&oe=63C2716F', N'0779847539', 1, N'7', 3)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bills_CartId] FOREIGN KEY([cartId])
REFERENCES [dbo].[Cart] ([cartId])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bills_CartId]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bills_UserId] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bills_UserId]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Store] FOREIGN KEY([storeId])
REFERENCES [dbo].[Store] ([storeId])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Store]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Users] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Users]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK_CartItem_Cart] FOREIGN KEY([cartId])
REFERENCES [dbo].[Cart] ([cartId])
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK_CartItem_Cart]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK_CartItem_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK_CartItem_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([categoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Store] FOREIGN KEY([storeId])
REFERENCES [dbo].[Store] ([storeId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Store]
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK_Store_User] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [FK_Store_User]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserRoles] FOREIGN KEY([roleId])
REFERENCES [dbo].[UserRoles] ([roleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserRoles]
GO
USE [master]
GO
ALTER DATABASE ecommercenew SET  READ_WRITE 
GO
