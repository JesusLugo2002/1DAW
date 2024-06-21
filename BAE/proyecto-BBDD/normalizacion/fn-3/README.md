# La Tercera Formal Normal
Después de realizar la segunda forma se han creado 2 nuevas tablas, en las que existen dependencias transitivas nuestro trabajo en la tercera forma normal es eliminarlas. Para ello hay que tener en cuenta que un estudiante puede tener la misma dirección que otro aunque aquí no se de ese caso. También aprovecharemos este dibujo para colocar el DNI en los emails como FK (Clave foránea) y dar un ID propio a los emails. 

<div align=center>

## Tabla Estudiante

|DNI|ID_Tutor|ID_Programa|Nombre|Apellido|
|---|---|---|----|----|
|20524442R|T-10|10001|Antonella|Marinella|
|51380282F|T-10|10001|Josua|Rodríguez|
|62867698G|T-11|10002|Miguel|Travesio|
|91577214T|T-11|10002|Armando|Casas|
|98336942M|T-12|10001|Alan|Brito|

## Tabla Email

|ID_Email|DNI|Emails|
|---|---|---|
|e-1|20524442R|antonella123@hotmail.com|
|e-2|20524442R|anto_nella@gmail.com|
|e-3|51380282F|josua_rod@hotmail.com|
|e-4|62867698G|miguelito_traviesillo@yahoo.com|
|e-5|62867698G|miguel007@gmail.com|
|e-6|91577214T|armando_casas@gmail.com|
|e-7|98336942M|alan12345@gmail.com|
|e-8|98336942M|alan_brito05@hotmail.com|

## Tabla intermedia: Estudiante-Dirección

|DNI|ID_Direccion|
|---|---|
|20524442R|Dir-1|
|51380282F|Dir-2|
|62867698G|Dir-3|
|91577214T|Dir-4|
|98336942M|Dir-5|

## Tabla Dirección

|ID_Direccion|Calle|Numero|Codigo Postal|Piso|Municipio|Provincia|
|---|---|---|---|---|---|---|
|Dir-1|Casa Nieves|Nº2|38419|Piso 1|Los Realejos|Sta. Cruz de Tenerife|
|Dir-2|El Mocán|Nº1|38420|Piso 1|Los Realejos|Sta. Cruz de Tenerife|
|Dir-3|La Romera|Nº1|38420|Piso 3|Los Realejos|Sta. Cruz de Tenerife|
|Dir-4|El Colegio|Nº3|38421|Piso 1|Los Realejos|Sta. Cruz de Tenerife|
|Dir-5|El Drago|Nº2|38300|Piso 2|La Orotava|Sta. Cruz de Tenerife|

</div>
