# Ejercicios de XQuery de los ficheros books.xml

A continuación se mostrarán los ejercicios de consultas realizados para los 2 archivos .xml de __books__:

## Ejercicios con 'Books1.xml'

### 1. Contar los autores por libro, iterando sobre los autores.

```xq
for $book in doc("books1.xml") //book
let $author := $book/author
return
  <libro>
     {$book/title}
     <autores>{count($author)}</autores>
  </libro>
```

### 2. Retornar la lista de libros ordenados.

```xq
for $x in doc("books1.xml") //book/title
order by $x
return $x 
```
### 3. Retornar la información de los libros en una tabla HTML

```xq
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
```

## Ejercicios con 'Books2.xml'

### 1. Retornar los títulos de los libros en una lista de formato HTML

```xq
<ul>
{
for $x in doc("books2.xml") //book/title
order by $x
return <li>{data($x)}</li>
}
</ul> 
```

### 2. Retornar los libros en etiquetas '<child>' si su categoría es 'children', si no, en etiqueta '<adult>'.

```xq
for $book in doc("books2.xml") //book
return if ($book/@category="children")
then <child>{data($book/title)}</child>
else <adult>{data($book/title)}</adult>
```