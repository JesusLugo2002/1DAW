<html>
  <head><title>Quinta consulta</title></head>
  <body>
    <table border='2'>
      <tr>
        <th>Referencia de artículo</th>
        <th>Nombre de artículo</th>
        <th>Referencia de proveedor</th>
        <th>Nombre de proveedor</th>
      </tr>
      {
        for $art in doc('neptuno-examen.xml') //articulo
        for $pro in doc('neptuno-examen.xml') //proveedor
        where $art/NombreCategoria = "Bebidas"
          and $art/ReferenciaProveedor = $pro/ReferenciaProveedor
        return
        <tr>
          <td>{data($art/RefArticulo)}</td>
          <td>{data($art/NombreArticulo)}</td>
          <td>{data($pro/ReferenciaProveedor)}</td>
          <td>{data($pro/NombreProveedor)}</td>
        </tr>
      }
    </table>
  </body>
</html>