# *************************
# OBTENIENDO LOS BIESTABLES
# *************************


def is_bistable(num: int) -> bool:
    binary = bin(num)[2:]
    return binary.count('0') == binary.count('1')


def run(a: int, b: int) -> list:
    return [num for num in range(a, b + 1) if is_bistable(num)]


if __name__ == '__main__':
    run(0, 40)
