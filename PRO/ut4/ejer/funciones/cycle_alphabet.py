# *****************
# ALFABETO CIRCULAR
# *****************


def get_alphabet(num_letters: int):
    for num in range(num_letters):
        yield num

def run(max_letters: int) -> str:
    ALPHABET = 'abcdefghijklmnopqrstuvwxyz'
    text = ''
    for num in get_alphabet(max_letters):
        text += ALPHABET[num % len(ALPHABET)]
    return text

if __name__ == '__main__':
    run(0)
