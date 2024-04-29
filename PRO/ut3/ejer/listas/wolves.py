# **************
# EL LOBO ACECHA
# **************


def run(farm: list) -> str:
    msg = ''
    if farm[-1] == 'lobo':
        msg = 'No te quiero ver más por aquí, lobo'
    else:
        for index, animal in enumerate(farm):
            if animal == 'lobo':
                sheep_in_danger_index = len(farm) - 1 if index - 1 == -1 else index - 1
                msg = f'Cuidado oveja {sheep_in_danger_index}, el lobo te va a comer'
                break

    return msg


if __name__ == '__main__':
    run(['oveja', 'oveja', 'lobo', 'oveja'])
