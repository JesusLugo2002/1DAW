# ***********************
# PARTICIÓN POR EL NÚMERO
# ***********************


def run(values: list, ref_value: int) -> list:
    npartition = [[], []]
    for num in values:
        if num < ref_value:
            npartition[0].append(num)
        elif num >= ref_value:
            npartition[1].append(num)

    return npartition


if __name__ == '__main__':
    run([4, 3, 2, 9, 8, 5], 4)
