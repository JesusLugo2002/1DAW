# *******************************
# DECORANDO CON VALORES ABSOLUTOS
# *******************************


def fabs(func):
    def matracazo(*args, **kwargs):
        result = func(*args, **kwargs)
        return abs(result)

    return matracazo


@fabs
def fprod(a: int, b: int) -> int:
    return a * b
