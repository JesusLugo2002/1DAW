# La Segunda Forma Normal
La tabla de estudiantes de nuestra base de datos, tras hacerle la primera forma normal y es que cuenta con varias entradas repetidas con la misma clave primaria por culpa de la atomización de elementos, el objetivo de esta 2ª forma normal, es arreglarlo. Para esta segunda forma normal escoremos una clave candidata que usaremos para que al separar los datos, no relacionados directamente con la información de los estudiantes no se pierda información.

<div align=center>

## LA TABLA ESTUDIANTES SE VERÁ REDUCIDA

# ESTUDIANTE 
| <u>__DNI__</u> | ID_Tutor,FK | ID_Programa,FK | Nombre    | Apellido  |
| ---            | ---         | ---            | ---       | ---       |
| 20524442R      | T-10        | 10001          | Antonella | Marinella |
| 51380282F      | T-10        | 10001          | Josua     | Rodríguez |
| 62867698G      | T-11        | 10002          | Miguel    | Travesio  |
| 91577214T      | T-11        | 10002          | Armando   | Casas     |
| 98336942M      | T-12        | 10001          | Alan      | Brito     |

## Y Se crearán nuevas tablas

# Email

| <u>__DNI__</u> | Emails                   |
| ---            | ---                      |
| 20524442R      | antonella123@hotmail.com |
| 20524442R      | anto_nella@gmail.com     |
| 51380282F      | josua_rod@hotmail.com    |
| 62867698G      | miguelito_traviesito@yahoo.com |
| 62867698G      | miguel007@gmail.com      |
| 91577214T      | armando_casas@gmail.com  |
| 98336942M      | alan12345@gmail.com      |
| 98336942M      | alan_brito05@hotmail.com |

# Dirección

| <u>__DNI__</u> | Calle       | Número | Código Postal | Piso   | Municipio    | Provincia             |
|---             |---          |---     |---            |---     |---           |---                    |
| 20524442R      | Casa Nieves | Nº 2   | 38419         | Piso 1 | Los Realejos | Sta. Cruz de Tenerife |
| 51380282F      | El Mocan    | Nº 1   | 38420         | Piso 1 | Los Realejos | Sta. Cruz de Tenerife |
| 62867698G      | La Romera   | Nº 1   | 38420         | Piso 3 | Los Realejos | Sta. Cruz de Tenerife |
| 91577214T      | El Colegio  | Nº 3   | 38421         | Piso 1 | Los Realejos | Sta. Cruz de Tenerife |
| 98336942M      | El Drago    | Nº 2   | 38300         | Piso 2 | La Orotava   | Sta. Cruz de Tenerife |

</div>
