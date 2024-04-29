# **********
# HISTOGRAMA
# **********
import filecmp
from pathlib import Path


def run(data_path: Path) -> bool:
    STICK = '█'
    histogram_path = 'data/histogram/histogram.txt'
    input_file = open(data_path)
    letters_count = {}
    with open(histogram_path, 'w') as output_file:
        for letter in input_file.readline():
            letters_count[letter] = letters_count.get(letter, 0) + 1
        for letter, count in sorted(letters_count.items()):
            output_file.write(f'{letter} {STICK * count} {count}\n')

    return filecmp.cmp(histogram_path, 'data/histogram/.expected', shallow=False)


if __name__ == '__main__':
    run('data/histogram/data.txt')
