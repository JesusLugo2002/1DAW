# *******************
# CONSONANTES COMUNES
# *******************


def run(text1: str, text2: str) -> str:
    # Consejo: usar constantes -> VOWELS = 'aeiou'
    letters1 = set(text1.replace(' ', '').lower())
    letters2 = set(text2.replace(' ', '').lower())
    common_letters = letters1 & letters2
    cconst = ''.join(sorted({letter for letter in common_letters if letter not in 'aeiou'}))

    return cconst


if __name__ == '__main__':
    run('Flat is bEtter than nested', 'Readability counts')
