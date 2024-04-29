# ********************
# REORGANIZANDO FECHAS
# ********************


def run(input_date: str, base_year: int) -> str:
    date = input_date.split('/')
    day = int(date[1])
    month = int(date[0])
    year = base_year + int(date[2])

    output_date = f'{day:02d}-{month:02d}-{year}'

    return output_date


if __name__ == '__main__':
    run('12/31/23', 2000)
