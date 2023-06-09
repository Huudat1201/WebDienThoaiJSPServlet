USE [master]
GO
/****** Object:  Database [QLDT]    Script Date: 4/17/2023 10:30:08 AM ******/
CREATE DATABASE [QLDT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLDT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLDT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLDT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLDT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLDT] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLDT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLDT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLDT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLDT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLDT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLDT] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLDT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLDT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLDT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLDT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLDT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLDT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLDT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLDT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLDT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLDT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLDT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLDT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLDT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLDT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLDT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLDT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLDT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLDT] SET RECOVERY FULL 
GO
ALTER DATABASE [QLDT] SET  MULTI_USER 
GO
ALTER DATABASE [QLDT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLDT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLDT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLDT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLDT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLDT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLDT', N'ON'
GO
ALTER DATABASE [QLDT] SET QUERY_STORE = OFF
GO
USE [QLDT]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 4/17/2023 10:30:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[catalog]    Script Date: 4/17/2023 10:30:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[catalog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[parent_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ordered]    Script Date: 4/17/2023 10:30:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordered](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[transaction_id] [int] NOT NULL,
	[qty] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 4/17/2023 10:30:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[catalog_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [nvarchar](20) NOT NULL,
	[status] [int] NOT NULL,
	[description] [nvarchar](4000) NOT NULL,
	[content] [nvarchar](4000) NOT NULL,
	[discount] [int] NULL,
	[image_link] [nvarchar](4000) NOT NULL,
	[created] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[review]    Script Date: 4/17/2023 10:30:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[content] [nvarchar](4000) NOT NULL,
	[created] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactions]    Script Date: 4/17/2023 10:30:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_session] [nvarchar](50) NOT NULL,
	[user_name] [nvarchar](50) NOT NULL,
	[user_mail] [nvarchar](50) NOT NULL,
	[user_phone] [nvarchar](20) NOT NULL,
	[address] [nvarchar](300) NOT NULL,
	[message] [nvarchar](4000) NOT NULL,
	[amount] [nvarchar](20) NOT NULL,
	[payment] [nvarchar](30) NOT NULL,
	[status] [nvarchar](30) NULL,
	[created] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 4/17/2023 10:30:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](20) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[created] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([id], [username], [password], [name]) VALUES (1, N'admin', N'1', N'Huudat1201')
INSERT [dbo].[admin] ([id], [username], [password], [name]) VALUES (2, N'Huudat1201', N'1', N'Huudat1201')
SET IDENTITY_INSERT [dbo].[admin] OFF
GO
SET IDENTITY_INSERT [dbo].[catalog] ON 

INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (1, N'Apple iPhone', NULL)
INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (2, N'Samsung', NULL)
INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (3, N'Xiaomi', NULL)
INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (4, N'Google Pixel', NULL)
INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (5, N'Sony', NULL)
INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (6, N'Oppo', NULL)
INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (7, N'Gaming Phone', NULL)
SET IDENTITY_INSERT [dbo].[catalog] OFF
GO
SET IDENTITY_INSERT [dbo].[ordered] ON 

INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (1, 2, 1, 2)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (2, 43, 1, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (3, 2, 3, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (4, 1, 3, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (5, 4, 4, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (6, 4, 5, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (7, 3, 5, 1)
SET IDENTITY_INSERT [dbo].[ordered] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (1, 7, N'OnePlus 9RT 5G', N'6990000', 1, N'(8GB - 128GB) 2 Sim Like New 99% chip Snapdragon 888 5G', N'Đánh giá Oneplus 9rt: Thiết kế đơn giản, Snapdragon 888, tốc độ cảm ứng 600Hz, camera 50MP
Oneplus 9rt với phiên bản nội địa Trung Quốc, đây là chiếc điện thoại sở hữu hiệu năng mạnh mẽ với chip Snapdragon 888 và màn hình AMOLED E4  mượt mà ở tần số quét 120Hz. Tại cửa hàng, bạn có thể ‘tậu’ cho mình chiếc Oneplus 9rt ở mức giá hời nhất thị trường; đặc biệt trải nghiệm 7 ngày miễn phí khi mua tại cửa hàng.', 0, N'Oneplus9rt.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (2, 1, N'Iphone 14 Pro', N'35390000', 1, N'256GB Chính hãng (VN/A)', N'Tổng thể iPhone 14 Pro 256GB không có nhiều thay đổi so với thế hệ tiền nhiệm iPhone 13 Pro. Điện thoại vẫn sử dụng khung viền vát phẳng với mô-đun camera nổi bật ở phía sau giống như iPhone 13 Pro. Thiết kế này vốn đã vay mượn từ dòng iPhone 12 Pro. Điều này có nghĩa là Apple iPhone 14 Pro 256GB tiếp tục được hoàn thiện từ khung thép không gỉ kết hợp với mặt kính trước và sau được bảo vệ bằng kính Ceramic Shield.

Thay vì bóng, mặt lưng điện thoại được phủ mờ mang đến cảm giác cầm nắm tốt hơn. Mua iPhone 14 Pro 256GB giá rẻ người dùng sẽ có 4 tùy chọn màu sắc gồm: Space Black, Gold, Silver và thêm phiên bản màu mới Deep Purple. Điện thoại iPhone 14 Pro năm nay có kích thước dày hơn và cao hơn một chút so với thế hệ tiền nhiệm, tất cả các phiên bản đều được trang bị xếp hạng IP68.', 10, N'iphone14pro.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (3, 1, N'iPhone 13', N'18690000', 1, N'128GB Chính hãng (VN/A)', N'Đánh giá điện thoại iPhone 13 128GB cho thấy ngoại hình máy không có nhiều khác biệt so với mẫu điện thoại iPhone 12. Apple tiếp tục sử dụng cạnh viền vát phẳng mang đến sự nam tính và mạnh mẽ. Phần thân máy siêu mỏng, kết hợp với mặt kính cường lực bóng bẩy và khung nhôm chắc chắn mang đến độ bền tốt hơn', 0, N'iphone13.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (4, 1, N'Iphone12', N'14490000', 1, N'64GB (Cũ 99%)', N'Điện thoại iPhone 12 64GB được đánh giá là dòng iPhone nổi bật, cuốn hút và hiệu năng. Không chỉ có thiết kế ấn tượng, dung lượng pin tốt cùng bộ nhớ vượt trội mà dòng iPhone này còn được nâng cấp một cách đáng kể, mang lại trải nghiệm ấn tượng cho người dùng.

Xem thêm thông tin về iPhone 12 64GB giá tốt nhất tại XTmobile, một trong những dòng iPhone được ưa chuộng hàng đầu hiện nay.', 10, N'iphone12.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (5, 1, N'iPhone SE 2020', N'6990000', 1, N'128GB (Cũ 99%)', N'Có thể thấy, mẫu điện thoại iPhone SE 2020 128GB mới sẽ là sự lựa chọn lý tưởng cho các tín đồ công nghệ ưa chuộng trường phái nhỏ gọn. Thoạt nhìn, người dùng dễ bị nhầm lẫn giữa thiết kế iPhone SE 2020 128GB và iPhone 8. Bởi về cơ bản Apple vẫn giữ lại thiết kế, bao gồm cả cách bố trí nút nguồn và phím âm lượng ở máy cũng sẽ giống với thế hệ trước.

Dường như Apple đang tận dụng ưu điểm của mình là lối thiết kế quen thuộc, dành được rất nhiều tình cảm của người dùng trong những năm qua. Với kiểu dáng nhỏ gọn, bo tròn các cạnh, thân máy siêu mỏng tinh tế và hoàn thiện từ chất liệu nhôm kết hợp kính cao cấp. Điều này giúp iPhone SE 2020 128GB mang đến một cảm giác thân thuộc, thoải mái khi sử dụng.', 10, N'iphonese2020.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (6, 1, N'iPhone Xs Max', N'9190000', 1, N'64GB (Cũ 99%)', N'Điện thoại iPhone Xs Max 64GB cũ vinh dự trở thành chiếc iPhone đầu tiên của Apple có màn hình lớn nhất lịch sử. Nhìn tổng thể cho thấy iPhone Xs Max chính là một bản phóng to so với người anh em iPhone Xs. Với thiết kế sang trọng, các góc cạnh được bo cong mềm mại cùng màn hình tràn viền đã mang lại cho iPhone Xs Max cũ sức hút đặc biệt.', 10, N'iphonexsmax.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (7, 1, N'iPhone 11', N'9090000', 1, N'128GB (Cũ 99%)', N'Có thể thấy, ông lớn Apple vẫn trung thành với thiết kế màn hình “tai thỏ” trên điện thoại iPhone 11 128GB cũ. Trong khi đó các dòng điện thoại cao cấp Android hiện nay đã sử dụng màn hình notch, màn hình không viền vô cùng ấn tượng.

Tuy nhiên, viền bezel phía trên và dưới cũng được làm gọn lại nhằm tối đa màn hình sử dụng. Cùng với đó, 4 góc của máy cũng được bo tròn nhẹ tạo cảm giác chắc chắn khi cầm trên tay. Mặt lưng iPhone 11 128GB cũ làm từ chất liệu kính nên rất sang trọng, tinh tế.', 10, N'iphone11.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (8, 1, N'iPhone 8 Plus', N'5790000', 1, N'64GB (Cũ 99%)', N'iPhone 8 Plus 64GB cũ được hoàn thiện dựa dựa theo kiểu dáng, kích thước của đàn anh iPhone 7 Plus. Tuy nhiên ở thế hệ mới này, Apple có sự thay đổi nhỏ trong ngôn ngữ thiết kế. Không còn là mặt lưng kim loại với dải ang-ten chạy bo viền cạnh trên, dưới.', 10, N'iphone8plus.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (9, 2, N'Samsung Galaxy Z Fold 4', N'36990000', 1, N'512GB', N'Galaxy Z Fold 4 512GB là mẫu smatphone màn hình gập mới được Samsung trình làng để tiếp nối sự thành công người tiền nhiệm Galaxy Z Fold 3. Tuy rằng phiên bản này không được Samsung chú trọng đến việc thay đổi về diện mạo thiết kế nhưng bù lại hãng đã tập trung vào việc cải thiện để thiết bị trở nên tốt hơn, đáp ứng tốt mọi nhu cầu trải nghiệm của người dùng.', 5, N'Szfold4.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (10, 2, N'Samsung Galaxy Z Flip 4', N'16590000', 1, N'(8GB|128GB)', N'Tương tự Galaxy Z Flip 3, thiết kế Samsung Z Flip 4 cũng được lấy cảm hứng từ “hộp trang điểm” với các đường nét được chau chuốt tỉ mỉ. Điều này không chỉ khiến chị em phụ nữ phải xuýt xoa mà các đấng mày râu cũng phải dành cho nó những lời khen ngợi có cánh.', 0, N'Szfip4.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (11, 2, N'Samsung Galaxy S22 Ultra 5G', N'27990000', 1, N'256GB', N'Tương tự với các thế hệ trước, Galaxy S22 Ultra 5G 256GB gây ấn tượng mạnh với người đối diện nhờ vào ngoại hình sang trọng, đẳng cấp. Không nói quá khi bạn dễ bị mê hoặc bởi chất liệu kim loại cao cấp được làm nhám, vừa tạo cảm giác cứng cáp vừa hạn chế bám vân tay trong quá trình sử dụng. ', 20, N'Ss22ultra5g.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (12, 2, N'Samsung Galaxy Note 20 Ultra 5G', N'12990000', 1, N'(12GB|256GB) Hàn Quốc - Snapdragon 865+ (Cũ 99%)', N'Thiết kế Galaxy Note 20 Ultra 5G Hàn cũ được hoàn thiện từ khung kim loại cao cấp với lớp kính cường lực ở trước và sau. Đáng chú ý là mặt kính này do Gorilla phát triển đem lại khả năng chống trầy cực tốt, chống bám bụi bẩn và mồ hôi tay hiệu quả.', 0, N'Snote20ultra.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (13, 2, N'Samsung Galaxy S20 5G', N'7690000', 1, N'(12GB|128GB) Hàn Quốc (Cũ 99%)', N'Galaxy S20 5G là dòng flagship mang trong mình những định hướng mới từ Samsung. Máy không chỉ mang hiệu năng mạnh mẽ mà còn sử dụng ngôn ngữ thiết kế độc đáo, mới mẻ mà hãng đang dần áp dụng lên mọi dòng Galaxy S20 của mình.', 20, N'Ss20.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (14, 2, N'Galaxy Note 10 Plus 5G', N'8590000', 1, N' (12GB|512GB) Hàn Quốc SM-N976N (Cũ 99%)', N'Thiết kế Galaxy Note 10 5G Plus cho tới thời điểm bày vẫn là một trong những điện thoại lớn với các viền bezel gần như biến mất hoàn toàn. Thật đáng tiếc khi đây là chiếc Galaxy Note đầu tiên Samsung quyết định loại bỏ giắc cắm tai nghe 3,5 mm.', 20, N'Snote10plus.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (15, 2, N'Samsung Galaxy S10 Plus', N'5890000', 1, N' (8GB|512GB) Hàn Quốc SM-G975N (Cũ 99%)', N'Galaxy S10 Plus 512GB Bản Hàn vẫn được sở hữu chất liệu kim loại nguyên khối bền bỉ cùng với mặt kính cường lực vô cùng chắc chắn. Điểm khác biệt mang tính đột phá của thiết bị này là sở hữu màn hình O-Infinity độc đáo, với một lỗ nhỏ khoét trên màn hình chứa camera selfie. Đây không phải là thiết bị đầu tiên sở hữu thiết kế màn hình này, nhưng chắc chắn sẽ là sản phẩm mở ra trào lưu mới cho các điện thoại khác. ', 0, N'S10plus.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (16, 2, N'Samsung Galaxy Note 9', N'5890000', 1, N'(8GB|512GB) Hàn Quốc (Cũ 99%)', N'Galaxy Note 9 512GB cũ có thiết kế nguyên khôi kim loại cứng cáp, các mặt được ốp kính cong 3D sang trọng. Máy được bo cạnh nhẹ hơn so với dòng S nên trông nam tính hơn nhưng vẫn đảm bảo thoải mái khi nằm trong tay người sử dụng.', 10, N'Snote9.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (23, 3, N'Xiaomi Redmi 10C', N'3650000', 1, N'(4GB|128GB) (CTY)', N'Xiaomi Redmi 10C là mẫu điện thoại thuộc phân khúc giá rẻ được Xiaomi ra mắt với mong muốn mang đến thêm lựa chọn cho khách hàng. Vừa ra mắt chiếc smartphone thu hút nhiều sự quan tâm của người dùng khi có nhiều nâng cấp đáng kể về mặt hiệu suất, màn hình và khả năng nhiếp ảnh ấn tượng cùng cùng mức giá cực kỳ cạnh tranh.', 0, N'Xredmi10c.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (24, 3, N'Xiaomi Redmi Note 11', N'4250000', 1, N'(4GB|128GB) (CTY)', N'Redmi Note 11 không thuộc phân khúc cao cấp nhưng lại sở hữu một số yếu tố của điện thoại hàng đầu. Chắc rằng thiết bị sẽ thành công vượt ca quả người anh em Redmi Note 10 của mình.', 0, N'Xredminote11.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (25, 4, N'Google Pixel 7', N'15890000', 1, N'(8GB|128GB) Mới 100% Fullbox', N'Google Pixel 7 được nhà sản xuất giới thiệu tại sự kiện Google I/O 2022 vào tháng 5,thế nhưng phải đến tận tháng 10 năm nay thì Pixel 7 mới được chuyển đến tay những khách hàng đặt mua. Và với khoảng thời gian chờ đợi lâu đến như vậy, chắc chắn mẫu smartphone này phải đem đến cho người dùng những sự cải tiến đặc biệt. Vậy đó là gì? Cùng Xtmobile tìm hiểu nhé!', 10, N'Gpixel7.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (26, 4, N'Google Pixel 6 Pro', N'12990000', 1, N'(12GB|256GB) Mới 100% Fullbox', N'Có thể thấy Pixel 6 Pro thu hút người dùng nhờ vào phong cách thiết kế độc lạ cùng tông màu thời trang cao cấp. Điều này không phải một chiếc flagship nào cũng làm được. Bên cạnh đó, gã khổng lồ sử dụng chất liệu kim loại và thủy tinh bóng để làm vỏ máy, có một chút bất tiện là điện thoại không mang lại nhiều độ bám khi cầm trên tay nhưng không đáng kể.', 5, N'Gpixel6.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (27, 4, N'Google Pixel 6a', N'8890000', 1, N'(6GB|128GB) Mới 100% Fullbox', N'Mẫu điện thoại giá rẻ Google Pixel 6a chính thức được ra mắt tại sự kiện Google I/O. Bên cạnh bộ đôi Google Pixel 7 và Pixel 7 Pro. Vậy mẫu điện thoại này sẽ có những điểm gì đặc biệt. Tìm hiểu kĩ hơn cùng XTmobile nhé!', 5, N'Gpixel6a.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (31, 5, N'Sony Xpria 1', N'3590000', 1, N'(6GB - 64GB) Like New 99%', N'Sony Xperia 1 là chiếc smartphone chip Snapdragon 855 mạnh mẽ nhất ở thời điểm hiện tại. Ngoài chipset cực mạnh, Sony Xperia 1 còn được trang bị màn hình OLED 4K với hỗ trợ Always-on, 3 camera, pin 3330mAh hỗ trợ sạc nhanh...', 0, N'SonyXperia1.png', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (32, 5, N'Sony Xperia 5', N'3490000', 1, N'(6GB - 64GB) Bản Nhật Like New 99% - chip Snapdragon 855', N'Sony Xperia 5 cũ - Sự lựa chọn hoàn hảo trong phân khúc tầm trung, sản phẩm có một thiết kế đẹp, cấu hình mạnh mẽ, đi kèm đó là hệ thống camera cực kỳ chất lượng!', 0, N'SonyXperia5.png', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (33, 5, N'Sony Xperia 1 II', N'6990000', 1, N'128GB - Like New 99%', N'Sony Xperia 1 Mark II được hoàn thiện bằng kính cường lực với ngôn ngữ thiết kế mạnh mẽ. Hiệu năng từ con chip Snapdragon 865 8 nhân giúp máy có thể đa nhiệm mượt mà nhiều ứng dụng khác nhau. ', 0, N'SonyXperia1II.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (36, 6, N'Oppo Reno6 Z 5G', N'4590000', 1, N'(8GB - 128GB) Mới 100% Trôi Bảo Hành', N'Oppo Reno6 Z Công ty là chiếc smartphone tầm trung vừa được ra mắt vào ngày 21/7 với thiết kế gọn gàng, màu sắc bắt mắt và cấu hình cực khủng từ chip Dimensity 800U hỗ trợ kết nối 5G cao cấp. Chiếc điện thoại này còn được mệnh danh là chuyên gia chụp ảnh với cụm 3 camera nổi bật, được tích hợp nhiều công nghệ chụp ảnh cao cấp.', 0, N'Opporeno6z5g.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (37, 6, N'Oppo Reno7 Z 5G', N'7990000', 1, N'(8GB - 128GB) Công Ty VN/A', N'Oppo luôn được đánh giá cao với những chiếc điện thoại có thiết kế độc đáo, thế mạnh của hãng luôn nằm ở tính năng camera selfie. Mới đây, Oppo Reno7 Z đã được ra mắt và được nhiều người trên thế giới đón nhận một cách tích cực. Vậy chúng ta hãy cùng nhau tìm hiểu kỹ hơn qua những bài đánh giá  Oppo Reno7 Z này nhé!', 0, N'Opporeno7z.png', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (38, 6, N'OPPO Reno5 4G', N'6890000', 1, N'(8GB - 128GB) Công Ty mới fullbox nguyên seal', N'OPPO Reno5 (8GB - 128GB): Thiết kế lạ mắt, cấu hình khủng, sạc nhanh 65W
OPPO Reno5 là chiếc điện thoại vừa ra mắt được thiết kế bắt mắt, màn hình tươi sáng cùng công nghệ sạc nhanh SuperVOOC mới. Cùng khám phá ngay các tiện ích tuyệt vời của chiếc điện thoại Oppo Reno5 này ngay!', 5, N'Opporeno5.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (39, 6, N'Oppo Reno8 Z 5G', N'8390000', 1, N'(8GB - 256GB) Công Ty mới Nguyên Seal', N'Đánh giá OPPO Reno8 Z 5G: Nâng cấp hiệu năng, vẻ đẹp quen thuộc, làm chủ mọi góc ảnh
Sau bao lâu chờ đợi, cuối cùng mình đã có được trên tay OPPO Reno8 Z 5G. Vẫn là con chip Snapdragon 695 5G nhưng hãng có đã những nâng cấp mạnh mẽ từ phần cứng đến phầm mềm của máy. Tại Viettablet, máy đang có sẵn hai phiên bản Mới 100% và Like New giúp bạn có thêm nhiều tùy chọn phù hợp với bản thân đấy.', 0, N'Opporeno8.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (41, 7, N'ASUS ROG Phone 5', N'14990000', 1, N'(8GB - 128GB) mới Fullbox nguyên seal', N'ASUS ROG Phone 5: Đánh giá thiết kế, cấu hình, giá bán
ASUS chính thức ra mắt phiên bản gaming phone cao cấp ASUS ROG Phone 5 vào đầu tháng 3/2021. Sở hữu thiết kế nam tính mạnh mẽ, cấu hình - tính năng được nâng cấp cực mạnh hỗ trợ cho chơi game như chip Snapdragon 888, màn hình 144Hz, pin khủng 6000mAh tích hợp sạc nhanh 65W... ', 0, N'Asusrogphone5.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (42, 7, N'ZTE Nubia Red Magic 3S', N'12990000', 1, N'(12GB - 512GB)', N'ZTE Nubia Red Magic 3S (12GB - 512GB) với dung lượng RAM khủng, bộ nhớ lên đến 512GB. Đây là dòng smartphone chuyên chơi game với thiết kế mạnh mẽ cá tính, cấu hình xử lý cực mạnh, pin trâu.', 0, N'ztenubiaredmagic3s.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (43, 7, N'ASUS ROG Phone 3', N'15990000', 1, N'(12GB - 512GB) Chip Snapdragon 865+', N'ROG PHONE 3 GAME CHANGER: QUYỀN NĂNG TỐI THƯỢNG
Thừa hưởng toàn bộ tinh hoa từ Rog Phone 2
Bộ xử lý Snapdragon 865 Plus 5G Mobile mạnh nhất thế giới mang đến HIỆU NĂNG ĐỈNH CAO
Tần số quét lên đến 144Hz đáp ứng mọi game thủ kể cả khó tính nhất
Với nâng cấp Air Trigger 3 giúp Asus ROG PHONE 3 trở thành CỔ MÁY KHỦNG NHẤT HIỆN NAY trong làng Smartphone.', 15, N'Asusrogphone3.jpg', CAST(N'2022-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (48, 3, N'Xiaomi 12 5G', N'16900000', 1, N'(12GB - 512GB)', N'Xiaomi Mi 12 dự kiến được cải tạo mạnh mẽ nhất ở cụm camera với 3 cảm biến lên đến 192MP. Đó là cảm biến chính góc rộng 192MP, camera góc siêu rộng và 1 cảm biến tele với khả năng zoom 5x cực khủng.

Về cấu hình, Xiaomi Mi 12 dự kiến được trang bị sức mạnh của chip Snapdragon 895 mới nhất cùng với RAM 8GB - 12GB với ROM 128GB/ 256GB. Ngoài ra, bạn sẽ có thêm màn hình Super AMOLED FullHD+ với tần số quét linh hoạt từ 1Hz đến 120Hz tiết kiệm điện năng nữa.', 0, N'xiaomi12.jpg', CAST(N'2022-12-08' AS Date))
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[review] ON 

INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created]) VALUES (4, 32, N'Nguyễn Hữu Đạt', N'huudat1201@gmail.com', N'hai long', CAST(N'2022-12-03' AS Date))
INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created]) VALUES (5, 3, N'Nguyễn Hữu Đạt', N'huudat1201@gmail.com', N'Sản phẩm đẹp
', CAST(N'2022-12-11' AS Date))
SET IDENTITY_INSERT [dbo].[review] OFF
GO
SET IDENTITY_INSERT [dbo].[transactions] ON 

INSERT [dbo].[transactions] ([id], [user_session], [user_name], [user_mail], [user_phone], [address], [message], [amount], [payment], [status], [created]) VALUES (1, N'Huudat1201', N'Nguyễn Hữu Đạt', N'Huudat1201@gmail.com', N'0395243809', N'tang nhon phu b- quan 9 - tphcm', N'giao vao luc 12h trua', N'25.200', N'0', N'Đã thanh toán', CAST(N'2022-12-03' AS Date))
INSERT [dbo].[transactions] ([id], [user_session], [user_name], [user_mail], [user_phone], [address], [message], [amount], [payment], [status], [created]) VALUES (3, N'Huudat1201', N'Nguyễn Hữu Đạt', N'Huudat1201@gmail.com', N'0395243809', N'Tang nhon phu b quan 9', N'giao trong vong 5h dong ho', N'33350000.000', N'0', N'Đã thanh toán', CAST(N'2022-12-09' AS Date))
INSERT [dbo].[transactions] ([id], [user_session], [user_name], [user_mail], [user_phone], [address], [message], [amount], [payment], [status], [created]) VALUES (4, N'Huudat1201', N'Nguyễn Hữu Đạt', N'Huudat1201@gmail.com', N'0395243809', N'sdfsdf', N'sdfsdf', N'13041000.000', N'0', NULL, CAST(N'2022-12-09' AS Date))
INSERT [dbo].[transactions] ([id], [user_session], [user_name], [user_mail], [user_phone], [address], [message], [amount], [payment], [status], [created]) VALUES (5, N'Huudang2503', N'Nguyễn Hữu Đăng', N'Huudat2053@gmail.com', N'0842166643', N'Tăng Nhơn Phú B - Quận 9 tphcm', N'Giao hàng vào 5h chiều ngày 7/6/2023', N'31731000.000', N'0', NULL, CAST(N'2023-04-06' AS Date))
SET IDENTITY_INSERT [dbo].[transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [name], [email], [phone], [username], [password], [created]) VALUES (1, N'Nguyễn Hữu Đạt', N'huudat1201@gmail.com', N'0395243809', N'Huudat1201', N'Huudat1201', CAST(N'2022-12-03' AS Date))
INSERT [dbo].[users] ([id], [name], [email], [phone], [username], [password], [created]) VALUES (2, N'Nguyễn Hữu Đăng', N'huudat2503@gmail.com', N'0842166643', N'Huudang2503', N'1', CAST(N'2023-04-06' AS Date))
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__admin__F3DBC572D4E4A261]    Script Date: 4/17/2023 10:30:08 AM ******/
ALTER TABLE [dbo].[admin] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E6164DBF47AD4]    Script Date: 4/17/2023 10:30:08 AM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__F3DBC572A78421D2]    Script Date: 4/17/2023 10:30:08 AM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ordered]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ordered]  WITH CHECK ADD FOREIGN KEY([transaction_id])
REFERENCES [dbo].[transactions] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([catalog_id])
REFERENCES [dbo].[catalog] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [QLDT] SET  READ_WRITE 
GO
