# *******************
# NÚMERO EN INTERVALO
# *******************


def in_range(value: int, /, lower_limit: int, upper_limit: int) -> bool:
    return value in range(lower_limit, upper_limit + 1)
