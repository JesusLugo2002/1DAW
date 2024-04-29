# *****************
# NÚMEROS PERFECTOS
# *****************

def get_dividers(num: int):
    return [n for n in range(1, num) if num % n == 0]


def is_perfect(num: int) -> bool:  
    return sum(get_dividers(num)) == num

