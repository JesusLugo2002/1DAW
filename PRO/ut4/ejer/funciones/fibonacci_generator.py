# *******************
# FIBONACCI GENERADOR
# *******************


def fibonacci_gen(n: int):
    for num in range(1, n):
        if num == 0:
            yield 0
        elif num == 1:
            yield 1
        else:
            yield (num-1)+(num-2)


def run(n: int) -> list[int]:
    return list(fibonacci_gen(n))
