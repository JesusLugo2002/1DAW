# *******************
# DE TEXTO A MARKDOWN
# *******************
import filecmp
from pathlib import Path


def run(text_path: Path) -> bool:
    md_path = 'data/txt2md/outline.md'
    input_file = open(text_path)

    with open(md_path, 'w') as md_file:
        for line in input_file:
            md_file.write('#' + ('#' * line.count('\t')) + ' ' + line.strip() + '\n')


    return filecmp.cmp(md_path, 'data/txt2md/.expected', shallow=False)


if __name__ == '__main__':
    run('data/txt2md/outline.txt')