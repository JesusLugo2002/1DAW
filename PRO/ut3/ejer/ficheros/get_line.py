# *****************
# HAN CANTADO LÍNEA
# *****************
from pathlib import Path


def run(input_path: Path, line_no: int) -> str:
    input_file = open(input_path)
    line = None
    if line_no > 0:
        for num_ln, ln in enumerate(input_file):
            if line_no == num_ln + 1:
                line = ln.strip()
                break

    return line


if __name__ == '__main__':
    run('data/get_line/nasdaq.txt', 20)