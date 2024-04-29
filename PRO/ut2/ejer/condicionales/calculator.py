num1 = int(input('Inserta el primer valor -> '))
num2 = int(input('Inserta el segundo valor -> '))
operator = input('Inserta el operador a utilizar (+, -, *, /) -> ')

match operator:
    case '+':
        print(f'{num1} + {num2} = {num1 + num2}')
    case '-':
        print(f'{num1} - {num2} = {num1 - num2}')
    case '*':
        print(f'{num1} * {num2} = {num1 * num2}')
    case '/':
        print(f'{num1} / {num2} = {num1 / num2:.2f}')
    case _:
        print('Operador inválido')
