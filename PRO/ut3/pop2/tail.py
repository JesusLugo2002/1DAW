# *************************
# SIMULANDO EL COMANDO TAIL
# *************************
from pathlib import Path


def run(file: Path, n: int) -> str:
    input_file = open(file)
    file_lines = input_file.readlines()
    lines = []
    num_lines = -n - 1

    for line_no in range(-1, num_lines, -1):
        lines.insert(0, file_lines[line_no])
    lines = ''.join(lines).strip()

    return lines


if __name__ == '__main__':
    run('data/tail/nba_season22.txt', 3)
