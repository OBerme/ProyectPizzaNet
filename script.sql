USE [PizzaNet]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 10/12/2021 0:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[dni] [char](9) NOT NULL,
	[direccion] [varchar](150) NOT NULL,
	[tlfno] [char](9) NOT NULL,
	[eCorreo] [varchar](150) NOT NULL,
 CONSTRAINT [PkCliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[extras]    Script Date: 10/12/2021 0:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[extras](
	[idExtra] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
	[precio] [money] NOT NULL,
 CONSTRAINT [PkExtras] PRIMARY KEY CLUSTERED 
(
	[idExtra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pizza]    Script Date: 10/12/2021 0:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pizza](
	[idPizza] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](2000) NOT NULL,
	[foto] [varchar](200) NULL,
 CONSTRAINT [PkPizza] PRIMARY KEY CLUSTERED 
(
	[idPizza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sesion]    Script Date: 10/12/2021 0:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sesion](
	[idSesion] [int] IDENTITY(1,1) NOT NULL,
	[sesion] [varchar](20) NOT NULL,
	[pass] [varchar](255) NOT NULL,
	[rol] [varchar](30) NOT NULL,
 CONSTRAINT [PkUsuario] PRIMARY KEY CLUSTERED 
(
	[idSesion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[extras] ON 

INSERT [dbo].[extras] ([idExtra], [nombre], [precio]) VALUES (5, N'cacas', 0.6500)
INSERT [dbo].[extras] ([idExtra], [nombre], [precio]) VALUES (6, N'cacas variadas', 1.5600)
SET IDENTITY_INSERT [dbo].[extras] OFF
GO
SET IDENTITY_INSERT [dbo].[pizza] ON 

INSERT [dbo].[pizza] ([idPizza], [nombre], [descripcion], [foto]) VALUES (1, N'Margarita', N'Deliciosa pizza con queso Mozarela y tomate, aromatizada con albahaca, en crujiente masa fina o sabrosa masa normal', NULL)
INSERT [dbo].[pizza] ([idPizza], [nombre], [descripcion], [foto]) VALUES (2, N'Cuatro quesos', N'Sabrosa pizza con los mejores quesos del mundo: Mozarella, Chedar, Roqueford y Gouda, en crujiente masa fina o en masa normal con los bordes rellenos de queso', NULL)
INSERT [dbo].[pizza] ([idPizza], [nombre], [descripcion], [foto]) VALUES (3, N'Carbonara', N'Pizza con base de tomate y queso Mozarella y deliciosa salsa carbonara', NULL)
SET IDENTITY_INSERT [dbo].[pizza] OFF
GO
SET IDENTITY_INSERT [dbo].[sesion] ON 

INSERT [dbo].[sesion] ([idSesion], [sesion], [pass], [rol]) VALUES (1, N'admin', N'$2y$10$Sts5Jb.se2uMgVick/ohg.qj6pjDPlVKrX7VW9.9CLqsK9bUe2ZcS', N'admin')
SET IDENTITY_INSERT [dbo].[sesion] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UClienteDni]    Script Date: 10/12/2021 0:11:11 ******/
ALTER TABLE [dbo].[cliente] ADD  CONSTRAINT [UClienteDni] UNIQUE NONCLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UNombreExtra]    Script Date: 10/12/2021 0:11:11 ******/
ALTER TABLE [dbo].[extras] ADD  CONSTRAINT [UNombreExtra] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UnombrePizza]    Script Date: 10/12/2021 0:11:11 ******/
ALTER TABLE [dbo].[pizza] ADD  CONSTRAINT [UnombrePizza] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UusuNusuario]    Script Date: 10/12/2021 0:11:11 ******/
ALTER TABLE [dbo].[sesion] ADD  CONSTRAINT [UusuNusuario] UNIQUE NONCLUSTERED 
(
	[sesion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[sesion] ADD  DEFAULT ('CLI') FOR [rol]
GO
