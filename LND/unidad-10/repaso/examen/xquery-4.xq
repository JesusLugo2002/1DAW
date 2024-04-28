<html>
  <head><title>Cuarta consulta</title></head>
  <body>
    <table border='2'>
      <tr>
        <th>Referencia de pedido</th>
        <th>Referencia de cliente</th>
        <th>Referencia de artículo</th>
        <th>Fecha de pedido</th>
      </tr>
      {
        for $cl in doc('neptuno-examen.xml') //cliente
        for $art in doc('neptuno-examen.xml') //articulo
        where $cl/RefCliente = "PICCO"
          and $cl/RefArticulo = $art/RefArticulo
        return
        <tr>
          <td>{data($cl/RefPedido)}</td>
          <td>{data($cl/RefCliente)}</td>
          <td>{data($art/RefArticulo)}</td>
          <td>{data($cl/FechaPedido)}</td>
        </tr>
      }
    </table>
  </body>
</html>