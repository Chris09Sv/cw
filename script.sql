USE [master]
GO
/****** Object:  Database [CongregacionBani]    Script Date: 12/9/2018 11:15:08 PM ******/
CREATE DATABASE [CongregacionBani]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CongregacionBani', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CongregacionBani.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CongregacionBani_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CongregacionBani_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CongregacionBani] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CongregacionBani].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CongregacionBani] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CongregacionBani] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CongregacionBani] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CongregacionBani] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CongregacionBani] SET ARITHABORT OFF 
GO
ALTER DATABASE [CongregacionBani] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CongregacionBani] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CongregacionBani] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CongregacionBani] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CongregacionBani] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CongregacionBani] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CongregacionBani] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CongregacionBani] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CongregacionBani] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CongregacionBani] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CongregacionBani] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CongregacionBani] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CongregacionBani] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CongregacionBani] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CongregacionBani] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CongregacionBani] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CongregacionBani] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CongregacionBani] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CongregacionBani] SET  MULTI_USER 
GO
ALTER DATABASE [CongregacionBani] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CongregacionBani] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CongregacionBani] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CongregacionBani] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CongregacionBani] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CongregacionBani]
GO
/****** Object:  Table [dbo].[Asignacion]    Script Date: 12/9/2018 11:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPersona] [int] NULL,
	[IdAsignacion] [int] NOT NULL,
	[IdPunto] [int] NULL,
	[IdAyudante] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_Asignaciones]    Script Date: 12/9/2018 11:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_Asignaciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Categoria] [int] NOT NULL,
	[Clase] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 12/9/2018 11:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Persona](
	[IdPersona] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NULL,
	[IdMiembro] [int] NOT NULL,
	[Direccion] [varchar](50) NULL,
	[Fecha] [date] NULL,
 CONSTRAINT [PK__Persona__2EC8D2ACAFC6CD5D] PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Punto_Oratoria]    Script Date: 12/9/2018 11:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Punto_Oratoria](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_Punto_Oratoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tipo_Asignacion]    Script Date: 12/9/2018 11:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tipo_Asignacion](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[IdMiembro] [int] NULL,
 CONSTRAINT [PK_Tipo_Asignacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TMiembro]    Script Date: 12/9/2018 11:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TMiembro](
	[IdMiembro] [int] NOT NULL,
	[Miembro] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMiembro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD  CONSTRAINT [FK_Asignacion_M_Asignaciones] FOREIGN KEY([IdAsignacion])
REFERENCES [dbo].[M_Asignaciones] ([id])
GO
ALTER TABLE [dbo].[Asignacion] CHECK CONSTRAINT [FK_Asignacion_M_Asignaciones]
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD  CONSTRAINT [FK_Asignacion_Persona] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([IdPersona])
GO
ALTER TABLE [dbo].[Asignacion] CHECK CONSTRAINT [FK_Asignacion_Persona]
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD  CONSTRAINT [FK_Asignacion_Persona1] FOREIGN KEY([IdAyudante])
REFERENCES [dbo].[Persona] ([IdPersona])
GO
ALTER TABLE [dbo].[Asignacion] CHECK CONSTRAINT [FK_Asignacion_Persona1]
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD  CONSTRAINT [FK_Asignacion_Punto_Oratoria] FOREIGN KEY([IdPunto])
REFERENCES [dbo].[Punto_Oratoria] ([Id])
GO
ALTER TABLE [dbo].[Asignacion] CHECK CONSTRAINT [FK_Asignacion_Punto_Oratoria]
GO
ALTER TABLE [dbo].[M_Asignaciones]  WITH CHECK ADD  CONSTRAINT [FK_M_Asignaciones_Tipo_Asignacion] FOREIGN KEY([Categoria])
REFERENCES [dbo].[Tipo_Asignacion] ([Id])
GO
ALTER TABLE [dbo].[M_Asignaciones] CHECK CONSTRAINT [FK_M_Asignaciones_Tipo_Asignacion]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [FK_Persona_TMiembro] FOREIGN KEY([IdMiembro])
REFERENCES [dbo].[TMiembro] ([IdMiembro])
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [FK_Persona_TMiembro]
GO
ALTER TABLE [dbo].[Tipo_Asignacion]  WITH CHECK ADD  CONSTRAINT [FK_Tipo_Asignacion_TMiembro1] FOREIGN KEY([IdMiembro])
REFERENCES [dbo].[TMiembro] ([IdMiembro])
GO
ALTER TABLE [dbo].[Tipo_Asignacion] CHECK CONSTRAINT [FK_Tipo_Asignacion_TMiembro1]
GO
/****** Object:  StoredProcedure [dbo].[ASIGNACIONES_LOAD]    Script Date: 12/9/2018 11:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ASIGNACIONES_LOAD]
  @mes int, @dia int as
SELECT P.Nombre+' '+P.Apellido AS NOMBRE,Y.Nombre AS Ayudante,Tipo,TA.Nombre AS CATEGORIA,M.Fecha FROM Asignacion A 
INNER JOIN  Persona P ON A.IdPersona=P.IdPersona
INNER JOIN M_Asignaciones M ON M.id=A.IdAsignacion
INNER JOIN Punto_Oratoria O ON O.Id=A.IdPunto
INNER JOIN Persona Y ON Y.IdPersona=A.IdAyudante
INNER JOIN Tipo_Asignacion TA ON M.Categoria=TA.Id
 
 
 where MONTH(m.Fecha)=@mes and day(m.Fecha)=@dia;




GO
/****** Object:  StoredProcedure [dbo].[AsignacionesMes]    Script Date: 12/9/2018 11:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[AsignacionesMes]
  @mes int, @IdMiembro int 
  as 
  /* lectura*/
  if(@IdMiembro=1 or @IdMiembro =4)
  select p.Nombre,p.Apellido,m.Clase,m.Tipo,p2.Nombre as Ayudante,o.Nombre as Oratoria from Persona  p
   
   inner join asignacion a on p.IdPersona=a.IdPersona
   
   inner join M_Asignaciones m on a.IdAsignacion=m.id
   
   inner join Punto_Oratoria o on a.IdPunto=o.Id
   
   inner join Persona p2 on p2.IdPersona=a.IdAyudante

  where MONTH(m.Fecha)=@mes and m.Categoria=1

   else   if(@IdMiembro>=2 and @IdMiembro <=6)
     select p.Nombre,p.Apellido,m.Clase,m.Tipo,p2.Nombre as Ayudante,o.Nombre as Oratoria from Persona  p
   
   inner join asignacion a on p.IdPersona=a.IdPersona
   
   inner join M_Asignaciones m on a.IdAsignacion=m.id
   
   inner join Punto_Oratoria o on a.IdPunto=o.Id
   
   inner join Persona p2 on p2.IdPersona=a.IdAyudante

   where MONTH(m.Fecha)=@mes and m.Categoria>=2 and m.Categoria<=6

   else 
   if(@IdMiembro>=5 and @IdMiembro <=6)
     select p.Nombre,p.Apellido,m.Clase,m.Tipo,p2.Nombre as Ayudante,o.Nombre as Oratoria from Persona  p
   
   inner join asignacion a on p.IdPersona=a.IdPersona
   
   inner join M_Asignaciones m on a.IdAsignacion=m.id
   
   inner join Punto_Oratoria o on a.IdPunto=o.Id
   
   inner join Persona p2 on p2.IdPersona=a.IdAyudante

   where MONTH(m.Fecha)=@mes and m.Categoria>=7 and m.Categoria<=10

   if(@IdMiembro=6)
     select p.Nombre,p.Apellido,m.Clase,m.Tipo,p2.Nombre as Ayudante,o.Nombre as Oratoria from Persona  p
   
   inner join asignacion a on p.IdPersona=a.IdPersona
   
   inner join M_Asignaciones m on a.IdAsignacion=m.id
   
   inner join Punto_Oratoria o on a.IdPunto=o.Id
   
   inner join Persona p2 on p2.IdPersona=a.IdAyudante

   where MONTH(m.Fecha)=@mes and m.Categoria>=7 and m.Categoria<=11



   ELSE  if(@IdMiembro=0)
  select p.Nombre,p.Apellido,m.Clase,m.Tipo,p2.Nombre as Ayudante,o.Nombre as Oratoria from Persona  p
   
   inner join asignacion a on p.IdPersona=a.IdPersona
   
   inner join M_Asignaciones m on a.IdAsignacion=m.id
   
   inner join Punto_Oratoria o on a.IdPunto=o.Id
   
   inner join Persona p2 on p2.IdPersona=a.IdAyudante

  where MONTH(m.Fecha)=@mes 

  
   
   else
        select p.Nombre,p.Apellido,m.Clase,m.Tipo,p2.Nombre as Ayudante,o.Nombre as Oratoria from Persona  p
   
   inner join asignacion a on p.IdPersona=a.IdPersona
   
   inner join M_Asignaciones m on a.IdAsignacion=m.id
   
   inner join Punto_Oratoria o on a.IdPunto=o.Id
   
   inner join Persona p2 on p2.IdPersona=a.IdAyudante

   where MONTH(m.Fecha)=@mes



