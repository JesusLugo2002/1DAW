# *************************
# MOVIMIENTOS DE INVENTARIO
# *************************


def run(imoves: str) -> dict:
    inventory = {}
    for move in imoves.split(','):
        # CONSEJO: Reemplazar move[0] por 'article' y move[1] por 'quantity'.
        # OTRO: Todo el if se puede evitar si se utiliza la función get() de la siguiente forma:
        # -> article = move[0]
        # -> quantity = int(move[1:])
        # -> inventory[article] = inventory.get(article, 0) + quantity
        if move[0] in inventory:
            inventory[move[0]] += int(move[1:])
        else:
            inventory[move[0]] = int(move[1:])

    return inventory


if __name__ == '__main__':
    run('A1,B4,A-2,A7,B1,C4')
