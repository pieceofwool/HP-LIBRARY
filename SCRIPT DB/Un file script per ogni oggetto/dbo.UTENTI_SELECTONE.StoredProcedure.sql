USE [LIBRARY]
GO
/****** Object:  StoredProcedure [dbo].[UTENTI_SELECTONE]    Script Date: 13/09/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UTENTI_SELECTONE]
(
	@codUtente int
)
as
begin
	SELECT *
	FROM UTENTI
	WHERE codUtente=@codUtente
end
GO
