# ************************
# DÍGITOS EN ORDEN INVERSO
# ************************


def run(number: int) -> list:
    rev_digits = [int(num) for num in reversed(str(number))]

    return rev_digits


if __name__ == '__main__':
    run(35231)
