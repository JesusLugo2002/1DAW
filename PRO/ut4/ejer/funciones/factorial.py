# ************************************
# CALCULANDO EL FACTORIAL DE UN NÚMERO
# ************************************


def factorial(num):
    if num < 0:
        return None
    if num == 0:
        return 1
    if num > 0:
        factor = num
        for i in range(2, num):
            factor *= i
        return factor
