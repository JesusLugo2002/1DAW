# ********************
# ENCUENTRE EL UNICODE
# ********************


def run(source_char: str, offset: int) -> str:
    target_char = chr(int(ord(source_char)) + offset)

    return target_char


if __name__ == '__main__':
    run('δ', -2)
