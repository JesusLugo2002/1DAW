<div align=justify>

# La Primera Forma Normal
En nuestra base de datos existe un problema, ya que la tabla de los estudiantes cuenta tanto con elementos compuesto como con elementos multivaluados, el trabajo de esta primera forma normal será la de atomizarlos (separarlos), creando para ellos nuevas columnas para las compuestas y nuevas entradas (filas) para las multivaluadas.

</div>
<div align=center>

| <u>__DNI__</u> | ID_Tutor,FK | ID_Programa,FK | Nombre    | Apellido  | Emails | Calle | Número | Código Postal | Piso | Municipio | Provincia |
| ---            | ---         | ---            | ---       | ---       | ---    | ---   |  ---   | ---           | ---  | ---       | ---       |
| 20524442R      | T-10        | 10001          | Antonella | Marinella | antonella123@hotmail.com | Casa Nieves | Nº 2 | 38419 | Piso 1 | Los Realejos | Sta. Cruz de Tenerife |
| 20524442R      | T-10        | 10001          | Antonella | Marinella | anto_nella@gmail.com | Casa Nieves | Nº 2 | 38419 | Piso 1 | Los Realejos | Sta. Cruz de Tenerife | 
| 51380282F      | T-10        | 10001          | Josua     | Rodríguez | josua_rod@hotmail.com | El Mocan | Nº 1 | 38420 | Piso 1 | Los Realejos | Sta. Cruz de Tenerife |
| 62867698G      | T-11        | 10002          | Miguel    | Travesio  | miguelito_traviesillo@yahoo.com | La Romera | Nº 1 | 38420 | Piso 3 | Los Realejos | Sta. Cruz de Tenerife |
| 62867698G      | T-11        | 10002          | Miguel    | Travesio  | miguel007@gmail.com | La Romera | Nº 1 | 38420 | Piso 3 | Los Realejos | Sta. Cruz de Tenerife |
| 91577214T      | T-11        | 10002          | Armando   | Casas     | armando_casas@gmail.com | El Colegio | Nº 3 | 38421 | Piso 1 | Los Realejos | Sta. Cruz de Tenerife |
| 98336942M      | T-12        | 10001          | Alan      | Brito     | alan12345@gmail.com | El Drago | Nº 2 | 38300 | Piso 2 | La Orotava | Sta. Cruz de Tenerife |
| 98336942M      | T-12        | 10001          | Alan      | Brito     | alan_brito05@hotmail.com | El Drago | Nº 2 | 38300 | Piso 2 | La Orotava | Sta. Cruz de Tenerife |


</div>

