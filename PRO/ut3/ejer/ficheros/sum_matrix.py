# ****************
# SUMANDO MATRICES
# ****************
import filecmp
from pathlib import Path


def run(matrix1_path: Path, matrix2_path: Path) -> bool:
    result_path = 'data/sum_matrix/result.dat'
    matrix1_file = open(matrix1_path)
    matrix2_file = open(matrix2_path)

    with open(result_path, 'w') as result_file:
        for m1_line, m2_line in zip(matrix1_file, matrix2_file):
            result_line = [str(int(value1) + int(value2)) for value1, value2 in zip(m1_line.split(' '), m2_line.split(' '))]
            result_file.write(f'{" ".join(result_line)}\n')

    return filecmp.cmp(result_path, 'data/sum_matrix/.expected', shallow=False)


if __name__ == '__main__':
    run('data/sum_matrix/matrix1.dat', 'data/sum_matrix/matrix2.dat')