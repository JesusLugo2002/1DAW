# ***********************************
# ¿DÓNDE ESTÁN LAS PALABRAS? MATARILE
# ***********************************
from pathlib import Path


def run(data_path: Path, target_word: str) -> list:
    matches = []
    data_file = open(data_path)
    target_word_lowered = target_word.lower()

    for line_num, line in enumerate(data_file):
        fixed_line = ''
        for char in line:
            if char.isalnum() or char == ' ':
                fixed_line += char.lower()
        if target_word_lowered in fixed_line:
            col_num = line.lower().find(target_word_lowered) + 1
            matches.append((line_num + 1, col_num))

    return matches


if __name__ == '__main__':
    run('data/find_words/bzrp.txt', 'persona')
