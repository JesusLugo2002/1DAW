import sys

values = [int(num) for num in sys.argv[1:]]
result = sum(values) / len(values)

print(f'El promedio de los valores es {result:.2f}')
