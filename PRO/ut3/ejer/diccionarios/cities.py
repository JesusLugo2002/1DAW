# ********************
# DESCIFRANDO CIUDADES
# ********************


def run(cinfo: str) -> dict:
    cities = {}
    splitted_cities = cinfo.split(';')
    for info in splitted_cities:
        city, population = info.split(':')
        cities[city] = int(population)

    return cities


if __name__ == '__main__':
    run('Tokyo:38_140_000;Delhi:26_454_000;Shanghai:24_484_000;Mumbai:21_357_000')
