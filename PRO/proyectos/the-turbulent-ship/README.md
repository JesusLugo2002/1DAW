# The Turbulent Ship

<div align=center>

![gif](https://www.gifmaniacos.es/wp-content/uploads/2019/04/peces-gif-gifmaniacos.es-15.gif)

*Él es Patricio, pez de la buena suerte y mascota de nuestro juego, 'The Turbulent Ship' (Nombre no definitivo y muy dispuesto a cambios).*

</div>

## Índice

- [Introducción](#introducción)
- [Instrucciones](#instrucciones)
- [Explicación del código](#explicación-del-código)
   - [Variables](#variables)
   - [Funciones destacadas](#funciones-destacadas)
      - [Impresión del tablero](#1-impresión-de-tablero)
      - [¿Cuál casilla quiere atacar?](#2-pregunta-de-casilla-a-atacar-y-conversión-a-índices-de-tablero)
      - [Cambios en casillas y puntuación](#3-ejecutar-cambios-de-casillas-y-puntuación)
      - [Fin del juego](#4-fin-del-juego)

## Introducción

Hola, soy Patricio, ser omnipotente, narrador de esta emocionante historia; por favor, sientate bien, así evitarás problemas de salud en un futuro, y disfruta:

*Eres un joven pirata novato, navegando en medio de las insondables aguas de la noche. La negrura te envuelve, pero de repente, el sonido lejano de cañones rompe el silencio. Un escalofrío recorre tu espina dorsal cuando una voz retumbante te desafía: "¡Encuéntranos, insensato!" Barba Negra, el pirata más temido, te ha tendido una trampa. En la penumbra, una flota invisible se acerca, decidida a hundirte en las profundidades del mar. Con rapidez, te levantas y das la orden a tu tripulación: "¡Todos a los cañones, nos atacan!" Los marineros, fieles a bordo de tu barco, se apresuran a ocupar sus posiciones. Ha llegado el momento de demostrar tu valía como pirata. Con la mirada fija en la oscuridad, te preparas para el enfrentamiento, listo para hacerlos caer con precisión y perspicacia.*

## Instrucciones

1. Identificate, navegante.
2. Tus enemigos se ocultan entre la niebla en el mar, ordena tus ataques estratégicamente, pues cada bala de cañón cuenta en tu puntuación.
   - Los ataques son realizados escribiendo coordenadas del mapa, el formato es **letra+número**. Ejemplo: A3, B7, J9.
3. Se efectivo, derrota a los enemigos y disfruta de la calma luego de la tormenta :D
   - El juego se completará cuando hundas todos los barcos.

## Explicación del código

A continuación, le haré un breve resumen del código y las funciones principales que este posee como forma de presentar nuestra versión de _Hundir la Flota_ desde un punto más _técnico_:
Iniciando con la lógica que debería tener, pensamos en que el flujo básico debería ser algo como:

1. Se inicia el programa.
2. Se pregunta el nombre del jugador.
3. Inicia el bucle principal, que consiste en:
   1. Mostrar mapa visible al jugador junto a su interfaz.
   2. Preguntar la casilla a atacar.
   3. Ejecutar cambios visuales de casilla dependiendo de, si en la misma posición pero en el tablero aleatorio de barcos, se encuentra un barco, agua o la última parte de un barco ya tocado.
   4. Aumentar o disminuir los puntos dependiendo de lo anterior.
   5. Comprobar si todos las partes de los barcos fueron tocadas (lo que es igual a que todos los barcos están hundidos).
      - Si se cumple la condición, efectua un `break` y sale del bucle principal
      - Si no se ha cumplido la condición, continua con la siguiente iteración.
4. Tras salir del bucle por hundir todos los barcos, se muestra un resumen de la puntuación y los turnos necesarios.

### Variables

Las variables declaradas en el código, exceptuando las creadas por el docente, son las siguientes:

```py
LETTERS = 'ABCDEFGHIJ'
board = generate_board()
game_board = [[UNEXPLORED for _ in range(11)] for _ in range(11)]
player_name = ''
player_points = 0
previous_movements = []
touched_ships = []
ships = []
```

- **'LETTERS'**: Constante utilizada para almacenar las letras que limitan el tablero; el rango A-J
- **'board'**: El tablero generado por el código del docente, donde se hayan los barcos.
- **'game_board'**: El tablero generado por nosotros, mostrado al jugador, que posee las casillas coloreadas. Se creó utilizando una lista por comprensión dentro de otra lista por comprensión.
- **'player_name'**: Variable que almacena el nombre del jugador para mostrarlo en interfaz.
- **'player_points'**: Variable que almacena el puntaje del jugador y que se actualiza con cada ataque del mismo.
- **'previous_movements'**: Lista que contiene los movimientos ya realizados por el jugador, esto para evitar ataques repetidos y contabilizar los turnos realizados.
- **'ships' y 'touched_ships'**: Listas que contienen las partes de barcos totales y las partes de barcos atacadas, respectivamente. Ambas se utilizan para compararse entre sí y determinar cuáles barcos ya están hundidos.

### Funciones destacadas

A continuación se mostrarán algunas de las funciones principales de nuestro código:

#### 1. Impresión de tablero
```py
for row_index, row in enumerate(game_board):
   for col_index, item in enumerate(row):
      if row_index == 0:
         print(f'{str(col_index):3s}', end='')
      elif col_index == 0:
         print(f'{LETTERS[row_index-1]:3s}', end='')
      else:
         print(f'{item:2s}', end='')
   print()
print('---------------------------------')
print(f'Jugador {player_name} | Puntos: {player_points} | Turnos: {len(previous_movements)}')
print()
```

La primera función del bucle principal del juego, encargada de imprimir una matriz de *items*, los cuales son los cuadrados de colores mostrados al jugador. Según si se encuentra en la fila 0, columna 0 u otras, este imprimirá la cabecera *1-10*, el lateral *A-J* o los cuadros de colores, respectivamente.
Debajo del tablero, se muestra la pequeña interfaz que contiene el nombre del jugador, su puntuación y los turnos realizados.

#### 2. Pregunta de casilla a atacar y conversión a índices de tablero

```py
order = input('¿Dónde va a atacar? <A-J><1-10> --> ').upper().replace(' ', '')

order_letter = LETTERS.index(order[0])
order_number = int(order[1:]) - 1
```

La segunda función importante es la de obtener la casilla a atacar por parte del jugador; este hecho por un `input` aplica al final un `.upper().replace(' ', '')` para, primero, pasar las letras a mayúsculas y procesarlas luego, y segundo, eliminar los espacios blanco, esto para que cuando un jugador ponga `b4`, `B 4`o `b     4`, siempre se convertirá a `B4`.
Luego, **order_letter** equivale a la posición índice de la letra, mientras que **order_number** toma los números después de la letra y equivale al índice - 1, pues al jugador se muestra un rango de 1-10 pero el tablero trabajo con un rango de 0-9.

> Ejemplo: *El ataque B4 se convertiría en [1][3], al momento de buscar posiciones en los tableros.*

#### 3. Ejecutar cambios de casillas y puntuación

```py
targeted_box = board[order_letter][order_number]                           # 1. Guardado en variable de la casilla objetivo
if targeted_box == EMPTY:                                                  # 2. Si la casilla objetiva está vacía...
   game_board[order_letter + 1][order_number + 1] = WATER
   player_points -= 1
else:                                                                      # 3. Si no lo está (hay una parte de barco)...
   touched_ships.append(targeted_box) 
   if ships.count(targeted_box) == touched_ships.count(targeted_box):      # 4. Si las partes atacadas del objetivo son iguales a las partes totales del mismo...
      player_points += 4 * int(targeted_box[0]) 
      for row_index, row in enumerate(board):
         for col_index, elem in enumerate(row):
            if elem == targeted_box:
               game_board[row_index + 1][col_index + 1] = SUNKEN
   else:                                                                   # 5. Si no (has atacado una parte del barco pero no todas del mismo)...
      game_board[order_letter + 1][order_number + 1] = TOUCHED
      player_points += 2 * int(targeted_box[0])
```

Esta fue la parte más difícil de escribir y, para mi, de explicar del código pero trataré de hacerlo de la forma más comprensible; extrayendo partes del código sería algo como:

1. Se guarda en la variable `targeted_box` la posición determinada por el jugador (previamente transformada en la función anterior), en el tablero interno: el mapa donde se encuentran las partes del barco con sus posiciones aleatorias generadas por el código del docente.
2. Si la casilla objetivo, en el tablero interno, está vacío, se pintará de azul en el tablero visible y se restará un punto al jugador.
3. Si en la casilla objetivo hay un barco, se añadirá la parte atacada a la lista `touched_ships` para comprobar si es la última parte de un barco por hundir o no.
4. Si todas las partes de la casilla objetivo fueron atacadas, todo el barco de la casilla objetivo se hunde, aumentando la puntuación y coloreando las casillas del barco en el tablero visible de color rojo.
5. Si has atacado una parte del barco pero todavía quedan más partes del mismo, aumenta la puntuación y cambia el color de la casilla objetivo, en el tablero visible, de color amarillo.

#### 4. Fin del juego

El bucle principal del juego se rompe al momento de que todas las partes de barcos hayan sido atacadas (lo que es igual a que todos los barcos se hayan hundido). Esto se comprueba luego de cambiar el puntaje y la casilla tras el ataque, con las siguientes líneas:

```py
if len(touched_ships) == len(ships):
   # ...
   # Se ejecuta una última impresión del mapa para dejar visible el resultado final
   # ...
   break
```

Luego de esto, se muestra el mensaje de _Juego Finalizado_, donde se muestra el nombre del jugador junto a su puntuación y los turnos realizados para acabar la partida.

```py
print(f'Felicidades {player_name}, has ganado esta batalla :D')
print(f'Lo has completado en {len(previous_movements)} turnos.')
print(f'Puntaje: {player_points}')
```
