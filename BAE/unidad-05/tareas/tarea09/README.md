# Ejercicios de subconsultas (uso del Join)

<div align=center>
    
![gif](https://www.gifmaniacos.es/wp-content/uploads/2019/04/peces-gif-gifmaniacos.es-15.gif)

*Pez de la buena suerte.*

</div>

## Consultas

#### 1. Obtener el nombre del alumno y el nombre de la clase en la que está inscrito.
```sql
select a.nombre as nombre_alumno, c.nombre as nombre_clase from alumnos as a join inscripciones as i on a.id=i.id_alumno join clases as c on c.id=i.id_clase; 
```
| nombre_alumno |      nombre_clase      |
|---------------|------------------------|
| Juan          | Matemáticas 101        |
| Juan          | Historia Antigua       |
| María         | Literatura Moderna     |
| María         | Biología Avanzada      |
| Pedro         | Química Orgánica       |
| Pedro         | Física Cuántica        |
| Laura         | Arte Contemporáneo     |
| Laura         | Inglés Avanzado        |
| Carlos        | Economía Internacional |
| Ana           | Derecho Penal          |

#### 2. Obtener el nombre del alumno y la materia de las clases en las que está inscrito.
```sql
select a.nombre, c.materia from alumnos as a join inscripciones as i on a.id=i.id_alumno join clases as c on c.id=i.id_clase;
```
| nombre |   materia   |
|--------|-------------|
| Juan   | Matemáticas |
| Juan   | Historia    |
| María  | Literatura  |
| María  | Biología    |
| Pedro  | Química     |
| Pedro  | Física      |
| Laura  | Arte        |
| Laura  | Idiomas     |
| Carlos | Economía    |
| Ana    | Derecho     |


#### 3. Obtener el nombre del alumno, la edad y el nombre del profesor de las clases en las que está inscrito.
```sql
select a.nombre, a.edad, c.profesor from alumnos as a join inscripciones as i on a.id=i.id_alumno join clases as c on c.id=i.id_clase;
```
| nombre | edad |  profesor  |
|--------|------|------------|
| Juan   | 20   | Profesor X |
| Juan   | 20   | Profesor Y |
| María  | 21   | Profesor Z |
| María  | 21   | Profesor W |
| Pedro  | 19   | Profesor V |
| Pedro  | 19   | Profesor U |
| Laura  | 22   | Profesor T |
| Laura  | 22   | Profesor S |
| Carlos | 20   | Profesor R |
| Ana    | 19   | Profesor Q |


#### 4. Obtener el nombre del alumno y la dirección de las clases en las que está inscrito.
```sql
select distinct a.nombre, a.direccion from alumnos as a join inscripciones as i on a.id=i.id_alumno join clases as c on c.id=i.id_clase;
```
| nombre | direccion |
|--------|-----------|
| Juan   | Calle A   |
| María  | Calle B   |
| Pedro  | Calle C   |
| Laura  | Calle D   |
| Carlos | Calle E   |
| Ana    | Calle F   |


#### 5. Obtener el nombre del alumno y el nombre de la clase junto con el profesor.
```sql
select a.nombre as nombre_alumno, c.nombre as nombre_clase, c.profesor from alumnos as a join inscripciones as i on a.id=i.id_alumno join clases as c on c.id=i.id_clase;
```
| nombre_alumno |      nombre_clase      |  profesor  |
|---------------|------------------------|------------|
| Juan          | Matemáticas 101        | Profesor X |
| Juan          | Historia Antigua       | Profesor Y |
| María         | Literatura Moderna     | Profesor Z |
| María         | Biología Avanzada      | Profesor W |
| Pedro         | Química Orgánica       | Profesor V |
| Pedro         | Física Cuántica        | Profesor U |
| Laura         | Arte Contemporáneo     | Profesor T |
| Laura         | Inglés Avanzado        | Profesor S |
| Carlos        | Economía Internacional | Profesor R |
| Ana           | Derecho Penal          | Profesor Q |


#### 6. Obtener el nombre del alumno, la materia y el nombre del profesor de las clases en las que está inscrito.
```sql
select a.nombre, c.materia, c.profesor from alumnos as a join inscripciones as i on a.id=i.id_alumno join clases as c on c.id=i.id_clase;
```
| nombre |   materia   |  profesor  |
|--------|-------------|------------|
| Juan   | Matemáticas | Profesor X |
| Juan   | Historia    | Profesor Y |
| María  | Literatura  | Profesor Z |
| María  | Biología    | Profesor W |
| Pedro  | Química     | Profesor V |
| Pedro  | Física      | Profesor U |
| Laura  | Arte        | Profesor T |
| Laura  | Idiomas     | Profesor S |
| Carlos | Economía    | Profesor R |
| Ana    | Derecho     | Profesor Q |


#### 7. Obtener el nombre del alumno, la edad y la materia de las clases en las que está inscrito.
```sql
select a.nombre, a.edad, c.materia from alumnos as a join inscripciones as i on a.id=i.id_alumno join clases as c on c.id=i.id_clase;
```
| nombre | edad |   materia   |
|--------|------|-------------|
| Juan   | 20   | Matemáticas |
| Juan   | 20   | Historia    |
| María  | 21   | Literatura  |
| María  | 21   | Biología    |
| Pedro  | 19   | Química     |
| Pedro  | 19   | Física      |
| Laura  | 22   | Arte        |
| Laura  | 22   | Idiomas     |
| Carlos | 20   | Economía    |
| Ana    | 19   | Derecho     |


#### 8. Obtener el nombre del alumno, la dirección y el profesor de las clases en las que está inscrito.
```sql
select a.nombre, a.direccion, c.profesor from alumnos as a join inscripciones as i on a.id=i.id_alumno join clases as c on c.id=i.id_clase;
```
| nombre | direccion |  profesor  |
|--------|-----------|------------|
| Juan   | Calle A   | Profesor X |
| Juan   | Calle A   | Profesor Y |
| María  | Calle B   | Profesor Z |
| María  | Calle B   | Profesor W |
| Pedro  | Calle C   | Profesor V |
| Pedro  | Calle C   | Profesor U |
| Laura  | Calle D   | Profesor T |
| Laura  | Calle D   | Profesor S |
| Carlos | Calle E   | Profesor R |
| Ana    | Calle F   | Profesor Q |

#### 9. Obtener el nombre del alumno y la materia de las clases en las que está inscrito, ordenado por el nombre del alumno.
```sql
select a.nombre, c.materia from alumnos as a join inscripciones as i on a.id=i.id_alumno join clases as c on c.id=i.id_clase order by a.nombre;
```
| nombre |   materia   |
|--------|-------------|
| Ana    | Derecho     |
| Carlos | Economía    |
| Juan   | Matemáticas |
| Juan   | Historia    |
| Laura  | Arte        |
| Laura  | Idiomas     |
| María  | Literatura  |
| María  | Biología    |
| Pedro  | Química     |
| Pedro  | Física      |


#### 10. Contar cuántos alumnos están inscritos en cada clase.
```sql
select c.nombre as clase, count(a.id) as alumnos_inscritos from alumnos as a join inscripciones as i on a.id=i.id_alumno join clases as c on c.id=i.id_clase group by clase; 
```
|         clase          | alumnos_inscritos |
|------------------------|-------------------|
| Arte Contemporáneo     | 1                 |
| Biología Avanzada      | 1                 |
| Derecho Penal          | 1                 |
| Economía Internacional | 1                 |
| Física Cuántica        | 1                 |
| Historia Antigua       | 1                 |
| Inglés Avanzado        | 1                 |
| Literatura Moderna     | 1                 |
| Matemáticas 101        | 1                 |
| Química Orgánica       | 1                 |
