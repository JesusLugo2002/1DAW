# **********************
# MULTIPLICANDO MATRICES
# **********************


def run(A: list, B: list) -> list:
    P = []
    is_valid_dimensions = len(A[0]) == len(B)
    sorted_columns = []

    if is_valid_dimensions:
        for rowA_index in range(len(A)):
            for columnB_index in range(len(B[0])):
                
        
    return P

if __name__ == '__main__':
    run([[1, 2, 3], [4, 5, 6]], [[5, -1], [1, 0], [-2, 3]])