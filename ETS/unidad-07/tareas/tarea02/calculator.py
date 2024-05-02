def my_sum(a: int | float, b: int | float) -> int | float:
    return a + b

def my_sub(a: int | float, b: int | float) -> int | float:
    return a - b

def my_mul(a: int | float, b: int | float) -> int | float:
    return a * b

def my_div(a: int | float, b: int | float) -> int | float:
    return a // b if not isinstance(a, float) or not isinstance(b, float) else a / b

def my_pow(a: int | float, b: int | float) -> int | float:
    return a ** b