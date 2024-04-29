# ***********************
# SUBCONJUNTOS EN CASCADA
# ***********************


def run(values: list, size: int) -> list:
    cascading = []
    if len(values) > 0:
        for index in range(len(values)):
            if len(values[index:index+size]) != size:
                break
            cascading.append([num for num in values[index:index+size]])
            

    return cascading


if __name__ == '__main__':
    run([1, 2, 3, 4], 3)