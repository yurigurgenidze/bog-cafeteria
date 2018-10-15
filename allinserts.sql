SET IDENTITY_INSERT [dbo].[CommentType] ON
INSERT INTO [dbo].[CommentType] ([Id], [Name]) VALUES (1, N'Good')
INSERT INTO [dbo].[CommentType] ([Id], [Name]) VALUES (2, N'Average')
INSERT INTO [dbo].[CommentType] ([Id], [Name]) VALUES (3, N'Bad')
SET IDENTITY_INSERT [dbo].[CommentType] OFF
SET IDENTITY_INSERT [dbo].[CompanyType] ON
INSERT INTO [dbo].[CompanyType] ([Id], [Name]) VALUES (1, N'American')
INSERT INTO [dbo].[CompanyType] ([Id], [Name]) VALUES (2, N'Japanese')
INSERT INTO [dbo].[CompanyType] ([Id], [Name]) VALUES (3, N'Georgian')
INSERT INTO [dbo].[CompanyType] ([Id], [Name]) VALUES (4, N'Mexican')
SET IDENTITY_INSERT [dbo].[CompanyType] OFF
SET IDENTITY_INSERT [dbo].[PriceRange] ON
INSERT INTO [dbo].[PriceRange] ([Id], [PriceRange]) VALUES (1, N'Expensive')
INSERT INTO [dbo].[PriceRange] ([Id], [PriceRange]) VALUES (2, N'Average')
INSERT INTO [dbo].[PriceRange] ([Id], [PriceRange]) VALUES (3, N'Cheap')
SET IDENTITY_INSERT [dbo].[PriceRange] OFF
SET IDENTITY_INSERT [dbo].[ProductType] ON
INSERT INTO [dbo].[ProductType] ([Id], [Name]) VALUES (1, N'Pizza')
INSERT INTO [dbo].[ProductType] ([Id], [Name]) VALUES (2, N'Khinkali')
INSERT INTO [dbo].[ProductType] ([Id], [Name]) VALUES (3, N'Shawarma')
INSERT INTO [dbo].[ProductType] ([Id], [Name]) VALUES (4, N'Donut')
INSERT INTO [dbo].[ProductType] ([Id], [Name]) VALUES (1002, N'Sea Food')
SET IDENTITY_INSERT [dbo].[ProductType] OFF
SET IDENTITY_INSERT [dbo].[Product] ON
INSERT INTO [dbo].[Product] ([Id], [Name]) VALUES (1, N'Peperoni Pizza')
INSERT INTO [dbo].[Product] ([Id], [Name]) VALUES (2, N'Mtiuluri Khinkali')
INSERT INTO [dbo].[Product] ([Id], [Name]) VALUES (1002, N'Kalakuri Khinkali')
INSERT INTO [dbo].[Product] ([Id], [Name]) VALUES (1003, N'Sushi')
INSERT INTO [dbo].[Product] ([Id], [Name]) VALUES (1004, N'Margarita Pizza')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Company] ON
INSERT INTO [dbo].[Company] ([Id], [Name], [Type], [Logo], [Average Price], [Description], [RegisterDate]) VALUES (2004, N'Domino''s Pizza', 1, N'https://pbs.twimg.com/profile_images/963381842459185152/dYXkqLSA_400x400.jpg', 3, N'Some pizza', N'2018-10-16 00:37:01')
SET IDENTITY_INSERT [dbo].[Company] OFF
INSERT INTO [dbo].[Comment] ([Id], [Company], [Type], [Comment]) VALUES (1, 2004, 1, N'helo')
INSERT INTO [dbo].[Comment] ([Id], [Company], [Type], [Comment]) VALUES (2, 2004, 3, N'vax es ra iyo')
SET IDENTITY_INSERT [dbo].[Menu] ON
INSERT INTO [dbo].[Menu] ([Id], [Product], [Category], [Time], [Price], [Company]) VALUES (1002, 1, 1, 20, 15, 2004)
INSERT INTO [dbo].[Menu] ([Id], [Product], [Category], [Time], [Price], [Company]) VALUES (1003, 1004, 1, 25, 12, 2004)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[Sale] ON
INSERT INTO [dbo].[Sale] ([Id], [Company], [Price], [Date], [Rating], [User]) VALUES (2004, 2004, 45, N'2018-10-16 00:43:16', 0, NULL)
INSERT INTO [dbo].[Sale] ([Id], [Company], [Price], [Date], [Rating], [User]) VALUES (3004, 2004, 45, N'2018-10-16 00:59:58', 0, NULL)
INSERT INTO [dbo].[Sale] ([Id], [Company], [Price], [Date], [Rating], [User]) VALUES (4004, 2004, 81, N'2018-10-16 01:12:39', 0, NULL)
INSERT INTO [dbo].[Sale] ([Id], [Company], [Price], [Date], [Rating], [User]) VALUES (4005, 2004, 15, N'2018-10-16 01:18:36', 5, NULL)
INSERT INTO [dbo].[Sale] ([Id], [Company], [Price], [Date], [Rating], [User]) VALUES (4006, 2004, 30, N'2018-10-16 02:23:46', 5, NULL)
INSERT INTO [dbo].[Sale] ([Id], [Company], [Price], [Date], [Rating], [User]) VALUES (4007, 2004, 30, N'2018-10-16 02:24:25', 5, NULL)
INSERT INTO [dbo].[Sale] ([Id], [Company], [Price], [Date], [Rating], [User]) VALUES (4008, 2004, 42, N'2018-10-16 02:28:33', 5, NULL)
INSERT INTO [dbo].[Sale] ([Id], [Company], [Price], [Date], [Rating], [User]) VALUES (4009, 2004, 15, N'2018-10-16 03:00:25', 5, NULL)
INSERT INTO [dbo].[Sale] ([Id], [Company], [Price], [Date], [Rating], [User]) VALUES (4010, 2004, 15, N'2018-10-16 03:04:12', 5, NULL)
INSERT INTO [dbo].[Sale] ([Id], [Company], [Price], [Date], [Rating], [User]) VALUES (4011, 2004, 15, N'2018-10-16 03:04:18', 5, NULL)
SET IDENTITY_INSERT [dbo].[Sale] OFF







