(: Mostrar información de los proveedores en HTML :)

<html>
  <head><title>Información de los proveedores</title></head>
  <body>
  <h2>Información del proveedor</h2>
    <table border="2">
    <tr>
      <th>Referencia</th><th>Nombre</th><th>Pais</th>
    </tr>
    {
      for $prov in doc ("../neptuno.xml") //proveedores
      where $prov/PaisProveedor = "Francia"
      return 
      <tr>
        <td>{$prov/ReferenciaProveedor}</td>
        <td>{$prov/NombreProveedor}</td>
        <td>{$prov/PaisProveedor}</td>
      </tr>
    }
    </table>
  </body>
</html>