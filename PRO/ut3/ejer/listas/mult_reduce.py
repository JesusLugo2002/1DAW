# ************************
# MULTIPLICACIÓN EN CADENA
# ************************


def run(numbers: list) -> int:
    rmult = 1
    for num in numbers:
        rmult = rmult * num

    return rmult


if __name__ == '__main__':
    run([1, 2, 3, 4])
