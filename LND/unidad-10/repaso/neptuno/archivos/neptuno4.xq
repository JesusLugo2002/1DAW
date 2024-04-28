<html>
  <head><title>Primera consulta</title></head>
  <body>
    <table border='2'>
      <tr><th>Referencia de artículo</th><th>Referencia de proveedor</th><th>Nombre de artículo</th></tr>
      {
        for $art in doc('../neptuno.xml')//articulos
        return
        <tr>
          <td>{$art/number(RefArticulo)}</td>
          <td>{$art/number(ReferenciaProveedor)}</td>
          <td>{$art/NombreArticulo/text()}</td>
        </tr>
      }
    </table>
  </body>
</html>