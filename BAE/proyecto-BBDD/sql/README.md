<div align="justify">

# Estructura de la base de datos

Para nuestra estructura de la base de datos, y por motivos de presentación de este trabajo, se mostrará la sintaxis utilizada al crear las tablas más importantes en sqlite3. Si desea ver toda la base de datos resultante, puede ingresar en [este fichero](./universidad.sql).

### Tabla Estudiante

La tabla de la entidad **Estudiante**, previamente normalizada, fue creada en sqlite de la siguiente forma:

```sql
CREATE TABLE estudiante (
DNI text not null primary key,
Nombre text,
Apellido text, 
ID_Programa integer references programa(ID_Programa), 
ID_Tutor text references tutor(ID_Tutor));
```

Y la inserción de los datos correspondientes:

```sql
INSERT INTO estudiante VALUES('20524442R','Antonella','Marinella',10001,'T-10');
INSERT INTO estudiante VALUES('51380282F','Josua','Rodriguez',10001,'T-10');
INSERT INTO estudiante VALUES('62867698G','Miguel','Travesio',10002,'T-11');
INSERT INTO estudiante VALUES('91577214T','Armando','Casas',10002,'T-11');
INSERT INTO estudiante VALUES('98336942M','Alan','Brito',10001,'T-12');
```

Esto daría como resultado una tabla como esta:

<div align="center">

|DNI|Nombre|Apellido|ID_Programa|ID_Tutor|
|---|------|--------|-----------|--------|
|20524442R|Antonella|Marinella|10001|T-10|
|51380282F|Josua|Rodriguez|10001|T-10|
|62867698G|Miguel|Travesio|10002|T-11|
|91577214T|Armando|Casas|10002|T-11|
|98336942M|Alan|Brito|10001|T-12|

</div>

### Tabla Profesor

Otras de las tablas destacadas en nuestra base de datos es la de la entidad **Profesor**, creada de la siguiente forma:

```sql
CREATE TABLE profesor (
ID_Profesor text primary key not null,
DNI text not null,
Nombre text not null,
Apellido text not null);
```

Y la inserción de sus datos:

```sql
INSERT INTO profesor VALUES('Pro-101','53171412N','Jesús','López');
INSERT INTO profesor VALUES('Pro-102','76894471C','Michael','Jackson');
INSERT INTO profesor VALUES('Pro-103','50166883L','Isaias','Ferruel');
INSERT INTO profesor VALUES('Pro-104','81368079J','Jake','Fernández');
INSERT INTO profesor VALUES('Pro-105','42869342X','Mauricio','Willars');
```

Dando como resultado la siguiente tabla:

<div align="center">

|ID_Profesor|DNI|Nombre|Apellido|
|-----------|---|------|--------|
|Pro-101|53171412N|Jesús|López|
|Pro-102|76894471C|Michael|Jackson|
|Pro-103|50166883L|Isaias|Ferruel|
|Pro-104|81368079J|Jake|Fernández|
|Pro-105|42869342X|Mauricio|Willars|

</div>

### Tabla Matricula

Por último, una de las tablas a destacar es la de **Matricula**, pues es una tabla intermedia que posee dos *foreign keys* en su estructura, aparte de su *primary key*:

```sql
CREATE TABLE matricula (
ID_Matricula integer primary key,
DNI text references estudiante(DNI),
ID_Curso integer references Curso(ID_Curso));
```

La inserción de sus datos correspondientes:

```sql
INSERT INTO matricula VALUES(101,'20524442R',1001);
INSERT INTO matricula VALUES(102,'51380282F',1001);
INSERT INTO matricula VALUES(103,'62867698G',1002);
INSERT INTO matricula VALUES(104,'91577214T',1002);
INSERT INTO matricula VALUES(105,'98336942M',1003);
```

Y su tabla resultante es:

<div align="center">

|ID_Matricula|DNI|ID_Curso|
|-----------|---|------|
|101|20524442R|1001|
|102|51380282F|1001|
|103|62867698G|1002|
|104|91577214T|1002|
|105|98336942M|1003|

</div>

> Las tablas fueron creadas con el motor de bases de datos [Sqlite3](https://www.sqlite.org/index.html).

</div>