<div align="justify">
  
# Análisis emocional del videojuego Celeste

## Introducción
Celeste es un videojuego que te ponen en los pies de Madeline, una alpinista que toma como reto personal alcanzar la cima del monte Celeste.
Es un juego donde las caidas del personajes son un factor determinante en el mensaje que devuelve a sus jugadores, ya que constantemente
retroalimenta a los jugadores y les alimenta con determinación y perseverancia para seguir intentándolo y lograr sus objetivos.
<!-- Imagen introductoria del videojuego -->
![introducción](https://www.uniat.edu.mx/wp-content/uploads/2021/02/Celeste-760x428.png)

## Reconocimiento
Celeste fue nominado en los [Game Awards 2018](https://thegameawards.com/rewind/year-2018) a cuatro categorías:

1. Juego del año.
2. Mejor banda sonora.
3. Mejor juego indie.
4. Mejor juego de impacto.

Finalizando el evento, Celeste fue ganador de los últimos dos premios.

## Argumento
Encarnas a **Madeline**, quien estando abajo de todo el monte Celeste se anima a sí misma a subirlo, no por alguna razón en específico, sino porque
'es algo que debo hacer'. En el camino se acabará encontrando con distintos personajes como:
- **La anciana**: que a pesar de burlarse de Madeline le aconseja sobre los peligros del camino porque ya lo ha recorrido.
- **Theo**: un joven fotógrafo que busca aventurarse a la cima y explorar nuevos horizontes.
<!-- Gif de Madeline tras conocer a la Anciana -->
![gif](https://media1.tenor.com/images/0ca9ff5e02b536af581d5a0c2eeffa9a/tenor.gif?itemid=14902960)

Tras iniciar la aventura, uno de los principales descubrimientos es que la montaña en sí misma es un ser vivo, un personaje que cataliza las emociones de quienes se atreven a escalarla y creando los obstáculos en base a ello. En el caso de Madeline, la hace enfrentarse a sí misma, una versión oscura que representa la ansiedad y la depresión que ella padece.
El juego también tiene una mecánica en la que puedes ingresar a un menú y observar en tiempo real como el resto de jugadores de todo el mundo 'escalan sus propias montañas', haciendo referencia a como todos enfrentan sus propios problemas y perseveran, en el monte Celeste, dándole al jugador el mensaje de 'no estás solo en esto'.
<!-- Gif de Madeline y Theo descansando -->
![gif](https://66.media.tumblr.com/452115a94309de388a764d1fd618c39f/tumblr_inline_p08wz4jeSI1qdiwz3_540.gif)

El mensaje emocional del videojuego es muy rico, un llamamiento a los jugadores para enfrentar sus problemas, perseverar en la búsqueda de logros y ayudarse unos a otros. 
Juegos como Celeste nos recuerdan que las emociones, sentimientos, dudas, inquietudes y miedos, no son cosas que solo pasan a nosotros, lo importante es nunca dejar que estas nos consuman y no tener miedo de pedir ayuda, ninguna tarea por más monumental que parezca es imposible, debemos recordar que sin importar que suceda somos los capitanes de nuestro propio destino, los maestros de nuestra alma y nadie ni siquiera nosotros mismo podemos quitarnos eso, nunca debemos dejar de enorgullecernos de nuestros logros y nuestra meta debe estar en alcanzar esa cima, porque, cuando menos nos demos cuenta finalmente habremos llegado a ella y la tarea que parecía imposible era más fácil de alcanzar de lo que creímos.

---
> Ninguna tarea, por monumental que sea, es imposible.
---

### La importancia de las fresas
En toda la aventura, Madeline puede (o no) tomar las fresas que se consiguen en las zonas que cruzan: esto para el jugador se presenta como un coleccionable, algo totalmente opcional de tomar, sin embargo, para quien se atreve a tomarlas todas, recorrerá los caminos más dificiles de la montaña.
Esto, aunque parezca no tener más importancia, al final del juego tras llegar a la cima, todos los personajes celebran el logro cocinando y comiendo un pastel con las fresas que has recolectado. Esto quiere decir que si has enfrentado el peligro añadido al recolectarlas todas, el final será más dulce y habrá valido la pena ese esfuerzo extra que en un principio parecía no servir para nada.
Como dato curioso, dejaré a continuación una tabla con la cantidad de fresas por capítulo en el juego:
<!-- Tabla de fresas/capítulo -->
|**Capítulo**|**Fresas**|
|-----------|-----------|
|1|20|
|2|18|
|3|25|
|4|29|
|5|31|
|6|0|
|7|47|
|8|5|

### Ejemplo con xml
Dejaré a continuación, por motivos de la actividad a entregar, una versión xml de la tabla pero incluyendo el nombre de los capítulos:

```xml
<capitulos>
  <capitulo>
    <nombre>Chapter 1: Forsaken City</nombre>
    <fresas>20</fresas>
  </capitulo>
  <capitulo>
    <nombre>Chapter 2: Old Site</nombre>
    <fresas>18</fresas>
  </capitulo>
  <capitulo>
    <nombre>Chapter 3: Celestial Resort</nombre>
    <fresas>25</fresas>
  </capitulo>
  <capitulo>
    <nombre>Chapter 4: Golden Ridge</nombre>
    <fresas>29</fresas>
  </capitulo>
  <capitulo>
    <nombre>Chapter 5: Mirror Temple</nombre>
    <fresas>31</fresas>
  </capitulo>
  <capitulo>
    <nombre>Chapter 6: Reflection</nombre>
    <fresas>0</fresas>
  </capitulo>
  <capitulo>
    <nombre>Chapter 7: The Summit</nombre>
    <fresas>47</fresas>
  </capitulo>
  <capitulo>
    <nombre>Chapter 8: Core</nombre>
    <fresas>5</fresas>
  </capitulo>
</capitulos>
```

<!-- Comparación de imagenes finales sin fresas -> con fresas -->
![Sin fresas](https://th.bing.com/th/id/R.1b08516140474a5455042386d0646e7c?rik=dzdjeDWYkaY%2f5w&pid=ImgRaw&r=0)
![Con fresas](https://www.gamersdecide.com/sites/default/files/authors/u144656/9bvgz.jpg)

### Código fuente
El código fuente del juego puede conseguirse en su proyecto de [GitHub](https://github.com/NoelFB/Celeste/tree/master) y está escrito totalmente en lenguaje C#. A continuación un ejemplo de su código y la versión de Python que correspondería:

#### C#
```cs
switch (IntroType)
  {
    case IntroTypes.Respawn:
      StateMachine.State = StIntroRespawn;
      JustRespawned = true;
      ...
```

#### Python
```py
match (IntroType):
  {  
  case IntroTypes.Respawn:
    StateMachine.State = StIntroRespawn;
    JustRespawned = True;
    ...
```

*El sentimiento que Celeste quiere transmitir puede ser diferente para cada uno de nosotros, pero, es acertado decir que alcanzar la cima, significa que “finalmente te has aceptado a ti mismo, ahora puedes continuar con tu vida y que definitivamente hay algo más allá afuera”.*

![end photo](https://i.ytimg.com/vi/MDi8V9C2LlM/maxresdefault.jpg)

</div>
