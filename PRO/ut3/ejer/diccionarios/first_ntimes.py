# ********************************
# PRIMER ELEMENTO REPETIDO N-VECES
# ********************************


def run(numbers: list, nrep: int) -> int:
    nums_dict = {}
    target_num = -1
    for num in numbers:
        nums_dict[num] = nums_dict.get(num, 0) + 1
        if nums_dict[num] == nrep:
            target_num = num
            break

    return target_num


if __name__ == '__main__':
    run([2, 3, 5, 3, 2, 1, 8, 2], 3)
