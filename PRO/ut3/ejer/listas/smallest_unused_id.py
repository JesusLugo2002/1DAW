# *****************
# MENOR ID SIN USAR
# *****************


def run(ids: list) -> int:
    smallest_unused_id = 0
    max_id = ids[0]
    ids_unused = []

    for id in ids:
        if id > max_id:
            max_id = id

    ids_unused = sorted([num for num in range(1, max_id + 1) if num not in ids])
    if len(ids_unused) > 0:
        smallest_unused_id = ids_unused[0]
    else:
        smallest_unused_id = sorted(ids)[-1] + 1

    return smallest_unused_id


if __name__ == '__main__':
    run([3, 1, 8, 4, 9])