GO
/****** Object:  StoredProcedure [dbo].[CargarAsignaciones_All]    Script Date: 12/9/2018 11:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[CargarAsignaciones_All]
@mes int ,@dia int
as
select  M_Asignaciones.id, Tipo as Nombre,(select Nombre from Tipo_Asignacion t where t.Id=Categoria ) as Asignacion,Categoria ,Fecha from M_Asignaciones

 where MONTH(fecha)=@mes and day(Fecha)=@dia;

GO
/****** Object:  StoredProcedure [dbo].[CargarOratoria_All]    Script Date: 12/9/2018 11:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[CargarOratoria_All]
as 
select Id, Nombre from Punto_Oratoria

GO
/****** Object:  StoredProcedure [dbo].[ST_CargarMiembros]    Script Date: 12/9/2018 11:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ST_CargarMiembros]
@asig int
as


if(@asig=1)
select P.IdPersona, Nombre+' '+Apellido as Nombre, t.Miembro,p.Fecha,T.IdMiembro from Persona p
inner join TMiembro t on t.IdMiembro=p.IdMiembro
 
 where t.IdMiembro=1 or t.IdMiembro=4
order by Fecha ;

/*lectura*/
if(@asig=0)
select P.IdPersona, Nombre+' '+Apellido as Nombre, t.Miembro,p.Fecha,T.IdMiembro  from Persona p
inner join TMiembro t on t.IdMiembro=p.IdMiembro
 
