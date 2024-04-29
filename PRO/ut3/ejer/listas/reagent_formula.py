# ************
# ELLA QUÍMICA
# ************


def run(formula: list) -> bool:
    valid = True
    while True:
        # Regla 1
        if 1 in formula and 2 in formula:
            valid = False
            break
        # Regla 2
        if 3 in formula and 4 in formula:
            valid = False
            break
        # Regla 3
        if 5 in formula or 6 in formula:
            if 5 in formula and 6 in formula:
                valid = True
            else:
                valid = False
                break
        # Regla 4
        if 7 in formula or 8 in formula:
            valid = True
        break
    return valid


if __name__ == '__main__':
    run([1, 3, 7])