x = 0
y = 1

for _ in range(100):
    print(x)
    x, y = y, x + y
