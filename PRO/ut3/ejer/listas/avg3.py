import sys

values = [int(num) for num in sys.argv[1].split(',')]
decimals = int(sys.argv[2])
result = sum(values) / len(values)
print(f'El promedio de los valores es {round(result, decimals)}')
