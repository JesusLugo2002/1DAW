<html>
  <head>
    <title>Lista</title>
  </head>
  <body>
    <h3>Hay { count(doc("alumnos.xml")/instituto/curso/alumno) } alumnos</h3>
    <ul>
    {
    for $a in doc("alumnos.xml")/instituto/curso/alumno
    order by $a/apellidos
    return <li>{string($a/apellidos)}, {string($a/nombre)}</li>
    }
    </ul>
  </body>
</html>