USE [LIBRARY]
GO
/****** Object:  StoredProcedure [dbo].[UTENTI_REGISTRATO]    Script Date: 13/09/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UTENTI_REGISTRATO]
(
	@email nvarchar(50)
)
as
begin
	select * from UTENTI
	WHERE email = @email
end
GO
