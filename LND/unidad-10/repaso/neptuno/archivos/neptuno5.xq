<html>
  <head><title>Segunda consulta</title></head>
  <body>
    <table border='2'>
      <tr>
        <th>Referencia de cliente</th>
        <th>Nombre de cliente</th>
        <th>Referencia de artículo</th>
        <th>Nombre de categoría</th>
      </tr>
      {
        for $articulo in doc('../neptuno.xml')//articulos
        for $cliente in doc('../neptuno.xml')//clientes
        where $articulo/NombreCategoria="Bebidas"
          and $articulo/ReferenciaPedido=$cliente/ReferenciaPedido
        return
        <tr>
          <td>{data($cliente/RefCliente)}</td>
          <td>{data($cliente/NombreCliente)}</td>
          <td>{data($articulo/NombreArticulo)}</td>
          <td>{data($articulo/NombreCategoria)}</td>
        </tr>
      }
    </table>
  </body>
</html>