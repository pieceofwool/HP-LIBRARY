USE [LIBRARY]
GO
/****** Object:  StoredProcedure [dbo].[LIBRI_RICERCA_GENERE]    Script Date: 13/09/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LIBRI_RICERCA_GENERE]
(
@ricerca nvarchar(50)
)
AS
BEGIN
 SELECT * from LIBRI where genere like '%'+@ricerca+'%'
end
GO
