import os
import random
import string

EMPTY = ''

UNEXPLORED = '⬛'
WATER = '🟦'
TOUCHED = '🟧'
SUNKEN = '🟥'


def generate_board(
    size: int = 10,
    sheeps: tuple[tuple[int, int]] = ((5, 1), (4, 1), (3, 2), (2, 1)),
) -> list[list[str]]:
    board = [[EMPTY for _ in range(size)] for _ in range(size)]
    for sheep_size, num_sheeps in sheeps:
        placed_sheeps = 0
        while placed_sheeps < num_sheeps:
            sheep_id = f'{sheep_size}{string.ascii_uppercase[placed_sheeps]}'
            row, col = random.randint(0, size), random.randint(0, size)
            step = random.choice((-1, 1))
            row_step, col_step = (step, 0) if random.randint(0, 1) else (0, step)
            breadcrumbs = []
            for _ in range(sheep_size):
                try:
                    if not (0 <= row < size and 0 <= col < size):
                        raise IndexError()
                    if board[row][col] == EMPTY:
                        board[row][col] = sheep_id
                        breadcrumbs.append((row, col))
                    else:
                        raise IndexError()
                    row += row_step
                    col += col_step
                except IndexError:
                    # reset board
                    for bc in breadcrumbs:
                        board[bc[0]][bc[1]] = EMPTY
                    break
            else:
                placed_sheeps += 1

    return board


def show_board(board: list[list[str]]) -> None:
    for row in board:
        for item in row:
            print(f'[{item:2s}]', end='')
        print()


# TU CÓDIGO DESDE AQUÍ HACIA ABAJO
# ↓↓↓↓↓↓↓↓↓

LETTERS = 'ABCDEFGHIJ'
board = generate_board()
game_board = [[UNEXPLORED for _ in range(11)] for _ in range(11)]
player_name = ''
player_points = 0
previous_movements = []
touched_ships = []
ships = []
base_ships_count = ships_count = 5
is_invalid = False
i_am_tired_of_playing_this_thing = False

# Contabilización previa de las partes de barco
for row in board:
    for elem in row:
        if elem != EMPTY:
            ships.append(elem)

# 1. Introducción y nombre de jugador

