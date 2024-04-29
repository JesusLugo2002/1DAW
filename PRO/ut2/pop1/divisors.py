# ******************
# CONTANDO DIVISORES
# ******************


def run(number: int) -> int:
    OFFSET = 1  # Constante para el funcionamiento correcto del range: sin divisiones entre 0 y con el número completo
    num_divisors = 0
    for divisor in range(OFFSET, number + OFFSET):
        if number % divisor == 0:  # Si es divisor, se añade al contador
            num_divisors += 1

    return num_divisors


if __name__ == '__main__':
    run(67)
