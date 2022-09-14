USE [LIBRARY]
GO
/****** Object:  StoredProcedure [dbo].[LIBRI_RESTITUISCI]    Script Date: 13/09/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[LIBRI_RESTITUISCI]
(
	@codLibro int
)
AS
BEGIN
	update LIBRI
	set
		codUtente=NULL,
		dataPrestito=NULL
	where codLibro=@codLibro
END
GO