print()
print(
    """Hola, soy Patricio, ser omnipotente, narrador de esta emocionante historia...
Por favor, siéntate bien, para evitar problemas de salud, y disfruta de esta aventura...

      /`·.¸\n     /¸...¸`:·\n ¸.·´  ¸   `·.¸.·´)\n: © ):´;      ¸  {\n `·.¸ `·  ¸.·´\\`·¸)\n     `\\´´\\¸.·´"""
)
print()
input('Presiona Enter para continuar...')
print()
print(
    """Eres un joven pirata novato, navegando en medio de las insondables aguas de la noche. 
La negrura te envuelve, pero de repente, el sonido lejano de cañones rompe el silencio..."""
)
input()
print(
    """Un escalofrío recorre tu espina dorsal cuando una voz retumbante te desafía: 
"¡Encuéntranos, insensato!" Barba Negra, el pirata más temido, te ha tendido una trampa. 
En la penumbra, una flota invisible se acerca, decidida a hundirte en las profundidades del mar...

⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⠁⢼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⠟⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⠁⠀⣺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣿⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⡿⠁⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⢧⠇⢀⣷⠘⢿⣿⣿⣿⣿⣿⣻⣿⣿⣿⣿⣿⣿⣿⢟⣯⣿⡿⢻⠏⣦⠉⠋⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⢀⣾⣿⣄⠈⢻⡓⠟⢻⣿⣇⣧⣸⡿⢿⣿⡇⣻⣿⠞⢿⣧⠏⣼⣷⣄⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⡿⠃⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⣼⣿⣿⣿⣷⡀⠈⢸⣀⢸⣿⣿⠿⡃⣼⣿⣻⢻⣿⣠⠟⣣⣾⣿⣷⣿⡆⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⡅⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⢰⣿⣾⡟⠀⠻⡿⣦⡀⠈⠉⠙⢺⢸⣏⣿⢣⣟⡚⠛⣀⣾⡿⠛⠁⣿⣿⡇⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿
⣿⡿⠃⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⠈⢿⣿⣧⡀⠸⠿⠞⠻⣦⣀⣠⢟⣿⣿⣿⣈⡁⣠⣾⠟⠛⣿⣤⣾⣿⡿⠁⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⡇⢻⡝⣿⣿⣿⣿⣿
⡏⠁⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠹⠿⣿⣷⣶⣶⣶⡿⣿⣷⡿⣿⣿⣿⣿⣿⣿⣷⣶⣾⣿⣿⠟⠟⠁⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠹⣟⠻⣿⣿⣿
⠂⠀⣰⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⣠⠀⠀⠀⠀⠀⠀⠈⠉⠀⠀⠈⠙⠲⣿⣿⣿⠃⠀⠀⠈⠉⠉⠉⠀⠀⠀⠀⠀⠰⣄⠀⢹⣿⣿⣿⣿⣿⣿⣿⡅⢸⠀⠙⣆⢻⣿⣿
⢀⣴⣿⡿⢃⣼⢛⣿⣿⢟⣿⣿⣿⣿⣿⢀⣞⡥⠚⠀⠀⠀⠀⣀⣠⠤⠄⠀⠀⢠⣾⣿⣿⣧⡄⠀⠀⠰⠲⢦⣀⠀⠀⠀⠈⠉⢑⣺⣷⡌⣿⣿⣿⣿⣿⣿⣿⡇⣿⠂⠀⠘⢯⣿⣿
⣾⣿⠟⢁⣼⡏⣸⣿⡟⢲⢈⣿⣿⣿⡏⣾⣿⣷⡶⢶⣶⣶⣿⣿⠿⣶⢦⡀⠀⠈⠛⠿⣿⡿⠃⠀⣀⣴⡶⢺⣿⣹⣷⣾⣿⡿⣿⣿⣿⡇⢻⣿⡏⢿⣿⣿⣿⣇⣿⡄⠀⠀⣼⣿⣿
⠟⠁⠀⢸⣿⠁⣿⡿⣰⣡⣿⢇⣿⣿⠁⢻⣯⣿⣍⠻⠭⣹⣿⣿⣿⣧⣼⣿⣦⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⠿⢛⠵⣿⡏⡇⠸⣿⣿⠘⣧⣿⣿⣿⣾⠄⠀⣴⣿⣿⣿
⠀⠀⠀⢸⣿⣈⣿⠃⣧⣯⣿⣸⢉⣗⠀⢸⢸⢹⣏⢳⣤⣈⠙⠲⢿⣿⣿⣻⢿⣷⣶⣤⣴⣶⣾⣿⡿⣿⣿⠿⠟⠛⣉⡤⠚⡇⢸⣟⢧⡇⠀⣿⣿⡄⢻⣸⡯⣿⣸⡇⢤⣿⣿⣿⣿
⡀⠀⠀⠀⣿⣿⣷⣸⣿⠀⣬⣿⣿⣯⡀⠸⣿⡆⢿⡎⣇⠈⢹⠓⠦⢤⣄⣉⠉⠉⠉⠉⠉⠉⠉⠉⣉⣡⡤⠖⢺⣿⣿⠀⣀⣤⣿⣸⢸⠃⢰⣿⣿⠇⢼⣿⣿⣿⡿⣀⣾⣿⣿⣿⣿
⠁⡆⠀⠸⣿⣿⣿⣿⡏⢰⣿⣿⣿⣿⣿⡀⢿⢻⠘⣿⣿⣄⡀⠀⠀⠀⠘⡌⠉⠙⢻⠞⠉⠉⢙⣿⣿⣿⠀⢀⣸⣯⣿⣿⣿⣿⡇⡟⣾⠀⣾⣿⣿⠦⣙⡙⠍⣿⣇⣼⣿⣿⣿⣿⣟
⡀⢹⣤⣤⣟⣿⣯⣿⡿⠸⣾⣿⣯⣿⣾⣧⢘⣏⢧⠸⣿⣿⣛⣷⣦⣤⣤⣧⣀⣀⣘⣆⣀⣀⣸⡿⣿⡌⣿⡟⠛⣿⣷⠿⣿⡿⠸⢧⠏⢼⣿⣿⢹⣀⠸⢧⠀⣿⣿⣿⣿⣿⣿⣧⣹
⡇⢸⣿⣿⣿⣯⣿⠟⠁⠀⠀⠀⣷⡇⣿⣿⣼⡆⠀⠀⢹⣿⠻⣿⣟⠛⠉⠿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠛⡹⠃⠀⣿⠟⣯⣿⠇⠈⢠⣌⣿⣿⣿⡿⢸⢶⠈⠣⣾⣿⣿⣿⡽⢻⡜⡟
⡇⢸⡟⣿⣿⣿⡟⠀⠀⠀⠀⠀⣬⣿⣿⣽⡿⣷⣢⠀⠀⢿⣷⠙⢿⣦⣀⡀⠐⠿⣿⣿⣶⣷⣿⡗⠄⢂⣃⡤⠚⠉⣇⡟⡟⠀⢀⣼⣿⣿⣻⣍⢃⠘⠀⠀⠀⣿⣿⣿⢿⣧⠀⢿⣷
⣇⠀⡧⣿⣿⡇⠀⠀⠀⠀⠀⠀⣿⡇⠿⠛⠧⠙⢿⣆⡀⠘⡎⢧⣨⠀⠈⢹⡀⠀⠉⣾⠿⠯⠿⢲⡋⠉⠀⢹⠀⢠⡟⣸⠁⢀⢺⡿⠛⠙⢿⣿⢸⣴⣀⠀⣰⣿⣿⣿⢸⣿⡄⠘⣧
⣿⠀⣇⣿⡿⠁⠀⠀⠀⠀⠀⠀⠁⠁⠀⠀⠀⠀⠸⢿⣿⣀⠹⡌⠻⢦⣀⠘⣿⣶⣶⣿⠀⠀⠀⠨⡇⠀⣀⣸⣴⡟⢡⠇⢀⣿⣿⠁⠀⠀⠈⢻⡎⣿⣿⣿⣿⣿⡏⢹⢸⣿⣧⠀⢹
⡏⢰⣿⡇⠀⠀⢀⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢾⣿⣿⡄⠙⢦⡀⠈⠉⠛⠻⠿⠛⠿⢶⠾⠿⠛⠟⠛⠉⣁⣤⠟⢀⣾⣿⣿⠀⠀⠀⠀⠀⠁⠙⣿⣿⣿⣿⡆⠸⣿⡼⣿⡄⠈
⡇⢸⣾⢣⣄⣴⢾⠸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣟⣿⣷⣦⠀⠉⠓⣶⡤⠤⣤⣤⣤⢤⣤⣤⣤⣶⣶⣿⡍⠀⢀⣾⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣯⣧⡄⣿⣇⢻⣷⠀
⡷⢸⣿⣿⡟⣇⣸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣶⣆⣒⣿⣧⣿⣿⣿⠟⢸⣿⠟⣿⣿⡿⣇⣦⣴⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣏⠹⣿⣿⡇⣿⣿⠀⢻⣇
⢃⣾⣼⣿⣇⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣦⣼⣿⣶⣾⣯⣷⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠀⠈⠻⣿⣷⣿⣇⠀⢯
⣾⣿⣥⣿⣿⡿⠀⣄⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢫⣿⡴⣿⡆⠈
⣿⣿⣿⣿⣿⡷⠸⢿⠰⢻⡷⡆⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣷⢸⣸⣿⣿⡏⠀
⠉⠿⣿⣿⣿⠛⢦⣼⣿⣿⡍⣇⡈⡙⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⡶⣾⣟⣿⣿⣟⣹⡷⢿⣿⡀"""
)
input()
print(
    """Con rapidez, te levantas y das la orden a tu tripulación: "¡Todos a los cañones, nos atacan!" 
Los marineros, fieles a bordo de tu barco, se apresuran a ocupar sus posiciones. 
Ha llegado el momento de demostrar tu valía como pirata. 

              |    |    |                 \n             )_)  )_)  )_)              \n            )___))___))___)\\            \n           )____)____)_____)\\\\\n         _____|____|____|____\\\\\\__\n---------\\                   /---------\n  ^^^^^ ^^^^^^^^^^^^^^^^^^^^^\n    ^^^^      ^^^^     ^^^    ^^\n         ^^^^      ^^"""
)
input()
player_name = input('¿Cómo se llama, navegante? --> ')
print()
print(
    'Con la mirada fija en la oscuridad, te preparas para el enfrentamiento, listo para hacerlos caer con precisión y perspicacia.'
)
input()

