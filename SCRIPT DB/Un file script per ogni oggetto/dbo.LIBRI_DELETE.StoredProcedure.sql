USE [LIBRARY]
GO
/****** Object:  StoredProcedure [dbo].[LIBRI_DELETE]    Script Date: 13/09/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[LIBRI_DELETE]
(
	@codLibro int
)
AS
BEGIN
	DELETE FROM LIBRI
	WHERE codLibro = @codLibro
END
GO
