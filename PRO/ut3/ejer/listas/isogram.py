# *********************
# ENCONTRANDO ISOGRAMAS
# *********************


def run(text: str) -> bool:
    ALPHABET = 'abcdefghijklmnñopqrstuvwxyz'
    text_list = list(text)
    search_index = 0
    is_isogram = True

    for letter in text_list:
        if not is_isogram:
            break
        search_index += 1
        for other_letter in text_list[search_index:]:
            if letter.lower() == other_letter.lower() and letter in ALPHABET:
                is_isogram = False
                break

    return is_isogram


if __name__ == '__main__':
    run('lumberjacks')
