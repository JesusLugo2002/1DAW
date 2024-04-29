# ************
# VALOR MÍNIMO
# ************


def run(values: list) -> int:
    min_value = values[0]
    for num in values:
        if num < min_value:
            min_value = num

    return min_value


if __name__ == '__main__':
    run([-11, 10, -6, 15, -1])
