import re


def do_str_oper(a: int | float, oper: str, b: int | float) -> int | float:
    match oper:
        case '+':
            result = a + b
        case '-':
            result = a - b
        case '*':
            result = a * b
        case '/':
            result = a / b
    return result


def get_expression_parts(expression: str) -> tuple[int, str, int]:
    regexp = r'(?P<a>\d+)\s*(?P<oper>[+\-*/])\s*(?P<b>\d+)'
    expr_parts = re.fullmatch(regexp, expression)
    return int(expr_parts['a']), expr_parts['oper'], int(expr_parts['b'])


def calc(expression: str) -> int | float:
    a, oper, b = get_expression_parts(expression)
    return do_str_oper(a, oper, b)
