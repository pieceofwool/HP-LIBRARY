USE [LIBRARY]
GO
/****** Object:  StoredProcedure [dbo].[UTENTI_GETCODUTENTE]    Script Date: 13/09/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UTENTI_GETCODUTENTE]
(
	@email nvarchar(50)
)
AS
BEGIN
	select *
	from UTENTI
	where email=@email
END
GO
