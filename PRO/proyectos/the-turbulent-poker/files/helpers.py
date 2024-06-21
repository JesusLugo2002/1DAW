import random
from typing import Generator, Iterable, MutableSequence


def randint(a: int = -1, b: int = -1, /) -> int:
    '''Genera un valor aleatorio entre a y b (incluidos)'''
    if b == -1:
        a, b = 0, a
    if a < 0 or b < 0:
        raise ValueError('Args must be positive!')
    if a > b:
        raise ValueError('Upper bound must be greater than lower bound!')
    return random.randint(a, b)


def shuffle(items: MutableSequence) -> None:
    '''Baraja una serie de items (in-situ)'''
    random.shuffle(items)


def combinations(values: Iterable, *, n: int) -> Generator:
    '''Genera todas las combinaciones de "values" de tamaño "n"'''

    def combinations_helper(items, k=0, h=0):
        if k == n:
            yield tuple(items)
        else:
            for i in range(h, len(values)):
                items[k] = values[i]
                yield from combinations_helper(items, k + 1, i + 1)

    return combinations_helper([None] * n)
