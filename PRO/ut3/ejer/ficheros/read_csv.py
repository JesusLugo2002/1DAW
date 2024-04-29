# ********************
# LEYENDO FICHEROS CSV
# ********************
from pathlib import Path


def run(datafile: Path) -> list:
    input_file = open(datafile)
    keys_list = input_file.readline().strip().split(',')
    data = []
    data_group = {}

    for line in input_file:
        values_list = line.strip().split(',')
        for key, value in zip(keys_list, values_list):
            if value.isnumeric():
                value = int(value)
            elif value == '':
                value = None
            elif value == 'False':
                value = False
            elif value == 'True':
                value = True
            data_group[key] = value
        data.append(data_group.copy())

    return data


if __name__ == '__main__':
    run('data/read_csv/pokemon.csv')