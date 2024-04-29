-- Selección de libros cuyo título comienza con "H".

select * from libro where titulo regexp '^H';

/**
No se retorna tabla pues no existen libros que empiecen con 'H'.
**/

-- Libros escritos por autores cuyos nombres terminan con "ing".

select l.* from libro as l, autor as a where l.autor_id = a.id and a.nombre regexp 'ing$';

/**
No retorna tabla porque no se cumplen las condiciones.
**/

-- Libros con títulos que contienen la palabra "and" en cualquier posición.

select * from libro where titulo regexp 'and';

/**
+--------+----------------------------------+----------+-------------------------+--------+
| codigo |              titulo              | autor_id |        editorial        | precio |
+--------+----------------------------------+----------+-------------------------+--------+
| 15     | The Old Man and the Sea          | 17       | Charles Scribner's Sons | 18.95  |
| 20     | Alice's Adventures in Wonderland | 22       | Macmillan               | 11.5   |
| 28     | War and Peace                    | 26       | The Russian Messenger   | 33.25  |
| 29     | Crime and Punishment             | 30       | The Russian Messenger   | 19.99  |
+--------+----------------------------------+----------+-------------------------+--------+
**/

-- Libros cuyo título comienza con una vocal.

select * from libro where titulo regexp '^[aeiouAEIOU]';

/**
+--------+----------------------------------+----------+-----------------------+--------+
| codigo |              titulo              | autor_id |       editorial       | precio |
+--------+----------------------------------+----------+-----------------------+--------+
| 4      | One Hundred Years of Solitude    | 9        | Harper & Row          | 22.5   |
| 20     | Alice's Adventures in Wonderland | 22       | Macmillan             | 11.5   |
| 24     | Anna Karenina                    | 26       | The Russian Messenger | 23.99  |
+--------+----------------------------------+----------+-----------------------+--------+
**/

-- Libros cuyo autor tiene al menos una vocal repetida.

select l.*, a.nombre as nombre_autor from libro as l, autor as a where l.autor_id = a.id and a.nombre regexp '[aeiouAEIOU]{2}';

/**
+--------+-----------------+----------+-----------------+--------+---------------+
| codigo |     titulo      | autor_id |    editorial    | precio | nombre_autor  |
+--------+-----------------+----------+-----------------+--------+---------------+
| 5      | Brave New World | 3        | Chatto & Windus | 17.99  | George Orwell |
+--------+-----------------+----------+-----------------+--------+---------------+
**/

-- Libros con precios que tienen dos dígitos decimales exactos.

select * from libro where precio regexp '\.\d{2}$';

/**
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| codigo |              titulo               | autor_id |                  editorial                  | precio |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
| 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
| 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
| 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
| 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
| 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
| 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
| 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
| 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
| 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
| 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
| 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
**/

-- Libros cuyos títulos tienen al menos tres palabras.

select * from libro where titulo regexp '\w+\s\w+\s\w+';

/**
+--------+-----------------------------------+----------+---------------------------+--------+
| codigo |              titulo               | autor_id |         editorial         | precio |
+--------+-----------------------------------+----------+---------------------------+--------+
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons   | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.     | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company | 18.75  |
| 4      | One Hundred Years of Solitude     | 9        | Harper & Row              | 22.5   |
| 5      | Brave New World                   | 3        | Chatto & Windus           | 17.99  |
| 7      | The Lord of the Rings             | 10       | George Allen & Unwin      | 35.5   |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles             | 28.99  |
| 13     | The Grapes of Wrath               | 15       | The Viking Press          | 21.5   |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons   | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                    | 27.99  |
| 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company   | 14.5   |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes             | 16.99  |
| 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                 | 11.5   |
| 23     | The Divine Comedy                 | 25       | Dante Alighieri           | 20.5   |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers      | 14.99  |
| 27     | The Wind in the Willows           | 29       | Methuen & Co.             | 17.5   |
| 28     | War and Peace                     | 26       | The Russian Messenger     | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger     | 19.99  |
+--------+-----------------------------------+----------+---------------------------+--------+
**/

-- Obtener todos los autores cuyo nombre empieza con la letra "A":

select * from autor where nombre regexp '^[aA]';

/**
+----+-----------------+
| id |     nombre      |
+----+-----------------+
| 5  | Agatha Christie |
+----+-----------------+
**/

-- Seleccionar los libros cuyo título contiene la palabra "SQL":

select * from libro where titulo regexp 'SQL';

/**
Se retorna vacío pues no existe ningún libro cuyo título contenga la palabra 'SQL'.
**/

-- Obtener todos los autores cuyo nombre termina con "ez":

select * from autor where nombre regexp 'ez$';

/**
Se retorna vacío pues no existe ningún autor cuyo nombre termine en 'ez'.
**/

-- Obtener todos los autores cuyo nombre tiene al menos 5 caracteres:

