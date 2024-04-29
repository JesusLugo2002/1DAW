# **************
# SUMA INVERTIDA
# **************


def run(numbers: list) -> int:
    add_inv = sum([num for num in numbers]) * -1

    return add_inv


if __name__ == '__main__':
    run([1, 2, 3, 4, 5])
