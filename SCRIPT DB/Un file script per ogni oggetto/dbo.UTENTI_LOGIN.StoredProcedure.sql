USE [LIBRARY]
GO
/****** Object:  StoredProcedure [dbo].[UTENTI_LOGIN]    Script Date: 13/09/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UTENTI_LOGIN]
(
	@email nvarchar(50),
	@password nvarchar(50)
)
as
begin
	select * from UTENTI
	WHERE email = @email
	and password=@password
end
GO
