# *********************
# VOLUMEN DE UNA ESFERA
# *********************


def run(radius: float) -> float:
    PI = 3.14
    volume = 4 / 3 * PI * (radius**3)

    return volume


if __name__ == '__main__':
    run(5)
