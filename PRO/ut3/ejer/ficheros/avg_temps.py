# *******************
# TEMPERATURAS MEDIAS
# *******************
import filecmp
from pathlib import Path


def run(input_path: Path) -> bool:
    output_path = 'data/avg_temps/avg_temps.dat'
    temperatures_file = open(input_path)

    with open(output_path, 'w') as avg_file:
        for line in temperatures_file:
            avg = 0
            values = line.strip().split(',')
            avg = sum([int(num) for num in values]) / len(values)
            avg_file.write(f'{avg:.2f}' + '\n')

    return filecmp.cmp(output_path, 'data/avg_temps/.expected', shallow=False)


if __name__ == '__main__':
    run('data/avg_temps/temperatures.dat')
