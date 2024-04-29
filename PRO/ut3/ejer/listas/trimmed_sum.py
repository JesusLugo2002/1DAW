# **************
# SUMA RECORTADA
# **************


def run(values: list) -> int:
    tsum = 0

    if len(values) > 2:
        max_value = values[0]
        min_value = values[0]
        for num in values:
            if num > max_value:
                max_value = num
            elif num < min_value:
                min_value = num

        for _ in range(values.count(min_value)):
            values.remove(min_value)
        for _ in range(values.count(max_value)):
            values.remove(max_value)

        tsum = sum(values)

    return tsum


if __name__ == '__main__':
    run([6, 2, 1, 8, 10])
