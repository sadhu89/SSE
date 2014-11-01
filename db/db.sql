

CREATE SCHEMA "SSE";

CREATE SEQUENCE "SSE"."ADMINISTRADOR$IDENTITY_SEQUENCE";
CREATE SEQUENCE "SSE"."ALUMNO$IDENTITY_SEQUENCE";
CREATE SEQUENCE "SSE"."EMPRESA$IDENTITY_SEQUENCE";
CREATE SEQUENCE "SSE"."ENCUESTA$IDENTITY_SEQUENCE";
CREATE SEQUENCE "SSE"."ESTUDIO$IDENTITY_SEQUENCE";
CREATE SEQUENCE "SSE"."EVENTO$IDENTITY_SEQUENCE";
CREATE SEQUENCE "SSE"."INSTITUCION$IDENTITY_SEQUENCE";
CREATE SEQUENCE "SSE"."NOTICIA$IDENTITY_SEQUENCE";
CREATE SEQUENCE "SSE"."OFERTA$IDENTITY_SEQUENCE";
CREATE SEQUENCE "SSE"."POSTULACION$IDENTITY_SEQUENCE";
CREATE SEQUENCE "SSE"."PREGUNTA$IDENTITY_SEQUENCE";
CREATE SEQUENCE "SSE"."RESPUESTA$IDENTITY_SEQUENCE";
CREATE SEQUENCE "SSE"."TRABAJO$IDENTITY_SEQUENCE";
CREATE SEQUENCE "SSE"."USUARIO$IDENTITY_SEQUENCE";


CREATE TABLE IF NOT EXISTS "SSE"."ADMINISTRADOR" (

	"IDADMINISTRADOR" integer generated always as identity NOT NULL,
	"NOMBRE" varchar(50) NOT NULL,
	"TELEFONO" varchar(9) NOT NULL,
	"IDEVENTO" integer DEFAULT ( not null),
	"IDNOTICIA" integer DEFAULT ( not null),
	"IDENCUESTA" integer DEFAULT ( not null)
	,PRIMARY KEY(IDADMINISTRADOR)
);


CREATE TABLE IF NOT EXISTS "SSE"."ALUMNO" (

	"IDALUMNO" integer generated always as identity NOT NULL,
	"NOMBRES" varchar(50) NOT NULL,
	"APELLIDOS" varchar(50) NOT NULL,
	"DIRECCION" varchar(100) NOT NULL,
	"ANIOPROMOCION" varchar(4) NOT NULL,
	"CVURL" varchar(50) NOT NULL,
	"DNI" varchar(8) NOT NULL,
	"ESPECIALIDAD" varchar(50) NOT NULL,
	"FACULTAD" varchar(50) NOT NULL,
	"FECHANACIMIENTO" date NOT NULL,
	"FOTOURL" varchar(50) NOT NULL,
	"GENERO" varchar(10) NOT NULL,
	"NACIONALIDAD" varchar(20) NOT NULL,
	"IDTRABAJO" integer NOT NULL,
	"IDESTUDIO" integer NOT NULL,
	"IDRESPUESTA" integer NOT NULL,
	"IDPOSTULACION" integer NOT NULL
	,PRIMARY KEY(IDALUMNO)
);


CREATE TABLE IF NOT EXISTS "SSE"."EMPRESA" (

	"IDEMPRESA" integer generated always as identity NOT NULL,
	"NOMBRE" varchar(100) NOT NULL,
	"DEPARTAMENTO" varchar(100) NOT NULL,
	"DESCRIPCION" varchar(100) NOT NULL,
	"LOGOURL" varchar(100) NOT NULL,
	"PAIS" varchar(50) NOT NULL,
	"DISTRITO" varchar(50) NOT NULL,
	"REGISTRADO" boolean NOT NULL,
	"REPRESENTANTE" varchar(50) NOT NULL,
	"TELEFONO" varchar(9) NOT NULL,
	"DIRECCION" varchar(100) NOT NULL,
	"RUC" varchar(11) NOT NULL,
	"RUBRO" varchar(50) NOT NULL,
	"IDOFERTA" integer NOT NULL,
	"IDUSUARIO" integer NOT NULL
	,PRIMARY KEY(IDEMPRESA)
);


CREATE TABLE IF NOT EXISTS "SSE"."ENCUESTA" (

	"IDENCUESTA" integer generated always as identity NOT NULL,
	"DESCRIPCION" varchar(100) NOT NULL,
	"FECHA" date NOT NULL,
	"TITULO" varchar(100) NOT NULL,
	"IDPREGUNTA" integer NOT NULL
	,PRIMARY KEY(IDENCUESTA)
);


CREATE TABLE IF NOT EXISTS "SSE"."ESTUDIO" (

	"IDESTUDIO" integer generated always as identity NOT NULL,
	"ACTUAL" boolean NOT NULL,
	"FECHAINICIO" date NOT NULL,
	"FECHAFIN" date NOT NULL,
	"GRADO" varchar(50) NOT NULL,
	"NIVEL" varchar(100) NOT NULL,
	"IDINSTITUCION" integer NOT NULL
	,PRIMARY KEY(IDESTUDIO)
);


CREATE TABLE IF NOT EXISTS "SSE"."EVENTO" (

	"IDEVENTO" integer generated always as identity NOT NULL,
	"TITULO" varchar(150) NOT NULL,
	"DESCRIPCION" varchar(200) NOT NULL,
	"FECHA" date NOT NULL,
	"TIPO" varchar(100) NOT NULL
	,PRIMARY KEY(IDEVENTO)
);


