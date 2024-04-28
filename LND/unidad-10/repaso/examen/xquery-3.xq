<html>
  <head><title>Tercera consulta</title></head>
  <body>
    <table border='2'>
      <tr>
        <th>Referencia de cliente</th>
        <th>Nombre de cliente</th>
        <th>Dirección</th>
        <th>Ciudad</th>
      </tr>
      {
        for $cl in doc('neptuno-examen.xml') //cliente
        where $cl/CiudadCliente = "Madrid"
        return
        <tr>
          <td>{data($cl/RefCliente)}</td>
          <td>{data($cl/NombreCliente)}</td>
          <td>{data($cl/DireccionCliente)}</td>
          <td>{data($cl/CiudadCliente)}</td>
        </tr>
      }
    </table>
  </body>
</html>