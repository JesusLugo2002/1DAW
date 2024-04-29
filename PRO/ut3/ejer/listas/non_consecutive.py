# *******************
# NO ERES CONSECUTIVO
# *******************


def run(values: list) -> int:
    target = None

    if len(values) > 1:
        for index, num in enumerate(values[: len(values) - 1]):
            if num + 1 != values[index + 1]:
                target = values[index + 1]
                break

    return target


if __name__ == '__main__':
    run([1, 2, 3, 4, 6, 7, 8])
