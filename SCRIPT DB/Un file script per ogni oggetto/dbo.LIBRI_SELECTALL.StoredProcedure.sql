USE [LIBRARY]
GO
/****** Object:  StoredProcedure [dbo].[LIBRI_SELECTALL]    Script Date: 13/09/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[LIBRI_SELECTALL]
AS
BEGIN
	SELECT codlibro, codutente, titolo, autore, genere, copertina, sinossi, cast(dataprestito as nvarchar(10))as dataprestito FROM LIBRI
END
GO
