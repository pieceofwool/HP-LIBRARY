USE [LIBRARY]
GO
/****** Object:  StoredProcedure [dbo].[LIBRI_SELECTONE]    Script Date: 13/09/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[LIBRI_SELECTONE]
(
	@codLibro int
)
AS
BEGIN
	SELECT *
	FROM LIBRI
	WHERE codLibro= @codLibro
END
GO
