USE [LIBRARY]
GO
/****** Object:  Table [dbo].[LIBRI]    Script Date: 13/09/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIBRI](
	[codLibro] [int] IDENTITY(1,1) NOT NULL,
	[codUtente] [int] NULL,
	[titolo] [nvarchar](50) NULL,
	[autore] [nvarchar](50) NULL,
	[genere] [nvarchar](50) NULL,
	[copertina] [varbinary](max) NULL,
	[sinossi] [text] NULL,
	[dataPrestito] [date] NULL,
 CONSTRAINT [PK_LIBRI] PRIMARY KEY CLUSTERED 
(
	[codLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
