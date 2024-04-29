# ***********************
# REEMPLAZO DE CARACTERES
# ***********************
import filecmp
from pathlib import Path


def run(input_path: Path, replacements: str) -> bool:
    output_path = 'data/replace_chars/r_noticia.txt'
    input_file = open(input_path)
    replacements_split = replacements.split('|')

    with open(output_path, 'w') as output_file:
        for line in input_file:
            for chars_group in replacements_split:
                line = line.replace(chars_group[0], chars_group[1])
            output_file.write(line)

    return filecmp.cmp(output_path, 'data/replace_chars/.expected', shallow=False)


if __name__ == '__main__':
    run('data/replace_chars/noticia.txt', 'áa|ée|íi|óo|úu')
