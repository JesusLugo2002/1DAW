# ****************
# SUMANDO COLUMNAS
# ****************
from pathlib import Path


def run(data_path: Path) -> tuple:
    nums_rows = open(data_path).readlines()
    tup_lenght = len(nums_rows[0].strip().split())
    csum = [0 for _ in range(0, tup_lenght)]

    for row in nums_rows:
        for col, num in enumerate(row.strip().split()):
            csum[col] += int(num)
    csum = tuple(csum)

    return csum


if __name__ == '__main__':
    run('data/sum_cols/data1.txt')