CREATE TABLE IF NOT EXISTS "SSE"."INSTITUCION" (

	"IDINSTITUCION" integer generated always as identity NOT NULL,
	"NOMBRE" varchar(100) NOT NULL
	,PRIMARY KEY(IDINSTITUCION)
);


CREATE TABLE IF NOT EXISTS "SSE"."NOTICIA" (

	"IDNOTICIA" integer generated always as identity NOT NULL,
	"TITULO" varchar(150) NOT NULL,
	"DESCRIPCION" varchar(200) NOT NULL,
	"TIPO" varchar(100) NOT NULL,
	"FECHA" date NOT NULL
	,PRIMARY KEY(IDNOTICIA)
);


CREATE TABLE IF NOT EXISTS "SSE"."OFERTA" (

	"IDOFERTA" integer generated always as identity NOT NULL,
	"TITULO" varchar(100) NOT NULL,
	"DESCRIPCION" varchar(100) NOT NULL,
	"FECHA" date NOT NULL,
	"IDPOSTULACION" integer NOT NULL
	,PRIMARY KEY(IDOFERTA)
);


CREATE TABLE IF NOT EXISTS "SSE"."POSTULACION" (

	"IDPOSTULACION" integer generated always as identity NOT NULL,
	"ESTADO" boolean NOT NULL
	,PRIMARY KEY(IDPOSTULACION)
);


CREATE TABLE IF NOT EXISTS "SSE"."PREGUNTA" (

	"IDPREGUNTA" integer generated always as identity NOT NULL,
	"DESCRIPCION" varchar(200) NOT NULL,
	"IDRESPUESTA" integer NOT NULL
	,PRIMARY KEY(IDPREGUNTA)
);


CREATE TABLE IF NOT EXISTS "SSE"."RESPUESTA" (

	"DESCRIPCION" varchar(200) NOT NULL,
	"IDRESPUESTA" integer generated always as identity NOT NULL
	,PRIMARY KEY(IDRESPUESTA)
);


CREATE TABLE IF NOT EXISTS "SSE"."SCHEMABOOTSTRAP" (

	"ID" integer
);


CREATE TABLE IF NOT EXISTS "SSE"."TRABAJO" (

	"IDTRABAJO" integer generated always as identity NOT NULL,
	"ACTUAL" boolean NOT NULL,
	"AREA" varchar(100) NOT NULL,
	"DETALLE" varchar(100) NOT NULL,
	"POSICION" varchar(100) NOT NULL,
	"FECHAINICIO" date NOT NULL,
	"FECHAFIN" date NOT NULL,
	"IDEMPRESA" integer NOT NULL
	,PRIMARY KEY(IDTRABAJO)
);


CREATE TABLE IF NOT EXISTS "SSE"."USUARIO" (

	"IDUSUARIO" integer generated always as identity NOT NULL,
	"CORREO" varchar(50) NOT NULL,
	"HABILITADO" boolean NOT NULL,
	"PASSWORD" varchar(100) NOT NULL,
	"USERNAME" string NOT NULL
	,PRIMARY KEY(IDUSUARIO)
);


ALTER TABLE "SSE"."ADMINISTRADOR" ADD FOREIGN KEY (IDNOTICIA) REFERENCES "SSE"."ENCUESTA"(IDENCUESTA);
ALTER TABLE "SSE"."ADMINISTRADOR" ADD FOREIGN KEY (IDEVENTO) REFERENCES "SSE"."EVENTO"(IDEVENTO);
ALTER TABLE "SSE"."ADMINISTRADOR" ADD FOREIGN KEY (IDNOTICIA) REFERENCES "SSE"."NOTICIA"(IDNOTICIA);
ALTER TABLE "SSE"."ALUMNO" ADD FOREIGN KEY (IDESTUDIO) REFERENCES "SSE"."ESTUDIO"(IDESTUDIO);
ALTER TABLE "SSE"."ALUMNO" ADD FOREIGN KEY (IDPOSTULACION) REFERENCES "SSE"."POSTULACION"(IDPOSTULACION);
ALTER TABLE "SSE"."ALUMNO" ADD FOREIGN KEY (IDRESPUESTA) REFERENCES "SSE"."RESPUESTA"(IDRESPUESTA);
ALTER TABLE "SSE"."ALUMNO" ADD FOREIGN KEY (IDTRABAJO) REFERENCES "SSE"."TRABAJO"(IDTRABAJO);
ALTER TABLE "SSE"."EMPRESA" ADD FOREIGN KEY (IDOFERTA) REFERENCES "SSE"."OFERTA"(IDOFERTA);
ALTER TABLE "SSE"."EMPRESA" ADD FOREIGN KEY (IDUSUARIO) REFERENCES "SSE"."USUARIO"(IDUSUARIO);
ALTER TABLE "SSE"."ENCUESTA" ADD FOREIGN KEY (IDPREGUNTA) REFERENCES "SSE"."PREGUNTA"(IDPREGUNTA);
ALTER TABLE "SSE"."ESTUDIO" ADD FOREIGN KEY (IDINSTITUCION) REFERENCES "SSE"."INSTITUCION"(IDINSTITUCION);
ALTER TABLE "SSE"."OFERTA" ADD FOREIGN KEY (IDPOSTULACION) REFERENCES "SSE"."POSTULACION"(IDPOSTULACION);
ALTER TABLE "SSE"."PREGUNTA" ADD FOREIGN KEY (IDRESPUESTA) REFERENCES "SSE"."RESPUESTA"(IDRESPUESTA);
ALTER TABLE "SSE"."TRABAJO" ADD FOREIGN KEY (IDEMPRESA) REFERENCES "SSE"."EMPRESA"(IDEMPRESA);




