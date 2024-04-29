# ******************
# POBLACIÓN PROMEDIO
# ******************


def run(pdata: dict) -> dict:
    avg_data = {}
    total_pop = sum([pop for pop in pdata.values()])
    for city, pop in pdata.items():
        avg_data[city] = round(pop / total_pop * 100, 3)

    return avg_data


if __name__ == '__main__':
    run({'Tokyo': 38140000, 'Delhi': 26454000, 'Shanghai': 24484000, 'Mumbai': 21357000})
