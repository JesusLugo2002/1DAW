# **************
# AÑOS BISIESTOS
# **************


def run(year: int) -> bool:
    is_leap_year = False
    if year % 4 == 0:
        if year % 100 != 0 or year % 400 == 0:
            is_leap_year = True

    return is_leap_year


if __name__ == '__main__':
    run(1900)
