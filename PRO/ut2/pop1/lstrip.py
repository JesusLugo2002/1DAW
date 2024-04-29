# **********
# LEFT STRIP
# **********


def run(text: str, blacklist: str) -> str:
    stext = ''
    # Si el carácter de 'text' no está en la 'blacklist', se sumará a la cadena-resultado
    for character in text:
        if character not in blacklist:
            stext += character

    return stext


if __name__ == '__main__':
    run('955428PAYLOAD', '0123456789')
