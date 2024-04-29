# *********************
# ¿QUÉ ES LO SIGUIENTE?
# *********************


def run(items: list, ref_item: object) -> object:
    if ref_item not in items or items.index(ref_item) == len(items) - 1:
        target_item = None
    else:
        target_item = items[items.index(ref_item) + 1]

    return target_item


if __name__ == '__main__':
    run([1, 2, 3, 4, 5, 6, 7], 3)
