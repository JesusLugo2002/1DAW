for $book in doc("books.xml") //book
let $author := $book/author
return
  <libro>
     {$book/title}
     <autores>{count($author)}</autores>
  </libro>