# ********************
# INTERVALO DESPLEGADO
# ********************


def run(interval: str) -> list:
    first_symbol = interval[0]
    last_symbol = interval[-1]
    splitted_interval = interval[1:-1].split(',')
    min_interval = (
        int(splitted_interval[0]) if first_symbol == '[' else int(splitted_interval[0]) + 1
    )
    max_interval = (
        int(splitted_interval[1]) if last_symbol == ')' else int(splitted_interval[1]) + 1
    )

    irange = [num for num in range(min_interval, max_interval)]

    return irange


if __name__ == '__main__':
    run('[3,10]')
