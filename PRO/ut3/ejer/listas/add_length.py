# *********************
# PALABRAS CON LONGITUD
# *********************


def run(text: str) -> list:
    words_length = []
    for word in text.split(' '):
        words_length.append(word + f' {len(word)}')

    return words_length


if __name__ == '__main__':
    run('todo se transforma')
