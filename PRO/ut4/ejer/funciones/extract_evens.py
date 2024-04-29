# *******************
# EXTRACCIÓN DE PARES
# *******************


def run(values: list[int]) -> list[int]:
    return [n for n in values if n % 2 == 0]