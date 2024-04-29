# *************************
# NO ME INTERESAN LOS PARES
# *************************


def run(items: list) -> list:
    filter = []
    for index, item in enumerate(items):
        if not index % 2 != 0:
            filter.append(item)

    return filter


if __name__ == '__main__':
    run([1, 2, 1, 2, 1, 2])
