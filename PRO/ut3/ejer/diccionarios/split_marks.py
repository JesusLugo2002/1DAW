# *********************
# CADA NOTA EN SU SITIO
# *********************


def run(marks: dict) -> tuple:
    passed = {name.upper(): mark for name, mark in marks.items() if mark >= 5}
    failed = {name.lower(): mark for name, mark in marks.items() if mark < 5}

    return passed, failed


if __name__ == '__main__':
    run({'Ana': 4, 'Domingo': 7, 'Eva': 5, 'Álvaro': 3, 'Juan': 8, 'Belén': 1})
