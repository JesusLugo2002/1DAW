# *******************
# GENERANDO CUADRADOS
# *******************


def gen_sq(n: int) -> list[int]:
    """Return a list with squared numbers until n limit.

    :param n: limit number
    :type n: int

    :return: squared numbers
    :rtype: list[int]
    """
    return list(num**2 for num in range(n))
