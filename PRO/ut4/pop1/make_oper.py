# *******************
# CREANDO OPERACIONES
# *******************


def make_oper(oper: str):
    def operation(num1: int | float, num2: int | float) -> int | float | None:
        match oper:
            case 'add':
                result = num1 + num2
            case 'sub':
                result = num1 - num2
            case 'mul':
                result = num1 * num2
            case 'div':
                result = num1 / num2
            case _:
                result = None
        return result

    return operation


def run(oper: str, num1: int | float, num2: int | float) -> int | float | None:
    operation = make_oper(oper)
    result = operation(num1, num2)
    return result
