USE [LIBRARY]
GO
/****** Object:  StoredProcedure [dbo].[UTENTI_INSERT]    Script Date: 13/09/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UTENTI_INSERT]
(
	@email nvarchar(50),
	@password nvarchar(50)
)
as
begin
	insert into UTENTI
	values('U', 0, @email, @password)
end
GO
