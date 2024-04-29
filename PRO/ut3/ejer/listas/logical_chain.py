# ******************
# CALCULADORA LÓGICA
# ******************


def run(values: list, oper: str) -> bool:
    result = None

    match oper:
        case 'and':
            result = True
            for boolean in values:
                if boolean == False:
                    result = boolean
                    break
        case 'or':
            result = False
            for boolean in values:
                if boolean == True:
                    result = boolean
                    break

    return result


if __name__ == '__main__':
    run([True, True, False], 'and')
