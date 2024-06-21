PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

-- Tabla Empresa
CREATE TABLE empresa (
ID_Empresa text primary key not null);
INSERT INTO empresa VALUES('Emp-1001');
INSERT INTO empresa VALUES('Emp-1010');
INSERT INTO empresa VALUES('Emp-1100');

-- Tabla Evento
CREATE TABLE evento (
ID_Evento text primary key not null);
INSERT INTO evento VALUES('Ev-01');
INSERT INTO evento VALUES('Ev-02');
CREATE TABLE IF NOT EXISTS "instalacion" (
ID_Instalacion text primary key not null);
INSERT INTO instalacion VALUES('Ins-01');
INSERT INTO instalacion VALUES('Ins-02');
INSERT INTO instalacion VALUES('Ins-03');

-- Tabla Beca
CREATE TABLE beca (
ID_Beca text primary key not null);
INSERT INTO beca VALUES('B-10');
INSERT INTO beca VALUES('B-11');
INSERT INTO beca VALUES('B-12');

-- Tabla Nota
CREATE TABLE nota (
ID_Nota text primary key not null);
INSERT INTO nota VALUES('N-10');
INSERT INTO nota VALUES('N-11');
INSERT INTO nota VALUES('N-12');
INSERT INTO nota VALUES('N-13');
INSERT INTO nota VALUES('N-14');
INSERT INTO nota VALUES('N-15');
INSERT INTO nota VALUES('N-16');

-- Tabla Profesor
CREATE TABLE profesor (
ID_Profesor text primary key not null,
DNI text not null,
Nombre text not null,
Apellido text not null);
INSERT INTO profesor VALUES('Pro-101','53171412N','Jesús','López');
INSERT INTO profesor VALUES('Pro-102','76894471C','Michael','Jackson');
INSERT INTO profesor VALUES('Pro-103','50166883L','Isaias','Ferruel');
INSERT INTO profesor VALUES('Pro-104','81368079J','Jake','Fernández');
INSERT INTO profesor VALUES('Pro-105','42869342X','Mauricio','Willars');

-- Tabla Curso
CREATE TABLE curso (
ID_Curso integer primary key not null, ID_Programa integer references programa(ID_Programa));
INSERT INTO curso VALUES(1001,10001);
INSERT INTO curso VALUES(1002,10002);
INSERT INTO curso VALUES(1003,10001);

-- Tabla Programa
CREATE TABLE programa (
ID_Programa integer primary key not null);
INSERT INTO programa VALUES(10001);
INSERT INTO programa VALUES(10002);

-- Tabla Departamento
CREATE TABLE departamento (
ID_Departamento text not null primary key);
INSERT INTO departamento VALUES('Dep_01');
INSERT INTO departamento VALUES('Dep_02');
INSERT INTO departamento VALUES('Dep_03');

-- Tabla Empleado
CREATE TABLE empleado (
ID_Empleado text not null primary key);
INSERT INTO empleado VALUES('E-501');
INSERT INTO empleado VALUES('E-502');
INSERT INTO empleado VALUES('E-510');
INSERT INTO empleado VALUES('E-511');
INSERT INTO empleado VALUES('E-512');
INSERT INTO empleado VALUES('E-520');

-- Tabla Aula
CREATE TABLE aula (
ID_Aula text not null primary key);
INSERT INTO aula VALUES('A_101');
INSERT INTO aula VALUES('A_102');
INSERT INTO aula VALUES('A_103');

-- Tabla Libro
CREATE TABLE libro (
ID_Libro text not null primary key);
INSERT INTO libro VALUES('L-101');
INSERT INTO libro VALUES('L-102');
INSERT INTO libro VALUES('L-103');
INSERT INTO libro VALUES('L-104');
INSERT INTO libro VALUES('L-105');

-- Tabla Genero
CREATE TABLE genero (
ID_Genero text not null primary key);
INSERT INTO genero VALUES('G-1');
INSERT INTO genero VALUES('G-2');

