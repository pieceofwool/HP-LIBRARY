USE [master]
GO
/****** Object:  Database [LIBRARY]    Script Date: 13/09/2022 18:58:20 ******/
CREATE DATABASE [LIBRARY]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LIBRARY', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LIBRARY.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LIBRARY_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LIBRARY_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LIBRARY] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LIBRARY].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LIBRARY] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LIBRARY] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LIBRARY] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LIBRARY] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LIBRARY] SET ARITHABORT OFF 
GO
ALTER DATABASE [LIBRARY] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LIBRARY] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LIBRARY] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LIBRARY] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LIBRARY] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LIBRARY] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LIBRARY] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LIBRARY] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LIBRARY] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LIBRARY] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LIBRARY] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LIBRARY] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LIBRARY] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LIBRARY] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LIBRARY] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LIBRARY] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LIBRARY] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LIBRARY] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LIBRARY] SET  MULTI_USER 
GO
ALTER DATABASE [LIBRARY] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LIBRARY] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LIBRARY] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LIBRARY] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LIBRARY] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LIBRARY] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LIBRARY] SET QUERY_STORE = OFF
GO
USE [LIBRARY]
GO
/****** Object:  Table [dbo].[LIBRI]    Script Date: 13/09/2022 18:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIBRI](
	[codLibro] [int] IDENTITY(1,1) NOT NULL,
	[codUtente] [int] NULL,
	[titolo] [nvarchar](50) NULL,
	[autore] [nvarchar](50) NULL,
	[genere] [nvarchar](50) NULL,
	[copertina] [varbinary](max) NULL,
	[sinossi] [text] NULL,
	[dataPrestito] [date] NULL,
 CONSTRAINT [PK_LIBRI] PRIMARY KEY CLUSTERED 
(
	[codLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UTENTI]    Script Date: 13/09/2022 18:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UTENTI](
	[codUtente] [int] IDENTITY(1,1) NOT NULL,
	[tipoUtente] [char](1) NULL,
	[abilitato] [bit] NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK_UTENTI] PRIMARY KEY CLUSTERED 
(
	[codUtente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[LIBRI_DELETE]    Script Date: 13/09/2022 18:58:20 ******/
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
/****** Object:  StoredProcedure [dbo].[LIBRI_INSERT]    Script Date: 13/09/2022 18:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[LIBRI_INSERT]
(
	@titolo nvarchar(50),
	@autore nvarchar(50),
	@genere nvarchar(50),
	@copertina varbinary(MAX),
	@sinossi text
)
AS
BEGIN
	INSERT INTO LIBRI(TITOLO, AUTORE, GENERE, COPERTINA, SINOSSI)
	VALUES(
		@titolo,
		@autore,
		@genere,
		@copertina,
		@sinossi
	)
END
GO
/****** Object:  StoredProcedure [dbo].[LIBRI_NOLEGGIA]    Script Date: 13/09/2022 18:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[LIBRI_NOLEGGIA]
(
	@codLibro int,
	@codUtente int
)
AS
BEGIN
	update LIBRI
	set
		codUtente=@codUtente,
		dataPrestito=GETDATE()
	where codLibro=@codLibro
END
GO
/****** Object:  StoredProcedure [dbo].[LIBRI_RESTITUISCI]    Script Date: 13/09/2022 18:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[LIBRI_RESTITUISCI]
(
	@codLibro int
)
AS
BEGIN
	update LIBRI
	set
		codUtente=NULL,
		dataPrestito=NULL
	where codLibro=@codLibro
END
GO
/****** Object:  StoredProcedure [dbo].[LIBRI_RICERCA_GENERE]    Script Date: 13/09/2022 18:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LIBRI_RICERCA_GENERE]
(
@ricerca nvarchar(50)
)
AS
BEGIN
 SELECT * from LIBRI where genere like '%'+@ricerca+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[LIBRI_SELECTALL]    Script Date: 13/09/2022 18:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[LIBRI_SELECTALL]
AS
BEGIN
	SELECT codlibro, codutente, titolo, autore, genere, copertina, sinossi, cast(dataprestito as nvarchar(10))as dataprestito FROM LIBRI
END
GO
/****** Object:  StoredProcedure [dbo].[LIBRI_SELECTBYUTENTE]    Script Date: 13/09/2022 18:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[LIBRI_SELECTBYUTENTE]
(
	@codUtente int
)
AS
BEGIN
	select codlibro, codutente, titolo, autore, genere, copertina, sinossi, cast(dataprestito as nvarchar(10))as dataprestito
	from LIBRI
	where codUtente=@codUtente
END
GO
/****** Object:  StoredProcedure [dbo].[LIBRI_SELECTDISPONIBILI]    Script Date: 13/09/2022 18:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[LIBRI_SELECTDISPONIBILI]
AS
BEGIN
	SELECT *
	FROM LIBRI
	WHERE codUtente IS NULL
END
GO
/****** Object:  StoredProcedure [dbo].[LIBRI_SELECTONE]    Script Date: 13/09/2022 18:58:20 ******/
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
/****** Object:  StoredProcedure [dbo].[LIBRI_UPDATE]    Script Date: 13/09/2022 18:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[LIBRI_UPDATE]
(
	@codLibro int,
	@titolo nvarchar(50),
	@autore nvarchar(50),
	@genere nvarchar(50),
	@copertina varbinary(MAX),
	@sinossi text
)
AS
BEGIN
	UPDATE LIBRI
	SET
		titolo=@titolo,
		autore=@autore,
		genere=@genere,
		copertina=@copertina,
		sinossi=@sinossi
	WHERE codLibro=@codLibro
END
GO
/****** Object:  StoredProcedure [dbo].[UTENTI_GETCODUTENTE]    Script Date: 13/09/2022 18:58:20 ******/
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
/****** Object:  StoredProcedure [dbo].[UTENTI_INSERT]    Script Date: 13/09/2022 18:58:20 ******/
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
/****** Object:  StoredProcedure [dbo].[UTENTI_LOGIN]    Script Date: 13/09/2022 18:58:20 ******/
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
/****** Object:  StoredProcedure [dbo].[UTENTI_REGISTRATO]    Script Date: 13/09/2022 18:58:20 ******/
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
/****** Object:  StoredProcedure [dbo].[UTENTI_SELECTABILITATI]    Script Date: 13/09/2022 18:58:20 ******/
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
/****** Object:  StoredProcedure [dbo].[UTENTI_SELECTALL]    Script Date: 13/09/2022 18:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UTENTI_SELECTALL]
as
begin
	select * from UTENTI
end
GO
/****** Object:  StoredProcedure [dbo].[UTENTI_SELECTONE]    Script Date: 13/09/2022 18:58:20 ******/
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
/****** Object:  StoredProcedure [dbo].[UTENTI_UPDATE]    Script Date: 13/09/2022 18:58:20 ******/
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
/****** Object:  StoredProcedure [dbo].[UTENTI_UPDATEPWD]    Script Date: 13/09/2022 18:58:20 ******/
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
USE [master]
GO
ALTER DATABASE [LIBRARY] SET  READ_WRITE 
GO
