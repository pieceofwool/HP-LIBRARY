USE [LIBRARY]
GO
/****** Object:  StoredProcedure [dbo].[UTENTI_SELECTABILITATI]    Script Date: 13/09/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UTENTI_SELECTABILITATI]
(
	@abilitato bit
)
as
begin
	select * from UTENTI
	WHERE abilitato = @abilitato
end
GO
