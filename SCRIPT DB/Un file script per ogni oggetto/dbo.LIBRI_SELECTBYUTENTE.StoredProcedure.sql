USE [LIBRARY]
GO
/****** Object:  StoredProcedure [dbo].[LIBRI_SELECTBYUTENTE]    Script Date: 13/09/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[LIBRI_SELECTBYUTENTE]
(
	@codUtente int
)
AS
BEGIN
	select codlibro, codutente, titolo, autore, genere, copertina, sinossi, cast(dataprestito as nvarchar(10))as dataprestito
	from LIBRI
	where codUtente=@codUtente
END
GO
