<html>
  <head><title>Segunda consulta</title></head>
  <body>
    <table border='2'>
      <tr>
        <th>Referencia de proveedor</th>
        <th>Nombre de proveedor</th>
        <th>Dirección</th>
        <th>Código postal</th>
        <th>País</th>
        <th>Teléfono</th>
      </tr>
      {
        for $pro in doc('neptuno-examen.xml') //proveedor
        where $pro/PaisProveedor = "Francia"
        return
        <tr>
          <td>{data($pro/ReferenciaProveedor)}</td>
          <td>{data($pro/NombreProveedor)}</td>
          <td>{data($pro/DireccionProveedor)}</td>
          <td>{data($pro/CodigoPostal)}</td>
          <td>{data($pro/PaisProveedor)}</td>
          <td>{data($pro/TelefonoProveedor)}</td>
        </tr>
      }
    </table>
  </body>
</html>