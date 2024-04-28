(: Retornar tabla de libros con su información en HTML :)

<html>
  <head><title>Lista de libros</title></head>
  <body>
    <table border="1">
      <tr><th>Autor</th><th>Título</th><th>Género</th><th>Precio</th></tr>
      {
        for $book in doc("../books1.xml") //book
        return <tr><td>{$book/author/text()}</td><td>{$book/title/text()}</td><td>{$book/genre/text()}</td><td>{$book/number(price)}</td></tr>
      }
    </table>
  </body>
</html>