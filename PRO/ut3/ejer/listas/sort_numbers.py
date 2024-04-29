# *****************
# ORDENANDO NÚMEROS
# *****************


def run(numbers: list) -> list:
    sorted_numbers = []
    aux = 0
    is_sorted = True

    while True:
        is_sorted = True
        for index in range(1, len(numbers)):
            if numbers[index] < numbers[index - 1]:
                aux = numbers[index]
                numbers[index] = numbers[index - 1]
                numbers[index - 1] = aux
                is_sorted = False

        if is_sorted:
            break

    sorted_numbers = numbers.copy()

    return sorted_numbers


if __name__ == '__main__':
    run([4, 2, 9, 7, 1, 8])
