# *******************************
# ADIVINANDO PERSONAJES DE MARVEL
# *******************************


def run(can_fly: bool, is_human: bool, has_mask: bool) -> str:
    character = 'output'
    if can_fly:
        if is_human:
            if has_mask:
                character = 'Ironman'
            else:
                character = 'Captain Marvel'
        else:
            if has_mask:
                character = 'Ronan Accuser'
            else:
                character = 'Vision'
    else:
        if is_human:
            if has_mask:
                character = 'Spiderman'
            else:
                character = 'Hulk'
        else:
            if has_mask:
                character = 'Black Bolt'
            else:
                character = 'Thanos'

    return character


if __name__ == '__main__':
    run(True, True, True)
