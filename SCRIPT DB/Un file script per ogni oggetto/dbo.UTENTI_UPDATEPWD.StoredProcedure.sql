USE [LIBRARY]
GO
/****** Object:  StoredProcedure [dbo].[UTENTI_UPDATEPWD]    Script Date: 13/09/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UTENTI_UPDATEPWD]
(
	@email nvarchar(50),
	@password nvarchar(50)
)
as
begin
	update UTENTI
	set password=@password
	where email=@email
end
GO
