# **************
# NÚMEROS PRIMOS
# **************


def run(n: int) -> bool:
    for i in range(2, n):
        if n % i == 0:
            isprime = False
            break
    else:
        isprime = True

    return isprime


if __name__ == '__main__':
    run(2)
