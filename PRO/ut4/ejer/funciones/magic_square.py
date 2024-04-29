# ***************
# CUADRADO MÁGICO
# ***************

def sum_rows(matrix: list[int]) -> list[int]:
    result = [sum(row) for row in matrix]
    return result

def sum_columns(matrix: list[int]) -> list[int]:
    matrix_lenght = len(matrix) - 1
    result = [0 for _ in range(matrix_lenght)]
    for row in matrix:
        for col_index in matrix_lenght:
            result[col_index] += row[col_index]
    return result

def sum_diagonals(matrix: list[int]) -> list[int]:
    first_diagonal = sum([])
    return result

def is_magic_square(values: list[int]) -> bool:
    pass
