(: Muestra todos los bailes con un precio superior a 40, pero en formato HTML :)

<html>
  <head><title>Bailes con precio superior a 40</title></head>
  <body>
    <table border="1">
      <tr><th>Nombre</th><th>Precio</th></tr>
{
for $baile in doc ("bailes.xml") //bailes/baile
where $baile/number(precio)>40
return <tr><td>{$baile/nombre}</td><td>{$baile/precio}</td></tr>
} 
    </table>
  </body>
</html>