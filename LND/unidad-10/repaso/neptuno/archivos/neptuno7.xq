<html>
  <head><title>Cuarta consulta</title></head>
  <body>
    <table border='2'>
      <tr>
        <th>Nombre de clientes</th>
        <th>Nombre de artículos</th>
        <th>Nombre de proveedor</th>
        <th>Categoría de artículo</th>
      </tr>
      {
        for $art in doc('../neptuno.xml')//articulos
        for $pro in doc('../neptuno.xml')//proveedores
        for $cli in doc('../neptuno.xml')//clientes
        where $art/ReferenciaProveedor = $pro/ReferenciaProveedor
          and $art/ReferenciaPedido = $cli/ReferenciaPedido
          and $art/NombreCategoria="Bebidas"
        return
        <tr>
          <td>{data($cli/NombreCliente)}</td>
          <td>{data($art/NombreArticulo)}</td>
          <td>{data($pro/NombreProveedor)}</td>
          <td>{data($art/NombreCategoria)}</td>
        </tr>
      }
    </table>
  </body>
</html>