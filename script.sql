USE [master]
GO
/****** Object:  Database [WebDongHoMVC]    Script Date: 1/7/2021 8:28:30 AM ******/
CREATE DATABASE [WebDongHoMVC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebDongHoMVC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WebDongHoMVC.mdf' , SIZE = 6144KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WebDongHoMVC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WebDongHoMVC_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WebDongHoMVC] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebDongHoMVC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebDongHoMVC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebDongHoMVC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebDongHoMVC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebDongHoMVC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebDongHoMVC] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebDongHoMVC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebDongHoMVC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebDongHoMVC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebDongHoMVC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebDongHoMVC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebDongHoMVC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebDongHoMVC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebDongHoMVC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebDongHoMVC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebDongHoMVC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebDongHoMVC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebDongHoMVC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebDongHoMVC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebDongHoMVC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebDongHoMVC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebDongHoMVC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebDongHoMVC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebDongHoMVC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebDongHoMVC] SET  MULTI_USER 
GO
ALTER DATABASE [WebDongHoMVC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebDongHoMVC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebDongHoMVC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebDongHoMVC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WebDongHoMVC] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WebDongHoMVC]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 1/7/2021 8:28:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Brands](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Logo] [nvarchar](250) NOT NULL,
	[Order] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Footers]    Script Date: 1/7/2021 8:28:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Footers](
	[ID] [varchar](50) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[ContentHtml] [ntext] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Footers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 1/7/2021 8:28:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[ProductID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 1/7/2021 8:28:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CustomerID] [bigint] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipEmail] [varchar](250) NULL,
	[ShipMobile] [varchar](20) NULL,
	[ShipAddress] [nvarchar](250) NULL,
	[Status] [nchar](20) NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 1/7/2021 8:28:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[MetaTitle] [varchar](250) NULL,
	[Images] [nvarchar](250) NULL,
	[Order] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescription] [nvarchar](250) NULL,
	[Status] [bit] NOT NULL,
	[UpHome] [bit] NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 1/7/2021 8:28:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[MetaTitle] [varchar](250) NULL,
	[Images] [xml] NULL,
	[Thumb] [nvarchar](250) NULL,
	[Price] [decimal](18, 0) NULL,
	[OldPrice] [decimal](18, 0) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescription] [nvarchar](250) NULL,
	[Gift] [ntext] NULL,
	[Quantity] [int] NULL,
	[Detail] [ntext] NULL,
	[Guarantee] [int] NULL,
	[Specification] [ntext] NULL,
	[MoreDesc] [ntext] NULL,
	[CategoryID] [bigint] NOT NULL,
	[BrandID] [int] NULL,
	[Special] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Slides]    Script Date: 1/7/2021 8:28:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slides](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Link] [nvarchar](250) NULL,
	[Images] [nvarchar](250) NULL,
	[Order] [int] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Slides] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserGroups]    Script Date: 1/7/2021 8:28:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserGroups](
	[ID] [varchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
	[IsActived] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_UserGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/7/2021 8:28:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserName] [varchar](20) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Mobile] [varchar](20) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Sex] [bit] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
	[LastLoginDate] [datetime] NULL,
	[LastChangePassword] [datetime] NULL,
	[GroupID] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([ID], [Title], [Logo], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status]) VALUES (1, N'Garmin', N'/Data/images/brands/garmin-logo-rgsd-cmyk-delta_148.jpg', 1, CAST(N'2020-12-13 06:35:22.057' AS DateTime), N'lehaichien', NULL, NULL, 1)
