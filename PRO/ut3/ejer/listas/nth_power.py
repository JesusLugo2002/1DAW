# *************
# N ELEVADO A N
# *************


def run(values: list, power: int) -> int:
    result = -1 if power > len(values)-1 else values[power] ** power

    return result


if __name__ == '__main__':
    run([1, 2, 3, 4], 2)