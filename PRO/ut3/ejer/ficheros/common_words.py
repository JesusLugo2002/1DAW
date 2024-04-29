# *************************
# BUSCANDO PALABRAS COMUNES
# *************************
import filecmp
from pathlib import Path


def run(input_path: Path) -> bool:
    output_path = 'data/common_words/output.txt'
    input_lines = open(input_path).readlines()

    with open(output_path, 'w') as output_file:
        for line in input_lines:
            for other_line in input_lines:
                common_words = len(set(line.split(' ')) & set(other_line.split(' ')))
                output_file.write(f'{common_words}\n')

    return filecmp.cmp(output_path, 'data/common_words/.expected', shallow=False)


if __name__ == '__main__':
    run('data/common_words/minizen.txt')
