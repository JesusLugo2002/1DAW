# ****************************************
# ENCONTRANDO EL PRIMER Y EL ÚLTIMO DÍGITO
# ****************************************


def run(text: str) -> tuple:
    digits = [digit for digit in text if not digit.isalpha()]
    first_digit = int(digits[0])
    last_digit = int(digits[-1])

    return first_digit, last_digit


if __name__ == '__main__':
    run('1abc2')
