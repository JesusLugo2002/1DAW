# ******************
# TUPLAS Y CONJUNTOS
# ******************


def run(input: tuple) -> tuple:
    first_set = set()
    second_set = set()
    for first_v, second_v in input:
        first_set.add(first_v)
        second_set.add(second_v)
    output = first_set, second_set

    return output


if __name__ == '__main__':
    run(((4, 3), (8, 2), (7, 5), (8, 2), (9, 1)))
