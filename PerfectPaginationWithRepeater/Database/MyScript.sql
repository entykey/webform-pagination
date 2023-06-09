/****** Object:  Table [dbo].[tblPerson]    Script Date: 10/11/2015 3:13:39 PM ******/
--CREATE DATABASE ASPNETMVC
--USE ASPNETMVC
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPerson](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[createdDate] [datetime] NULL,
 CONSTRAINT [PK_tblPerson] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblPerson] ON 

GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (1, N'ChienVH', N'Ha Noi, Viet Nam', CAST(N'2015-09-09 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (2, N'HopHT', N'Viet Nam', CAST(N'2015-09-09 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (3, N'ThangVH', N'HaNoi, Viet Nam', CAST(N'2015-09-09 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (4, N'HuyDQ', N'Ha Noi', CAST(N'2015-09-09 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (5, N'Test', N'1', CAST(N'2015-09-09 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (6, N'Hạnh', N'Hà Tây', CAST(N'2015-09-09 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (7, N'Chien2', N'Mỹ đình', CAST(N'2015-09-09 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (8, N'John', N'US', CAST(N'2015-09-08 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (9, N'Pete', N'UK', CAST(N'2015-07-09 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (10, N'Hop Hoang', N'My Dinh', CAST(N'2015-09-09 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (11, N'Hop Hoang', N'My Dinh', CAST(N'2015-09-09 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (12, N'Hop Hoang 2', N'My Dinh', CAST(N'2015-09-09 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (13, N'Chien Vu 100', N'Viet Nam', CAST(N'2015-09-09 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (14, N'Chien Vu 2', N'Viet Nam', CAST(N'2015-09-09 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (15, N'ThangVH 2', N'Viet Nam', CAST(N'2015-09-09 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (16, N'HopHT', N'HaNoi, Viet Nam', CAST(N'2015-06-09 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (20, N'Chien Vu Hoang', N'My Dinh, Ha Noi, Viet Nam', CAST(N'2015-09-10 17:50:48.023' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (21, N'Anh Chien', N'VN', CAST(N'2015-09-15 23:12:51.730' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (22, N'Anh Chien 2', N'VN2', CAST(N'2015-09-15 23:13:23.577' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (23, N'ChienVH', N'Viet Nam', CAST(N'2015-09-15 23:16:39.540' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (24, N'ChienVH', N'Viet Nam', CAST(N'2015-09-15 23:16:53.847' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (25, N'Vu Hoang Chien', N'Ha Noi, Viet Nam', CAST(N'2015-09-15 23:23:43.430' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (26, N'Vu Hoang Chien', N'Ha Noi, Viet Nam', CAST(N'2015-09-15 23:24:04.280' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (27, N'Chien 1', N'Viet Nam', CAST(N'2015-09-15 23:24:39.070' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (28, N'Chien 2', N'VN 2', CAST(N'2015-09-15 23:27:53.690' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (29, N'Chien 3', N'VN 3', CAST(N'2015-09-15 23:28:09.987' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (30, N'Vu Hoang Chien', N'Ha Noi, Viet Nam', CAST(N'2015-09-15 23:29:16.760' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (31, N'Chien Vu', N'Viet Nam, Ha Noi', CAST(N'2015-09-15 23:29:40.127' AS DateTime))
GO
INSERT [dbo].[tblPerson] ([id], [name], [address], [createdDate]) VALUES (32, N'Nguyễn Hữu Anh Tuấn', N'HCMUE', CAST(N'2015-09-15 23:29:40.127' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblPerson] OFF
GO
