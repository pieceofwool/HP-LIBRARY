USE [LIBRARY]
GO
/****** Object:  StoredProcedure [dbo].[LIBRI_UPDATE]    Script Date: 13/09/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[LIBRI_UPDATE]
(
	@codLibro int,
	@titolo nvarchar(50),
	@autore nvarchar(50),
	@genere nvarchar(50),
	@copertina varbinary(MAX),
	@sinossi text
)
AS
BEGIN
	UPDATE LIBRI
	SET
		titolo=@titolo,
		autore=@autore,
		genere=@genere,
		copertina=@copertina,
		sinossi=@sinossi
	WHERE codLibro=@codLibro
END
GO
