<html>
  <head><title>Tercera consulta</title></head>
  <body>
    <table border='2'>
      <tr>
        <th>Referencia de artículo</th>
        <th>Nombre de artículo</th>
        <th>Referencia de proveedor</th>
        <th>Nombre de proveedor</th>
      </tr>
      {
        for $articulo in doc('../neptuno.xml')//articulos
        for $proveedor in doc('../neptuno.xml')//proveedores
        where $articulo/ReferenciaProveedor = $proveedor/ReferenciaProveedor
          and $articulo/NombreCategoria="Bebidas"
        return
        <tr>
          <td>{data($articulo/RefArticulo)}</td>
          <td>{data($articulo/NombreArticulo)}</td>
          <td>{data($proveedor/ReferenciaProveedor)}</td>
          <td>{data($proveedor/NombreProveedor)}</td>
        </tr>
      }
    </table>
  </body>
</html>