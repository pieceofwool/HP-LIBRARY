USE [LIBRARY]
GO
/****** Object:  StoredProcedure [dbo].[LIBRI_INSERT]    Script Date: 13/09/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[LIBRI_INSERT]
(
	@titolo nvarchar(50),
	@autore nvarchar(50),
	@genere nvarchar(50),
	@copertina varbinary(MAX),
	@sinossi text
)
AS
BEGIN
	INSERT INTO LIBRI(TITOLO, AUTORE, GENERE, COPERTINA, SINOSSI)
	VALUES(
		@titolo,
		@autore,
		@genere,
		@copertina,
		@sinossi
	)
END
GO
