USE [FoodieDB]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 1/17/2024 5:46:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 1/17/2024 5:46:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ImageUrl] [varchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 1/17/2024 5:46:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Subject] [varchar](200) NULL,
	[Message] [varchar](max) NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 1/17/2024 5:46:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [varchar](max) NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[UserID] [int] NULL,
	[Status] [varchar](50) NULL,
	[PaymentId] [int] NULL,
	[OrderDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 1/17/2024 5:46:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CardNo] [varchar](50) NULL,
	[ExpiryDate] [varchar](50) NULL,
	[CvvNo] [int] NULL,
	[Address] [varchar](max) NULL,
	[PaymentMode] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 1/17/2024 5:46:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
	[Price] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
	[ImageUrl] [varchar](max) NULL,
	[CategoryId] [int] NULL,
	[IsActive] [bit] NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/17/2024 5:46:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Username] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
	[PostCode] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[ImageUrl] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([CartId], [ProductId], [Quantity], [UserId]) VALUES (14, 9, 4, 1)
INSERT [dbo].[Carts] ([CartId], [ProductId], [Quantity], [UserId]) VALUES (15, 11, 1, 1)
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [Name], [ImageUrl], [IsActive], [CreateDate]) VALUES (19, N'Foods', N'Images/Category/e319c407-f463-492d-8b6f-5b9cfc2ad5d8.jpg', 1, CAST(N'2024-01-17T15:25:50.753' AS DateTime))
INSERT [dbo].[Categories] ([CategoryID], [Name], [ImageUrl], [IsActive], [CreateDate]) VALUES (20, N'Spices', N'Images/Category/e37d35a3-e8c4-4e2b-954f-fa78b59214dd.jpg', 1, CAST(N'2024-01-17T15:26:13.847' AS DateTime))
INSERT [dbo].[Categories] ([CategoryID], [Name], [ImageUrl], [IsActive], [CreateDate]) VALUES (21, N'Drinks', N'Images/Category/07d8c978-7a63-4ef5-8fbd-410aecb018f8.png', 1, CAST(N'2024-01-17T15:26:20.797' AS DateTime))
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderDetailsId], [OrderNo], [ProductId], [Quantity], [UserID], [Status], [PaymentId], [OrderDate]) VALUES (64, N'ee065f9d-69b3-4d0a-8f59-068926718c47', 9, 2, 1, N'Pending', 37, CAST(N'2024-01-17T15:30:15.943' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (1, N'', N'', N'', 0, N'Vi?t Nam', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (2, N'VoGiaHuy', N'************9423', N'01/2024', 191, N'Vi?t Nam', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (4, N'VoG', N'************1221', N'01/2024', 191, N'Vi?t Nam', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (8, N'VoGiaHuy', N'************1111', N'12/2222', 222, N'Vi?t Nam', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (9, N'', N'', N'', 0, N'QN', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (10, N'Huy', N'************2111', N'11/2024', 222, N'QN', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (12, N'huy', N'************1112', N'22/2060', 222, N'QN', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (13, N'huy', N'************2222', N'22/1222', 222, N'QN', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (15, N'huy', N'************1111', N'22/1222', 223, N'Vi?t Nam', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (16, N'huy', N'************2222', N'22/2222', 222, N'Vi?t Nam', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (17, N'huy', N'************1111', N'22/2222', 222, N'Vi?t Nam', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (18, N'huy', N'************2222', N'22/2222', 222, N'Vi?t Nam', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (19, N'huy', N'************2222', N'22/2222', 222, N'Vi?t Nam', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (21, N'huy', N'************2222', N'22/2222', 222, N'Vi?t Nam', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (30, N'', N'', N'', 0, N'QN', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (31, N'huy', N'************1111', N'22/2222', 222, N'QN', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (32, N'', N'', N'', 0, N'QN', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (33, N'huy', N'************2222', N'22/2222', 222, N'QN', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (34, N'huy', N'************2222', N'22/2222', 222, N'QN', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (35, N'huy', N'************2222', N'22/2222', 222, N'QN', N'card')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (36, N'', N'', N'', 0, N'QN', N'cod')
INSERT [dbo].[Payment] ([PaymentId], [Name], [CardNo], [ExpiryDate], [CvvNo], [Address], [PaymentMode]) VALUES (37, N'', N'', N'', 0, N'QN', N'cod')
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreateDate]) VALUES (9, N'Pho', N'Loving Vegan Food', CAST(18.00 AS Decimal(18, 2)), 10, N'Images/Product/c4a4701b-6a3b-4e28-8309-190bd57aee66.jpg', 19, 1, CAST(N'2024-01-17T15:27:24.743' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreateDate]) VALUES (10, N'Hu Tieu', N'Loving Vegan Food', CAST(20.00 AS Decimal(18, 2)), 5, N'Images/Product/c04a7847-b8d1-4981-8dda-1569ad63e3ae.jpg', 19, 1, CAST(N'2024-01-17T15:51:04.643' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreateDate]) VALUES (11, N'Bun Mang', N'Loving Vegan Food', CAST(20.00 AS Decimal(18, 2)), 5, N'Images/Product/139803c3-4092-41b7-8440-5141c5b9c853.jpg', 19, 1, CAST(N'2024-01-17T15:51:35.890' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreateDate]) VALUES (12, N'Burger', N'Loving Vegan Food', CAST(20.00 AS Decimal(18, 2)), 5, N'Images/Product/b7d9b19f-3951-4ac8-8be9-88ee17c03df2.png', 19, 1, CAST(N'2024-01-17T15:51:55.217' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive], [CreateDate]) VALUES (13, N'Pho', N'Loving Vegan Food', CAST(20.00 AS Decimal(18, 2)), 5, N'Images/Product/ba174b25-ec55-4354-a606-ff8a9da47c3f.png', 19, 1, CAST(N'2024-01-17T15:52:25.147' AS DateTime))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Name], [Username], [Mobile], [Email], [Address], [PostCode], [Password], [ImageUrl], [CreatedDate]) VALUES (1, N'Võ Gia Huy', N'huy', N'0911503320', N'vohuy19120@gmail.com', N'Vi?t Nam', N'123', N'1234', NULL, CAST(N'2023-12-07T16:24:33.360' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E4C05FCD4B]    Script Date: 1/17/2024 5:46:03 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534ACDC18D4]    Script Date: 1/17/2024 5:46:03 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Products]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Users]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Payment] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payment] ([PaymentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Payment]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
/****** Object:  StoredProcedure [dbo].[Cart_Crud]    Script Date: 1/17/2024 5:46:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Cart_Crud]
@Action VARCHAR(10),
@ProductId INT = NULL,
@Quantity INT = NULL,
@UserId INT = NULL
AS
BEGIN
 SET NOCOUNT ON;

--SELECT
IF @Action = 'SELECT'
	BEGIN
		SELECT c.ProductId,p.Name,p.ImageUrl,p.Price,c.Quantity,c.Quantity AS Qty,p.Quantity AS PrdQty
		FROM dbo.Carts c
		INNER JOIN dbo.Products p ON p.ProductId = c.ProductId
		WHERE c.UserId = @UserId
	END

--INSERT
IF @Action = 'INSERT'
	BEGIN
		INSERT INTO dbo.Carts(ProductId, Quantity,UserId)
		VALUES(@ProductId, @Quantity, @UserId)
	END
--UPDATE
IF @Action = 'UPDATE'
	BEGIN
		UPDATE dbo.Carts
		SET Quantity = @Quantity
		WHERE ProductId = @ProductId AND UserId = @UserId
	END

--DELETE
IF @Action = 'DELETE'
	BEGIN
		DELETE FROM dbo.Carts
		WHERE ProductId = @ProductId AND UserId = @UserId
	END
--GET BY ID (PEODUCTID & USERID)
IF @Action = 'GETBYID'
	BEGIN
		SELECT * FROM dbo.Carts
		WHERE ProductId = @ProductId AND UserId = @UserId
	END

END
GO
/****** Object:  StoredProcedure [dbo].[Category_Crud]    Script Date: 1/17/2024 5:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Category_Crud]
	@Action VARCHAR(10),
	@CategoryId INT = NULL,
	@Name VARCHAR(100) = Null,
	@IsActive BIT =false,
	@ImageUrl VARCHAR(MAX)=NULL
	
AS
BEGIN

	SET NOCOUNT ON;

	 --SELECT
   IF @Action ='SELECT'
   BEGIN
       SELECT *FROM dbo.Categories ORDER BY CreateDate DESC
	   END

	    --ACTIVECAT
   IF @Action ='ACTIVECAT'
   BEGIN
       SELECT *FROM dbo.Categories WHERE IsActive=1
	   END

     --INSERT
	   IF @Action = 'INSERT'
	   BEGIN
	   
	   INSERT INTO dbo.Categories   (Name,ImageUrl, IsActive, CreateDate)
	   VALUES(@Name, @ImageUrl, @IsActive, GETDATE())
	   
	   END

	    --UPDATE
	   IF @Action = 'UPDATE'
		BEGIN
			DECLARE @UPDATE_IMAGE VARCHAR(20)
			SELECT @UPDATE_IMAGE =(CASE WHEN @ImageUrl IS NULL THEN 'NO' ELSE 'YES' END)
			IF @UPDATE_IMAGE='NO'
				BEGIN
				UPDATE dbo.Categories
				SET Name = @Name, IsActive =@IsActive
				WHERE CategoryId = @CategoryId
				END
				ELSE
				BEGIN 
				UPDATE dbo.Categories
				SET Name =@Name, ImageUrl = @ImageUrl, IsActive = @IsActive
				WHERE CategoryId =@CategoryId
				END
			END

			--DELETE
			IF @Action= 'DELETE'
			BEGIN 
			DELETE FROM dbo.Categories WHERE CategoryId =@CategoryId
			END

			--GETBYID 
			IF @Action= 'GETBYID'
			BEGIN 
			SELECT * FROM dbo.Categories WHERE CategoryId =@CategoryId
			END

END
GO
/****** Object:  StoredProcedure [dbo].[Invoice]    Script Date: 1/17/2024 5:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Invoice]
	@Action VARCHAR(10),
	@PaymentId INT = NULL,
	@UserId INT = NULL,
	@OrderDetailsId INT = NULL,
	@Status VARCHAR(50) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   --GET INVOICE BY ID
   IF @Action = 'INVOICBYID'
	BEGIN
		SELECT ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS [SrNo], o.OrderNo, p.Name, p.Price, o.Quantity,
		(p. Price * o.Quantity) as TotalPrice, o.OrderDate, o.Status FROM Orders o
		INNER JOIN Products p ON p.ProductId = o.ProductId
		WHERE o.PaymentId = @PaymentId AND o.UserID = @UserId
	END

	--SELECT ORDER HISTORY
	IF @Action = 'ODRHISTORY'
		BEGIN
			SELECT DISTINCT o.PaymentId, p.PaymentMode, p.CardNo FROM Orders o
			INNER JOIN Payment p ON p.PaymentId = o.PaymentId
			WHERE o.UserID = @UserId
		END

	--GET ORDER STATUS
	IF @Action = 'GETSTATUS'
		BEGIN 
			SELECT o.OrderDetailsId, o.OrderNo, (pr.Price * o.Quantity) as TotalPrice, o.Status,
			o.OrderDate, p.PaymentMode, pr.Name FROM Orders o
			INNER JOIN Payment p ON p.PaymentId = o.PaymentId
			INNER JOIN Products pr ON pr.ProductId = o.ProductId
		END

	--GET ORDER STATUS BY ID
	IF @Action = 'STATUSBYID'
		BEGIN 
			SELECT OrderDetailsId, Status FROM Orders
			WHERE OrderDetailsId = @OrderDetailsId
		END

	--UPDATE ORDER STATUS
	IF @Action = 'UPDTSTATUS'
		BEGIN 
			UPDATE dbo.Orders
			SET Status = @Status WHERE OrderDetailsId = @OrderDetailsId
		END
END
GO
/****** Object:  StoredProcedure [dbo].[Product_Crud]    Script Date: 1/17/2024 5:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Product_Crud]
   @Action varchar(10),
   @ProductId int =null,
   @Name varchar(100)=null,
   @Description varchar(max)=null,
   @Price decimal(18,2)=0,
   @Quantity int=null,
   @ImageUrl varchar(max)=null,
   @CategoryId int=null,
   @IsActive bit=false
 
 as

 begin
   set nocount on 

   --select
   if @Action='SELECT'
   BEGIN
    SELECT p.*,c.Name as CategoryName from dbo.Products p
		inner join dbo.Categories c on c.CategoryID= p.CategoryId order by p.CreateDate desc
		end

		  --ACTIVEPRODUCT
   if @Action='ACTIVEPROD'
   BEGIN
    SELECT p.*,c.Name as CategoryName from dbo.Products p
		inner join dbo.Categories c on c.CategoryID= p.CategoryId
		WHERE p.IsActive=1
		END

		--insert

		if @Action ='INSERT'
		begin
		 INSERT INTO dbo.Products(Name, Description, Price, Quantity, ImageUrl, CategoryId, IsActive, CreateDate)
		 values (@Name, @Description,@Price,@Quantity,@ImageUrl,@CategoryId,@IsActive,GETDATE())
		 END

		 --UPDATE

		 IF @Action ='UPDATE'
		 BEGIN
		 DECLARE @UPDATE_IMAGE VARCHAR(20)
		 SELECT @UPDATE_IMAGE = (CASE WHEN @ImageUrl IS NULL THEN 'NO' ELSE 'YES' END)
		 IF @UPDATE_IMAGE='NO'
		 BEGIN 
		 UPDATE dbo.Products
		  Set Name = @Name, Description = @Description, Price = @Price, Quantity=@Quantity, CategoryId=@CategoryId, IsActive=@IsActive
		  where ProductId =@ProductId
		  end
		  else
		  BEGIN  
		  UPDATE dbo.Products
		  Set Name = @Name, Description =@Description, Price=@Price, Quantity=@Quantity, ImageUrl=@ImageUrl, CategoryId=@CategoryId, IsActive=@IsActive
		  where ProductId=@ProductId
		  end

		end

		--update quantity
		if @Action ='QTYUPDATE'
		BEGIN 
		UPDATE dbo.Products SET Quantity=@Quantity
		where ProductId =@ProductId
		end

		--delete
		if @Action='DELETE'
		BEGIN
		  DELETE FROM dbo.Products WHERE ProductId=@ProductId
		  end
		  --GETBYID
		  IF @Action ='GETBYID'
		  BEGIN 
		  SELECT *FROM dbo.Products where ProductId =@ProductId
		  end
		end
GO
/****** Object:  StoredProcedure [dbo].[Save_Orders]    Script Date: 1/17/2024 5:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Save_Orders] @tblOrders OrderDetails READONLY
as
begin
	set nocount on;

	insert into Orders(OrderNo, ProductId, Quantity, UserID, Status, PaymentId, OrderDate)
	select OrderNo, ProductId, Quantity, UserID, Status, PaymentId, OrderDate from @tblOrders 
end
GO
/****** Object:  StoredProcedure [dbo].[Save_Payment]    Script Date: 1/17/2024 5:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Save_Payment]
    @Name VARCHAR(100) = NULL,
    @CardNo VARCHAR(50) = NULL,
    @ExpiryDate VARCHAR(50) = NULL,
    @Cvv INT = NULL,
    @Address VARCHAR(MAX) = NULL,
    @PaymentMode VARCHAR(10) = 'card',
    @InsertedId INT OUTPUT

as
 begin
   set nocount on 

	BEGIN
		INSERT INTO dbo.Payment(Name, CardNo, ExpiryDate, CvvNo, Address, PaymentMode)
		VALUES (@Name, @CardNo, @ExpiryDate, @Cvv, @Address, @PaymentMode)

		SELECT @InsertedId = SCOPE_IDENTITY();	
	END
END
GO
/****** Object:  StoredProcedure [dbo].[User_Crud]    Script Date: 1/17/2024 5:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[User_Crud]
@Action varchar(20),
@UserId int=null,
@Name nvarchar(50)=null,
@Username varchar(50)=null,
@Mobile varchar(50)=null,
@Email varchar(50)=null,
@Address nvarchar(max)=null,
@PostCode varchar(20)=null,
@Password varchar(20)=null,
@ImageUrl varchar(max)=null
as
begin 
set nocount on;
 --select for login
    if @Action ='SELECTFORLOGIN'
	BEGIN 
	select *from dbo.Users where Username = @Username and Password = @Password
	end
	 ---Select form user profile
	 if @Action = 'SELECTFORPROFILE'
	 BEGIN 
	 SELECT *FROM dbo.Users where UserID = @UserId
	 end

	 --Insert (registration)
	 if @Action='INSERT'
	  BEGIN
	  Insert into dbo.Users(Name,Username,Mobile,Email,Address,PostCode,Password,ImageUrl,CreatedDate)
	  values (@Name,@Username,@Mobile,@Email,@Address,@PostCode,@Password,@ImageUrl,GETDATE())
	  END
	  --update user profile
	  if @Action='UPDATE'
	  BEGIN
	  DECLARE @UPDATE_IMAGE VARCHAR(20)
	  SELECT @UPDATE_IMAGE = (CASE WHEN @ImageUrl IS NULL THEN 'NO' ELSE 'YES' END)
	  IF @UPDATE_IMAGE ='NO'
	  BEGIN 
	  UPDATE dbo.Users
	  SET Name =@Name, Username=@Username, Mobile=@Mobile, Email=@Email, Address=@Address,
	  PostCode=@PostCode
	  WHERE UserID=@UserId
	  END
	  END
	  --SELECT FOR ADMIN 
	  IF @Action ='SELECTFORADMIN'
	  BEGIN 
	  SELECT ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS [SrNo], UserId, Name, Username, Email, CreatedDate
	  from Users
	  end
	  --select by admin
	  IF @Action = 'DELETE'
	  BEGIN 
	  DELETE FROM dbo.Users where UserId=@UserId
		end
		end
GO
