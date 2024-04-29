# *********************
# ORDENE MI DICCIONARIO
# *********************


def run(unsorted_items: dict) -> list:
    sorted_values = sorted([(value, key) for key, value in unsorted_items.items()])
    sorted_items = [(key, value) for value, key in sorted_values]

    return sorted_items


if __name__ == '__main__':
    run({'a': 'two', 'b': 'one', 'c': 'three'})