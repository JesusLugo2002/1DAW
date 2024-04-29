def power(base, exponent=2):
    result = base**exponent
    return result


def calc_rect_area(base, height):
    area = base * height
    return area


def frange(start, end, step=1):
    chunks = []
    current = start
    while current < end:
        chunks.append(current)
        current += step
    return chunks


def integral(x1, x2, precision=1):
    result = 0
    for width in frange(x1, x2, precision):
        chunk_area = calc_rect_area(precision, power(width))
        result += chunk_area
    return result


print(integral(0, 2, 0.0001))
