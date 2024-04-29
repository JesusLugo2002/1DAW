# ********
# PANGRAMA
# ********


def is_pangram(text: str) -> bool:
    ALPHABET = 'abcdefghijklmnopqrstuvwxyz '
    for char in ALPHABET:
        if char not in text.lower():
            return False
    return True