select * from autor where nombre regexp '.....';

/**
+----+-----------------+
| id |     nombre      |
+----+-----------------+
| 1  | J.K. Rowling    |
| 2  | Stephen King    |
| 3  | George Orwell   |
| 4  | Jane Austen     |
| 5  | Agatha Christie |
+----+-----------------+
**/

-- Seleccionar los libros cuya editorial es diferente de "EditorialX":

select * from libro where editorial not regexp 'EditorialX';

/**
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| codigo |              titulo               | autor_id |                  editorial                  | precio |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
| 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   |
| 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
| 7      | The Lord of the Rings             | 10       | George Allen & Unwin                        | 35.5   |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
| 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
| 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
| 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
| 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   |
| 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
| 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
| 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
| 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   |
| 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
| 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
| 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   |
| 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
| 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
| 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   |
| 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
**/


-- Obtener todos los autores cuyo nombre contiene al menos una vocal:

select * from autor where nombre regexp '[aeiouAEIOU]+';

/**
+----+-----------------+
| id |     nombre      |
+----+-----------------+
| 1  | J.K. Rowling    |
| 2  | Stephen King    |
| 3  | George Orwell   |
| 4  | Jane Austen     |
| 5  | Agatha Christie |
+----+-----------------+
**/

-- Seleccionar los libros cuyo título comienza con una letra mayúscula:

select * from libro where titulo regexp '^[A-Z]';

/**
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| codigo |              titulo               | autor_id |                  editorial                  | precio |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
| 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   |
| 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
| 7      | The Lord of the Rings             | 10       | George Allen & Unwin                        | 35.5   |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
| 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
| 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
| 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
| 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   |
| 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
| 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
| 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
| 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   |
| 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
| 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
| 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   |
| 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
| 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
| 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   |
| 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
**/

-- Obtener todos los autores cuyo nombre no contiene la letra "r":

select * from autor where nombre not regexp '[rR]';

/**
+----+--------------+
| id |    nombre    |
+----+--------------+
| 2  | Stephen King |
| 4  | Jane Austen  |
+----+--------------+
**/

-- Seleccionar los libros cuya editorial empieza con la letra "P":

select * from libro where editorial regexp '^[Pp]';

/**
+--------+---------------------------+----------+-----------+--------+
| codigo |          titulo           | autor_id | editorial | precio |
+--------+---------------------------+----------+-----------+--------+
| 16     | The Count of Monte Cristo | 18       | Pétion    | 27.99  |
+--------+---------------------------+----------+-----------+--------+
**/

-- Obtener todos los autores cuyo nombre tiene exactamente 6 caracteres:

select * from autor where nombre regexp '^......$';

/**
No se retorna nada pues no hay autores con un nombre de exactamente 6 carácteres.
**/

-- Seleccionar los libros cuyo título contiene al menos un número:

select * from libro where titulo regexp '\d+';

/**
No se retorna nada pues no hay libros cuyo título contenga al menos un número.
**/

-- Obtener todos los autores cuyo nombre inicia con una vocal:

select * from autor where nombre regexp '^[aeiouAEIOU]';

/**
+----+-----------------+
| id |     nombre      |
+----+-----------------+
| 5  | Agatha Christie |
+----+-----------------+
**/

-- Obtener todos los autores cuyo nombre no contiene espacios en blanco:

select * from autor where nombre not regexp '\s';

/**
Se retorna vacío pues no existen nombres de autores que no contengan espacios en blanco.
**/

-- Seleccionar los libros cuyo título termina con una vocal:

select * from libro where titulo regexp '[aeiouAEIOU]$';

/**
+--------+-------------------------------+----------+---------------------------+--------+
| codigo |            titulo             | autor_id |         editorial         | precio |
+--------+-------------------------------+----------+---------------------------+--------+
| 3      | The Catcher in the Rye        | 8        | Little, Brown and Company | 18.75  |
| 4      | One Hundred Years of Solitude | 9        | Harper & Row              | 22.5   |
| 8      | The Chronicles of Narnia      | 11       | Geoffrey Bles             | 28.99  |
| 15     | The Old Man and the Sea       | 17       | Charles Scribner's Sons   | 18.95  |
| 16     | The Count of Monte Cristo     | 18       | Pétion                    | 27.99  |
| 21     | The Prince                    | 23       | Niccolò Machiavelli       | 10.99  |
| 22     | Don Quixote                   | 24       | Francisco de Robles       | 26.75  |
| 24     | Anna Karenina                 | 26       | The Russian Messenger     | 23.99  |
| 28     | War and Peace                 | 26       | The Russian Messenger     | 33.25  |
+--------+-------------------------------+----------+---------------------------+--------+
**/

-- Obtener todos los autores cuyo nombre contiene la secuencia "er":

select * from autor where nombre regexp 'er';