-- Tabla Direccion
CREATE TABLE direccion (
ID_Direccion text not null primary key,
Calle text,
Numero text,
Codigo_postal integer,
Piso text,
Municipio text,
Provincia text);
INSERT INTO direccion VALUES('Dir-1','Casa Nieves','Nº2',38419,'Piso 1','Los Realejos','Sta. Cruz de Tenerife');
INSERT INTO direccion VALUES('Dir-2','El Mocan','Nº1',38420,'Piso 1','Los Realejos','Sta. Cruz de Tenerife');
INSERT INTO direccion VALUES('Dir-3','La Romera','Nº1',38420,'Piso 3','Los Realejos','Sta. Cruz de Tenerife');
INSERT INTO direccion VALUES('Dir-4','El Colegio','Nº3',38421,'Piso 1','Los Realejos','Sta. Cruz de Tenerife');
INSERT INTO direccion VALUES('Dir-5','El Drago','Nº2',38300,'Piso 2','La Orotava','Sta. Cruz de Tenerife');

-- Tabla Estudiante
CREATE TABLE estudiante (
DNI text not null primary key,
Nombre text,
Apellido text, ID_Programa integer references programa(ID_Programa), ID_Tutor text references tutor(ID_Tutor));
INSERT INTO estudiante VALUES('20524442R','Antonella','Marinella',10001,'T-10');
INSERT INTO estudiante VALUES('51380282F','Josua','Rodriguez',10001,'T-10');
INSERT INTO estudiante VALUES('62867698G','Miguel','Travesio',10002,'T-11');
INSERT INTO estudiante VALUES('91577214T','Armando','Casas',10002,'T-11');
INSERT INTO estudiante VALUES('98336942M','Alan','Brito',10001,'T-12');

-- Tabla Email
CREATE TABLE email (
ID_Email text not null primary key,
Email text, DNI text references estudiante(DNI));
INSERT INTO email VALUES('e-1','antonella123@hotmail.com','20524442R');
INSERT INTO email VALUES('e-2','anto_nella@gmail.com','20524442R');
INSERT INTO email VALUES('e-3','josua_rod@hotmail.com','51380282F');
INSERT INTO email VALUES('e-4','miguelito_traviesillo@yahoo.com','62867698G');
INSERT INTO email VALUES('e-5','miguel007@gmail.com','62867698G');
INSERT INTO email VALUES('e-6','armando_casas@gmail.com','91577214T');
INSERT INTO email VALUES('e-7','alan12345@gmail.com','98336942M');
INSERT INTO email VALUES('e-8','alan_brito05@hotmail.com','98336942M');

-- Tabla Matricula
CREATE TABLE matricula (
ID_Matricula integer primary key,
DNI text references estudiante(DNI),
ID_Curso integer references Curso(ID_Curso));
INSERT INTO matricula VALUES(101,'20524442R',1001);
INSERT INTO matricula VALUES(102,'51380282F',1001);
INSERT INTO matricula VALUES(103,'62867698G',1002);
INSERT INTO matricula VALUES(104,'91577214T',1002);
INSERT INTO matricula VALUES(105,'98336942M',1003);

-- Tabla Tutor
CREATE TABLE tutor (
ID_Profesor text references profesor(ID_Profesor),
ID_Tutor text primary key);
INSERT INTO tutor VALUES('Pro-101','T-10');
INSERT INTO tutor VALUES('Pro-102','T-11');
INSERT INTO tutor VALUES('Pro-103','T-12');

-- Tabla intermedia: evento-instalación
CREATE TABLE evento_instalacion (
ID_Evento text primary key references evento(ID_Evento),
ID_Instalacion text references instalacion(ID_Instalacion));
INSERT INTO evento_instalacion VALUES('Ev-01','Ins-01');
INSERT INTO evento_instalacion VALUES('Ev-02','Ins-01');

