# ***************
# APLANA LA LISTA
# ***************


def run(elements: list) -> list:
    elements_copy = elements.copy()
    flatten_elements = []
    need_repeat = False

    while True:
        
        for elem in elements_copy:
            if isinstance(elem, list):
                elements_copy

    return flatten_elements


if __name__ == '__main__':
    run([0, 10, [20, [-10, [5, 5, 5], -20], 30], 40, 50, [60, 70, [-1, -2, -3], 80], [90, 100, 110, 120]])