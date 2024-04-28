<html>
  <head><title>Primera consulta</title></head>
  <body>
    <table border='2'>
      <tr>
        <th>Referencia de artículo</th>
        <th>Referencia de proveedor</th>
        <th>Nombre de artículo</th>
        <th>Categoría</th>
        <th>Precio por unidad</th>
        <th>Unidades en existencia</th>
      </tr>
      {
        for $art in doc('neptuno-examen.xml') //articulo
        for $pro in doc('neptuno-examen.xml') //proveedor
        where $art/NombreCategoria = "Bebidas"
          and $art/ReferenciaProveedor = $pro/ReferenciaProveedor
        return
        <tr>
          <td>{data($art/RefArticulo)}</td>
          <td>{data($pro/ReferenciaProveedor)}</td>
          <td>{data($art/NombreArticulo)}</td>
          <td>{data($art/NombreCategoria)}</td>
          <td>{data($art/PrecioUnidad)}</td>
          <td>{data($art/UnidadesExistencia)}</td>
        </tr>
      }
    </table>
  </body>
</html>