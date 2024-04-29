# ************
# VALOR MÁXIMO
# ************


def run(values: list) -> int:
    max_value = values[0]
    for num in values:
        if num > max_value:
            max_value = num

    return max_value


if __name__ == '__main__':
    run([-11, 10, -6, 15, -1])