INSERT [dbo].[Brands] ([ID], [Title], [Logo], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status]) VALUES (2, N'Ticwatch', N'/Data/images/brands/ticwatch.jpg', 2, CAST(N'2020-12-13 06:36:04.417' AS DateTime), N'lehaichien', NULL, NULL, 1)
INSERT [dbo].[Brands] ([ID], [Title], [Logo], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status]) VALUES (3, N'Huawei', N'/Data/images/brands/Huawei-logo.jpg', 3, CAST(N'2020-12-13 06:36:36.880' AS DateTime), N'lehaichien', NULL, NULL, 1)
INSERT [dbo].[Brands] ([ID], [Title], [Logo], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status]) VALUES (4, N'Fitbit', N'/Data/images/brands/fitbit-logo.jpg', 4, CAST(N'2020-12-13 06:36:58.277' AS DateTime), N'lehaichien', NULL, NULL, 1)
INSERT [dbo].[Brands] ([ID], [Title], [Logo], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status]) VALUES (5, N'Asus', N'/Data/images/brands/asus_logo.jpg', 5, CAST(N'2020-12-13 06:37:19.670' AS DateTime), N'lehaichien', NULL, NULL, 1)
INSERT [dbo].[Brands] ([ID], [Title], [Logo], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status]) VALUES (6, N'Pebble', N'/Data/images/brands/Pebble_Logo.jpg', 6, CAST(N'2020-12-13 06:37:50.713' AS DateTime), N'lehaichien', NULL, NULL, 1)
INSERT [dbo].[Brands] ([ID], [Title], [Logo], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status]) VALUES (7, N'Mobvoi', N'/Data/images/brands/Mobvoi-Logo.jpg', 7, NULL, NULL, CAST(N'2020-12-13 15:28:12.870' AS DateTime), N'lehaichien', 0)
INSERT [dbo].[Brands] ([ID], [Title], [Logo], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status]) VALUES (8, N'Apple', N'/Data/images/banner/image.png', NULL, CAST(N'2020-12-13 15:12:40.773' AS DateTime), N'lehaichien', NULL, NULL, 1)
INSERT [dbo].[Brands] ([ID], [Title], [Logo], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status]) VALUES (9, N'Xiaomi', N'/Data/images/banner/Xiaomi-patents-smartphone-with-all-around-screen-108MP-camera.png', NULL, CAST(N'2020-12-13 15:13:29.637' AS DateTime), N'lehaichien', NULL, NULL, 1)
INSERT [dbo].[Brands] ([ID], [Title], [Logo], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status]) VALUES (10, N'Samsung', N'/Data/images/banner/Samsung-Logo-Wordmark-RGB.png', NULL, CAST(N'2020-12-13 15:15:52.637' AS DateTime), N'lehaichien', NULL, NULL, 1)
INSERT [dbo].[Brands] ([ID], [Title], [Logo], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status]) VALUES (11, N'Oppo', N'/Data/images/banner/23161.jpg', NULL, CAST(N'2020-12-13 15:16:33.873' AS DateTime), N'lehaichien', NULL, NULL, 1)
INSERT [dbo].[Brands] ([ID], [Title], [Logo], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status]) VALUES (12, N'Polar', N'/Data/images/banner/polar-logo-png-6.png', NULL, CAST(N'2020-12-13 15:18:01.927' AS DateTime), N'lehaichien', NULL, NULL, 1)
INSERT [dbo].[Brands] ([ID], [Title], [Logo], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status]) VALUES (13, N'Matrix', N'/Data/images/banner/mark.jpg', 13, NULL, NULL, CAST(N'2020-12-13 15:23:10.873' AS DateTime), N'lehaichien', 1)
INSERT [dbo].[Brands] ([ID], [Title], [Logo], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status]) VALUES (14, N'LG', N'/Data/images/banner/lg-logo-black-and-white.png', 14, CAST(N'2020-12-13 15:25:05.450' AS DateTime), N'lehaichien', NULL, NULL, 1)
INSERT [dbo].[Brands] ([ID], [Title], [Logo], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status]) VALUES (15, N'Motorola', N'/Data/images/banner/motorola-logo-vector-22.jpg', 15, CAST(N'2020-12-13 15:26:38.707' AS DateTime), N'lehaichien', NULL, NULL, 1)
INSERT [dbo].[Brands] ([ID], [Title], [Logo], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status]) VALUES (16, N'ZTE', N'/Data/images/banner/zte_logo_678x452.png', 16, CAST(N'2020-12-13 15:27:52.840' AS DateTime), N'lehaichien', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Brands] OFF
INSERT [dbo].[Footers] ([ID], [Title], [ContentHtml], [Status]) VALUES (N'footer-bottom', N'footer-bottom', N'<div class="footer-bottom">
                        <div class="footer-bottom-content container clearfix">
                           <div class="copyright-footer pull-left">
                              © Bản quyền thuộc về LD STORE | Giấy chứng nhận ĐKKD số 01G8021941 do UBND Quận Cầu Giấy - Hà Nội cấp ngày 04/01/2018 
                           </div>
                           <div class="payment">
                              <ul class="payment-method pull-right">
                                 <li><a class="payment1" title="Payment Method" href="https://ldstore.vn/#"></a></li>
                                 <li><a class="payment2" title="Payment Method" href="https://ldstore.vn/#"></a></li>
                                 <li><a class="payment3" title="Payment Method" href="https://ldstore.vn/#"></a></li>
                                 <li><a class="payment4" title="Payment Method" href="https://ldstore.vn/#"></a></li>
                              </ul>
                           </div>
                        </div>
                     </div>', 1)
INSERT [dbo].[Footers] ([ID], [Title], [ContentHtml], [Status]) VALUES (N'footer-bottom-sevicer', N'footer-bottom-sevicer', N'<div class="footer-bottom-sevicer">
                        <div class="container">
                           <div class="widget-1 widget-first widget text-18 widget_text">
                              <div class="widget-inner">
                                 <div class="textwidget">
                                    <div class="box-sevicer">
                                       <div class="sn-sevirce sn-put1">
                                          <div class="img-sevirce img-sevirce1"></div>
                                          <div class="content-service"><a class="sn-title" href="https://ldstore.vn/#" rel="nofollow" data-wpel-link="internal">Chất lượng đảm bảo</a><br>
                                             Đảm bảo chất lượng đúng như mô tả
                                          </div>
                                       </div>
                                       <div class="sn-sevirce sn-put2">
                                          <div class="img-sevirce img-sevirce2"></div>
                                          <div class="content-service"><a class="sn-title" href="https://ldstore.vn/#" rel="nofollow" data-wpel-link="internal">Tư vấn tận tình</a><br>
                                             Hỗ trợ tư vấn mua bán smartwatch sản phẩm tùy theo nhu cầu sử dụng
                                          </div>
                                       </div>
                                       <div class="sn-sevirce sn-put3">
                                          <div class="img-sevirce img-sevirce3"></div>
                                          <div class="content-service"><a class="sn-title" href="https://ldstore.vn/#" rel="nofollow" data-wpel-link="internal">Giao hàng nhanh chóng</a><br>
                                             Nội thành trong vòng 3 giờ. Các tỉnh từ 2-3 ngày làm việc.
                                          </div>
                                       </div>
                                       <div class="sn-sevirce sn-put4">
                                          <div class="img-sevirce img-sevirce4"></div>
                                          <div class="content-service"><a class="sn-title" href="https://ldstore.vn/#" rel="nofollow" data-wpel-link="internal">Bảo hành chu đáo</a><br>
                                             1 đổi 1 không thay thế sữa chữa tất cả sản phẩm
                                          </div>
                                       </div>
                                       <div class="sn-sevirce sn-put5">
                                          <div class="img-sevirce img-sevirce5"></div>
                                          <div class="content-service"><a class="sn-title" href="https://ldstore.vn/#" rel="nofollow" data-wpel-link="internal">Bảo mật thanh toán</a><br>
                                             Thanh toán quẹt thẻ tiện lợi bảo mật bao gồm Visa , Master , nội địa atm …
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>', 1)
INSERT [dbo].[Footers] ([ID], [Title], [ContentHtml], [Status]) VALUES (N'footer-middle', N'footer-middle', N'<div class="container"><div class="footer-column">
                              <div class="footer-border">
                                 <div class="footer-title">
                                    <h2>Chính sách khách hàng</h2>
                                 </div>
                                 <ul id="menu-chinh-sach-khach-hang" class="menu">
                                    <li class="menu-chinh-sach-bao-hanh ya-menu-custom level1"><a target="_blank" rel="nofollow" href="https://ldstore.vn/chinh-sach-bao-hanh/" class="item-link"><span class="have-title"><span class="menu-title">Chính sách bảo hành</span></span></a></li>
                                    <li class="menu-chinh-sach-bao-mat ya-menu-custom level1"><a target="_blank" rel="nofollow" href="https://ldstore.vn/chinh-sach-bao-mat/" class="item-link"><span class="have-title"><span class="menu-title">Chính sách bảo mật</span></span></a></li>
                                    <li class="menu-chinh-sach-doi-tra ya-menu-custom level1"><a target="_blank" rel="nofollow" href="https://ldstore.vn/chinh-sach-doi-tra/" class="item-link"><span class="have-title"><span class="menu-title">Chính sách đổi trả</span></span></a></li>
                                    <li class="menu-chinh-sach-van-chuyen ya-menu-custom level1"><a target="_blank" rel="nofollow" href="https://ldstore.vn/chinh-sach-van-chuyen-giao-nhan/" class="item-link"><span class="have-title"><span class="menu-title">Chính sách vận chuyển</span></span></a></li>
                                    <li class="menu-quy-dinh-thanh-toan ya-menu-custom level1"><a target="_blank" rel="nofollow" href="https://ldstore.vn/quy-dinh-va-hinh-thuc-thanh-toan/" class="item-link"><span class="have-title"><span class="menu-title">Quy định thanh toán</span></span></a></li>
                                 </ul>
                              </div>
                           </div><div class="footer-column">
                              <div class="footer-border">
                                 <div class="footer-title">
                                    <h2>Cửa hàng tại Hồ Chí Minh</h2>
                                 </div>
                                 <div class="textwidget">
                                    <ul>
                                       <li><span class="fas fa-map-marker-alt" style="font-size: 16px; position: relative; top: 1px;">&nbsp;</span>Địa chỉ : Đang cập nhật</li>
                                       <li><span class="fas fa-mobile">&nbsp;</span>Điện thoại : <a href="http://tel+84911479999/" class="external" rel="nofollow" target="_blank">0911479999</a></li>
                                    </ul>
                                    <div class="footer-title" style="margin-top:20px">
                                       <h2>Cửa hàng tại Đắk Lắk</h2>
                                    </div>
                                    <ul>
                                       <li><span class="fas fa-map-marker-alt">&nbsp;</span>Địa chỉ: Số 195 Lê Duẩn TP. Buôn Ma Thuột , Đắk Lắk</li>
                                       <li><span class="fas fa-mobile">&nbsp;</span>Điện thoại : <a href="http://tel+84911479999/" class="external" rel="nofollow" target="_blank">0911479999</a></li>
                                    </ul>
                                 </div>
                              </div>
                           </div><div class="footer-column">
                              <div class="footer-border">
                                 <div class="footer-title">
                                    <h2>Cửa hàng tại Hà Nội</h2>
                                 </div>
                                 <div class="textwidget">
                                    <div class="content-block-footer">
                                       <ul>
                                          <li><span class="fas fa-map-marker-alt" style="font-size: 16px; position: relative; top: 1px;">&nbsp;</span>Địa chỉ: Số 157 Trần Quốc Hoàn , Cầu Giấy , Hà Nội.</li>
                                          <li><span class="fas fa-mobile" style="font-size: 18px; position: relative; top: 4px;">&nbsp;</span>Điện thoại : <a title="Call:0924049999" href="tel:+84924049999" data-wpel-link="internal">0924049999</a></li>
                                          <li><span class="fas fa-envelope" style="font-size: 11px; position: relative;">&nbsp;</span>E-mail: <a title="ldstorevn8@gmail.com" href="mailto:ldstorevn8@gmail.com">ldstorevn8@gmail.com</a></li>
                                          <li><span class="fab fa-youtube" style="font-size: 11px; position: relative; color: #f00;">&nbsp;</span> <a title="Lâm SmartWatch" href="https://www.youtube.com/channel/UCyoQY5n_Q6xoLTxf0g6fPDw?sub_confirmation=1" class="external" rel="nofollow" target="_blank">Kênh Youtube</a></li>
                                       </ul>
                                    </div>
                                 </div>
                              </div>
                           </div><div class="footer-column">
                              <div class="footer-border">
                                 <div class="textwidget">
                                    <p><a title="Video đánh giá smartwatch mới nhất" href="https://www.youtube.com/channel/UCyoQY5n_Q6xoLTxf0g6fPDw?sub_confirmation=1" rel="nofollow" class="external" target="_blank"><img class="wp-image-13533 aligncenter" src="./LD Store - Chuyên Đồng hồ thông minh - Smartwatch chính hãng - LD Store_files/YOUTUBE.png" alt="Video đánh giá smartwatch mới nhất" style="width: 200px;"></a></p>
                                    <p><a title="Đã thông báo với bộ công thương" href="http://online.gov.vn/HomePage/CustomWebsiteDisplay.aspx?DocId=56868" rel="nofollow" class="external" target="_blank"><img class="wp-image-13533 aligncenter" src="./LD Store - Chuyên Đồng hồ thông minh - Smartwatch chính hãng - LD Store_files/20150827110756-dathongbao.png" alt="" style="width: 200px;"></a></p>
                                 </div>
                              </div>
                           </div></div>', 1)
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [Images], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [MetaKeywords], [MetaDescription], [Status], [UpHome]) VALUES (1, N'Xiaomi', N'xiaomi', N'/Data/images/huamiamazfit.png', 1, NULL, NULL, CAST(N'2020-12-14 04:10:56.160' AS DateTime), N'lehaichien', NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [Images], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [MetaKeywords], [MetaDescription], [Status], [UpHome]) VALUES (2, N'Ticwatch', N'ticwatch', N'/Data/images/noname.png', 2, NULL, NULL, CAST(N'2020-12-14 04:08:58.553' AS DateTime), N'lehaichien', NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [Images], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [MetaKeywords], [MetaDescription], [Status], [UpHome]) VALUES (3, N'Samsung', N'samsung', N'/Data/images/SAMSUNG-BANNER1.png', 3, NULL, NULL, CAST(N'2020-12-14 04:10:06.803' AS DateTime), N'lehaichien', NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [Images], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [MetaKeywords], [MetaDescription], [Status], [UpHome]) VALUES (4, N'Huawei', N'huawei', N'/Data/images/noname-2.png', 4, NULL, NULL, CAST(N'2020-12-14 04:09:17.853' AS DateTime), N'lehaichien', NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [Images], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [MetaKeywords], [MetaDescription], [Status], [UpHome]) VALUES (5, N'Oppo', N'oppo', NULL, 5, CAST(N'2020-12-13 15:05:15.640' AS DateTime), N'lehaichien', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [Images], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [MetaKeywords], [MetaDescription], [Status], [UpHome]) VALUES (6, N'Garmin', N'garmin', N'/Data/images/noname-1.png', 6, NULL, NULL, CAST(N'2020-12-14 04:10:33.630' AS DateTime), N'lehaichien', NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [Images], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [MetaKeywords], [MetaDescription], [Status], [UpHome]) VALUES (7, N'Polar', N'polar', NULL, 7, CAST(N'2020-12-13 15:06:15.530' AS DateTime), N'lehaichien', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [Images], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [MetaKeywords], [MetaDescription], [Status], [UpHome]) VALUES (8, N'Fitbit', N'fitbit', N'/Data/images/fitbit.png', 8, NULL, NULL, CAST(N'2020-12-14 04:09:41.753' AS DateTime), N'lehaichien', NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [Images], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [MetaKeywords], [MetaDescription], [Status], [UpHome]) VALUES (10, N'Asus', N'asus', NULL, 11, CAST(N'2020-12-13 15:07:21.800' AS DateTime), N'lehaichien', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [Images], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [MetaKeywords], [MetaDescription], [Status], [UpHome]) VALUES (11, N'LG', N'lg', NULL, 11, CAST(N'2020-12-13 15:08:28.320' AS DateTime), N'lehaichien', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [Images], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [MetaKeywords], [MetaDescription], [Status], [UpHome]) VALUES (12, N'Apple', N'apple', NULL, 12, CAST(N'2020-12-13 15:08:43.097' AS DateTime), N'lehaichien', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [Images], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [MetaKeywords], [MetaDescription], [Status], [UpHome]) VALUES (13, N'Pebble', N'pebble', NULL, 12, CAST(N'2020-12-13 15:09:02.250' AS DateTime), N'lehaichien', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [Images], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [MetaKeywords], [MetaDescription], [Status], [UpHome]) VALUES (14, N'Motorola', N'motorola', NULL, 13, CAST(N'2020-12-13 15:09:27.660' AS DateTime), N'lehaichien', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [Images], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [MetaKeywords], [MetaDescription], [Status], [UpHome]) VALUES (15, N'Vòng đeo tay', N'vong-deo-tay', NULL, 14, CAST(N'2020-12-13 15:09:50.090' AS DateTime), N'lehaichien', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [Images], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [MetaKeywords], [MetaDescription], [Status], [UpHome]) VALUES (16, N'ZTE', N'zte', NULL, 16, CAST(N'2020-12-13 15:10:25.510' AS DateTime), N'lehaichien', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [Images], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [MetaKeywords], [MetaDescription], [Status], [UpHome]) VALUES (17, N'Phụ kiện', N'phu-kien', NULL, 17, CAST(N'2020-12-13 15:10:53.663' AS DateTime), N'lehaichien', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [Images], [Order], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [MetaKeywords], [MetaDescription], [Status], [UpHome]) VALUES (18, N'Qua sử dụng', N'qua-su-dung', NULL, 18, CAST(N'2020-12-13 15:11:10.867' AS DateTime), N'lehaichien', NULL, NULL, NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [Title], [MetaTitle], [Images], [Thumb], [Price], [OldPrice], [MetaKeywords], [MetaDescription], [Gift], [Quantity], [Detail], [Guarantee], [Specification], [MoreDesc], [CategoryID], [BrandID], [Special], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Garmin Venu SQ', N'garmin-venu-sq', N'<Images><Images>/Data/images/product/venu-sq-music-black-ldstore-1-768x768.png</Images><Images>/Data/images/product/venu-sq-music-black-ldstore-2-768x768.png</Images><Images>/Data/images/product/venu-sq-music-black-ldstore-3-768x768.png</Images><Images>/Data/images/product/venu-sq-music-black-ldstore-4-768x768.png</Images><Images>/Data/images/product/venu-sq-music-black-ldstore-5-768x768.png</Images></Images>', N'/Data/images/product/venu-sq-music-black-ldstore-1-300x300.png', CAST(4990000 AS Decimal(18, 0)), NULL, NULL, NULL, N'<ul>
	<li>Sản phẩm Garmin c&oacute; gi&aacute; ưu đ&atilde;i giảm gi&aacute; lớn vui l&ograve;ng li&ecirc;n hệ hotline để c&oacute; gi&aacute; tốt hơn</li>
	<li>D&aacute;n m&agrave;n h&igrave;nh PPF</li>
	<li>Giảm 100.000vnđ khi mua 2 sản phẩm</li>
	<li>Trả g&oacute;p l&atilde;i suất 0% qua thẻ t&iacute;n dụng</li>
</ul>
', 10, N'<h2 style="text-align: center;"><strong>THÔNG TIN ĐỒNG HỒ THÔNG MINH GARMIN VENU SQ – SMARTWATCH TÍNH NĂNG NGON GIÁ TỐT NHẤT TỪ GARMIN</strong></h2>
<p><img class="size-full wp-image-36344 aligncenter" src="https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-background-ldstore-1.png" alt="" width="1600" height="455" srcset="https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-background-ldstore-1.png 1600w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-background-ldstore-1-300x85.png 300w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-background-ldstore-1-768x218.png 768w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-background-ldstore-1-1024x291.png 1024w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-background-ldstore-1-600x171.png 600w" sizes="(max-width: 1600px) 100vw, 1600px"></p>
<p>Với màn hình Amoled sắc nét độ sáng cao, đồng hồ thông minh Venu Sq có GPS kết hợp phong cách hàng ngày và với các tính năng theo dõi sức khỏe như đo SPO2 oxy bão hòa trong máu và thể chất truyền cảm hứng để bạn tiếp tục di chuyển.</p>
<h3 class="app__feature__card__title light left">ĐƯỢC THIẾT KẾ DÀNH CHO BẠN</h3>
<p class="app__feature__card__description">Từ Corning Gorilla Glass 3 bền bỉ đến viền nhôm nhẹ và dây silicon thoải mái, chiếc smartwatch này đã được tạo ra để phù hợp phong của bạn. Với thiết kế đẹp mắt, phù hợp với mọi trang phục và mọi thứ trong ngày, chiếc đồng hồ với màn hình màu sáng và chế độ luôn bật tùy chọn, do đó bạn có thể nhìn mọi thứ nhanh chóng.</p>
<p><img class="size-full wp-image-36345 aligncenter" src="https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-6.png" alt="" width="1600" height="455" srcset="https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-6.png 1600w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-6-300x85.png 300w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-6-768x218.png 768w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-6-1024x291.png 1024w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-6-600x171.png 600w" sizes="(max-width: 1600px) 100vw, 1600px"></p>
<hr>
<h3 class="app__feature__card__title light left">THEO DÕI NĂNG LƯỢNG BODY BATTERY</h3>
<p class="app__feature__card__description">Xem mức năng lượng cơ thể cả ngày để có thể chọn thời gian tốt nhất cho hoạt động và nghỉ ngơi.</p>
<h3 class="app__feature__card__title light left">CẢM BIẾN MÁY ĐO NHỊP TIM VÀ NỒNG ĐỘ OXI TRONG MÁU SPO2</h3>
<p class="app__feature__card__description">Thiết bị cảm biến Pulse Ox<sup>2</sup>&nbsp;đo nồng độ oxy hấp thụ vào máu trong ngày và trong giấc ngủ để đánh giá khả năng hấp thụ oxy của cơ thể.</p>
<p><img class="size-full wp-image-36348 aligncenter" src="https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-8.png" alt="" width="1600" height="455" srcset="https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-8.png 1600w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-8-300x85.png 300w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-8-768x218.png 768w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-8-1024x291.png 1024w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-8-600x171.png 600w" sizes="(max-width: 1600px) 100vw, 1600px"></p>
<h3 class="app__feature__card__title light left">THEO DÕI MỨC ĐỘ CĂNG THẲNG</h3>
<p class="app__feature__card__description">Tìm hiểu xem liệu bạn đang có một ngày yên bình, cân bằng hoặc căng thẳng. Bộ nhắc nhở nghỉ ngơi thậm chí sẽ nhắc bạn thực hiện hoạt động thở ngắn khi bạn cảm thấy căng thẳng.</p>
<h3 class="app__feature__card__title light left">THEO DÕI CHU KÌ KINH NGUYỆT</h3>
<p class="app__feature__card__description">Sử dụng ứng dụng Garmin Connect để theo dõi chu kỳ kinh nguyệt của bạn, ghi lại các triệu chứng thể chất và cảm xúc và tìm hiểu về luyện tập và dinh dưỡng trong mỗi giai đoạn của chu kỳ. Thậm chí có được thông tin theo dõi chu kỳ king nguyệt trên cổ tay của bạn.</p>
<p><img class="size-full wp-image-36351 aligncenter" src="https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-12.png" alt="" width="800" height="400" srcset="https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-12.png 800w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-12-300x150.png 300w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-12-768x384.png 768w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-12-600x300.png 600w" sizes="(max-width: 800px) 100vw, 800px"></p>
<h3 class="app__feature__card__title light left">THEO DÕI LƯỢNG NƯỚC</h3>
<p class="app__feature__card__description">Ghi lại lượng chất lỏng hàng ngày để nhắc nhở bù nước. Bạn thậm chí có thể có một mục tiêu tự động như uống nước dựa trên lượng mồ hôi bạn mất trong các hoạt động.</p>
<p><img class="size-full wp-image-36339 aligncenter" src="https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-13.png" alt="" width="800" height="400" srcset="https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-13.png 800w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-13-300x150.png 300w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-13-768x384.png 768w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-13-600x300.png 600w" sizes="(max-width: 800px) 100vw, 800px"></p>
<h3 class="app__feature__card__title light left">THEO DÕI HÔ HẤP</h3>
<p class="app__feature__card__description">Xem cách bạn hít thở suốt cả ngày, trong khi ngủ và trong các hoạt động thở và yoga.</p>
<h3 class="app__feature__card__title light left">THEO DÕI GIẤC NGỦ TIÊN TIẾN</h3>
<p class="app__feature__card__description">Xem đầy đủ chất lượng giấc ngủ của bạn với phân tích các giai đoạn ngủ nông, ngủ sâu và ngủ mơ REM cũng như Pulse Ox<sup>2</sup>&nbsp;và dữ liệu hô hấp.</p>
<p><img class="size-full wp-image-36350 aligncenter" src="https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-11.png" alt="" width="1600" height="455" srcset="https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-11.png 1600w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-11-300x85.png 300w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-11-768x218.png 768w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-11-1024x291.png 1024w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-11-600x171.png 600w" sizes="(max-width: 1600px) 100vw, 1600px"></p>
<h3 class="app__feature__card__title light left">ĐO NHỊP TIM Ở CỔ TAY</h3>
<p class="app__feature__card__description">Đồng hồ&nbsp;liên tục lấy mẫu nhịp tim của bạn và sẽ cảnh báo nếu nhịp tim quá cao hoặc quá thấp trong khi bạn đang nghỉ ngơi. Nó cũng giúp đánh giá mức độ luyện tập chăm chỉ trong các hoạt động, thậm chí dưới nước.</p>
<h3 class="app__feature__card__title light left">THỞ THƯ GIÃN</h3>
<p class="app__feature__card__description">Khi bắt đầu thư giãn hoặc tập trung, bạn có thể bắt đầu hoạt động thở và đồng hồ này sẽ theo dõi mức căng thẳng và hô hấp để giúp bạn hiểu rõ bạn đang thở như thế nào.</p>
<p><img class="size-full wp-image-36340 aligncenter" src="https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-10.png" alt="" width="1600" height="455" srcset="https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-10.png 1600w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-10-300x85.png 300w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-10-768x218.png 768w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-10-1024x291.png 1024w, https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-10-600x171.png 600w" sizes="(max-width: 1600px) 100vw, 1600px"></p>
<h2 style="text-align: center;"><strong>&nbsp;</strong></h2>', 12, N'
<table class="shop_attributes woocommerce-product-attributes">
	<tbody>
		<tr>
			<th>Hệ Điều H&agrave;nh</th>
			<td>
			<p>Garmin OS</p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p>Amoled 1.3inch</p>
			</td>
		</tr>
		<tr>
			<th>K&iacute;ch thước</th>
			<td>
			<p>40.6 x 37.0 x 11.5 mm</p>
			</td>
		</tr>
		<tr>
			<th>Trọng lượng</th>
			<td>
			<p>37.6 g</p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p>Ch&ecirc;́ đ&ocirc;̣ đồng hồ th&ocirc;ng minh: Tối đa 6 ng&agrave;y Ch&ecirc;́ đ&ocirc;̣ GPS v&agrave; &acirc;m nhạc: Tối đa 6 giờ Chế độ GPS kh&ocirc;ng sử dụng t&iacute;nh năng nhạc: L&ecirc;n đến 20 giờ.</p>
			</td>
		</tr>
		<tr>
			<th>Chuẩn chống nước - Kh&aacute;ng bụi</th>
			<td>
			<p>5 ATM</p>
			</td>
		</tr>
		<tr>
			<th>Quai đeo</th>
			<td>
			<p>20mm c&oacute; thể thay thế</p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p>Đen, V&agrave;ng</p>
			</td>
		</tr>
	</tbody>
</table>

', N'<p><strong>H&agrave;ng ch&iacute;nh h&atilde;ng FPT</strong><br />
<strong>Bảo h&agrave;nh : 12 th&aacute;ng (1 đổi 1)</strong></p>
', 6, 1, 1, NULL, NULL, CAST(N'2020-12-14 18:16:12.610' AS DateTime), N'lehaichien')
INSERT [dbo].[Products] ([ID], [Title], [MetaTitle], [Images], [Thumb], [Price], [OldPrice], [MetaKeywords], [MetaDescription], [Gift], [Quantity], [Detail], [Guarantee], [Specification], [MoreDesc], [CategoryID], [BrandID], [Special], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Garmin Approach S62', N'garmin-approach-s62', N'<Images><Images>/Data/images/product/garmin-approach-s62-black-image-ldstore-2-768x768%20(1).png</Images><Images>/Data/images/product/garmin-approach-s62-black-image-ldstore-1-768x768.png</Images><Images>/Data/images/product/garmin-approach-s62-black-image-ldstore-4-768x768.png</Images><Images>/Data/images/product/garmin-approach-s62-black-image-ldstore-5-768x768.png</Images></Images>', N'/Data/images/product/garmin-approach-s62-black-image-ldstore-2-300x300.png', CAST(12800000 AS Decimal(18, 0)), CAST(12990000 AS Decimal(18, 0)), NULL, NULL, N'<ul>
	<li>Sản phẩm Garmin c&oacute; gi&aacute; ưu đ&atilde;i giảm gi&aacute; lớn vui l&ograve;ng li&ecirc;n hệ hotline để c&oacute; gi&aacute; tốt hơn</li>
	<li>D&aacute;n m&agrave;n h&igrave;nh PPF</li>
	<li>Giảm 100.000vnđ khi mua 2 sản phẩm</li>
	<li>Trả g&oacute;p l&atilde;i suất 0% qua thẻ t&iacute;n dụng</li>
</ul>
', 10, N'<h2>Đ&Aacute;NH GI&Aacute; TR&Ecirc;N TAY ĐỒNG HỒ TH&Ocirc;NG MINH THỂ THAO SMARTWATCH CHƠI GOLF GARMIN S62</h2>

<p><img alt="" class="aligncenter size-full wp-image-28050" src="https://ldstore.vn/wp-content/uploads/2020/05/garmin-s62-12.jpg" style="height:546px; width:1632px" /></p>

<p><img alt="" class="aligncenter size-full wp-image-28042" src="https://ldstore.vn/wp-content/uploads/2020/05/bestgame2_desktop_01-7d319c40-194d-43cc-925a-7978ffd462e1.png" style="height:455px; width:1600px" /></p>

<p>&nbsp;</p>

<p><img alt="" class="aligncenter size-full wp-image-28049" src="https://ldstore.vn/wp-content/uploads/2020/05/S62-Hires.jpg" style="height:354px; width:500px" /></p>

<p><strong>Sang trọng hơn tr&ecirc;n s&acirc;n golf</strong></p>

<p>Garmin Approach S62 l&agrave; một chiếc đồng hồ GPS hỗ trợ chơi golf c&oacute; kiểu d&aacute;ng thiết kế phong c&aacute;ch với m&agrave;n h&igrave;nh cảm ứng đủ m&agrave;u sắc, k&iacute;ch thước 1.3 inch, lớn hơn 17% so với phi&ecirc;n bản trước. Thiết bị hỗ trợ tải sẵn hơn 41,000 bản đồ s&acirc;n golf từ khắp nơi tr&ecirc;n thế giới.</p>

<hr />
<h3><strong>GARMIN S62 Virtual Caddie hỗ trợ ngay tr&ecirc;n cổ tay</strong></h3>

<p>Virtual Caddie hay trợ l&yacute; chơi golf ảo được t&iacute;ch hợp tr&ecirc;n đồng hồ, hỗ trợ người d&ugrave;ng tận dụng lợi thế của c&aacute;c t&iacute;nh năng được x&acirc;y dựng để ph&acirc;n t&iacute;ch những c&uacute; đ&aacute;nh trước đ&oacute; của golfer, từ đ&oacute; lựa chọn đầu gậy ph&ugrave; hợp nhất cho mỗi c&uacute; đ&aacute;nh.</p>

<p><img alt="" class="aligncenter size-full wp-image-28048" src="https://ldstore.vn/wp-content/uploads/2020/05/garmin-s62-.jpg" style="height:375px; width:500px" /></p>

<p><img alt="" class="aligncenter size-full wp-image-28045" src="https://ldstore.vn/wp-content/uploads/2020/05/garmin-s62-9.png" style="height:921px; width:921px" /></p>

<hr />
<p><strong>GARMIN S62 Harzard View dự đo&aacute;n những mối nguy hiểm khi chơi</strong></p>

<p>T&iacute;nh năng n&agrave;y cho ph&eacute;p người chơi tr&aacute;nh được những điểm nguy hiểm tr&ecirc;n bản đồ như hố c&aacute;t, hồ, ao, hầm ngầm v&agrave; nhận th&ocirc;ng tin khoảng c&aacute;ch quan trọng để biết ch&iacute;nh x&aacute;c những g&igrave; cần tr&aacute;nh trong khi chơi.</p>

<p><img alt="" class="aligncenter size-full wp-image-28041" src="https://ldstore.vn/wp-content/uploads/2020/05/garmin-s62-2.jpg" style="height:375px; width:500px" /></p>

<p><img alt="" class="aligncenter size-full wp-image-28046" src="https://ldstore.vn/wp-content/uploads/2020/05/garmin-s62-10.png" style="height:985px; width:814px" /></p>

<hr />
<p><strong>GARMIN S62 Hỗ trợ nhiều hoạt động thể thao chuy&ecirc;n nghiệp</strong></p>

<p>Approach S62 c&oacute; ưu thế về thời lượng pin, k&eacute;o d&agrave;i tới 20 giờ ở chế độ GPS v&agrave; tối đa 14 ng&agrave;y ở chế độ đồng hồ th&ocirc;ng minh. Ngo&agrave;i c&aacute;c t&iacute;nh năng nổi bật về hỗ trợ người chơi golf chuy&ecirc;n nghiệp, đồng hồ sẽ lu&ocirc;n lu&ocirc;n đồng h&agrave;nh c&ugrave;ng người d&ugrave;ng với dữ liệu theo d&otilde;i những hoạt động thể thao kh&aacute;c như chạy bộ, đạp xe, bơi lội v&agrave; nhiều hơn nữa.</p>

<p><img alt="" class="aligncenter size-full wp-image-28040" src="https://ldstore.vn/wp-content/uploads/2020/05/garmin-s62-3.jpg" style="height:375px; width:500px" /></p>

<p><img alt="" class="aligncenter size-full wp-image-28044" src="https://ldstore.vn/wp-content/uploads/2020/05/garmin-s62-8.png" style="height:921px; width:921px" /></p>

<hr />
<p><strong>GARMIN S62 Theo d&otilde;i sức khỏe</strong></p>

<p>C&ugrave;ng với c&aacute;c t&iacute;nh năng theo d&otilde;i vận động, đồng hồ c&ograve;n c&oacute; thể đ&aacute;nh gi&aacute; tốt hơn mức độ sức khỏe v&agrave; thể lực chung của từng c&aacute; nh&acirc;n, cung cấp chức năng theo d&otilde;i tim tr&ecirc;n cổ tay v&agrave; cảm biến Pulse Ox để ước t&iacute;nh mức b&atilde;o h&ograve;a oxy trong m&aacute;u. Cuối ng&agrave;y, S62 ph&acirc;n t&iacute;ch giấc ngủ của người d&ugrave;ng với bộ điều khiển giấc ngủ chuy&ecirc;n s&acirc;u.</p>

<p><img alt="" class="aligncenter size-full wp-image-28039" src="https://ldstore.vn/wp-content/uploads/2020/05/garmin-s62-4.jpg" style="height:375px; width:500px" /></p>

<p><img alt="" class="aligncenter size-full wp-image-28047" src="https://ldstore.vn/wp-content/uploads/2020/05/garmin-s62-11.png" style="height:431px; width:792px" /></p>

<hr />
<p><strong>GARMIN S62 Th&ocirc;ng b&aacute;o th&ocirc;ng minh</strong></p>

<p>S62 nhận th&ocirc;ng b&aacute;o th&ocirc;ng minh như cuộc gọi đến, tin nhắn v&agrave; một số th&ocirc;ng b&aacute;o kh&aacute;c khi người d&ugrave;ng đồng bộ với điện thoại. Ngo&agrave;i ra, khả năng tuỳ biến mặt đồng hồ, tải ứng dụng v&agrave; widget từ cửa h&agrave;ng Connect IQ cũng được hỗ trợ tr&ecirc;n thiết bị.</p>

<p><img alt="" class="aligncenter size-full wp-image-28038" src="https://ldstore.vn/wp-content/uploads/2020/05/garmin-s62-5.jpg" style="height:375px; width:500px" /></p>

<hr />
<h3 style="text-align:center"><strong>H&Igrave;NH ẢNH THỰC TẾ ĐỒNG HỒ TH&Ocirc;NG MINH CHƠI GOLF GARMIN S62&nbsp;</strong></h3>

<p>&nbsp;</p>

<hr />
<h3>Mua garmin s62 ở đ&acirc;u ? Gi&aacute; garmin s62</h3>

<h3>Mua Garmin s62 ở h&agrave; nội ? Mua garmin s62 trả g&oacute;p qua thẻ t&iacute;n dụng l&atilde;i suất 0%</h3>

<p>&nbsp;</p>', NULL, N'<table class="shop_attributes woocommerce-product-attributes">
	<tbody>
		<tr>
			<th>Hệ Điều H&agrave;nh</th>
			<td>
			<p>Garmin OS</p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p>Đường kính 1,3&rdquo; (33.02 mm) ĐỘ PH&Acirc;N GIẢI M&Agrave;N H&Igrave;NH 260 x 260 pixels LOẠI MÀN HÌNH c&ocirc;ng ngh&ecirc;̣ MIP (b&ocirc;̣ nhớ trong từng đi&ecirc;̉m ảnh) ch&ocirc;́ng chói, có th&ecirc;̉ nhìn rõ dưới ánh sáng mặt trời</p>
			</td>
		</tr>
		<tr>
			<th>Chuẩn chống nước - Kh&aacute;ng bụi</th>
			<td>
			<p>5 ATM</p>
			</td>
		</tr>
		<tr>
			<th>K&iacute;ch thước</th>
			<td>
			<p>47 x 47 x 14.8 mm</p>
			</td>
		</tr>
		<tr>
			<th>Quai đeo</th>
			<td>
			<p>22mm c&oacute; thể thay thế</p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p>Đồng hồ th&ocirc;ng minh: Tối đa 14 ng&agrave;y</p>
			</td>
		</tr>
		<tr>
			<th>Chất liệu</th>
			<td>
			<p>Stainless Steel | Ceramic</p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p>Đen, Trắng</p>
			</td>
		</tr>
	</tbody>
</table>
', NULL, 6, 1, 1, NULL, NULL, CAST(N'2020-12-14 18:17:18.197' AS DateTime), N'lehaichien')
INSERT [dbo].[Products] ([ID], [Title], [MetaTitle], [Images], [Thumb], [Price], [OldPrice], [MetaKeywords], [MetaDescription], [Gift], [Quantity], [Detail], [Guarantee], [Specification], [MoreDesc], [CategoryID], [BrandID], [Special], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Garmin Venu SQ Music Edition', N'garmin-venu-sq-music-edition', N'<Images><Images>/Data/images/product/venu-sq-music-black-ldstore-2-768x768.png</Images><Images>/Data/images/product/venu-sq-music-black-ldstore-3-768x768%20(1).png</Images><Images>/Data/images/product/venu-sq-music-black-ldstore-3-768x768.png</Images><Images>/Data/images/product/venu-sq-music-black-ldstore-4-768x768.png</Images><Images>/Data/images/product/venu-sq-music-black-ldstore-5-768x768%20(1).png</Images></Images>', N'/Data/images/product/venu-sq-music-black-ldstore-1111-300x300.png', CAST(6190000 AS Decimal(18, 0)), NULL, NULL, NULL, N'<ul>
	<li>Sản phẩm Garmin c&oacute; gi&aacute; ưu đ&atilde;i giảm gi&aacute; lớn vui l&ograve;ng li&ecirc;n hệ hotline để c&oacute; gi&aacute; tốt hơn</li>
	<li>D&aacute;n m&agrave;n h&igrave;nh PPF</li>
	<li>Giảm 100.000vnđ khi mua 2 sản phẩm</li>
	<li>Trả g&oacute;p l&atilde;i suất 0% qua thẻ t&iacute;n dụng</li>
</ul>
', 10, N'<h2 style="text-align:center"><strong>TH&Ocirc;NG TIN ĐỒNG HỒ TH&Ocirc;NG MINH GARMIN VENU SQ MUSIC EDITION &ndash; SMARTWATCH T&Iacute;NH NĂNG NGON GI&Aacute; TỐT NHẤT TỪ GARMIN</strong></h2>

<p><img alt="" class="aligncenter size-full wp-image-36344" src="https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-background-ldstore-1.png" style="height:455px; width:1600px" /></p>

<p>Với m&agrave;n h&igrave;nh Amoled sắc n&eacute;t độ s&aacute;ng cao, đồng hồ th&ocirc;ng minh Venu Sq Music Edition c&oacute; GPS kết hợp phong c&aacute;ch h&agrave;ng ng&agrave;y đi k&egrave;m c&oacute; bộ nhớ trong để nghe nhạc offline khi tập luyện v&agrave; với c&aacute;c t&iacute;nh năng theo d&otilde;i sức khỏe như đo SPO2 oxy b&atilde;o h&ograve;a trong m&aacute;u v&agrave; thể chất truyền cảm hứng để bạn tiếp tục di chuyển.</p>

<h3>ĐƯỢC THIẾT KẾ D&Agrave;NH CHO BẠN</h3>

<p>Từ Corning Gorilla Glass 3 bền bỉ đến viền nh&ocirc;m nhẹ v&agrave; d&acirc;y silicon thoải m&aacute;i, chiếc smartwatch n&agrave;y đ&atilde; được tạo ra để ph&ugrave; hợp phong của bạn. Với thiết kế đẹp mắt, ph&ugrave; hợp với mọi trang phục v&agrave; mọi thứ trong ng&agrave;y, chiếc đồng hồ với m&agrave;n h&igrave;nh m&agrave;u s&aacute;ng v&agrave; chế độ lu&ocirc;n bật t&ugrave;y chọn, do đ&oacute; bạn c&oacute; thể nh&igrave;n mọi thứ nhanh ch&oacute;ng.</p>

<p><img alt="" class="aligncenter size-full wp-image-36345" src="https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-6.png" style="height:455px; width:1600px" /></p>

<hr />
<h3>THEO D&Otilde;I NĂNG LƯỢNG BODY BATTERY</h3>

<p>Xem mức năng lượng cơ thể cả ng&agrave;y để c&oacute; thể chọn thời gian tốt nhất cho hoạt động v&agrave; nghỉ ngơi.</p>

<h3>CẢM BI&Ecirc;́N MÁY ĐO NHỊP TIM VÀ N&Ocirc;̀NG Đ&Ocirc;̣ OXI TRONG MÁU SPO2</h3>

<p>Thiết bị cảm biến Pulse Ox<sup>2</sup>&nbsp;đo nồng độ oxy hấp thụ v&agrave;o m&aacute;u trong ng&agrave;y v&agrave; trong giấc ngủ để đ&aacute;nh gi&aacute; khả năng hấp thụ oxy của cơ thể.</p>

<p><img alt="" class="aligncenter size-full wp-image-36348" src="https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-8.png" style="height:455px; width:1600px" /></p>

<h3>THEO DÕI MỨC Đ&Ocirc;̣ CĂNG THẲNG</h3>

<p>T&igrave;m hiểu xem liệu bạn đang c&oacute; một ng&agrave;y y&ecirc;n bình, c&acirc;n bằng hoặc căng thẳng. Bộ nhắc nhở nghỉ ngơi thậm ch&iacute; sẽ nhắc bạn thực hiện hoạt động thở ngắn khi bạn cảm thấy căng thẳng.</p>

<p><img alt="" class="aligncenter size-full wp-image-36426" src="https://ldstore.vn/wp-content/uploads/2020/11/Garmin-vernu-sq-music.png" style="height:478px; width:1090px" /></p>

<h3>THEO DÕI CHU KÌ KINH NGUY&Ecirc;̣T</h3>

<p>Sử dụng ứng dụng Garmin Connect để theo d&otilde;i chu kỳ kinh nguy&ecirc;̣t của bạn, ghi lại c&aacute;c triệu chứng thể chất v&agrave; cảm x&uacute;c v&agrave; t&igrave;m hiểu về luy&ecirc;̣n t&acirc;̣p v&agrave; dinh dưỡng trong mỗi giai đoạn của chu kỳ. Thậm ch&iacute; c&oacute; được th&ocirc;ng tin theo d&otilde;i chu kỳ king nguy&ecirc;̣t tr&ecirc;n cổ tay của bạn.</p>

<p><img alt="" class="aligncenter size-full wp-image-36351" src="https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-12.png" style="height:400px; width:800px" /></p>

<h3>THEO D&Otilde;I LƯỢNG NƯỚC</h3>

<p>Ghi lại lượng ch&acirc;́t lỏng h&agrave;ng ng&agrave;y để nhắc nhở b&ugrave; nước. Bạn thậm ch&iacute; c&oacute; thể c&oacute; một mục ti&ecirc;u tự động như uống nước dựa tr&ecirc;n lượng mồ h&ocirc;i bạn mất trong c&aacute;c hoạt động.</p>

<p><img alt="" class="aligncenter size-full wp-image-36339" src="https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-13.png" style="height:400px; width:800px" /></p>

<h3>THEO DÕI H&Ocirc; H&Acirc;́P</h3>

<p>Xem c&aacute;ch bạn h&iacute;t thở suốt cả ng&agrave;y, trong khi ngủ v&agrave; trong c&aacute;c hoạt động thở v&agrave; yoga.</p>

<h3>THEO DÕI GI&Acirc;́C NGỦ TI&Ecirc;N TI&Ecirc;́N</h3>

<p>Xem đầy đủ chất lượng giấc ngủ của bạn với ph&acirc;n t&iacute;ch c&aacute;c giai đoạn ngủ n&ocirc;ng, ngủ s&acirc;u v&agrave; ngủ mơ REM cũng như Pulse Ox<sup>2</sup>&nbsp;v&agrave; dữ liệu h&ocirc; hấp.</p>

<p><img alt="" class="aligncenter size-full wp-image-36350" src="https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-11.png" style="height:455px; width:1600px" /></p>

<h3>ĐO NHỊP TIM Ở C&Ocirc;̉ TAY</h3>

<p>Đồng hồ&nbsp;li&ecirc;n tục lấy mẫu nhịp tim của bạn v&agrave; sẽ cảnh b&aacute;o nếu nhịp tim qu&aacute; cao hoặc qu&aacute; thấp trong khi bạn đang nghỉ ngơi. N&oacute; cũng gi&uacute;p đ&aacute;nh gi&aacute; mức độ luyện tập chăm chỉ trong c&aacute;c hoạt động, thậm ch&iacute; dưới nước.</p>

<h3>THỞ THƯ GI&Atilde;N</h3>

<p>Khi bắt đầu thư gi&atilde;n hoặc tập trung, bạn c&oacute; thể bắt đầu hoạt động thở v&agrave; đồng hồ n&agrave;y sẽ theo d&otilde;i mức căng thẳng v&agrave; h&ocirc; hấp để gi&uacute;p bạn hiểu r&otilde; bạn đang thở như thế n&agrave;o.</p>

<p><img alt="" class="aligncenter size-full wp-image-36340" src="https://ldstore.vn/wp-content/uploads/2020/11/venu-sq-music-black-ldstore-10.png" style="height:455px; width:1600px" /></p>

<h2 style="text-align:center"><strong>&nbsp;</strong></h2>', 12, N'<table class="shop_attributes woocommerce-product-attributes">
	<tbody>
		<tr>
			<th>Hệ Điều H&agrave;nh</th>
			<td>
			<p>Garmin OS</p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p>Amoled 1.3inch</p>
			</td>
		</tr>
		<tr>
			<th>K&iacute;ch thước</th>
			<td>
			<p>40.6 x 37.0 x 11.5 mm</p>
			</td>
		</tr>
		<tr>
			<th>Trọng lượng</th>
			<td>
			<p>37.6 g</p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p>Ch&ecirc;́ đ&ocirc;̣ đồng hồ th&ocirc;ng minh: Tối đa 6 ng&agrave;y Ch&ecirc;́ đ&ocirc;̣ GPS v&agrave; &acirc;m nhạc: Tối đa 6 giờ Chế độ GPS kh&ocirc;ng sử dụng t&iacute;nh năng nhạc: L&ecirc;n đến 20 giờ.</p>
			</td>
		</tr>
		<tr>
			<th>Chuẩn chống nước - Kh&aacute;ng bụi</th>
			<td>
			<p>5 ATM</p>
			</td>
		</tr>
		<tr>
			<th>Quai đeo</th>
			<td>
			<p>20mm c&oacute; thể thay thế</p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p>Đen, V&agrave;ng</p>
			</td>
		</tr>
		<tr>
			<th>Th&ocirc;ng tin phần cứng</th>
			<td>
			<p>Nghe nhạc Offline, Bộ nhớ trong : 4GB</p>
			</td>
		</tr>
	</tbody>
</table>
', N'<p><strong>H&agrave;ng ch&iacute;nh h&atilde;ng FPT</strong><br />
<strong>Bảo h&agrave;nh : 12 th&aacute;ng (1 đổi 1)</strong></p>
', 6, 1, 1, NULL, NULL, CAST(N'2020-12-14 18:17:50.133' AS DateTime), N'lehaichien')
INSERT [dbo].[Products] ([ID], [Title], [MetaTitle], [Images], [Thumb], [Price], [OldPrice], [MetaKeywords], [MetaDescription], [Gift], [Quantity], [Detail], [Guarantee], [Specification], [MoreDesc], [CategoryID], [BrandID], [Special], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Garmin Swim 2', N'garmin-swim-2', N'<Images><Images>/Data/images/product/garmin-swim2-slate-ldstore-05-150x150.png</Images><Images>/Data/images/product/garmin-swim2-slate-ldstore-01.png</Images><Images>/Data/images/product/garmin-swim2-slate-ldstore-02.png</Images><Images>/Data/images/product/garmin-swim2-slate-ldstore-03.png</Images><Images>/Data/images/product/garmin-swim2-slate-ldstore-04.png</Images></Images>', N'/Data/images/product/garmin-swim2-slate-ldstore-05-300x300.png', CAST(5990000 AS Decimal(18, 0)), NULL, NULL, NULL, N'<ul>
	<li>Sản phẩm Garmin c&oacute; gi&aacute; ưu đ&atilde;i giảm gi&aacute; lớn vui l&ograve;ng li&ecirc;n hệ hotline để c&oacute; gi&aacute; tốt hơn</li>
	<li>D&aacute;n m&agrave;n h&igrave;nh cường lực trị gi&aacute; 100.000đ</li>
	<li>Giảm 100.000vnđ khi mua 2 sản phẩm</li>
	<li>Thanh to&aacute;n VNPAY QRCODE giảm 50.000đ</li>
	<li>Trả g&oacute;p l&atilde;i suất 0% qua thẻ t&iacute;n dụng</li>
</ul>
', 10, N'<h2>Đ&aacute;nh gi&aacute; tr&ecirc;n tay Đồng hồ th&ocirc;ng minh SmartWatch Garmin Swim 2 &ndash; Đồng hồ thể thao GPS với hỗ trợ bơi lội chuy&ecirc;n nghiệp</h2>

<ul>
	<li style="text-align:center">Theo d&otilde;i nhịp tim đo tr&ecirc;n cổ tay&sup1; ở dưới nước trong khi bơi.</li>
	<li style="text-align:center">Chế độ bơi bể bơi: ghi lại qu&atilde;ng đường, nhịp độ, số lần quạt tay, kiểu quạt tay v&agrave; swolf (đo hiệu quả bơi).</li>
	<li style="text-align:center">Chế độ bơi ngo&agrave;i trời: sử dụng GPS t&iacute;ch hợp d&agrave;nh cho bơi ở hồ, s&ocirc;ng hoặc biển; ghi lại qu&atilde;ng đường, nhịp độ, số lần quạt tay, swolf, tỷ lệ quạt tay v&agrave; qu&atilde;ng đường quạt tay.</li>
	<li style="text-align:center">Cung cấp c&aacute;c t&iacute;nh năng ti&ecirc;n tiến gi&uacute;p bạn giữ nhịp độ, ghi lại tập luyện v&agrave; hơn nữa<br />
	Bao gồm ph&acirc;n t&iacute;ch trực tuyến miễn ph&iacute;, tạo b&agrave;i tập t&ugrave;y chỉnh, lưu trữ v&agrave; chia sẻ tr&ecirc;n cộng đồng trực tuyến Garmin Connect&trade;.</li>
	<li style="text-align:center">Tuổi thọ pin: l&ecirc;n đến 7 ng&agrave;y ở chế độ đồng hồ th&ocirc;ng minh, 13 giờ chế độ GPS v&agrave; nhịp tim quang học (OHR) v&agrave; 72 giờ ở chế độ bể bơi v&agrave; OHR.</li>
</ul>

<h3 style="text-align:center">LD STORE ph&acirc;n phối Garmin Swim 2 với 2 m&agrave;u sắc :</h3>

<h3 style="text-align:center">Garmin Swim 2 Whitestone ( Đen trắng )</h3>

<h3 style="text-align:center">Garmin Swim 2 Slate ( Đen x&aacute;m )</h3>

<p><img alt="" class="aligncenter size-full wp-image-24871" src="https://ldstore.vn/wp-content/uploads/2020/02/swim2-ldstore-2.jpg" style="height:480px; width:720px" /></p>

<p>&nbsp;</p>

<hr />
<p>&nbsp;</p>

<p>Bơi v&agrave; tập mọi l&uacute;c mọi nơi với Garmin Swim 2, đồng hồ th&ocirc;ng minh bơi lội GPS. Sử dụng thiết bị ở bể bơi hoặc v&ugrave;ng nước ngo&agrave;i trời để theo d&otilde;i nhịp tim dưới nước của bạn từ cổ tay1 v&agrave; đảm bảo tiến bộ bằng c&aacute;ch ghi lại qu&atilde;ng đường, nhịp độ, số lần quạt tay, kiểu quạt tay v&agrave; qu&atilde;ng đường mỗi lần quạt tay. Tất cả bạn cần l&agrave; xuống nước.</p>

<p><img alt="" class="aligncenter size-full wp-image-24872" src="https://ldstore.vn/wp-content/uploads/2020/02/swim2-ldstore-3.jpg" style="height:434px; width:800px" /></p>

<hr />
<h3 style="text-align:left">Garmin Swim 2 Nhịp Tim Đo Tr&ecirc;n Cổ Tay dưới nước</h3>

<p>Garmin Swim 2 với c&ocirc;ng nghệ đo nhịp tim Elevate đo nhịp tim từ cổ tay 24/7, bao gồm c&aacute;c hoạt động bơi.&nbsp; Nh&igrave;n nhịp tim thực tế trong thời gian thực khi bơi, kiểm tra c&aacute;c gi&aacute; trị trung b&igrave;nh v&agrave; tối đa trong khi nghỉ, sau đ&oacute; ph&acirc;n t&iacute;ch nhịp tim sau khi bơi tr&ecirc;n Garmin Connect.</p>

<p><img alt="" class="aligncenter size-full wp-image-24870" src="https://ldstore.vn/wp-content/uploads/2020/02/swim2-ldstore-1.jpg" style="height:389px; width:1000px" /></p>

<hr />
<h3>Garmin Swim 2 Bể bơi v&agrave; V&ugrave;ng nước ngo&agrave;i trời</h3>

<p>Khi xuống nước, đồng hồ n&agrave;y hoạt động để theo d&otilde;i b&agrave;i tập của bạn.&nbsp;Sử dụng GPS t&iacute;ch hợp, bạn c&oacute; thể tập luyện trong hồ, s&ocirc;ng v&agrave; biển trong khi ghi lại qu&atilde;ng đường, nhịp độ, số lần quạt tay, tỷ lệ quạt tay, qu&atilde;ng đường quạt tay v&agrave; điểm swolf để đo hiệu quả bơi. Nếu bạn th&iacute;ch bơi ở bể bơi, h&atilde;y tận dụng c&aacute;c t&iacute;nh năng ti&ecirc;n tiến d&ugrave;ng cho bể bơi bao gồm t&iacute;nh năng dừng tự động khi nghỉ ngời nhằm theo d&otilde;i c&aacute;c thời khoảng bơi v&agrave; nghỉ tự động m&agrave; kh&ocirc;ng cần bấm n&uacute;t.</p>

<p><img alt="" class="aligncenter size-full wp-image-24877" src="https://ldstore.vn/wp-content/uploads/2020/02/swim2-ldstore-4.png" style="height:500px; width:500px" /> <img alt="" class="aligncenter size-full wp-image-24878" src="https://ldstore.vn/wp-content/uploads/2020/02/swim2-ldstore-5.png" style="height:500px; width:500px" /></p>

<hr />
<h3>Garmin Swim 2 C&aacute;c t&iacute;nh năng bơi n&acirc;ng cao</h3>

<p>Tập luyện n&acirc;ng cao cần c&oacute; c&aacute;c t&iacute;nh năng ti&ecirc;n tiến, đ&oacute; l&agrave; l&yacute; do ch&uacute;ng t&ocirc;i đ&atilde; th&ecirc;m nhiều hơn v&agrave;o đồng hồ th&ocirc;ng minh Garmin Swim 2.&nbsp; Tốc độ bơi tới hạn ước lượng tốc độ ngưỡng kỵ kh&iacute; v&agrave; bạn c&oacute; thể sử dụng n&oacute; để hướng dẫn v&agrave; theo d&otilde;i sự tiến bộ của m&igrave;nh.&nbsp;Cảnh b&aacute;o nhịp độ khi rẽ gi&uacute;p dễ d&agrave;ng theo đuổi v&agrave; đạt được mục ti&ecirc;u.&nbsp;Chức năng ghi luyện tập gi&uacute;p bạn theo d&otilde;i thời gian v&agrave; qu&atilde;ng đường luyện tập, như đạp, bơi một tay, hoặc tập bơi ch&egrave;o. V&agrave; khi bạn cần nghỉ, Garmin Swim 2 cho ph&eacute;p bạn theo d&otilde;i lần nghỉ với hai kiểu bộ đếm giờ nghỉ.</p>

<p><img alt="" class="aligncenter size-full wp-image-24879" src="https://ldstore.vn/wp-content/uploads/2020/02/swim2-ldstore-6.png" style="height:500px; width:500px" /> <img alt="" class="aligncenter size-full wp-image-24880" src="https://ldstore.vn/wp-content/uploads/2020/02/swim2-ldstore-7.png" style="height:500px; width:500px" /></p>

<hr />
<h3>Garmin Swim 2 được thiết kế d&agrave;nh cho m&ocirc;i trường dưới nước</h3>

<p>Garmin Swim 2 được thiết kế để kh&ocirc;ng bao giờ l&agrave;m bạn chậm lại dưới nước &ndash; thiết bị gọn v&agrave; nhẹ. C&ocirc;ng nghệ m&agrave;n h&igrave;nh Garmin Chroma Display&nbsp; lu&ocirc;n s&aacute;ng đầy m&agrave;u sắc gi&uacute;p dễ đọc kể cả dưới &aacute;nh mặt trời trực tiếp. Với giao diện 5 n&uacute;t đ&aacute;ng tin cậy, bạn c&oacute; thể dễ d&agrave;ng bắt đầu tập luyện, xem dữ liệu kh&aacute;c nhau, ghi b&agrave;i tập hoặc thay đổi c&agrave;i đặt m&agrave; kh&ocirc;ng sợ bị ngấm nước.</p>

<p><img alt="" class="size-full wp-image-24883" src="https://ldstore.vn/wp-content/uploads/2020/02/swim2-ldstore-8.jpg" style="height:853px; width:1280px" /></p>

<hr />
<h3>Garmin Swim 2 lu&ocirc;n kết nối</h3>

<p>H&atilde;y bắt đầu bơi m&agrave; kh&ocirc;ng bỏ lại c&aacute;c t&iacute;nh năng th&ocirc;ng minh quan trọng. Sau khi được gh&eacute;p đ&ocirc;i với điện thoại th&ocirc;ng minh tương th&iacute;ch, bạn c&oacute; thể li&ecirc;n tục kết nối với c&aacute;c th&ocirc;ng b&aacute;o th&ocirc;ng minh v&agrave; tự động tải l&ecirc;n cộng đồng trực tuyến Garmin Connect.&nbsp; Ứng dụng cho ph&eacute;p bạn xem số liệu chi tiết v&agrave; theo d&otilde;i sự tiến bộ qua thời gian. Bạn cũng c&oacute; thể chia sẻ dữ liệu luyện tập với huấn luyện vi&ecirc;n, bạn tập, hoặc bạn b&egrave; v&agrave; gia đ&igrave;nh</p>

<p><img alt="" class="aligncenter size-full wp-image-24884" src="https://ldstore.vn/wp-content/uploads/2020/02/swim2-ldstore-9.jpg" style="height:653px; width:1160px" /></p>

<h2>Đeo 24/7</h2>

<p>Ngo&agrave;i c&aacute;c t&iacute;nh năng d&agrave;nh cho bơi lội, đồng hồ th&ocirc;ng minh Garmin Swim 2 cung cấp c&aacute;c t&iacute;nh năng theo d&otilde;i sức khỏe v&agrave; thể chất, rất ph&ugrave; hợp để đeo cả ng&agrave;y.&nbsp; C&aacute;c t&iacute;nh năng như theo d&otilde;i mức căng thẳng cả ng&agrave;y v&agrave; theo d&otilde;i giấc ngủ ti&ecirc;n tiến gi&uacute;p người bơi quản l&yacute; sức khỏe tổng thể bằng c&aacute;ch cung cấp c&aacute;c ph&acirc;n t&iacute;ch quan trọng c&oacute; thể được sử dụng để tối ưu h&oacute;a luyện tập.&nbsp; Đặt mục ti&ecirc;u di chuyển, theo d&otilde;i số bước ch&acirc;n, theo d&otilde;i năng lượng cơ thể, thực hiện tập thở c&oacute; hướng dẫn v&agrave; sử dụng n&oacute; để theo d&otilde;i c&aacute;c b&agrave;i tập &ndash; bao gồm đạp xe v&agrave; chạy &ndash; ngo&agrave;i bể bơi.</p>

<p><img alt="" class="aligncenter size-full wp-image-24885" src="https://ldstore.vn/wp-content/uploads/2020/02/swim2-ldstore-10.jpg" style="height:445px; width:800px" /></p>

<hr />
<h3 style="text-align:center">ẢNH TR&Ecirc;N TAY THỰC TẾ ĐỒNG HỒ TH&Ocirc;NG MINH BƠI LỘI SMARTWATCH GARMIN SWIM 2</h3>

<p><img alt="" class="size-full wp-image-24888" src="https://ldstore.vn/wp-content/uploads/2020/02/swim2-ldstore-11.jpg" style="height:2324px; width:3616px" /></p>

<p><img alt="" class="aligncenter size-full wp-image-24889" src="https://ldstore.vn/wp-content/uploads/2020/02/swim2-ldstore-12.png" style="height:1600px; width:2560px" /></p>

<p><img alt="" class="size-full wp-image-24890" src="https://ldstore.vn/wp-content/uploads/2020/02/swim2-ldstore-13.jpg" style="height:664px; width:1180px" /></p>

<hr />
<h3><strong>Mua Garmin Swim 2 ở đ&acirc;u ? Địa điểm mua Garmin </strong><strong>Swim 2 </strong><strong>tại H&agrave; Nội ?</strong></h3>

<h3><strong>Mua Garmin Swim 2</strong><strong>&nbsp;</strong><strong>Gi&aacute; Tốt Nhất ở đ&acirc;u ?&nbsp;</strong></h3>
', 12, N'<table class="shop_attributes woocommerce-product-attributes">
	<tbody>
		<tr>
			<th>Hệ Điều H&agrave;nh</th>
			<td>
			<p>Garmin OS</p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p>208 x 208 pixels Loại màn hình c&ocirc;ng ngh&ecirc;̣ MIP (b&ocirc;̣ nhớ trong từng đi&ecirc;̉m ảnh) ch&ocirc;́ng chói, có th&ecirc;̉ nhìn rõ dưới ánh sáng mặt trời</p>
			</td>
		</tr>
		<tr>
			<th>K&iacute;ch thước</th>
			<td>
			<p>42 x 42 x 11.4 mm Ph&ugrave; hợp với cổ tay c&oacute; chu vi từ 129-197 mm</p>
			</td>
		</tr>
		<tr>
			<th>Chuẩn chống nước - Kh&aacute;ng bụi</th>
			<td>
			<p>5 ATM</p>
			</td>
		</tr>
		<tr>
			<th>Quai đeo</th>
			<td>
			<p>(20 mm, ti&ecirc;u chuẩn c&ocirc;ng nghiệp)</p>
			</td>
		</tr>
		<tr>
			<th>Trọng lượng</th>
			<td>
			<p>36g</p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p>Ch&ecirc;́ đ&ocirc;̣ th&ocirc;ng minh: L&ecirc;n đ&ecirc;́n 7 Ng&agrave;y Ch&ecirc;́ đ&ocirc;̣ GPS: L&ecirc;n đ&ecirc;́n 13 giờ</p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p>Đen, Trắng</p>
			</td>
		</tr>
	</tbody>
</table>
', N'<h3><strong>Bảo h&agrave;nh : 12 th&aacute;ng ch&iacute;nh h&atilde;ng FPT</strong></h3>
', 6, 1, 1, NULL, NULL, CAST(N'2020-12-14 18:16:46.510' AS DateTime), N'lehaichien')
INSERT [dbo].[Products] ([ID], [Title], [MetaTitle], [Images], [Thumb], [Price], [OldPrice], [MetaKeywords], [MetaDescription], [Gift], [Quantity], [Detail], [Guarantee], [Specification], [MoreDesc], [CategoryID], [BrandID], [Special], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Xiaomi Huami Amazfit GTS Phiên bản quốc tế chính hãng Digiworld', N'xiaomi-huami-amazfit-gts-phien-ban-quoc-te-chinh-hang-digiworld', N'<Images><Images>/Data/images/product/amazfit-GTS-global-version-ldstorevn-21-1.png</Images><Images>/Data/images/product/huami-amazfit-gts-ldstore3-768x768.jpg</Images><Images>/Data/images/product/huami-amazfit-gts-ldstore2-768x768.jpg</Images></Images>', N'/Data/images/product/amazfit-GTS-global-version-ldstorevn-21-1.png', CAST(2790000 AS Decimal(18, 0)), CAST(2990000 AS Decimal(18, 0)), NULL, NULL, N'<ul>
	<li>Lỗi đổi mới trong 12 th&aacute;ng (1 đổi 1)</li>
	<li>D&aacute;n m&agrave;n h&igrave;nh PPF trị gi&aacute; 100.000đ</li>
	<li>D&acirc;y Silicon Galaxy Watch trị gi&aacute; 250.000đ</li>
	<li>Giảm 100.000đ khi mua 2 sản phẩm</li>
	<li>Thanh to&aacute;n VNPAY QRCODE giảm 50.000đ</li>
	<li>Trả g&oacute;p l&atilde;i suất 0% qua thẻ t&iacute;n dụng</li>
</ul>
', 10, N'<h2>Sự kiện 27/8 Run to Run , Xiaomi Huami tiếp tục ra mắt 3 sản phẩm mới l&agrave; Amazfit GTS , Amazfit Stratos 3 , Amazfit X . Đặc biệt được mong chờ v&agrave; quan t&acirc;m nhất của cộng đồng smartwatch ch&iacute;nh l&agrave; Amazfit GTS</h2>

<hr />
<h2>TH&Ocirc;NG TIN CHI TIẾT Đ&Aacute;NH GI&Aacute; XIAOMI HUAMI AMAZFIT GTS GLOBAL VERSION &ndash; INTERNATIONAL VERSION &ndash; PHI&Ecirc;N BẢN CH&Iacute;NH H&Atilde;NG DIGIWORLD VIỆT NAM</h2>

<p><img alt="" class="aligncenter size-full wp-image-15463" src="https://ldstore.vn/wp-content/uploads/2019/08/Amazfit-GTS-LDSTORE-003.jpg" style="height:1253px; width:790px" /></p>

<h3 style="text-align:center"><strong>VIDEO Đ&Aacute;NH GI&Aacute; TRẢI NGHIỆM REVIEW AMAZFIT GTS SAU KHI SỬ DỤNG 1 TH&Aacute;NG</strong></h3>

<div class="entry-content-asset"><iframe frameborder="0" height="529" src="https://www.youtube.com/embed/f7RmRPrZwKs?feature=oembed" title="Đánh giá Review Amazfit GTS sau 1 tháng sử dụng | 1 Số lưu ý trước khi mua" width="100%"></iframe></div>

<hr />
<h2>XIAOMI HUAMI AMAZFIT GTS GLOBAL VERSION THIẾT KẾ ĐẸP</h2>

<p>Huami Amazfit GTS c&oacute; thiết kế ngay lập tức thấy quen thuộc gợi nhớ phần lớn đến Apple Watch Series 4. Amazfit GTS c&oacute; m&agrave;n h&igrave;nh AMOLED h&igrave;nh chữ nhật với k&iacute;ch thước 1,65 inch v&agrave; độ ph&acirc;n giải 348 x 438 mật độ điểm ảnh 341 ppi cực k&igrave; sắc n&eacute;t v&agrave; gam m&agrave;u 100% NTSC m&agrave;u sắc cực k&igrave; trung thực . M&ocirc;-đun khung đồng hồ Amazfit GTS&nbsp; ch&iacute;nh được l&agrave;m từ hợp kim nh&ocirc;m loại h&agrave;ng kh&ocirc;ng aluminium alloy , c&oacute; độ d&agrave;y 9,4mm cực k&igrave; mỏng v&agrave; trọng lượng si&ecirc;u nhẹ chỉ 24,8g.</p>

<p><img alt="" class="aligncenter size-full wp-image-15473" src="https://ldstore.vn/wp-content/uploads/2019/08/O1CN016AMbjW1MSM7LudxqA_2660521433.jpg" style="height:1253px; width:790px" /></p>

<p><img alt="" class="aligncenter size-full wp-image-15466" src="https://ldstore.vn/wp-content/uploads/2019/08/Amazfit-GTS-LDSTORE-006.jpg" style="height:981px; width:790px" /></p>

<p><img alt="" class="aligncenter size-full wp-image-15475" src="https://ldstore.vn/wp-content/uploads/2019/08/Amazfit-GTS-LDSTORE-008.jpg" style="height:800px; width:800px" /><img alt="" class="aligncenter size-full wp-image-15468" src="https://ldstore.vn/wp-content/uploads/2019/08/huami-amazfit-gts-ldstore1.jpg" style="height:800px; width:800px" /></p>

<p>&nbsp;</p>

<hr />
<h2>XIAOMI HUAMI AMAZFIT GTS GLOBAL VERSION THỜI LƯỢNG PIN CỰC TỐT</h2>

<p>Thời lượng pin Xiaomi Huami tự tin c&ocirc;ng khai đưa ra với 14 ng&agrave;y sử dụng cơ bản trong trường hợp : Nhịp tim li&ecirc;n tục , GPS thỉnh thoảng d&ugrave;ng , với th&ocirc;ng b&aacute;o 150 lần /1 ng&agrave;y bao gồm như tin nhắn , cuộc gọi , zalo , facebook v..v.. Giơ tay coi giờ 30 lần /1 ng&agrave;y , Sử dụng NFC thanh to&aacute;n 4 lần /1 ng&agrave;y ( Hiện tại Việt Nam chưa sử dụng được ) . C&aacute;c hoạt động kh&aacute;c sử dụng tr&ecirc;n đồng hồ 5 ph&uacute;t. V&agrave; 1 tuần tập thể dục chạy bộ 3 lần , mỗi lần 30 ph&uacute;t.</p>

<p>Với chế độ xem giờ kh&ocirc;ng kết nối c&oacute; thể l&ecirc;n tới 46 ng&agrave;y ( 1,5 th&aacute;ng ) với n&acirc;ng tay xem giờ 100 lần /1 ng&agrave;y.</p>

<p><img alt="" class="aligncenter size-full wp-image-15467" src="https://ldstore.vn/wp-content/uploads/2019/08/Amazfit-GTS-LDSTORE-007.jpg" style="height:375px; width:790px" /></p>

<p><img alt="" class="aligncenter size-full wp-image-15465" src="https://ldstore.vn/wp-content/uploads/2019/08/Amazfit-GTS-LDSTORE-005.jpg" style="height:472px; width:790px" /></p>

<hr />
<h2>XIAOMI HUAMI AMAZFIT GTS GLOBAL VERSION C&Ocirc;NG NGHỆ ĐO NHỊP TIM BIO TRACKER PPG</h2>

<p>HUAMI AMAZFIT GTS thừa hưởng c&aacute;c c&ocirc;ng nghệ xịn nhất từ Huami , tương đồng như Amazfit GTR . H&atilde;ng đưa BIO Tracker PPG v&agrave;o GTS sẽ đưa ra c&aacute;c th&ocirc;ng số theo d&otilde;i nhịp tim cực k&igrave; ch&iacute;nh x&aacute;c. Đo thời gian thực v&agrave; chi tiết theo từng giờ trong ng&agrave;y , theo d&otilde;i theo tuần , th&aacute;ng</p>

<p><img alt="" class="aligncenter size-full wp-image-15471" src="https://ldstore.vn/wp-content/uploads/2019/08/Amazfit-GTS-LDSTORE-001.png" style="height:602px; width:791px" /></p>

<hr />
<h2>XIAOMI HUAMI AMAZFIT GTS GLOBAL VERSION &ndash; GPS C&Oacute; ĐỘ CH&Iacute;NH X&Aacute;C CAO &ndash; 12 CHẾ ĐỘ TẬP LUYỆN</h2>

<p>Hệ thống định vị GPS c&oacute; độ ch&iacute;nh x&aacute;c cao được tối ưu h&oacute;a li&ecirc;n tục cung cấp dữ liệu chuyển động phong ph&uacute; trong c&aacute;c b&agrave;i tập thể thao ngo&agrave;i trời như đạp xe , chạy bộ , đồng h&agrave;nh c&ugrave;ng bạn với vị tr&iacute; ch&iacute;nh x&aacute;c d&ugrave; bạn đi rừng n&uacute;i hiểm trở , hoặc biển .</p>

<p>Amazfit GTS cung cấp 12 chế độ thể thao, cho d&ugrave; l&agrave; đi bộ h&agrave;ng ng&agrave;y hoặc trượt tuyết xuy&ecirc;n quốc gia, bạn c&oacute; thể bắt đầu một chế độ thể thao chuy&ecirc;n nghiệp ph&ugrave; hợp v&agrave; theo kịp c&aacute;c chuyển động của bạn. Đặc biệt với c&ocirc;ng nghệ mới do Xiaomi tự x&acirc;y dựng l&agrave; BioTracker PPG Cảm biến quang theo d&otilde;i sinh học cực k&igrave; ch&iacute;nh x&aacute;c nhịp tim vận động khi luyện tập cũng như theo d&otilde;i h&agrave;ng ng&agrave;y</p>

<p><img alt="" class="aligncenter size-full wp-image-13603" src="https://ldstore.vn/wp-content/uploads/2019/07/Screen-Shot-2019-07-24-at-17.38.30.png" style="height:380px; width:957px" /></p>

<p>&nbsp;</p>

<hr />
<h3>XIAOMI HUAMI AMAZFIT GTS GLOBAL VERSION CHỐNG NƯỚC 5ATM</h3>

<p>Đặc biệt chuẩn chống nước của Amazfit GTS l&ecirc;n tới 5ATM , s&acirc;u 50 m&eacute;t nước. Bạn c&oacute; thể thoải m&aacute;i tự do vận động bơi lội , biển m&agrave; kh&ocirc;ng phải lo Amazfit GTS c&oacute; vấn đề g&igrave; cả.</p>

<p><img alt="" class="aligncenter size-full wp-image-15464" src="https://ldstore.vn/wp-content/uploads/2019/08/Amazfit-GTS-LDSTORE-004.jpg" style="height:782px; width:789px" /></p>

<hr />
<h3 style="text-align:center">AMAZFIT GTS NẰM TRONG TOP SMARTWATCH Đ&Aacute;NG MUA NHẤT PH&Acirc;N KH&Uacute;C 3 TRIỆU ĐỒNG</h3>

<div class="entry-content-asset"><iframe frameborder="0" height="529" src="https://www.youtube.com/embed/ISUPWsEYqPo?feature=oembed" title="Top SmartWatch Đáng Mua Nhất Dưới 3 Triệu" width="100%"></iframe></div>

<hr />
<h3 style="text-align:center">H&Igrave;NH ẢNH THỰC TẾ XIAOMI HUAMI AMAZFIT GTS</h3>

<p><a class="external" href="https://www.flickr.com/photos/152184684@N08/48697704288/in/dateposted/" rel="nofollow" target="_blank" title="Huami Amazfit GTS"><img alt="Huami Amazfit GTS" class="aligncenter" src="https://live.staticflickr.com/65535/48697704288_b73cd48512_c.jpg" style="height:800px; width:600px" /></a><br />
<a class="external" href="https://www.flickr.com/photos/152184684@N08/48698038231/in/dateposted/" rel="nofollow" target="_blank" title="Huami Amazfit GTS"><img alt="Huami Amazfit GTS" class="aligncenter" src="https://live.staticflickr.com/65535/48698038231_fa2912fa7c_c.jpg" style="height:800px; width:600px" /></a><br />
<a class="external" href="https://www.flickr.com/photos/152184684@N08/48698215542/in/dateposted/" rel="nofollow" target="_blank" title="Huami Amazfit GTS"><img alt="Huami Amazfit GTS" class="aligncenter" src="https://live.staticflickr.com/65535/48698215542_aace4c43f7_c.jpg" style="height:800px; width:600px" /></a><br />
<a class="external" href="https://www.flickr.com/photos/152184684@N08/48698038041/in/dateposted/" rel="nofollow" target="_blank" title="Huami Amazfit GTS"><img alt="Huami Amazfit GTS" class="aligncenter" src="https://live.staticflickr.com/65535/48698038041_0f42afe3b8_c.jpg" style="height:800px; width:600px" /></a></p>

<hr />
<h3>Xiaomi Huami Amazfit GTS GLOBAL VERSION phi&ecirc;n bản quốc tế ch&iacute;nh h&atilde;ng Digiworld mua ở đ&acirc;u H&agrave; Nội ?</h3>

<h3>Xiaomi Huami Amazfit GTS GLOBAL VERSION phi&ecirc;n bản quốc tế ch&iacute;nh h&atilde;ng Digiworld gi&aacute; b&aacute;n ?</h3>

<h3>Xiaomi Huami Amazfit GTS GLOBAL VERSION phi&ecirc;n bản quốc tế ch&iacute;nh h&atilde;ng Digiworld sắp c&oacute; tại LD STORE trải nghiệm v&agrave; c&oacute; gi&aacute; ưu đ&atilde;i , qu&agrave; khuyến m&atilde;i , trả g&oacute;p qua thẻ t&iacute;n dụng , Quẹt VNPAY QR giảm 10%</h3>', 12, N'<table class="shop_attributes woocommerce-product-attributes">
	<tbody>
		<tr>
			<th>Chuẩn chống nước - Kh&aacute;ng bụi</th>
			<td>
			<p>5ATM ( c&oacute; thể bơi lội )</p>
			</td>
		</tr>
		<tr>
			<th>Hệ Điều H&agrave;nh</th>
			<td>
			<p>Amazfit OS</p>
			</td>
		</tr>
		<tr>
			<th>K&iacute;ch thước</th>
			<td>
			<p>43.25 x 36.25 x 9.4mm</p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p>1.65 INCH AMOLED 0 348 X 326 &ndash; Mật độ điểm ảnh 341ppi</p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p>220MAH LIPO &ndash; PIN 14 NG&Agrave;Y CƠ BẢN</p>
			</td>
		</tr>
		<tr>
			<th>Quai đeo</th>
			<td>
			<p>(20 mm, ti&ecirc;u chuẩn c&ocirc;ng nghiệp)</p>
			</td>
		</tr>
		<tr>
			<th>Kết Nối</th>
			<td>
			<p>Bluetooth LE 5.0</p>
			</td>
		</tr>
		<tr>
			<th>Trọng lượng</th>
			<td>
			<p>24.8G</p>
			</td>
		</tr>
		<tr>
			<th>Loa/Mic</th>
			<td>
			<p>Kh&ocirc;ng c&oacute; / Kh&ocirc;ng c&oacute;</p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p>Đen, Đỏ, V&agrave;ng, V&agrave;ng hồng, Xanh</p>
			</td>
		</tr>
	</tbody>
</table>
', N'<ul>
	<li><span style="color:#ff6600"><strong>CH&Iacute;NH H&Atilde;NG DIGIWORLD VIỆT NAM</strong></span></li>
	<li><strong>Bảo h&agrave;nh : 12 th&aacute;ng</strong></li>
</ul>
', 1, 9, 1, NULL, NULL, CAST(N'2020-12-14 18:19:09.263' AS DateTime), N'lehaichien')
INSERT [dbo].[Products] ([ID], [Title], [MetaTitle], [Images], [Thumb], [Price], [OldPrice], [MetaKeywords], [MetaDescription], [Gift], [Quantity], [Detail], [Guarantee], [Specification], [MoreDesc], [CategoryID], [BrandID], [Special], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'Xiaomi Huami Amazfit Nexo Verge 2 ( LTE )', N'xiaomi-huami-amazfit-nexo-verge-2-lte', N'<Images><Images>/Data/images/product/xiaomi-amazfit-verge-2-ldstorevn-1-768x768.jpg</Images><Images>/Data/images/product/xiaomi-amazfit-verge-2-ldstorevn-2.jpg</Images><Images>/Data/images/product/xiaomi-amazfit-verge2-7.png</Images></Images>', N'/Data/images/product/xiaomi-amazfit-verge-2-ldstorevn-1-768x768.jpg', CAST(3800000 AS Decimal(18, 0)), NULL, NULL, NULL, N'<ul>
	<li>CODE GIẢM GI&Aacute; : HILDSTORE ( -80.000đ )</li>
	<li>D&aacute;n m&agrave;n h&igrave;nh cường lực trị gi&aacute; 100.000đ</li>
	<li>Giảm 100.000đ khi mua 2 sản phẩm</li>
	<li>Thanh to&aacute;n VNPAY QRCODE giảm 50.000đ</li>
	<li>Trả g&oacute;p l&atilde;i suất 0% qua thẻ t&iacute;n dụng</li>
</ul>
', 10, N'<h4>Th&ocirc;ng tin Xiaomi Huami Amazfit Nexo Verge 2 Global Version Phi&ecirc;n bản quốc tế : Xiaomi v&agrave; Huami cho biết,&nbsp; họ muốn t&aacute;i định vị lại d&ograve;ng smartwatch của m&igrave;nh kh&ocirc;ng chỉ tập trung v&agrave;o thể thao như Stratos đ&atilde; l&agrave;m m&agrave; c&ograve;n l&agrave; một chiếc smartwatch ho&agrave;n chỉnh với c&aacute;c t&iacute;nh năng thời thượng tập trung v&agrave;o phi&ecirc;n bản Verge 2 mới n&agrave;y</h4>

<p><img alt="" class="aligncenter size-full wp-image-14542" src="https://ldstore.vn/wp-content/uploads/2019/08/xiaomi-amazfit-verge2-1.jpg" style="height:835px; width:790px" /></p>

<p><img alt="" class="aligncenter size-full wp-image-14550" src="https://ldstore.vn/wp-content/uploads/2019/08/xiaomi-amazfit-verge2-7.png" style="height:660px; width:1329px" /></p>

<hr />
<h3 style="text-align:center">Video Review chi tiết đ&aacute;nh gi&aacute; Xiaomi Huami Amazfit Nexo Verge 2&nbsp; &ndash; C&aacute;ch đăng k&yacute; Esim Viettel</h3>

<div class="entry-content-asset"><iframe frameborder="0" height="529" src="https://www.youtube.com/embed/TzB91zkWKtQ?feature=oembed" title="Smartwatch đầu tiên dùng được Esim tại Việt Nam | Xiaomi Huami Amazfit Nexo" width="100%"></iframe></div>

<hr />
<h3>Xiaomi Huami Amazfit Nexo Verge 2 Global Version Thiết Kế</h3>

<p>Huami đ&atilde; sử dụng một ng&ocirc;n ngữ thiết kế ho&agrave;n to&agrave;n mới tr&ecirc;n Verge 2, thiết kế giống hao như Samsung Galaxy Watch Active 2 nhưng nhỏ gọn hơn. Kh&ocirc;ng giống như Verge phi&ecirc;n bản cũ với th&acirc;n m&aacute;y l&agrave;m bằng nhựa, m&agrave; Xiaomi Amazfit Nexo Verge 2 l&agrave; chiếc đồng hồ mới được Huami thiết kế tinh giản nhưng sang trọng hơn với vỏ trơn b&oacute;ng l&agrave;m bằng gốm sứ v&agrave; m&agrave;n h&igrave;nh lớn hơn nhiều . Verge 2 c&oacute; vỏ được l&agrave;m từ gốm Microcrystalline c&oacute; độ cứng cực cao được nung n&oacute;ng với nhiệt độ tr&ecirc;n 1000 độ C. Đi k&egrave;m d&acirc;y đeo slicon hoặc dạng hybrid (bản ECG).</p>

<p>Huami cho biết họ mất đến 35 ng&agrave;y để xử l&yacute; th&acirc;n gốm v&agrave; trải qua 24 c&ocirc;ng đoạn phức tạp.</p>

<p>Xiaomi Huami Nexo Verge 2 c&oacute; m&agrave;n h&igrave;nh AMOLED rộng 1.39-inch với độ ph&acirc;n giải 454&times;454 pixels (326 PPI). M&agrave;n h&igrave;nh được ho&agrave;n thiện k&iacute;nh cong 2.5D, bảo vệ bởi k&iacute;nh Corning Gorilla Glass được đ&aacute;nh b&oacute;ng qua 10 quy tr&igrave;nh. M&aacute;y được c&agrave;i sẵn 4 mặt đồng hồ: simple, dashboard, classic, v&agrave; caterpillar v&agrave; sẽ c&oacute; nhiều mặt đồng hồ kh&aacute;c trong thời gian sắp tới</p>

<p><img alt="" class="aligncenter size-full wp-image-14541" src="https://ldstore.vn/wp-content/uploads/2019/08/xiaomi-amazfit-verge-2-ldstorevn-2.jpg" style="height:800px; width:800px" /></p>

<p><img alt="" class="aligncenter size-full wp-image-14544" src="https://ldstore.vn/wp-content/uploads/2019/08/xiaomi-amazfit-verge2-3.jpg" style="height:541px; width:790px" /><img alt="" class="aligncenter size-full wp-image-14549" src="https://ldstore.vn/wp-content/uploads/2019/08/xiaomi-amazfit-verge2-6.png" style="height:209px; width:862px" /></p>

<hr />
<h3>Xiaomi Huami Amazfit Nexo Verge 2 Global Version T&iacute;nh Năng</h3>

<p>Huami Xiaomi đ&atilde; thiết kế lại giao diện nguời d&ugrave;ng tr&ecirc;n Nexo Verge 2 gi&uacute;p thao t&aacute;c tr&ecirc;n m&agrave;n h&igrave;nh dễ d&agrave;ng hơn. Bổ sung t&iacute;nh năng tr&ecirc;n mặt đồng hồ l&agrave; c&aacute;c ph&iacute;m tắt bao gồm 30 th&agrave;nh phần t&ugrave;y chọn gi&uacute;p truy cập nhanh th&ocirc;ng tin calo, nhịp tim, lịch tr&igrave;nh, thời tiết, tập luyện khởi động c&aacute;c ứng dụng v&agrave; n&acirc;ng cao hiệu suất xử l&yacute; . Hệ điều h&agrave;nh Amazfit Verge 2 tr&ecirc;n nền Android 8.1 n&ecirc;n m&aacute;y hoạt động trơn chu c&oacute; thể c&agrave;i đặt được c&aacute;c ứng dụng android dễ d&agrave;ng.</p>

<p><img alt="" class="aligncenter size-full wp-image-14546" src="https://ldstore.vn/wp-content/uploads/2019/08/xiaomi-amazfit-verge2-5.jpg" style="height:640px; width:790px" /></p>

<p style="text-align:center">T&iacute;ch hợp trợ l&yacute; ảo Xiao AI, ra lệnh v&agrave; điều khiển bằng giọng n&oacute;i. Cho ph&eacute;p đọc t&ecirc;n người gọi, trả lời tin nhắn, đặt lịch hẹn, bật tắt đ&egrave;n flash, &hellip;Thiết kế lại giao diện m&agrave;n h&igrave;nh ứng dụng dạng bong b&oacute;ng hao như Apple Watch , đi k&egrave;m bao gồm rất nhiều c&aacute;c ứng dụng phụ trợ</p>

<hr />
<h3>Xiaomi Huami Amazfit Nexo Verge 2 Global Version Tập luyện thể thao th&ocirc;ng minh</h3>

<p>Xiaomi Huami Verge 2 t&iacute;ch hợp GPS độc lập với 15 chế độ thể thao chạy, đi bộ, đạp xe ngo&agrave;i trời, chạy trong nh&agrave;, đạp xe trong nh&agrave;, elliptical, leo n&uacute;i, chạy đường m&ograve;n, b&oacute;ng đ&aacute;, nhảy d&acirc;y đ&aacute;p ứng nhu cầu thể thao h&agrave;ng ng&agrave;y của bạn.</p>

<p><img alt="" class="aligncenter size-full wp-image-13603" src="https://ldstore.vn/wp-content/uploads/2019/07/Screen-Shot-2019-07-24-at-17.38.30.png" style="height:380px; width:957px" /><img alt="" class="aligncenter size-full wp-image-14547" src="https://ldstore.vn/wp-content/uploads/2019/08/Screen-Shot-2019-08-11-at-12.31.28.png" style="height:784px; width:787px" /></p>

<p>Phi&ecirc;n bản mới đ&atilde; t&iacute;ch hợp t&iacute;nh năng đo ECG với c&ocirc;ng nghệ cảm biến ti&ecirc;n tiến kết hợp với RealBeats Independent v&agrave; c&ocirc;ng cụ dữ liệu sinh học Huami AI gi&uacute;p cảnh b&aacute;o nhịp tim bất thường theo thời gian thực. C&ocirc;ng nghệ BioTracker PPG đo nhịp tim ch&iacute;nh x&aacute;c hơn cũng c&oacute; tr&ecirc;n Amazfit Verge 2.</p>

<p><img alt="" class="aligncenter size-full wp-image-14543" src="https://ldstore.vn/wp-content/uploads/2019/08/xiaomi-amazfit-verge2-2.jpg" style="height:432px; width:790px" /></p>

<p style="text-align:center">Ngo&agrave;i ra, Verge 2 c&ograve;n t&iacute;ch hợp e-SIM, cho ph&eacute;p thực hiện cuộc gọi 4G LTE m&agrave; kh&ocirc;ng cần đến điện thoại</p>

<p>&nbsp;</p>

<hr />
<h3>Hướng dẫn chuyển giao diện sang tiếng Anh cho Xiaomi Huami Amazfit Nexo Verge 2 : <span style="color:#ff0000"><a href="https://ldstore.vn/huong-dan-chuyen-giao-dien-sang-tieng-anh-cho-xiaomi-huami-amazfit-nexo-verge-2/" style="color: #ff0000;">Tại Đ&acirc;y</a></span></h3>

<hr />
<h3 style="text-align:center">H&Igrave;NH ẢNH THỰC TẾ ĐỒNG HỒ TH&Ocirc;NG MINH SMARTWATCH XIAOMI HUAMI AMAZFIT NEXO VERGE 2</h3>

<p><a class="external" href="https://www.flickr.com/photos/152184684@N08/48753616806/in/dateposted/" rel="nofollow" target="_blank" title="Huami Amazfit Nexo Verge 2"><img alt="Huami Amazfit Nexo Verge 2" class="aligncenter" src="https://live.staticflickr.com/65535/48753616806_c088569745_c.jpg" style="height:800px; width:600px" /></a><br />
<a class="external" href="https://www.flickr.com/photos/152184684@N08/48753291828/in/dateposted/" rel="nofollow" target="_blank" title="Huami Amazfit Nexo Verge 2"><img alt="Huami Amazfit Nexo Verge 2" class="aligncenter" src="https://live.staticflickr.com/65535/48753291828_00fa0f6517_c.jpg" style="height:600px; width:800px" /></a><br />
<a class="external" href="https://www.flickr.com/photos/152184684@N08/48753291868/in/dateposted/" rel="nofollow" target="_blank" title="Huami Amazfit Nexo Verge 2"><img alt="Huami Amazfit Nexo Verge 2" class="aligncenter" src="https://live.staticflickr.com/65535/48753291868_00a417711f_c.jpg" style="height:800px; width:600px" /></a><br />
<a class="external" href="https://www.flickr.com/photos/152184684@N08/48753616846/in/dateposted/" rel="nofollow" target="_blank" title="Huami Amazfit Nexo Verge 2"><img alt="Huami Amazfit Nexo Verge 2" class="aligncenter" src="https://live.staticflickr.com/65535/48753616846_1896c74d75_c.jpg" style="height:800px; width:600px" /></a><br />
<a class="external" href="https://www.flickr.com/photos/152184684@N08/48753291848/in/photostream/" rel="nofollow" target="_blank" title="Huami Amazfit Nexo Verge 2"><img alt="Huami Amazfit Nexo Verge 2" class="aligncenter" src="https://live.staticflickr.com/65535/48753291848_793c6230fc_c.jpg" style="height:800px; width:600px" /></a><br />
<a class="external" href="https://www.flickr.com/photos/152184684@N08/48753616621/in/photostream/" rel="nofollow" target="_blank" title="Huami Amazfit Nexo Verge 2"><img alt="Huami Amazfit Nexo Verge 2" class="aligncenter" src="https://live.staticflickr.com/65535/48753616621_2be986fb7f_c.jpg" style="height:800px; width:600px" /></a></p>

<hr />
<h3>Xiaomi Huami Amazfit NexoVerge 2 Global Version mua ở đ&acirc;u H&agrave; Nội ?</h3>

<h3>Xiaomi Huami Amazfit Nexo Verge 2 Global Version gi&aacute; b&aacute;n ?</h3>

<h3>Xiaomi Huami Amazfit Nexo Verge 2 Global Version đ&atilde; c&oacute; tại LD STORE trải nghiệm v&agrave; c&oacute; gi&aacute; ưu đ&atilde;i , qu&agrave; khuyến m&atilde;i , trả g&oacute;p qua thẻ t&iacute;n dụng</h3>
', 6, N'<h2>Th&ocirc;ng số kỹ thuật</h2>

<table class="shop_attributes woocommerce-product-attributes">
	<tbody>
		<tr>
			<th>Chuẩn chống nước - Kh&aacute;ng bụi</th>
			<td>
			<p>IP68</p>
			</td>
		</tr>
		<tr>
			<th>Hệ Điều H&agrave;nh</th>
			<td>
			<p>Amazfit OS</p>
			</td>
		</tr>
		<tr>
			<th>K&iacute;ch thước</th>
			<td>
			<p>46 x 46 x13.7mm</p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p>1.39 ICH AMOLED ( 454 x454 ) 424 PPI</p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p>420MAH</p>
			</td>
		</tr>
		<tr>
			<th>Quai đeo</th>
			<td>
			<p>22mm c&oacute; thể thay thế</p>
			</td>
		</tr>
		<tr>
			<th>Kết Nối</th>
			<td>
			<p>Bluetooth LE 5.0</p>
			</td>
		</tr>
		<tr>
			<th>Trọng lượng</th>
			<td>
			<p>49g</p>
			</td>
		</tr>
		<tr>
			<th>Loa/Mic</th>
			<td>
			<p>C&oacute; loa đ&agrave;m thoại / C&oacute; Mic</p>
			</td>
		</tr>
		<tr>
			<th>Th&ocirc;ng tin phần cứng</th>
			<td>
			<p>Snapdragon Wear 2500</p>
			</td>
		</tr>
	</tbody>
</table>', N'<ul>
	<li><strong>Bảo h&agrave;nh : 6 th&aacute;ng</strong></li>
</ul>
', 1, 9, 1, NULL, NULL, CAST(N'2020-12-14 18:19:38.787' AS DateTime), N'lehaichien')
INSERT [dbo].[Products] ([ID], [Title], [MetaTitle], [Images], [Thumb], [Price], [OldPrice], [MetaKeywords], [MetaDescription], [Gift], [Quantity], [Detail], [Guarantee], [Specification], [MoreDesc], [CategoryID], [BrandID], [Special], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'Xiaomi Amazfit GTR Phiên bản quốc tế – 42mm', N'xiaomi-amazfit-gtr-phien-ban-quoc-te-42mm', N'<Images><Images>/Data/images/product/amazfit-GTR-42mm-black-ldstore-12-768x768.png</Images><Images>/Data/images/product/amazfit-GTR-42mm-black-ldstore-1.jpg</Images><Images>/Data/images/product/amazfit-GTR-42mm-black-ldstore-2.jpg</Images></Images>', N'/Data/images/product/amazfit-GTR-42mm-black-ldstore-12-768x768.png', CAST(2790000 AS Decimal(18, 0)), NULL, NULL, NULL, N'<ul>
	<li>D&aacute;n m&agrave;n h&igrave;nh cường lực trị gi&aacute; 100.000đ</li>
	<li>D&acirc;y Silicon Amazfit trị gi&aacute; 250.000đ</li>
	<li>Giảm 100.000đ khi mua 2 sản phẩm</li>
	<li>Thanh to&aacute;n VNPAY QRCODE giảm 50.000đ</li>
	<li>Trả g&oacute;p l&atilde;i suất 0% qua thẻ t&iacute;n dụng</li>
</ul>
', 10, N'<h3>Xiaomi mới đ&acirc;y đ&atilde; ra mắt smartwatch mới với thời lượng pin cực k&igrave; khủng , chống nước tốt v&agrave; c&oacute; gi&aacute; th&agrave;nh phải chăng với t&ecirc;n gọi Xiaomi Huami Amazfit GTR Phi&ecirc;n bản Quốc Tế &ndash; Global Version &ndash; International version. Sau đ&acirc;y l&agrave; b&agrave;i đ&aacute;nh gi&aacute; Huami Amazfit GTR</h3>

<p><img alt="" class="aligncenter size-full wp-image-15883" src="https://ldstore.vn/wp-content/uploads/2019/07/amazfit-GTR-42mm-ldstore-1.jpg" style="height:460px; width:951px" /></p>

<hr />
<h3>Xiaomi Huami Amazfit GTR 42mm Global Version thiết kế cổ điển cực đẹp</h3>

<p>Với thiết kế viền gốm ceramic sang trọng , khung th&eacute;p 316L. Thiết kế lịch l&atilde;m , tinh tế v&agrave; thanh lịch. Quanh viền m&agrave;n h&igrave;nh l&agrave; khung gốm zirconium mỏng hơn v&agrave; c&oacute; độ cứng tốt , chống trầy xước khi va chạm hơn. 2 ph&iacute;m bấm th&eacute;p cao cấp.</p>

<p><img alt="" class="aligncenter size-full wp-image-13584" src="https://ldstore.vn/wp-content/uploads/2019/07/clean-swiper-04.png" style="height:1300px; width:933px" /></p>

<p><img alt="" class="aligncenter size-full wp-image-13581" src="https://ldstore.vn/wp-content/uploads/2019/07/clean-swiper-02.jpg" style="height:800px; width:1600px" /><img alt="" class="aligncenter size-full wp-image-13580" src="https://ldstore.vn/wp-content/uploads/2019/07/clean-swiper-01.jpg" style="height:800px; width:1600px" /></p>

<hr />
<h3>Xiaomi Huami Amazfit GTR Global Version phi&ecirc;n bản quốc tế 42mm M&agrave;n Amoled sắc n&eacute;t</h3>

<p style="text-align:center">Hiện tại LD STORE c&oacute; Huami Amazfit GTR đủ 4 phi&ecirc;n bản m&agrave;u sắc :</p>

<p style="text-align:center">Cherry Blossom Pink ( V&agrave;ng hồng )</p>

<p style="text-align:center">Starry Black ( Đen x&aacute;m )</p>

<p style="text-align:center">Coral Red ( Bạc đỏ )</p>

<p style="text-align:center">Moonlight White ( Trắng bạch kim )<img alt="" class="aligncenter size-full wp-image-16507" src="https://ldstore.vn/wp-content/uploads/2019/07/O1CN01QPBExx1MSM73uH7o0_2660521433.jpg" style="height:800px; width:800px" /></p>

<p>M&agrave;n h&igrave;nh lớn Amoled 1,39ich độ ph&acirc;n giải cao l&ecirc;n tới 326ppi n&ecirc;n Amazfit GTR cho chất lượng hiển thị cực k&igrave; sắc n&eacute;t đẹp v&agrave; sống động cho d&ugrave; đang hiển thị th&ocirc;ng tin thời gian hoặc c&aacute;c nội dung ứng dụng kh&aacute;c nhau.Độ s&aacute;ng m&agrave;n h&igrave;nh cực k&igrave; tốt hiển thị đẹp ngo&agrave;i trời. Kho mặt đồng hồ phong ph&uacute; được cập nhật li&ecirc;n tục với h&agrave;ng trăm watchfaces kh&aacute;c nhau. Đặc biệt lu&ocirc;n c&oacute; cộng đồng lớn , chia sẻ nhiều mặt đồng hồ b&ecirc;n thứ 3 do cộng đồng người d&ugrave;ng tự thiết kế.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<h4>Đặc biệt Huami Amazfit GTR phi&ecirc;n bản quốc tế &ndash; Global Version đ&atilde; c&oacute; cập nhật phi&ecirc;n bản mới c&oacute; bật chế độ Always On Display ( mặt đồng hồ Digital chờ lu&ocirc;n hiển thị để xem giờ ) khiến bạn lu&ocirc;n c&oacute; thể xem giờ m&agrave; kh&ocirc;ng cần giơ tay để hiển thị xem giờ như trước nữa.</h4>

<hr />
<h3>Xiaomi Huami Amazfit GTR Global Version phi&ecirc;n bản quốc tế 42mm c&oacute; thời lượng pin cực k&igrave; khủng</h3>

<p>Pin của Xiaomi Amazfit GTR thừa hưởng pin khủng như Amazfit Bip đời trước , C&aacute;c chip năng lượng thấp ti&ecirc;n tiến, thiết kế mạch mới, quản l&yacute; v&agrave; tối ưu h&oacute;a năng lượng s&acirc;u b&ecirc;n dưới, gi&uacute;p Amazfit GTR&nbsp; c&oacute; hiệu suất bền bỉ tuyệt vời. H&atilde;y thoải m&aacute;i sử dụng bạn kh&ocirc;ng phải lo vấn đề sạc pin khi đi du lịch , c&ocirc;ng t&aacute;c trong thời gian d&agrave;i. Dung lượng pin 195mah Lipo cho Amazfit GTR sử dụng l&ecirc;n tới 12 ng&agrave;y d&ugrave;ng với mức độ b&igrave;nh thường. 34 ng&agrave;y với chế độ cơ bản kh&ocirc;ng kết nối. v&agrave; 40 giờ GPS hoạt động li&ecirc;n tục. Thời lượng pin ấn tượng thậm ch&iacute; tốt hơn cả c&aacute;c sản phẩm Garmin Sport Watch thể thao cao cấp.</p>

<p><img alt="" class="alignleft size-full wp-image-15398" src="https://ldstore.vn/wp-content/uploads/2019/07/Screen-Shot-2019-08-27-at-11.14.26.png" style="height:450px; width:1575px" /></p>

<hr />
<h3>Xiaomi Huami Amazfit GTR Global Version phi&ecirc;n bản quốc tế 42mm GPS c&oacute; độ ch&iacute;nh x&aacute;c cao , 12 chế độ tập luyện</h3>

<p>Hệ thống định vị GPS c&oacute; độ ch&iacute;nh x&aacute;c cao được tối ưu h&oacute;a li&ecirc;n tục cung cấp dữ liệu chuyển động phong ph&uacute; trong c&aacute;c b&agrave;i tập thể thao ngo&agrave;i trời như đạp xe , chạy bộ , đồng h&agrave;nh c&ugrave;ng bạn với vị tr&iacute; ch&iacute;nh x&aacute;c d&ugrave; bạn đi rừng n&uacute;i hiểm trở , hoặc biển .</p>

<p>Amazfit GTR cung cấp 12 chế độ thể thao, cho d&ugrave; l&agrave; đi bộ h&agrave;ng ng&agrave;y hoặc trượt tuyết xuy&ecirc;n quốc gia, bạn c&oacute; thể bắt đầu một chế độ thể thao chuy&ecirc;n nghiệp ph&ugrave; hợp v&agrave; theo kịp c&aacute;c chuyển động của bạn. Đặc biệt với c&ocirc;ng nghệ mới do Xiaomi tự x&acirc;y dựng l&agrave;&nbsp;BioTracker&nbsp;<sup>TM</sup>&nbsp;PPG Cảm biến quang theo d&otilde;i sinh học cực k&igrave; ch&iacute;nh x&aacute;c nhịp tim vận động khi luyện tập cũng như theo d&otilde;i h&agrave;ng ng&agrave;y</p>

<p><img alt="" class="aligncenter size-full wp-image-13603" src="https://ldstore.vn/wp-content/uploads/2019/07/Screen-Shot-2019-07-24-at-17.38.30.png" style="height:380px; width:957px" /></p>

<p><img alt="" class="aligncenter size-full wp-image-13589" src="https://ldstore.vn/wp-content/uploads/2019/07/section-6.jpg" style="height:850px; width:2560px" /><img alt="" class="aligncenter size-full wp-image-13586" src="https://ldstore.vn/wp-content/uploads/2019/07/model-2.jpg" style="height:800px; width:1600px" /><img alt="" class="aligncenter size-full wp-image-13585" src="https://ldstore.vn/wp-content/uploads/2019/07/model-1.jpg" style="height:800px; width:1600px" /><img alt="" class="aligncenter size-full wp-image-13587" src="https://ldstore.vn/wp-content/uploads/2019/07/model-3.jpg" style="height:800px; width:1600px" /></p>

<hr />
<h3>Xiaomi Huami Amazfit GTR Global Version phi&ecirc;n bản quốc tế 42mm chống nước 5ATM</h3>

<p>Đặc biệt chuẩn chống nước của Amazfit GTR l&ecirc;n tới 5ATM , s&acirc;u 50 m&eacute;t nước. Bạn c&oacute; thể thoải m&aacute;i tự do vận động bơi lội , biển m&agrave; kh&ocirc;ng phải lo Amazfit GTR c&oacute; vấn đề g&igrave; cả.</p>

<p><img alt="" class="aligncenter size-full wp-image-13588" src="https://ldstore.vn/wp-content/uploads/2019/07/section-5.jpg" style="height:850px; width:2560px" /></p>

<hr />
<h3>Hướng dẫn fix lỗi font th&ocirc;ng b&aacute;o tiếng việt c&oacute; dấu cho Huami Amazfit GTR Phi&ecirc;n bản Quốc Tế : <a href="https://ldstore.vn/huong-dan-fix-loi-font-tieng-viet-cho-huami-amazfit-gtr-phien-ban-quoc-te/" rel="noopener noreferrer" target="_blank"><span style="color:#ff0000">Tại Đ&acirc;y&nbsp;</span></a></h3>

<h3>Hướng dẫn c&agrave;i th&ecirc;m mặt đồng hồ &ndash; Watchface cho Huami Amazfit GTR Phi&ecirc;n bản Quốc Tế kết nối Iphone / IOS : <span style="color:#ff0000"><a href="https://ldstore.vn/huong-dan-cai-them-mat-dong-ho-watchface-cho-huami-amazfit-gtr-cung-iphone-ios/" style="color: #ff0000;">Tại Đ&acirc;y&nbsp;</a></span></h3>

<hr />
<h3 style="text-align:center">H&Igrave;NH ẢNH THỰC TẾ XIAOMI HUAMI AMAZFIT GTR 42MM PHI&Ecirc;N BẢN QUỐC TẾ &ndash; GLOBAL VERSION &ndash; INTERNATIONAL VERSION</h3>

<p><a class="external" href="https://www.flickr.com/photos/152184684@N08/48721182427/in/dateposted/" rel="nofollow" target="_blank" title="Amazfit GTR 42MM"><img alt="Amazfit GTR 42MM" class="aligncenter" src="https://live.staticflickr.com/65535/48721182427_e2dd61482a_c.jpg" style="height:800px; width:600px" /></a><br />
<a class="external" href="https://www.flickr.com/photos/152184684@N08/48721184337/in/dateposted/" rel="nofollow" target="_blank" title="Amazfit GTR 42MM"><img alt="Amazfit GTR 42MM" class="aligncenter" src="https://live.staticflickr.com/65535/48721184337_cc366115b9_c.jpg" style="height:800px; width:600px" /></a><br />
<a class="external" href="https://www.flickr.com/photos/152184684@N08/48721010331/in/dateposted/" rel="nofollow" target="_blank" title="Amazfit GTR 42MM"><img alt="Amazfit GTR 42MM" class="aligncenter" src="https://live.staticflickr.com/65535/48721010331_35c613a908_c.jpg" style="height:800px; width:600px" /></a><br />
<a class="external" href="https://www.flickr.com/photos/152184684@N08/48720675083/in/dateposted/" rel="nofollow" target="_blank" title="Amazfit GTR 42MM"><img alt="Amazfit GTR 42MM" class="aligncenter" src="https://live.staticflickr.com/65535/48720675083_0520298bf4_c.jpg" style="height:800px; width:600px" /></a><br />
<a class="external" href="https://www.flickr.com/photos/152184684@N08/48721182392/in/dateposted/" rel="nofollow" target="_blank" title="Amazfit GTR 42MM"><img alt="Amazfit GTR 42MM" class="aligncenter" src="https://live.staticflickr.com/65535/48721182392_d702041827_c.jpg" style="height:800px; width:600px" /></a><br />
<a class="external" href="https://www.flickr.com/photos/152184684@N08/48721182402/in/dateposted/" rel="nofollow" target="_blank" title="Amazfit GTR 42MM"><img alt="Amazfit GTR 42MM" class="aligncenter" src="https://live.staticflickr.com/65535/48721182402_22e8d9f901_c.jpg" style="height:800px; width:600px" /></a><br />
<a class="external" href="https://www.flickr.com/photos/152184684@N08/48721010276/in/dateposted/" rel="nofollow" target="_blank" title="Amazfit GTR 42MM"><img alt="Amazfit GTR 42MM" class="aligncenter" src="https://live.staticflickr.com/65535/48721010276_1bc0d787c7_c.jpg" style="height:800px; width:600px" /></a><br />
<a class="external" href="https://www.flickr.com/photos/152184684@N08/48720674028/in/dateposted/" rel="nofollow" target="_blank" title="Amazfit GTR 42MM"><img alt="Amazfit GTR 42MM" class="aligncenter" src="https://live.staticflickr.com/65535/48720674028_fbbbab6a57_c.jpg" style="height:800px; width:600px" /></a><br />
<a class="external" href="https://www.flickr.com/photos/152184684@N08/48721010231/in/dateposted/" rel="nofollow" target="_blank" title="Amazfit GTR 42MM"><img alt="Amazfit GTR 42MM" class="aligncenter" src="https://live.staticflickr.com/65535/48721010231_66d9df2d63_c.jpg" style="height:800px; width:600px" /></a><a class="external" href="https://www.flickr.com/photos/152184684@N08/48720674668/in/dateposted/" rel="nofollow" target="_blank" title="Amazfit GTR 42MM"><img alt="Amazfit GTR 42MM" class="aligncenter" src="https://live.staticflickr.com/65535/48720674668_8f04fc5eac_c.jpg" style="height:800px; width:600px" /></a></p>

<hr />
<h3>Xiaomi Huami Amazfit GTR Global Version phi&ecirc;n bản quốc tế 42mm mua ở đ&acirc;u H&agrave; Nội ?</h3>

<h3>Xiaomi Huami Amazfit GTR Global Version phi&ecirc;n bản quốc tế 42mm gi&aacute; b&aacute;n ?</h3>

<h3>Xiaomi Huami Amazfit GTR Global Version phi&ecirc;n bản quốc tế 42mm đ&atilde; c&oacute; tại LD STORE trải nghiệm v&agrave; c&oacute; gi&aacute; ưu đ&atilde;i , qu&agrave; khuyến m&atilde;i , trả g&oacute;p qua thẻ t&iacute;n dụng</h3>

<h3>Tham khảo th&ecirc;m Xiaomi Huami Amazfit GTR Phi&ecirc;n bản 47MM &ndash; Quốc tế &ndash; Global Version &ndash; International : <span style="color:#ff0000"><a href="https://ldstore.vn/xiaomi-amazfit-gtr-quoc-te/" style="color: #ff0000;">Bấm tại đ&acirc;y&nbsp;</a></span></h3>', 12, N'<table class="shop_attributes woocommerce-product-attributes">
	<tbody>
		<tr>
			<th>Chuẩn chống nước - Kh&aacute;ng bụi</th>
			<td>
			<p>5ATM ( c&oacute; thể bơi lội )</p>
			</td>
		</tr>
		<tr>
			<th>Hệ Điều H&agrave;nh</th>
			<td>
			<p>RTOS</p>
			</td>
		</tr>
		<tr>
			<th>K&iacute;ch thước</th>
			<td>
			<p>42,6 X 42,6 X 9,2 mm</p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p>1.2&quot; AMOLED, độ ph&acirc;n giải 390 X 390.326 ppi</p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p>195MAH &ndash; sử dụng 12 ng&agrave;y</p>
			</td>
		</tr>
		<tr>
			<th>Quai đeo</th>
			<td>
			<p>(20 mm, ti&ecirc;u chuẩn c&ocirc;ng nghiệp)</p>
			</td>
		</tr>
		<tr>
			<th>Kết Nối</th>
			<td>
			<p>Bluetooth LE 5.0</p>
			</td>
		</tr>
		<tr>
			<th>Trọng lượng</th>
			<td>
			<p>25,5g</p>
			</td>
		</tr>
		<tr>
			<th>Loa/Mic</th>
			<td>
			<p>Kh&ocirc;ng c&oacute; / Kh&ocirc;ng c&oacute;</p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p>Bạc, Đen, Trắng, V&agrave;ng hồng</p>
			</td>
		</tr>
	</tbody>
</table>', N'<ul>
	<li><span style="color:#ff6600"><strong>Phi&ecirc;n bản DigiWorld Ch&iacute;nh H&atilde;ng Việt Nam&nbsp;</strong></span></li>
	<li><strong>Bảo h&agrave;nh : 12 th&aacute;ng ( 1 đổi 1 )</strong></li>
</ul>
', 1, 9, 1, NULL, NULL, CAST(N'2020-12-14 18:18:18.747' AS DateTime), N'lehaichien')
INSERT [dbo].[Products] ([ID], [Title], [MetaTitle], [Images], [Thumb], [Price], [OldPrice], [MetaKeywords], [MetaDescription], [Gift], [Quantity], [Detail], [Guarantee], [Specification], [MoreDesc], [CategoryID], [BrandID], [Special], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'Xiaomi Amazfit GTR Phiên bản quốc tế – 47mm', N'xiaomi-amazfit-gtr-phien-ban-quoc-te-47mm', N'<Images><Images>/Data/images/product/xiaomi-amazfit-gtr-global-47mm-ldstore-1-768x768.jpg</Images><Images>/Data/images/product/xiaomi-amazfit-gtr-black-ldstore-4-768x768.jpg</Images><Images>/Data/images/product/xiaomi-amazfit-gtr-black-ldstore-2-768x768.jpg</Images></Images>', N'/Data/images/product/xiaomi-amazfit-gtr-global-47mm-ldstore-1-768x768.jpg', CAST(2990000 AS Decimal(18, 0)), NULL, NULL, NULL, N'<ul>
	<li>D&aacute;n m&agrave;n h&igrave;nh cường lực trị gi&aacute; 100.000đ</li>
	<li>D&acirc;y Samsung Galaxy Watch ch&iacute;nh h&atilde;ng trị gi&aacute; 350.000đ</li>
	<li>Giảm 100.000đ khi mua 2 sản phẩm</li>
	<li>Thanh to&aacute;n VNPAY QRCODE giảm 50.000đ</li>
	<li>Trả g&oacute;p l&atilde;i suất 0% qua thẻ t&iacute;n dụng</li>
</ul>
', 12, N'<h3>Xiaomi mới đ&acirc;y đ&atilde; ra mắt smartwatch mới với thời lượng pin cực k&igrave; khủng , chống nước tốt v&agrave; c&oacute; gi&aacute; th&agrave;nh phải chăng với t&ecirc;n gọi Xiaomi Huami Amazfit GTR Phi&ecirc;n bản Quốc Tế &ndash; Global Version &ndash; International version. Sau đ&acirc;y l&agrave; b&agrave;i đ&aacute;nh gi&aacute; Huami Amazfit GTR</h3>

<p><img alt="" class="aligncenter size-full wp-image-13594" src="https://ldstore.vn/wp-content/uploads/2019/07/xiaomi-amazfit-gtr-black-ldstore-5.jpg" style="height:1500px; width:2560px" /></p>

<hr />
<h3>Xiaomi Huami Amazfit GTR Global Version 47mm thiết kế cổ điển cực đẹp</h3>

<p>Với thiết kế viền gốm ceramic sang trọng , khung th&eacute;p 316L. Thiết kế lịch l&atilde;m , tinh tế v&agrave; thanh lịch. Quanh viền m&agrave;n h&igrave;nh l&agrave; khung gốm zirconium mỏng hơn v&agrave; c&oacute; độ cứng tốt , chống trầy xước khi va chạm hơn. 2 ph&iacute;m bấm th&eacute;p cao cấp.</p>

<p><img alt="" class="aligncenter size-full wp-image-13584" src="https://ldstore.vn/wp-content/uploads/2019/07/clean-swiper-04.png" style="height:1300px; width:933px" /></p>

<p><img alt="" class="aligncenter size-full wp-image-13581" src="https://ldstore.vn/wp-content/uploads/2019/07/clean-swiper-02.jpg" style="height:800px; width:1600px" /><img alt="" class="aligncenter size-full wp-image-13580" src="https://ldstore.vn/wp-content/uploads/2019/07/clean-swiper-01.jpg" style="height:800px; width:1600px" /></p>

<hr />
<h3>Xiaomi Huami Amazfit GTR Global Version phi&ecirc;n bản quốc tế 47mm M&agrave;n Amoled sắc n&eacute;t</h3>

<p>M&agrave;n h&igrave;nh lớn Amoled 1,39ich độ ph&acirc;n giải cao l&ecirc;n tới 326ppi n&ecirc;n Amazfit GTR cho chất lượng hiển thị cực k&igrave; sắc n&eacute;t đẹp v&agrave; sống động cho d&ugrave; đang hiển thị th&ocirc;ng tin thời gian hoặc c&aacute;c nội dung ứng dụng kh&aacute;c nhau.Độ s&aacute;ng m&agrave;n h&igrave;nh cực k&igrave; tốt hiển thị đẹp ngo&agrave;i trời. Kho mặt đồng hồ phong ph&uacute; được cập nhật li&ecirc;n tục với h&agrave;ng trăm watchfaces kh&aacute;c nhau. Đặc biệt lu&ocirc;n c&oacute; cộng đồng lớn , chia sẻ nhiều mặt đồng hồ b&ecirc;n thứ 3 do cộng đồng người d&ugrave;ng tự thiết kế.</p>

<p style="text-align:center">Hiện tại LD STORE c&oacute; Huami Amazfit GTR đủ 2 phi&ecirc;n bản m&agrave;u sắc :</p>

<p style="text-align:center">Aluminium Alloy ( Đen X&aacute;m ) &ndash; Khung nh&ocirc;m m&aacute;y bay</p>

<p style="text-align:center">Stainless steel ( Bạc trắng ) &ndash; Khung th&eacute;p</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img alt="" class="aligncenter wp-image-13578" src="https://ldstore.vn/wp-content/uploads/2019/07/clean-01.png" style="height:756px; width:548px" /></p>

<p><img alt="" class="aligncenter wp-image-13579" src="https://ldstore.vn/wp-content/uploads/2019/07/clean-02.png" style="height:755px; width:529px" /></p>

<h4>Đặc biệt Huami Amazfit GTR phi&ecirc;n bản quốc tế &ndash; Global Version đ&atilde; c&oacute; cập nhật phi&ecirc;n bản mới c&oacute; bật chế độ Always On Display ( mặt đồng hồ Digital chờ lu&ocirc;n hiển thị để xem giờ ) khiến bạn lu&ocirc;n c&oacute; thể xem giờ m&agrave; kh&ocirc;ng cần giơ tay để hiển thị xem giờ như trước nữa.</h4>

<hr />
<h3>Xiaomi Huami Amazfit GTR Global Version phi&ecirc;n bản quốc tế 47mm c&oacute; thời lượng pin cực k&igrave; khủng</h3>

<p>Pin của Xiaomi Amazfit GTR thừa hưởng pin khủng như Amazfit Bip đời trước , C&aacute;c chip năng lượng thấp ti&ecirc;n tiến, thiết kế mạch mới, quản l&yacute; v&agrave; tối ưu h&oacute;a năng lượng s&acirc;u b&ecirc;n dưới, gi&uacute;p Amazfit GTR&nbsp;&nbsp;c&oacute; hiệu suất bền bỉ tuyệt vời.&nbsp;H&atilde;y thoải m&aacute;i sử dụng bạn kh&ocirc;ng phải lo vấn đề sạc pin khi đi du lịch , c&ocirc;ng t&aacute;c trong thời gian d&agrave;i. Dung lượng pin 410mah Lipo cho Amazfit GTR sử dụng l&ecirc;n tới 24 ng&agrave;y d&ugrave;ng với mức độ b&igrave;nh thường. 74 ng&agrave;y với chế độ cơ bản kh&ocirc;ng kết nối. v&agrave; 40 giờ GPS hoạt động li&ecirc;n tục. Thời lượng pin ấn tượng thậm ch&iacute; tốt hơn cả c&aacute;c sản phẩm Garmin Sport Watch thể thao cao cấp.</p>

<p><img alt="" class="aligncenter size-full wp-image-13602" src="https://ldstore.vn/wp-content/uploads/2019/07/xiaomi-amazfit-gtr-pin.png" style="height:531px; width:1183px" /></p>

<hr />
<h3>Xiaomi Huami Amazfit GTR Global Version phi&ecirc;n bản quốc tế 47mm GPS c&oacute; độ ch&iacute;nh x&aacute;c cao , 12 chế độ tập luyện</h3>

<p>Hệ thống định vị GPS c&oacute; độ ch&iacute;nh x&aacute;c cao được tối ưu h&oacute;a li&ecirc;n tục cung cấp dữ liệu chuyển động phong ph&uacute; trong c&aacute;c b&agrave;i tập thể thao ngo&agrave;i trời như đạp xe , chạy bộ , đồng h&agrave;nh c&ugrave;ng bạn với vị tr&iacute; ch&iacute;nh x&aacute;c d&ugrave; bạn đi rừng n&uacute;i hiểm trở , hoặc biển .</p>

<p>Amazfit GTR cung cấp 12 chế độ thể thao, cho d&ugrave; l&agrave; đi bộ h&agrave;ng ng&agrave;y hoặc trượt tuyết xuy&ecirc;n quốc gia, bạn c&oacute; thể bắt đầu một chế độ thể thao chuy&ecirc;n nghiệp ph&ugrave; hợp v&agrave; theo kịp c&aacute;c chuyển động của bạn. Đặc biệt với c&ocirc;ng nghệ mới do Xiaomi tự x&acirc;y dựng l&agrave;&nbsp;BioTracker&nbsp;<sup>TM</sup>&nbsp;PPG Cảm biến quang theo d&otilde;i sinh học cực k&igrave; ch&iacute;nh x&aacute;c nhịp tim vận động khi luyện tập cũng như theo d&otilde;i h&agrave;ng ng&agrave;y</p>

<p><img alt="" class="aligncenter size-full wp-image-13603" src="https://ldstore.vn/wp-content/uploads/2019/07/Screen-Shot-2019-07-24-at-17.38.30.png" style="height:380px; width:957px" /></p>

<p><img alt="" class="aligncenter size-full wp-image-13589" src="https://ldstore.vn/wp-content/uploads/2019/07/section-6.jpg" style="height:850px; width:2560px" /><img alt="" class="aligncenter size-full wp-image-13586" src="https://ldstore.vn/wp-content/uploads/2019/07/model-2.jpg" style="height:800px; width:1600px" /><img alt="" class="aligncenter size-full wp-image-13585" src="https://ldstore.vn/wp-content/uploads/2019/07/model-1.jpg" style="height:800px; width:1600px" /><img alt="" class="aligncenter size-full wp-image-13587" src="https://ldstore.vn/wp-content/uploads/2019/07/model-3.jpg" style="height:800px; width:1600px" /></p>

<hr />
<h3>Xiaomi Huami Amazfit GTR Global Version phi&ecirc;n bản quốc tế 47mm chống nước 5ATM</h3>

<p>Đặc biệt chuẩn chống nước của Amazfit GTR l&ecirc;n tới 5ATM , s&acirc;u 50 m&eacute;t nước. Bạn c&oacute; thể thoải m&aacute;i tự do vận động bơi lội , biển m&agrave; kh&ocirc;ng phải lo Amazfit GTR c&oacute; vấn đề g&igrave; cả.</p>

<p><img alt="" class="aligncenter size-full wp-image-13588" src="https://ldstore.vn/wp-content/uploads/2019/07/section-5.jpg" style="height:850px; width:2560px" /></p>

<hr />
<h3>ẢNH THỰC TẾ SẢN PHẨM XIAOMI HUAMI AMAZFIT GTR Global Version PHI&Ecirc;N BẢN QUỐC TẾ 47MM &ndash; 42MM</h3>

<p><a class="external" href="https://www.flickr.com/photos/152184684@N08/48686310733/in/dateposted/" rel="nofollow" target="_blank" title="Huami Amazfit GTR 47mm"><img alt="Huami Amazfit GTR 47mm" class="aligncenter" src="https://live.staticflickr.com/65535/48686310733_25acbb35f1_c.jpg" style="height:600px; width:800px" /></a><br />
<a class="external" href="https://www.flickr.com/photos/152184684@N08/48686823807/in/dateposted/" rel="nofollow" target="_blank" title="Huami Amazfit GTR 47mm"><img alt="Huami Amazfit GTR 47mm" class="aligncenter" src="https://live.staticflickr.com/65535/48686823807_1aee1b03db_c.jpg" style="height:800px; width:600px" /></a><br />
<a class="external" href="https://www.flickr.com/photos/152184684@N08/48686310603/in/dateposted/" rel="nofollow" target="_blank" title="Huami Amazfit GTR 47mm"><img alt="Huami Amazfit GTR 47mm" class="aligncenter" src="https://live.staticflickr.com/65535/48686310603_2bb2ca9c9f_c.jpg" style="height:800px; width:600px" /></a><br />
<a class="external" href="https://www.flickr.com/photos/152184684@N08/48615043828/in/dateposted/" rel="nofollow" target="_blank" title="Amazfit GTR"><img alt="Amazfit GTR" class="aligncenter" src="https://live.staticflickr.com/65535/48615043828_64630058fa_c.jpg" style="height:800px; width:600px" /></a><br />
<a class="external" href="https://www.flickr.com/photos/152184684@N08/48615390911/in/dateposted/" rel="nofollow" target="_blank" title="Amazfit GTR"><img alt="Amazfit GTR" class="aligncenter" src="https://live.staticflickr.com/65535/48615390911_7ebe1f8128_c.jpg" style="height:800px; width:600px" /></a></p>

<hr />
<h3>Hướng dẫn fix lỗi font th&ocirc;ng b&aacute;o tiếng việt c&oacute; dấu cho Huami Amazfit GTR Phi&ecirc;n bản Quốc Tế : <a href="https://ldstore.vn/huong-dan-fix-loi-font-tieng-viet-cho-huami-amazfit-gtr-phien-ban-quoc-te/" rel="noopener noreferrer" target="_blank"><span style="color:#ff0000">Tại Đ&acirc;y&nbsp;</span></a></h3>

<h3>Hướng dẫn c&agrave;i th&ecirc;m mặt đồng hồ &ndash; Watchface cho Huami Amazfit GTR Phi&ecirc;n bản Quốc Tế kết nối Iphone / IOS : <span style="color:#ff0000"><a href="https://ldstore.vn/huong-dan-cai-them-mat-dong-ho-watchface-cho-huami-amazfit-gtr-cung-iphone-ios/" style="color: #ff0000;">Tại Đ&acirc;y&nbsp;</a></span></h3>

<hr />
<h3>Xiaomi Huami Amazfit GTR Global Version phi&ecirc;n bản quốc tế 47mm mua ở đ&acirc;u H&agrave; Nội ?</h3>

<h3>Xiaomi Huami Amazfit GTR Global Version phi&ecirc;n bản quốc tế 47mm gi&aacute; b&aacute;n ?</h3>

<h3>Xiaomi Huami Amazfit GTR Global Version phi&ecirc;n bản quốc tế 47mm đ&atilde; c&oacute; tại LD STORE trải nghiệm v&agrave; c&oacute; gi&aacute; ưu đ&atilde;i , qu&agrave; khuyến m&atilde;i , trả g&oacute;p qua thẻ t&iacute;n dụng</h3>

<h3>Tham khảo th&ecirc;m Xiaomi Huami Amazfit GTR Phi&ecirc;n bản 42MM &ndash; Quốc tế &ndash; Global Version &ndash; International : <span style="color:#ff0000"><a href="https://ldstore.vn/xiaomi-amazfit-gtr-42mm/" style="color: #ff0000;">Bấm tại đ&acirc;y&nbsp;</a></span></h3>
', 12, N'<table class="shop_attributes woocommerce-product-attributes">
	<tbody>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p>Bạc, Đen</p>
			</td>
		</tr>
		<tr>
			<th>Chuẩn chống nước - Kh&aacute;ng bụi</th>
			<td>
			<p>5ATM ( c&oacute; thể bơi lội )</p>
			</td>
		</tr>
		<tr>
			<th>Hệ Điều H&agrave;nh</th>
			<td>
			<p>RTOS</p>
			</td>
		</tr>
		<tr>
			<th>K&iacute;ch thước</th>
			<td>
			<p>47,2 X 47,2 X 10,75 mm</p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p>1.39&quot; AMOLED, 16 triệu m&agrave;u, 400x400px, Gorilla Glass 3</p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p>410mah &ndash; pin sử dụng 24 ng&agrave;y b&igrave;nh thường</p>
			</td>
		</tr>
		<tr>
			<th>Quai đeo</th>
			<td>
			<p>22mm c&oacute; thể thay thế</p>
			</td>
		</tr>
		<tr>
			<th>Kết Nối</th>
			<td>
			<p>Bluetooth LE 5.0</p>
			</td>
		</tr>
		<tr>
			<th>Trọng lượng</th>
			<td>
			<p>36g</p>
			</td>
		</tr>
		<tr>
			<th>Loa/Mic</th>
			<td>
			<p>Kh&ocirc;ng c&oacute; / Kh&ocirc;ng c&oacute;</p>
			</td>
		</tr>
	</tbody>
</table>
', N'<ul>
	<li><span style="color:#ff6600"><strong>Phi&ecirc;n bản DigiWorld Ch&iacute;nh H&atilde;ng Việt Nam&nbsp;</strong></span></li>
	<li><strong>Bảo h&agrave;nh : 12 th&aacute;ng ( 1 đổi 1 )</strong></li>
</ul>
', 1, 9, 1, NULL, NULL, CAST(N'2020-12-14 18:18:44.490' AS DateTime), N'lehaichien')
INSERT [dbo].[Products] ([ID], [Title], [MetaTitle], [Images], [Thumb], [Price], [OldPrice], [MetaKeywords], [MetaDescription], [Gift], [Quantity], [Detail], [Guarantee], [Specification], [MoreDesc], [CategoryID], [BrandID], [Special], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, N'Polar Ignite', N'polar-ignite', N'<Images><Images>/Data/images/product/polar-ingite-1-768x768%20(1).jpg</Images><Images>/Data/images/product/polar-ingite-2-768x768.jpg</Images></Images>', N'/Data/images/product/polar-ingite-1-768x768.jpg', CAST(6800000 AS Decimal(18, 0)), NULL, NULL, NULL, N'<ul class="qua">
<li><i class="fa fa-check-circle"></i>Sản phẩm Polar có giá ưu đãi giảm giá vui lòng liên hệ hotline để có giá tốt hơn</li>
<li><i class="fa fa-check-circle"></i>Dán màn hình Pro9h+</li>
<li><i class="fa fa-check-circle"></i>Hỗ trợ thanh toán VNPAY, Airpay</li>
<li><i class="fa fa-check-circle"></i>Trả góp lãi suất 0% qua thẻ tín dụng Visa,Master Card</li>
</ul>', 100, N'<h2><strong>ĐỒNG HỒ THÔNG MINH GPS POLAR IGNITE THEO DÕI SỨC KHỎE CÓ GPS VÀ CHỨC NĂNG ĐO NHỊP TIM CỔ TAY</strong></h2>
<p>Polar Unite là chiếc đồng hồ thông minh theo dõi vận động có chức năng chống nước, chế độ theo dõi nhịp tim hiện đại qua cổ tay và tích hợp GPS. Chiếc đồng hồ thế hệ mới này sẽ trở thành người bạn tập luyện giúp bạn khai phá những tiềm năng và thúc đẩy khả năng bản than theo đúng cách. Polar Ignite cho bạn góc nhìn toàn diện về một ngày của bạn và đưa ra hướng dẫn để có cuộc sống cân bằng hơn.</p>
<p><strong>CHÀO ĐÓN NGƯỜI BẠN TẬP LUYỆN TÍCH HỢP TẤT CẢ TRONG MỘT</strong></p>
<p>Polar Ignite là người bạn tập luyện đa năng sẽ lên kế hoạch hoạt động cho bạn</p>
<p><img class="size-full wp-image-37173 aligncenter" src="https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-1_RGB_Expires_June_2021.jpg" alt="" width="6570" height="4380" srcset="https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-1_RGB_Expires_June_2021.jpg 6570w, https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-1_RGB_Expires_June_2021-300x200.jpg 300w, https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-1_RGB_Expires_June_2021-768x512.jpg 768w, https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-1_RGB_Expires_June_2021-1024x683.jpg 1024w, https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-1_RGB_Expires_June_2021-600x400.jpg 600w" sizes="(max-width: 6570px) 100vw, 6570px"></p>
<p><strong>POLAR INGITE HOẠT ĐỘNG MÀ KHÔNG GÂY KIỆT SỨC</strong></p>
<p>Không còn phải mất thời gian tìm kế hoạch luyện tập hiệu quả nhất trong ngày – Chức năng hướng dẫn tập luyện FitSpark giúp bạn tận hưởng những bài tập được thiết kế riêng, luôn có sẵn và theo yêu cầu của bạn, phù hợp với tiến độ phục hồi và sự sẵn sàng của bạn hằng ngày.</p>
<p><strong>POLAR INGITE GIÚP TẬP LUYỆN TRONG PHÒNG TẬP HIỆU QUẢ HƠN</strong></p>
<p>Đưa trải nghiệm nhóm tập luyện lên tầm cao mới – theo dõi nhịp tim, tìm hiểu bạn đã đốt được bao nhiêu calories và kết quả tổng hợp của buổi tập luyện sau đó.</p>
<p><strong>POLAR INGITE THEO DÕI BƯỚC CHẠY, ĐI BỘ VÀ ĐI XE ĐẠP</strong></p>
<p>Polar Ignite là người bạn hỗ trợ vận động như chạy bộ, đạp xe và những hoạt động tập luyện ngoài trời. GPS được tích hợp sẽ theo dõi tốc độ, quãng đường và chặng đường.</p>
<p><strong>POLAR INGITE TÌM HIỂU NỀN TẢNG TẬP LUYỆN TỐI ƯU</strong></p>
<p>Ứng dụng Polar Flow và dịch vụ hỗ trợ trên website sẽ giúp bạn có kho lưu trữ tự động dữ liệu hoạt động, là kho dữ liệu về giấc ngủ và hoạt động và nơi giúp bạn theo dõi tiến độ hoạt động.</p>
<p><img class="size-full wp-image-37176 aligncenter" src="https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-8_RGB_Expires_June_2021.jpg" alt="" width="4388" height="6582" srcset="https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-8_RGB_Expires_June_2021.jpg 4388w, https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-8_RGB_Expires_June_2021-200x300.jpg 200w, https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-8_RGB_Expires_June_2021-768x1152.jpg 768w, https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-8_RGB_Expires_June_2021-683x1024.jpg 683w, https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-8_RGB_Expires_June_2021-600x900.jpg 600w" sizes="(max-width: 4388px) 100vw, 4388px"></p>
<p><strong>Ngoài những chức năng cần thiết, như theo dõi hoạt động hằng ngày, bước chân và calories, Polar Ignite còn cho bạn những phân tích chi tiết về </strong>tiến độ phục hồi và sự sẵn sàng của bạn hằng ngày.</p>
<h3>XÂY DỰNG LỐI SỐNG BAN NGÀY QUA DỮ LIỆU BAN ĐÊM</h3>
<p>Chức năng đo sự phục hồi Nightly Recharge<sup>TM </sup>cho bạn những phản hồi về sức khỏe hằng ngày về sự phục hồi sau những căng thẳng và tập luyện qua 1 đêm. Từ đó, bạn có thể đưa ra những quyết định tối ưu vào ban ngày.</p>
<p><strong>NGỦ PHẢI NGON, LÀM MỚI TỐT</strong></p>
<h3>Theo dõi những quá trình giấc ngủ của bạn và đưa ra những phân tích chi tiết về giấc ngủ với chức năng theo dõi giấc ngủ New Sleep Plus Stages™.</h3>
<p><strong>HÍT THỞ VÀ TẬP TRUNG</strong></p>
<p>Thả lỏng cơ thể và trấn tĩnh tinh thần với chức năng mới tập luyện hít thở new Serene</p>
<p><img class="size-full wp-image-37174 aligncenter" src="https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-1_RGB_Expires_Sept_2021.jpg" alt="" width="6720" height="4480" srcset="https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-1_RGB_Expires_Sept_2021.jpg 6720w, https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-1_RGB_Expires_Sept_2021-300x200.jpg 300w, https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-1_RGB_Expires_Sept_2021-768x512.jpg 768w, https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-1_RGB_Expires_Sept_2021-1024x683.jpg 1024w, https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-1_RGB_Expires_Sept_2021-600x400.jpg 600w" sizes="(max-width: 6720px) 100vw, 6720px"></p>
<p><strong>Chức năng </strong><strong>Smart Calories</strong></p>
<p>Biết chắc chắn lượng calories bạn sẽ tiêu hao dựa theo cân nặng, chiều cao, lứa tuổi, giới tính, nhịp tim cao nhất của bạn (HRmax) và mức độ tập luyện.</p>
<p><strong>Chức năng Nhịp tim liên tục</strong></p>
<p>Có một cái nhìn tổng quát về cách vận hành của tim bạn trong ngày. Kiểm soát nhịp tim liên tục cho bạn một thước đo chính xác hơn về lượng calories đã đốt, dữ liệu hoạt động và cho bạn biết nhịp tim thấp nhất và cao nhất trong ngày.</p>
<p><strong>Chức năng</strong><strong> Activity </strong><strong>guide</strong></p>
<p>Luôn luôn vận động mỗi ngày. Polar Ignite giúp bạn có một kế hoạch hoạt động hằng ngày riêng&nbsp; biệt để khuyến khích bạn di chuyển trong suốt ngày. Bạn sẽ thấy bản thân vận động thường xuyên ra sao, và Polar Flow sẽ cung cấp những gợi ý thực tế để bạn hướng đến 100% mục tiêu.</p>
<p><strong>Chức năng </strong><strong>Fitness Test</strong></p>
<p>Kiểm tra mức độ tập luyện dễ dàng trong vòng 5 phút mà không cần phải đổ một giọt mồ hôi.<strong>&nbsp;</strong></p>
<p><strong>Chức năng</strong><strong> Running Index</strong></p>
<p>Có một con số dự đoán về chỉ số chạy bộ VO2max và xem hiệu quả chạy bộ tiến bộ hằng ngày.</p>
<p><img class="size-full wp-image-37175 aligncenter" src="https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-5_RGB_Expires_Sept_2021.jpg" alt="" width="6720" height="4480" srcset="https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-5_RGB_Expires_Sept_2021.jpg 6720w, https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-5_RGB_Expires_Sept_2021-300x200.jpg 300w, https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-5_RGB_Expires_Sept_2021-768x512.jpg 768w, https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-5_RGB_Expires_Sept_2021-1024x683.jpg 1024w, https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-5_RGB_Expires_Sept_2021-600x400.jpg 600w" sizes="(max-width: 6720px) 100vw, 6720px"></p>
<p><strong>Chức năng</strong><strong> Running Program</strong></p>
<p>Có một kế hoạch tập luyện cá nhân hóa và thích nghi cao sẽ phù hợp với bạn và mục đích tập luyện của bạn.</p>
<p><strong>Chức năng</strong><strong> Training Benefit</strong></p>
<p>Nhận những phản hồi tích cực ngay lập tức sau khi tập luyện để kể lại hiệu quả của phiên tập luyện vừa rồi.</p>
<p><strong>Chức năng</strong><strong> Training Load Pro</strong></p>
<p>Định khối lượng tập luyện của phiên tập và cho thấy hiệu quả của phiên tập tạo nên lên cơ thể bạn.</p>
<p><img class="size-full wp-image-37178 aligncenter" src="https://ldstore.vn/wp-content/uploads/2020/11/RUN_Ignite-2_RGB_Expires_June_2021.jpg" alt="" width="6720" height="4480" srcset="https://ldstore.vn/wp-content/uploads/2020/11/RUN_Ignite-2_RGB_Expires_June_2021.jpg 6720w, https://ldstore.vn/wp-content/uploads/2020/11/RUN_Ignite-2_RGB_Expires_June_2021-300x200.jpg 300w, https://ldstore.vn/wp-content/uploads/2020/11/RUN_Ignite-2_RGB_Expires_June_2021-768x512.jpg 768w, https://ldstore.vn/wp-content/uploads/2020/11/RUN_Ignite-2_RGB_Expires_June_2021-1024x683.jpg 1024w, https://ldstore.vn/wp-content/uploads/2020/11/RUN_Ignite-2_RGB_Expires_June_2021-600x400.jpg 600w" sizes="(max-width: 6720px) 100vw, 6720px"></p>
<p><img class="alignleft size-full wp-image-37176" src="https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-8_RGB_Expires_June_2021.jpg" alt="" width="4388" height="6582" srcset="https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-8_RGB_Expires_June_2021.jpg 4388w, https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-8_RGB_Expires_June_2021-200x300.jpg 200w, https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-8_RGB_Expires_June_2021-768x1152.jpg 768w, https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-8_RGB_Expires_June_2021-683x1024.jpg 683w, https://ldstore.vn/wp-content/uploads/2020/11/FIT_Ignite-8_RGB_Expires_June_2021-600x900.jpg 600w" sizes="(max-width: 4388px) 100vw, 4388px"></p>
<p>&nbsp;</p>', 12, N'<table class="woocommerce-product-attributes shop_attributes">
<tbody><tr class="woocommerce-product-attributes-item woocommerce-product-attributes-item--attribute_pa_manhinh">
<th class="woocommerce-product-attributes-item__label">Màn hình</th>
<td class="woocommerce-product-attributes-item__value"><p>1,3 inch IPS TFT (204×204)</p>
</td>
</tr>
<tr class="woocommerce-product-attributes-item woocommerce-product-attributes-item--attribute_pa_kichthuoc">
<th class="woocommerce-product-attributes-item__label">Kích thước</th>
<td class="woocommerce-product-attributes-item__value"><p>43 x 43 x 8.5 mm</p>
</td>
</tr>
<tr class="woocommerce-product-attributes-item woocommerce-product-attributes-item--attribute_pa_trong-luong">
<th class="woocommerce-product-attributes-item__label">Trọng lượng</th>
<td class="woocommerce-product-attributes-item__value"><p>35g</p>
</td>
</tr>
<tr class="woocommerce-product-attributes-item woocommerce-product-attributes-item--attribute_pa_pin">
<th class="woocommerce-product-attributes-item__label">Pin</th>
<td class="woocommerce-product-attributes-item__value"><p>165mah trung bình 5 ngày</p>
</td>
</tr>
<tr class="woocommerce-product-attributes-item woocommerce-product-attributes-item--attribute_pa_thong-tin-phan-cung">
<th class="woocommerce-product-attributes-item__label">Thông tin phần cứng</th>
<td class="woocommerce-product-attributes-item__value"><p>GPS GLONASS</p>
</td>
</tr>
</tbody></table>', N'<p><strong>Bảo hành chính hãng : 12 tháng</strong></p>', 7, 12, 1, CAST(N'2020-12-16 13:31:22.510' AS DateTime), N'lehaichien', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Slides] ON 

INSERT [dbo].[Slides] ([ID], [Name], [Description], [Link], [Images], [Order], [Status]) VALUES (1, N'Huawei Honor Magic Watch 2', NULL, N'/huawei-honor-magic-watch-2/', N'/Data/images/banner/honor-magic-watch-2-background-ldstore-1.jpg', 10, 1)
INSERT [dbo].[Slides] ([ID], [Name], [Description], [Link], [Images], [Order], [Status]) VALUES (2, N'Danh mục Ticwatch', NULL, N'/ticwatch/', N'/Data/images/banner/1%20(1).png', 1, 1)
INSERT [dbo].[Slides] ([ID], [Name], [Description], [Link], [Images], [Order], [Status]) VALUES (3, N'Huawei Honor Watch Magic ( Lava Black )', NULL, N'/huawei-honor-magic-watch-lava-black/', N'/Data/images/banner/banner9.jpg', 2, 1)
INSERT [dbo].[Slides] ([ID], [Name], [Description], [Link], [Images], [Order], [Status]) VALUES (4, N'Garmin Instinct', NULL, N'/garmin-instinct/', N'/Data/images/banner/BANNER10.jpg', 3, 1)
INSERT [dbo].[Slides] ([ID], [Name], [Description], [Link], [Images], [Order], [Status]) VALUES (5, N'Huawei Honor Watch Magic ( Lava Black )', NULL, N'/huawei-honor-magic-watch-lava-black/', N'/Data/images/banner/1.jpg', 4, 1)
INSERT [dbo].[Slides] ([ID], [Name], [Description], [Link], [Images], [Order], [Status]) VALUES (6, N'Xiaomi Amazfit GTR Phiên bản quốc tế – 47mm', NULL, N'/xiaomi-amazfit-gtr-quoc-te/', N'/Data/images/banner/amazfit-gtr-banner-5.jpg', 5, 1)
INSERT [dbo].[Slides] ([ID], [Name], [Description], [Link], [Images], [Order], [Status]) VALUES (7, N'Garmin Fenix 6', NULL, N'/garmin-fenix-6/', N'/Data/images/banner/fenix6_1600x710-vn.jpg', 6, 1)
INSERT [dbo].[Slides] ([ID], [Name], [Description], [Link], [Images], [Order], [Status]) VALUES (8, N'Xiaomi Amazfit GTR Phiên bản quốc tế – 42mm', NULL, N'/xiaomi-amazfit-gtr-42mm/', N'/Data/images/banner/amazfit-gtr-banner-1.jpg', 7, 1)
INSERT [dbo].[Slides] ([ID], [Name], [Description], [Link], [Images], [Order], [Status]) VALUES (9, N'Xiaomi Huami Amazfit T-REX', NULL, N'/xiaomi-huami-amazfit-t-rex/', N'/Data/images/banner/amazfit-t-rex-background-ldstore-1.png', 8, 1)
INSERT [dbo].[Slides] ([ID], [Name], [Description], [Link], [Images], [Order], [Status]) VALUES (10, N'Oppo Band', NULL, N'/oppo-band/', N'/Data/images/banner/oppo-band.png', 9, 1)
INSERT [dbo].[Slides] ([ID], [Name], [Description], [Link], [Images], [Order], [Status]) VALUES (11, N'Fitbit Versa Đen ( Likenew )', NULL, N'/fitbit-versa-den-likenew/', N'/Data/images/banner/shopee1.jpg', 11, 1)
INSERT [dbo].[Slides] ([ID], [Name], [Description], [Link], [Images], [Order], [Status]) VALUES (12, N'Xiaomi Mi Watch Phiên bản Esim (4G/LTE)', NULL, N'/xiaomi-mi-watch/', N'/Data/images/banner/miwatch.png', 12, 1)
SET IDENTITY_INSERT [dbo].[Slides] OFF
INSERT [dbo].[UserGroups] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsActived], [IsDeleted]) VALUES (N'ADMIN', N'Administrator', N'Nhóm quản tri cao nhất', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[UserGroups] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsActived], [IsDeleted]) VALUES (N'MEMBER', N'Thành viên', NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Users] ([UserName], [Password], [Email], [Mobile], [Name], [Address], [Sex], [UpdatedDate], [UpdatedBy], [LastLoginDate], [LastChangePassword], [GroupID]) VALUES (N'lehaichien', N'202cb962ac59075b964b07152d234b70', N'lehaichien@gmail.com', N'123456789', N'Lê Hải Chiến', N'Phủ Lý, Hà Nam', 1, NULL, NULL, NULL, NULL, N'ADMIN')
INSERT [dbo].[Users] ([UserName], [Password], [Email], [Mobile], [Name], [Address], [Sex], [UpdatedDate], [UpdatedBy], [LastLoginDate], [LastChangePassword], [GroupID]) VALUES (N'quangtran', N'202cb962ac59075b964b07152d234b70', N'dangquang@gmail.com', N'1234567', N'Trần Đăng Quang', N'Hà Nam', 1, CAST(N'2020-12-13 15:49:54.793' AS DateTime), N'lehaichien', NULL, NULL, N'ADMIN')
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brands] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategories] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategories]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserGroups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[UserGroups] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserGroups]
GO
USE [master]
GO
ALTER DATABASE [WebDongHoMVC] SET  READ_WRITE 
GO
