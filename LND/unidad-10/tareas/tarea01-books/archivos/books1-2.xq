for $x in doc("books.xml") //book/title
order by $x
return $x 