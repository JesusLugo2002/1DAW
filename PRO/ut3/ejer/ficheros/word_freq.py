# **********************
# FRECUENCIA DE PALABRAS
# **********************
from pathlib import Path


def run(input_path: Path, lower_bound: int) -> dict:
    input_file = open(input_path)
    words = input_file.read().replace('\n', ' ').lower().split(' ')
    freq = {}

    for word in words:
        if words.count(word) >= lower_bound and word != '':
            freq[word] = freq.get(word, 0) + 1

    return freq


if __name__ == '__main__':
    run('data/word_freq/cistercian.txt', 9)
