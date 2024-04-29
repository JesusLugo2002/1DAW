# ******************************
# VALORES IGUALES EN DICCIONARIO
# ******************************


def run(items: dict) -> bool:
    all_same = True
    ref_value = list(items.values())[0] if len(items) > 0 else None
    if (
        ref_value != None
    ):  # CONSEJO: El if podría añadirse en la linea 9 como len(items) > 0 y se simplicaría mucho el código.
        for value in items.values():
            if value != ref_value:
                all_same = False
                break

    return all_same


if __name__ == '__main__':
    run({'a': 1, 'b': 1, 'c': 1, 'd': 1})
