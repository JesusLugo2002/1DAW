# Guia de resolución de ejercicios

<div align=center>
    <img src="../../../images/bg2.gif" width="60%" alt="bg"/>
</div>
<br>

Esto lo hago meramente con el motivo de plantear un método para solucionar los ejercicios que se nos presenten (o al menos es el que hago yo internamente) con el fin de ayudar a quien se vea un poco complicado con, __no tanto el tema de la sintaxis o el uso de funciones en Python, sino con la implementación de los mismos; la lógica que debe tomarse para solucionar problemas de programación.__

Por lo que no me detendré a explicar cosas como, por ejemplo, _el módulo sqlite3 tiene el método execute() que sirve para..._, para eso tienen los apuntes del Sergio. Aquí plantearé un método para solucionar ejercicios abarcándolo totalmente.

Para estas explicaciones, intentaré tomar puntos teóricos (serán las etiquetas _NOTE_ en el readme) a la par de ejecución de código tomando como base el ejercicio [twitter.py de AprendePython](./files/twitter.py).
<br>

## Paso 1 - Identificación de métodos y clases

Lo primero que nos encontraremos al abrir un fichero de ejercicio es que se estructura en métodos y clases (o puede que no, pero eso será para otro tipo de ejercicios). Lo mejor que podremos hacer en primera instancia es identificarlas desde un principio. Pueden anotarlos en un fichero aparte, dibujarlos en una hoja o simplemente no hacer nada, depende de lo lioso que pueda ser.

En [twitter.py](./files/twitter.py) podemos encontrarnos con:

- Métodos externos (métodos que no están dentro de una clase):
    1. create_db
- Clase User:
    1. __init__
    2. save
    3. login
    4. tweet
    5. retweet
    6. property: tweets
    7. __repr__
    8. classmethod: from_db_row
- Clase Tweet:
    1. __init__
    2. property: is_retweet
    3. property: content
    4. save
    5. __repr__
    6. classmethod: from_db_row
- Clase Twitter:
    1. __init__
    2. add_user
    3. get_user
- Clase TwitterError(Exception):
    1. __init__

<br>
Ya con esta lista (escrita a un lado o interiorizada) podemos empezar a trabajar de forma ordenada.

## Paso 2 - Priorizar métodos y clases