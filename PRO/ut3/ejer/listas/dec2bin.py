# *****************
# DECIMAL A BINARIO
# *****************


def run(num: int) -> str:
    binaries = []
    while True:
        binaries.append(str(num % 2))
        num = int(num/2)
        if num < 2:
            if num == 1:
                binaries.append(str(num))
            break
    
    to_bin = ''.join(reversed(binaries))

    return to_bin


if __name__ == '__main__':
    run(1)