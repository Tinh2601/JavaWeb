﻿
Create Database [ShopGiayNew01]

go

USE [ShopGiayNew01]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 9/19/2022 8:44:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cartId] [int]IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[buyDate] [datetime] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[cartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 9/19/2022 8:44:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[cartItemId] [int]IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[unitPrice] [float] NULL,
	[productId] [int] NULL,
	[cartId] int NULL,
 CONSTRAINT [PK_CartItem] PRIMARY KEY CLUSTERED 
(
	[cartItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 9/19/2022 8:44:04 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 9/19/2022 8:44:04 AM ******/
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
	[sellerId] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seller]    Script Date: 9/19/2022 8:44:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seller](
	[sellerId] [int] IDENTITY(1,1) NOT NULL,
	[sellername] [nvarchar](50) NULL,
	[images] [nvarchar](500) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Seller] PRIMARY KEY CLUSTERED 
(
	[sellerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slides]    Script Date: 9/19/2022 8:44:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slides](
	[slideid] [int] IDENTITY(1,1) NOT NULL,
	[slidename] [nvarchar](200) NULL,
	[slidelink] [nvarchar](500) NULL,
	[slidedescription] [nvarchar](500) NULL,
	[slideimages] [nvarchar](500) NULL,
	[status] [int] NULL,
	[slidetype] [int] NULL,
 CONSTRAINT [PK_Slides] PRIMARY KEY CLUSTERED 
(
	[slideid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 9/19/2022 8:44:04 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/19/2022 8:44:04 AM ******/
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
	[sellerid] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[Bills](
	[bill_Id] [int] IDENTITY(1,1) NOT NULL,
	[total] [float](50) NULL,
	[date] [datetime] NULL,
	[cartId] [int]NULL,
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
	[bill_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


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
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Seller] FOREIGN KEY([sellerId])
REFERENCES [dbo].[Seller] ([sellerId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Seller]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Seller] FOREIGN KEY([sellerid])
REFERENCES [dbo].[Seller] ([sellerId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Seller]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserRoles] FOREIGN KEY([roleId])
REFERENCES [dbo].[UserRoles] ([roleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserRoles]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_CartId] FOREIGN KEY([cartId])
REFERENCES [dbo].[Cart] ([cartId])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_CartId]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_UserId] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_UserId]
GO
USE [master]
GO
ALTER DATABASE [ShopGiayNew01] SET  READ_WRITE 
GO


use [ShopGiayNew01]

go
--Insert Sql 

--insert into table UserRoles
insert into UserRoles values('admin')
insert into UserRoles values('staff')
insert into UserRoles values('user')

--insert into table Seller , tài khoản user đăng kí mới vào mặc định sellerId = 3
insert into Seller values(N'Nguyễn Nhật Tính','https://png.pngtree.com/png-vector/20190411/ourlarge/pngtree-business-male-icon-vector-png-image_916468.jpg',1)
insert into Seller values(N'Phan Duy Khánh','https://png.pngtree.com/png-vector/20190411/ourlarge/pngtree-business-male-icon-vector-png-image_916468.jpg',1)
insert into Seller values(N'Khách','https://png.pngtree.com/png-vector/20190411/ourlarge/pngtree-business-male-icon-vector-png-image_916468.jpg',1)

--insert into table Users

--tài khoản admin 
insert into Users values('tinh','20110576@student.hcmute.edu.vn',N'Nguyễn Nhật Tính','1','https://png.pngtree.com/png-vector/20190411/ourlarge/pngtree-business-male-icon-vector-png-image_916468.jpg','0708128879',1,'1',1,1)
insert into Users values('khanh','20110502@student.hcmute.edu.vn',N'Phan Duy Khánh','1','https://png.pngtree.com/png-vector/20190411/ourlarge/pngtree-business-male-icon-vector-png-image_916468.jpg','00213413689',1,'2',1,2)
--tài khoản staff 
insert into Users values('cong','20110447@student.hcmute.edu.vn',N'Nguyễn Phước Công','1','https://png.pngtree.com/png-vector/20190411/ourlarge/pngtree-business-male-icon-vector-png-image_916468.jpg','00423413689',1,'3',2,3)
--tài khoản người dùng , khi đăng kí mặc định sellerId là 3 ( khách )
insert into Users values('truong','20110590@student.hcmute.edu.vn',N'Trần Nguyễn Huy Trường','1','https://png.pngtree.com/png-vector/20190411/ourlarge/pngtree-business-male-icon-vector-png-image_916468.jpg','012341689',1,'4',3,3)
insert into Users values('khoa','20110088@student.hcmute.edu.vn',N'Nguyễn Anh Khoa','1','https://png.pngtree.com/png-vector/20190411/ourlarge/pngtree-business-male-icon-vector-png-image_916468.jpg','123413689',1,'5',3,3)


--insert into table Category 
insert into Category values('Bitis','https://upload.wikimedia.org/wikipedia/vi/thumb/3/37/Bitis_logo.svg/1200px-Bitis_logo.svg.png',1)
insert into Category values('Adidas','https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Adidas_Logo.svg/1000px-Adidas_Logo.svg.png',1)
insert into Category values('Nike','https://1000logos.net/wp-content/uploads/2021/11/Nike-Logo.png',1)
insert into Category values('Puma','https://brademar.com/wp-content/uploads/2022/05/Puma-Logo-PNG-1980-%E2%80%93-Now.png',1)
insert into Category values('Lacoste','https://upload.wikimedia.org/wikipedia/en/thumb/4/43/Lacoste_logo.svg/800px-Lacoste_logo.svg.png',1)




--insert into table Product 
--Bitis 
insert into Product values(N'Giày Thể Thao Nam Hunter X DSMH10500XAM (Xám)','371628','1','',100,100,0,'https://product.hstatic.net/1000230642/product/dsmh10500xam__5__113fd43149a74ead82897abb58b78cf9.jpg',0,'1','2022-11-29',1)
insert into Product values(N'Giày Thể Thao Nam Hunter X DSMH10500DEN (Đen)','3123628','1','',120,90,0,'https://product.hstatic.net/1000230642/product/dsmh10500den__2__876e6ceee0bc4f4688dc0479beed3f30.jpg',0,'1','2022-11-29',1)
insert into Product values(N'Giày Thể Thao Nam Hunter X DSMH10500TRG (Trắng)','123628','1','',150,80,0,'https://product.hstatic.net/1000230642/product/dsmh10500trg__2__6ea6f065d44f4e1285017c2ad763b201.jpg',0,'1','2022-11-29',1)
insert into Product values(N'Dép Si Nam DEM012000DEN (Đen)','4528','1','',180,70,0,'https://product.hstatic.net/1000230642/product/dem012000den__2__ff38ff8d4cf74f39b16f6762883acb92.jpg',0,'1','2022-11-29',1)
insert into Product values(N'Dép Eva Phun Trẻ Em DEB008401XDG (Xanh Dương)','168628','1','',210,60,0,'https://product.hstatic.net/1000230642/product/deb008401xdg__2__c781bff8af104d1ba527054c8ac64a11.jpg',0,'1','2022-11-29',1)
--Adidas
insert into Product values(N'GIÀY STAN SMITH','35346','2','',200,100,0,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/82308819f8fd4644b6b7aea90105eb06_9366/Giay_Stan_Smith_trang_GX4624_01_standard.jpg',0,'1','2022-11-29',1)
insert into Product values(N'GIÀY ULTRA 4DFWD','98712','2','',120,90,0,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/1a21c2bd10db44f1873dae9801719513_9366/Giay_Ultra_4DFWD_mau_xanh_la_GY8389_01_standard.jpg',0,'1','2022-11-29',1)
insert into Product values(N'GIÀY ADIDAS 4DFWD X PARLEY','981723','2','',150,80,0,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/d934c260d8eb4e699908aecb00dc8e5d_9366/Giay_adidas_4DFWD_x_Parley_Mau_xanh_da_troi_GX6604_01_standard.jpg',0,'1','2022-11-29',1)
insert into Product values(N'GIÀY NMD_V3','94712','2','',180,70,0,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bfff95f0750341bf939daed70141260e_9366/Giay_NMD_V3_trang_GX9468_01_standard.jpg',0,'1','2022-11-29',1)
insert into Product values(N'GIÀY LITE RACER REBOLD','955723','2','',210,60,0,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/af07915f24824cf190f6aed70136dc45_9366/Giay_Lite_Racer_Rebold_Mau_xanh_da_troi_GX4221_01_standard.jpg',0,'1','2022-11-29',1)
--Nike
insert into Product values(N'Nike Dunk High Retro','123431','3','',200,100,0,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/af75ebf0-5f07-4c50-af56-fe551bbdb8b6/dunk-high-retro-mens-shoe-dTVTCk.png',0,'1','2022-11-29',1)
insert into Product values(N'Nike Dunk High','12341','3','',250,500,0,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/42cc1a24-b96a-4490-8250-3346366d0607/dunk-high-big-kids-shoes-s8TQL9.png',0,'1','2022-11-29',1)
insert into Product values(N'Nike Air Max 270','73531','3','',170,50,0,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/pyyixbczj6u5kiwhpjik/air-max-270-womens-shoes-Pgb94t.png',0,'1','2022-11-29',1)
insert into Product values(N'Nike Air Max 270','36121','3','',300,20,0,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/8a9efd65-db93-482c-94f0-ad34a3b21265/air-max-270-mens-shoes-KkLcGR.png',0,'1','2022-11-29',1)
insert into Product values(N'Nike Air Max 97','81237','3','',400,10,0,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/yx8uzsrtbd1aca9h5al4/air-max-97-big-kids-shoes-bkTvwRKd.png',0,'1','2022-11-29',1)
--Puma 
insert into Product values(N'Suede Mid XXI Sneakers','123431','4','',200,100,0,'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_1350,h_1350/global/380205/01/sv01/fnd/PNA/fmt/png/Suede-Mid-XXI-Sneakers',0,'1','2022-11-29',1)
insert into Product values(N'PUMA x PALOMO Nitefox Boots','1325812','4','',180,100,0,'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_1350,h_1350/global/386684/01/sv01/fnd/PNA/fmt/png/PUMA-x-PALOMO-Nitefox-Boots',0,'1','2022-11-29',1)
insert into Product values(N'MB.01 Galaxy Basketball Shoes','912871','4','',350,100,0,'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_1350,h_1350/global/376677/07/sv01/fnd/PNA/fmt/png/MB.01-Galaxy-Basketball-Shoes',0,'1','2022-11-29',1)
insert into Product values(N'RS-X Galaxy Sneakers','1214431','4','',8000,100,0,'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_1350,h_1350/global/387764/01/sv01/fnd/PNA/fmt/png/RS-X-Galaxy-Sneakers',0,'1','2022-11-29',1)
insert into Product values(N'MB.02 Phenom Basketball Shoes','19812','4','',2000,100,0,'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_1350,h_1350/global/377644/01/sv01/fnd/PNA/fmt/png/MB.02-Phenom-Basketball-Shoes',0,'1','2022-11-29',1)
--Lacoste
insert into Product values(N'Men Lacoste Court-Master Pro Leather Tonal Sneakers','512331','5','',200,200,0,'https://imagena1.lacoste.com/dw/image/v2/AAUP_PRD/on/demandware.static/-/Sites-master/default/dw7835cd6d/44SMA0084_02H_01.jpg?imwidth=915&impolicy=product',0,'1','2022-11-29',1)
insert into Product values(N'Men Lacoste Powercourt Leather Sneakers','612331','5','',100,100,0,'https://imagena1.lacoste.com/dw/image/v2/AAUP_PRD/on/demandware.static/-/Sites-master/default/dwd903b9f8/44SMA0096_312_01.jpg?imwidth=915&impolicy=product',0,'1','2022-11-29',1)
insert into Product values(N'Lacoste Powercourt Leather Color Contrast Sneakers','82341','5','',300,400,0,'https://imagena1.lacoste.com/dw/image/v2/AAUP_PRD/on/demandware.static/-/Sites-master/default/dw458363b5/44SMA0025_J18_01.jpg?imwidth=915&impolicy=product',0,'1','2022-11-29',1)
insert into Product values(N'Lacoste Powercourt Leather Color-Pop Sneakers','02341','5','',400,200,0,'https://imagena1.lacoste.com/dw/image/v2/AAUP_PRD/on/demandware.static/-/Sites-master/default/dwcba0cf21/44SMA0116_1R5_01.jpg?imwidth=915&impolicy=product',0,'1','2022-11-29',1)
insert into Product values(N'Lacoste Gripshot Textile Sneakers','125121','5','',600,500,0,'https://imagena1.lacoste.com/dw/image/v2/AAUP_PRD/on/demandware.static/-/Sites-master/default/dw7e309615/44CMA0037_03A_01.jpg?imwidth=915&impolicy=product',0,'1','2022-11-29',1)
