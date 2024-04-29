# *********************************
# COMPROBANDO IGUALDAD DE POTENCIAS
# *********************************


def run(n: int) -> tuple:
    left_side = sum([num for num in range(1, n + 1)]) ** 2
    right_side = sum([num**3 for num in range(1, n + 1)])

    return left_side, right_side


if __name__ == '__main__':
    run(1)