# 2. Bucle principal

while True:
    os.system('clear')
    ### Mostrar mapa
    print()
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
    print(f'-=- QUEDAN {ships_count} BARCOS ENEMIGOS -=- ')
    print(f'Jugador {player_name} | Puntos: {player_points} | Turnos: {len(previous_movements)}')
    print()

    ### Preguntar casilla a atacar -> detectar entradas incorrectas
    while True:
        order = (
            input("¿Dónde va a atacar? <A-J><1-10> (O escriba 'salir' para dejar la partida) --> ")
            .upper()
            .replace(' ', '')
        )

        if order == 'SALIR':
            i_am_tired_of_playing_this_thing = True
            break

        is_invalid = False

        for index, character in enumerate(order):
            if index == 0 and character.isnumeric():
                print('MOVIMIENTO DENEGADO: Entrada errónea')
                is_invalid = True
                break

            if index > 0 and character.isalpha():
                print('MOVIMIENTO DENEGADO: Entrada errónea')
                is_invalid = True
                break

            if not character.isalnum():
                print('MOVIMIENTO DENEGADO: Se encuentran carácteres inválidos.')
                is_invalid = True
                break

        if is_invalid:
            continue

        if len(order) < 2 or len(order) > 3:
            print('MOVIMIENTO DENEGADO: Entrada errónea.')
            continue

        if order[0] not in LETTERS:
            print('MOVIMIENTO DENEGADO: La letra debe estar en el rango A-J.')
            continue

        if int(order[1:]) < 1 or int(order[1:]) > 10:
            print('MOVIMIENTO DENEGADO: El número debe estar en el rango 1-10.')
            continue

        order_letter = LETTERS.index(order[0])
        order_number = int(order[1:]) - 1

        if order not in previous_movements:
            previous_movements.append(order)
            break
        else:
            print('MOVIMIENTO DENEGADO: Ya has realizado este ataque.')

    if i_am_tired_of_playing_this_thing:
        break

    ### Ejecutar cambio de casillas y puntaje
    targeted_box = board[order_letter][order_number]
    if targeted_box == EMPTY:
        game_board[order_letter + 1][order_number + 1] = WATER
        player_points -= 1
    else:
        touched_ships.append(targeted_box)
        if ships.count(targeted_box) == touched_ships.count(targeted_box):
            player_points += 4 * int(targeted_box[0])

            for row_index, row in enumerate(board):
                for col_index, elem in enumerate(row):
                    if elem == targeted_box:
                        game_board[row_index + 1][col_index + 1] = SUNKEN

            ships_count -= 1

        else:
            game_board[order_letter + 1][order_number + 1] = TOUCHED
            player_points += 2 * int(targeted_box[0])

    ### Fin del bucle principal si todos los barcos fueron tocados.

    if len(touched_ships) == len(ships):
        os.system('clear')
        print()
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
        print(
            f'Jugador {player_name} | Puntos: {player_points} | Turnos: {len(previous_movements)}'
        )
        break