-- Tabla intermedia: empresa-evento
CREATE TABLE empresa_evento (
ID_Empresa text references empresa(ID_Empresa),
ID_Evento text references evento(ID_Evento),
primary key(ID_Empresa,ID_Evento));
INSERT INTO empresa_evento VALUES('Emp-1001','Ev-01');
INSERT INTO empresa_evento VALUES('Emp-1010','Ev-01');
INSERT INTO empresa_evento VALUES('Emp-1100','Ev-02');

-- Tabla intermedia: empresa-beca
CREATE TABLE empresa_beca (
ID_Empresa text references empresa(ID_Empresa),
ID_Beca text references beca(ID_Beca),
primary key(ID_Empresa,ID_Beca));
INSERT INTO empresa_beca VALUES('Emp-1001','B-10');
INSERT INTO empresa_beca VALUES('Emp-1010','B-11');
INSERT INTO empresa_beca VALUES('Emp-1100','B-12');

-- Tabla intermedia: estudiante-beca
CREATE TABLE estudiante_beca (
DNI text primary key references estudiante(DNI),
ID_Beca text references beca(ID_Beca));
INSERT INTO estudiante_beca VALUES('20524442R','B-10');
INSERT INTO estudiante_beca VALUES('62867698G','B-11');
INSERT INTO estudiante_beca VALUES('98336942M','B-12');

-- Tabla intermedia: libro-genero
CREATE TABLE libro_genero (
ID_Libro text references libro(ID_Libro),
ID_Genero text references genero(ID_Genero),
primary key(ID_Libro,ID_Genero));
INSERT INTO libro_genero VALUES('L-101','G-1');
INSERT INTO libro_genero VALUES('L-101','G-2');
INSERT INTO libro_genero VALUES('L-102','G-1');
INSERT INTO libro_genero VALUES('L-102','G-2');
INSERT INTO libro_genero VALUES('L-103','G-1');
INSERT INTO libro_genero VALUES('L-104','G-1');
INSERT INTO libro_genero VALUES('L-105','G-2');

-- Tabla intermedia: estudiante-libro
CREATE TABLE estudiante_libro (
DNI text references estudiante(DNI),
ID_Libro text references libro(ID_Libro),
primary key(DNI,ID_Libro));
INSERT INTO estudiante_libro VALUES('20524442R','L-101');
INSERT INTO estudiante_libro VALUES('51380282F','L-102');
INSERT INTO estudiante_libro VALUES('62867698G','L-103');
INSERT INTO estudiante_libro VALUES('91577214T','L-104');
INSERT INTO estudiante_libro VALUES('98336942M','L-105');

-- Tabla intermedia: programa-departamento
CREATE TABLE programa_departamento (
ID_Programa integer references programa(ID_Programa),
ID_Departamento text references departamento(ID_Departamento),
primary key(ID_Programa,ID_Departamento));
INSERT INTO programa_departamento VALUES(10001,'Dep_01');
INSERT INTO programa_departamento VALUES(10001,'Dep_03');
INSERT INTO programa_departamento VALUES(10002,'Dep_02');

-- Tabla intermedia: departamento-empleado
CREATE TABLE departamento_empleado (
ID_Departamento text references departamento(ID_Departamento),
ID_Empleado text references empleado(ID_Empleado),
primary key(ID_Departamento,ID_Empleado));
INSERT INTO departamento_empleado VALUES('Dep-01','E-501');
INSERT INTO departamento_empleado VALUES('Dep-01','E-502');
INSERT INTO departamento_empleado VALUES('Dep-02','E-510');
INSERT INTO departamento_empleado VALUES('Dep-02','E-511');
INSERT INTO departamento_empleado VALUES('Dep-02','E-512');
INSERT INTO departamento_empleado VALUES('Dep-03','E-520');

