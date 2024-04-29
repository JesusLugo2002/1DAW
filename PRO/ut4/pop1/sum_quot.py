# *****************
# SUMA DE COCIENTES
# *****************


def sum_quot(n: int) -> float:
    return 1 if n == 1 else sum_quot(n - 1) + 1 / n
