# ********************
# LA PALABRA MÁS LARGA
# ********************
from pathlib import Path


def run(input_path: Path) -> str:
    LIMIT_SYMBOLS = '.,;:()'
    input_file = open(input_path)
    longest_word = ''

    for line in input_file:
        for symbol in LIMIT_SYMBOLS:
            line = line.replace(symbol, '')
        words = line.strip().split(' ')
        for word in words:
            if len(word) >= len(longest_word):
                longest_word = word
        

    return longest_word


if __name__ == '__main__':
    run('data/longest_word/python.txt')