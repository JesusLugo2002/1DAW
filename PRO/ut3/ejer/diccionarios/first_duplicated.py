# *************************
# PRIMER ELEMENTO DUPLICADO
# *************************


def run(numbers: list) -> int:
    nums_dict = {}
    fdup = -1
    for num in numbers:
        nums_dict[num] = nums_dict.get(num, 0) + 1
        if nums_dict[num] > 1:
            fdup = num
            break

    return fdup


if __name__ == '__main__':
    run([2, 3, 5, 3, 2])
