# *******************************
# ASEGURANDO ARGUMENTOS POSITIVOS
# *******************************


def assert_positive(func):
    def wrapper(*args, **kwargs):
        for arg in args:
            if not isinstance(arg, int):
                return None
        for kwarg in kwargs:
            if not isinstance(kwarg, int):
                return None
        return func(*args, **kwargs) if args[0] >= 0 else 0

    return wrapper


@assert_positive
def factorial(n: int) -> int:
    return 1 if n == 0 else n * factorial(n - 1)
