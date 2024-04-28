for $book in doc("books2.xml") //book
return if ($book/@category="children")
then <child>{data($book/title)}</child>
else <adult>{data($book/title)}</adult>