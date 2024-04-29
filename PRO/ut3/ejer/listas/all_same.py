# *****************************
# SOMOS IGUALES, PERO DISTINTOS
# *****************************


def run(items: list) -> bool:
    all_same = False if items.count(items[0]) != len(items) else True

    return all_same


if __name__ == '__main__':
    run([1, 1, 1, 1, 1, 1])
