(: Mostrar información de los proveedores y los alimentos que provee en HTML:)

<html>
  <head><title>Información de producto</title></head>
  <h3>Información del producto-proveedor</h3>
  <body>
    <table border="1">
      <tr>
        <th>Nº Referencia</th><th>Nombre de proveedor</th><th>Nombre de producto</th><th>Categoría del producto</th>
        for $art in doc ("../neptuno.xml") //articulos
        for $prov in doc ("../neptuno.xml") //proveedores
        where $art/ReferenciaProveedor = $prov/ReferenciaProveedor and $art/NombreCategoria = "alimentación"
        return
      </tr>
    </table>
  </body>
</html>