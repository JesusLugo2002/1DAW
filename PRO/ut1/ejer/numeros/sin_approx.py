# *******************
# APROXIMANDO EL SENO
# *******************


def run(x: float) -> float:
    sin = (4 * x * (180 - x)) / (40500 - x * (180 - x))

    return sin


if __name__ == '__main__':
    run(90)
