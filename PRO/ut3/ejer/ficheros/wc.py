# ****************
# CONTANDO COMO WC
# ****************
from pathlib import Path


def run(input_path: Path) -> tuple:
    input_file = open(input_path)
    num_lines = num_words = num_bytes = 0

    for line in input_file:
        num_lines += 1
        words = line.strip().split(' ')
        if words[0] != '':
            num_words += len(words)
        num_bytes += len(line.encode('utf-8'))
    

    return num_lines, num_words, num_bytes


if __name__ == '__main__':
    run('data/wc/lorem.txt')