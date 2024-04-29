# ********************************
# OBTENIENDO EL NÚMERO DE PALABRAS
# ********************************


def run(text: str) -> int:
    num_words = len(text.split())

    return num_words


if __name__ == '__main__':
    run('Before software can be reusable it first has to be usable')