/**
Se retorna vacío pues no existen autores que tengan la secuencia 'er' en su nombre.
**/

-- Seleccionar los libros cuyo título empieza con la palabra "The":

select * from libro where titulo regexp '^The';

/**
+--------+-----------------------------------+----------+---------------------------+--------+
| codigo |              titulo               | autor_id |         editorial         | precio |
+--------+-----------------------------------+----------+---------------------------+--------+
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons   | 20.99  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company | 18.75  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin      | 24.99  |
| 7      | The Lord of the Rings             | 10       | George Allen & Unwin      | 35.5   |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles             | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                     | 14.95  |
| 10     | The Iliad                         | 12       | Homer                     | 14.95  |
| 12     | The Road                          | 14       | Alfred A. Knopf           | 16.75  |
| 13     | The Grapes of Wrath               | 15       | The Viking Press          | 21.5   |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons   | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                    | 27.99  |
| 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company   | 14.5   |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes             | 16.99  |
| 21     | The Prince                        | 23       | Niccolò Machiavelli       | 10.99  |
| 23     | The Divine Comedy                 | 25       | Dante Alighieri           | 20.5   |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers      | 14.99  |
| 27     | The Wind in the Willows           | 29       | Methuen & Co.             | 17.5   |
+--------+-----------------------------------+----------+---------------------------+--------+
**/

-- Obtener todos los autores cuyo nombre tiene al menos una letra mayúscula:

select * from autor where nombre regexp '[A-Z]+';

/**
+----+-----------------+
| id |     nombre      |
+----+-----------------+
| 1  | J.K. Rowling    |
| 2  | Stephen King    |
| 3  | George Orwell   |
| 4  | Jane Austen     |
| 5  | Agatha Christie |
+----+-----------------+
**/

-- Seleccionar los libros cuyo precio es un número decimal con exactamente dos decimales:

select * from libro where precio regexp '\.\d{2}$';

/**
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| codigo |              titulo               | autor_id |                  editorial                  | precio |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
| 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
| 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
| 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
| 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
| 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
| 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
| 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
| 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
| 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
| 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
| 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
**/

-- Obtener todos los autores cuyo nombre no contiene números:

select * from autor where nombre regexp '\D';

/**
+----+-----------------+
| id |     nombre      |
+----+-----------------+
| 1  | J.K. Rowling    |
| 2  | Stephen King    |
| 3  | George Orwell   |
| 4  | Jane Austen     |
| 5  | Agatha Christie |
+----+-----------------+
**/

-- Seleccionar los libros cuyo título contiene al menos tres vocales:

select * from libro where titulo regexp '[aeiouAEIOU]{3,}'; -- Preguntar por esta consulta.

-- Obtener todos los autores cuyo nombre inicia con una consonante:

select * from autor where nombre regexp '^[a-zA-Z]' and nombre not regexp '^[aeiouAEIOU]';

/**
+----+---------------+
| id |    nombre     |
+----+---------------+
| 1  | J.K. Rowling  |
| 2  | Stephen King  |
| 3  | George Orwell |
| 4  | Jane Austen   |
+----+---------------+
**/

-- Seleccionar los libros cuyo título no contiene la palabra "Science":

select * from libro where titulo not regexp 'Science';

/**
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| codigo |              titulo               | autor_id |                  editorial                  | precio |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
| 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   |
| 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
| 7      | The Lord of the Rings             | 10       | George Allen & Unwin                        | 35.5   |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
| 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
| 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
| 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
| 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   |
| 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
| 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
| 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
| 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   |
| 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
| 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
| 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   |
| 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
| 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
| 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   |
| 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
**/

-- Obtener todos los autores cuyo nombre tiene al menos una letra repetida consecutivamente:

select * from autor where nombre regexp '[a-zA-Z]{2}';

/**
+----+-----------------+
| id |     nombre      |
+----+-----------------+
| 1  | J.K. Rowling    |
| 2  | Stephen King    |
| 3  | George Orwell   |
| 4  | Jane Austen     |
| 5  | Agatha Christie |
+----+-----------------+
**/

-- Obtener todos los autores cuyo nombre empieza con "M" o termina con "n":

select * from autor where nombre regexp '^M|n$';

/**
NO SALE POR BUG.
+----+-------------+
| id |   nombre    |
+----+-------------+
| 4  | Jane Austen |
+----+-------------+
**/

-- Obtener todos los autores cuyo nombre no contiene caracteres especiales:

select * from autor where nombre regexp '[a-zA-Z]' or nombre regexp '[0-9]';

/**
+----+-----------------+
| id |     nombre      |
+----+-----------------+
| 1  | J.K. Rowling    |
| 2  | Stephen King    |
| 3  | George Orwell   |
| 4  | Jane Austen     |
| 5  | Agatha Christie |
+----+-----------------+
**/
