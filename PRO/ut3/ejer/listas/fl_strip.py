# ****************
# TROCEADO EXTREMO
# ****************


def run(numbers: str) -> str:
    strip_numbers = ' '.join(numbers[1 : len(numbers) - 1].split(',')).strip()

    return strip_numbers


if __name__ == '__main__':
    run('1,2,3')
