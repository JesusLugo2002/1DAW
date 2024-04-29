# *********
# BANAGRAMA
# *********


def run(word1: str, word2: str) -> bool:
    is_banagram = True  # El 'Banagrama' es cierto, hasta que se demuestre lo contrario
    for character in word1.lower():
        if character in word2.lower():
            continue
        else:  # Si el carácter no está en la segunda cadena, is_banagram = False y se rompe el bucle
            is_banagram = False
            break
    return is_banagram


if __name__ == '__main__':
    run('gabana', 'banagrama')