order by Fecha,t.Miembro,Nombre;

/*lectura*/
else if(@asig=1)
select P.IdPersona, Nombre+' '+Apellido as Nombre, t.Miembro,p.Fecha,T.IdMiembro  from Persona p
inner join TMiembro t on t.IdMiembro=p.IdMiembro
 
 where t.IdMiembro=1 or t.IdMiembro=4
order by Fecha ;

/*lectura*/
if(@asig=7)
select P.IdPersona, Nombre+' '+Apellido as Nombre, t.Miembro,p.Fecha,T.IdMiembro  from Persona p
inner join TMiembro t on t.IdMiembro=p.IdMiembro
 
 where t.IdMiembro>=4 and t.IdMiembro<=6
order by Fecha desc;

/*Asignaciones para hermanas y hermanos*/
else if(@asig>=2 and @asig<=6 )
select P.IdPersona, Nombre+' '+Apellido as Nombre, t.Miembro,p.Fecha,T.IdMiembro  from Persona p
inner join TMiembro t on t.IdMiembro=p.IdMiembro
 
 where t.IdMiembro>=2 and t.IdMiembro<4
order by Fecha,P.Nombre desc


/*asignaciones para ministeriales y ancianos*/
else if(@asig>=7 and @asig<=10)
select P.IdPersona, Nombre+' '+Apellido as Nombre, t.Miembro,p.Fecha,T.IdMiembro  from Persona p
inner join TMiembro t on t.IdMiembro=p.IdMiembro
 
 where t.IdMiembro=5 or t.IdMiembro=6
order by Fecha,P.Nombre desc

else if(@asig=11 )
select P.IdPersona, Nombre+' '+Apellido as Nombre, t.Miembro,p.Fecha,T.IdMiembro  from Persona p
inner join TMiembro t on t.IdMiembro=p.IdMiembro
 
 where t.IdMiembro=6 
order by Fecha desc



GO
/****** Object:  StoredProcedure [dbo].[ST_InsertarAsignacion]    Script Date: 12/9/2018 11:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ST_InsertarAsignacion]

@Name int,@Id_Asignacion int,@Oratoria int,@Ayudante int

as
insert into Asignacion (IdPersona,IdAsignacion,IdPunto,IdAyudante) values (@Name,@Id_Asignacion,@Oratoria,@Ayudante)

update Persona set Fecha=(select Fecha from M_Asignaciones where id=@Id_Asignacion) where IdPersona=@name

GO
/****** Object:  StoredProcedure [dbo].[ST_InsertarMiembro1]    Script Date: 12/9/2018 11:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[ST_InsertarMiembro1]

(
@Miembro varchar(50), @Name varchar(50),@Apellido varchar(50),@Direccion varchar(50),@Fecha date
)as 
insert into Persona(Nombre,Apellido,IdMiembro,Direccion,Fecha) values (@Name,@Apellido,(select m.IdMiembro as id from TMiembro m where Miembro=@Miembro),@Direccion,@Fecha)



GO
/****** Object:  StoredProcedure [dbo].[usp_CargarAsignaciones]    Script Date: 12/9/2018 11:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    CREATE procedure [dbo].[usp_CargarAsignaciones]
   
   @Tipo varchar(50),@Fecha date,@Cat varchar(50),@clase varchar(50)

  as 
 
  
insert into M_Asignaciones( Tipo, Fecha, Categoria, Clase) values(@Tipo,@Fecha,(select Id as b from Tipo_Asignacion where Nombre=@Cat ), @clase)
GO
USE [master]
GO
ALTER DATABASE [CongregacionBani] SET  READ_WRITE 
GO