-- Tabla intermedia: curso-aula
CREATE TABLE curso_aula (
ID_Curso integer references curso(ID_Curso),
ID_Aula text references aula(ID_Aula),
primary key(ID_Curso,ID_Aula));
INSERT INTO curso_aula VALUES(1001,'A_101');
INSERT INTO curso_aula VALUES(1002,'A_102');
INSERT INTO curso_aula VALUES(1003,'A_103');

-- Tabla intermedia: asignatura-curso
CREATE TABLE asignatura_curso (
ID_Asignatura text references asignatura(ID_Asignatura),
ID_Curso integer references curso(ID_Curso),
primary key(ID_Asignatura,ID_Curso));
INSERT INTO asignatura_curso VALUES('Asi-101',1001);
INSERT INTO asignatura_curso VALUES('Asi-105',1001);
INSERT INTO asignatura_curso VALUES('Asi-110',1002);
INSERT INTO asignatura_curso VALUES('Asi-120',1003);

-- Tabla intermedia: estudiante-direccion
CREATE TABLE estudiante_direccion (
DNI text references estudiante(DNI),
ID_Direccion text references direccion(ID_Direccion),
primary key(DNI,ID_Direccion));
INSERT INTO estudiante_direccion VALUES('20524442R','Dir-1');
INSERT INTO estudiante_direccion VALUES('51380282F','Dir-2');
INSERT INTO estudiante_direccion VALUES('62867698G','Dir-3');
INSERT INTO estudiante_direccion VALUES('91577214T','Dir-4');
INSERT INTO estudiante_direccion VALUES('98336942M','Dir-5');

-- Tabla intermedia: curso-profesor
CREATE TABLE curso_profesor (
ID_Curso integer references curso(ID_Curso),
ID_Profesor text references profesor(ID_Profesor),
primary key(ID_Curso,ID_Profesor));
INSERT INTO curso_profesor VALUES(1001,'Pro-101');
INSERT INTO curso_profesor VALUES(1001,'Pro-103');
INSERT INTO curso_profesor VALUES(1002,'Pro-102');
INSERT INTO curso_profesor VALUES(1003,'Pro-104');
INSERT INTO curso_profesor VALUES(1003,'Pro-105');

-- Tabla Asignatura
CREATE TABLE asignatura (
ID_Asignatura text primary key);
INSERT INTO asignatura VALUES('Asi-101');
INSERT INTO asignatura VALUES('Asi-105');
INSERT INTO asignatura VALUES('Asi-110');
INSERT INTO asignatura VALUES('Asi-120');

-- Tabla intermedia: asignatura-requisito
CREATE TABLE asignatura_requisito (
ID_Asignatura text primary key references asignatura(ID_Asignatura),
ID_Requisito text);
INSERT INTO asignatura_requisito VALUES('Asi-101','Req-10');
INSERT INTO asignatura_requisito VALUES('Asi-105','Req-11');
INSERT INTO asignatura_requisito VALUES('Asi-110','Req-12');
INSERT INTO asignatura_requisito VALUES('Asi-120','Req-13');

-- Tabla intermedia: estudiante-asignatura-nota
CREATE TABLE estudiante_asignatura_nota (
DNI text references estudiante(DNI),
ID_Asignatura text references asignatura(ID_Asignatura),
ID_Nota text references nota(ID_Nota),
primary key (DNI,ID_Asignatura,ID_Nota));
INSERT INTO estudiante_asignatura_nota VALUES('20524442R','Asi-101','N-10');
INSERT INTO estudiante_asignatura_nota VALUES('20524442R','Asi-105','N-15');
INSERT INTO estudiante_asignatura_nota VALUES('51380282F','Asi-101','N-11');
INSERT INTO estudiante_asignatura_nota VALUES('51380282F','Asi-105','N-16');
INSERT INTO estudiante_asignatura_nota VALUES('62867698G','Asi-110','N-12');
INSERT INTO estudiante_asignatura_nota VALUES('91577214T','Asi-110','N-13');
INSERT INTO estudiante_asignatura_nota VALUES('98336942M','Asi-120','N-14');

COMMIT;