# 3. Creditos

if not i_am_tired_of_playing_this_thing:
    print()
    print(
        f"""Enhorabuena, valiente {player_name}. Has vencido a {base_ships_count} barcos enemigos sin apenas vislumbrar lo que te rodea. 
    Con astucia y determinación, has utilizado {len(previous_movements)} cañonazos para superar la amenaza.
    Tu puntuación final es de {player_points} puntos..."""
    )
    print()
    input('Presiona Enter para continuar...')
    print()
    print(
        """Aunque te has quedado sin munición, sigues con vida, demostrando que incluso en la más profunda oscuridad, tu destreza como pirata brilla con intensidad.
    Como recompensa por tu valentía, el Consejo de Piratas decreta que has ascendido de rango.
    Las sirenas cantarán sobre ti, propagando tu leyenda por todos los mares conocidos. 
    ¡Que tu nombre resuene en las olas y tu historia sea contada de isla en isla!"""
    )
    print()
    print(
        """Y con esto yo, Patricio, me despido de ti. Nos volveremos a ver, navegante...
    Tenlo por seguro...

        /`·.¸\n     /¸...¸`:·\n ¸.·´  ¸   `·.¸.·´)\n: © ):´;      ¸  {\n `·.¸ `·  ¸.·´\\`·¸)\n     `\\\\´´\\¸.·´

    """
    )
else:
    print('HAHA TO MALO XD')
