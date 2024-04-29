# ***************
# MEZCLA ORDENADA
# ***************


def run(values1: list, values2: list) -> list:
    merged = []
    aux = 0
    
    for num in values1 + values2:
        if merged.count(num) == 0:
            merged.append(num)
    
    
    for index in range(len(merged)-1):
        if merged[index+1] < merged[index]:
            aux = merged[index]
            merged[index] = merged[index+1]
            merged[index+1] = aux 
            

    return merged


if __name__ == '__main__':
    run([1, 2, 3, 4], [1, 1, 2, 3, 4, 5])