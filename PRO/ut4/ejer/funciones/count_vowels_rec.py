# *******************************
# CONTANDO VOCALES (EN RECURSIVO)
# *******************************


def count_vowels(text: str) -> int:
    VOWELS = 'aeiou'
    vowels_count = 0
    splitted_text = text.lower().split(' ')
    if splitted_text[0] == '':
        return 0
    for vowel in VOWELS:
        vowels_count += splitted_text[0].count(vowel)
    return count_vowels(' '.join(splitted_text[1:])) + vowels_count
