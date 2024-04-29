# ******************
# AGRUPANDO PALABRAS
# ******************


def run(words: list) -> dict:
    group_words = {}
    for word in words:
        # Consejo: word[0] podría convertirse en una variable como 'first_letter'.
        if word[0] not in group_words:
            group_words[word[0]] = [item for item in words if item[0] == word[0]]

    return group_words


if __name__ == '__main__':
    run(
        [
            'mesa',
            'móvil',
            'barco',
            'coche',
            'avión',
            'bandeja',
            'casa',
            'monitor',
            'carretera',
            'arco',
        ]
    )
