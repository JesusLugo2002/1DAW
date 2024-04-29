# ****************
# PRODUCTO ESCALAR
# ****************


def run(vector1: list, vector2: list) -> float:
    dprod = 0
    diff = abs(len(vector1) - len(vector2))
    if diff == 0:
        for value1, value2 in zip(vector1, vector2):
            dprod += value1 * value2
    else:
        dprod = None

    return dprod


if __name__ == '__main__':
    run([4, 3, 8, 1], [9, 2, 7, 3])
