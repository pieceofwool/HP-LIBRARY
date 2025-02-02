USE [LIBRARY]
GO
/****** Object:  StoredProcedure [dbo].[UTENTI_UPDATE]    Script Date: 13/09/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UTENTI_UPDATE]
(
	@codUtente int,
	@tipoUtente char(1),
	@abilitato bit,
	@email nvarchar(50)
)
as
begin
	update UTENTI
	set
		tipoUtente=@tipoUtente,
		abilitato=@abilitato,
		email=@email
	where codUtente=@codUtente
end
GO
