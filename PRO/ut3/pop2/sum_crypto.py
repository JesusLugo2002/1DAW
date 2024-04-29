# ******************
# SUMA CRIPTOGRÁFICA
# ******************
from pathlib import Path


def run(crypto_path: Path) -> float:
    crypto_lines = open(crypto_path).readlines()
    sum_cr = []
    translated_line = auxiliar = ''

    for line in crypto_lines:
        for letter in line.strip():
            auxiliar += letter
            if len(auxiliar) == 2:
                match auxiliar:
                    case 'sd':
                        translated_line += '-'
                    case 'vo':
                        translated_line += '.'
                    case 'ax':
                        translated_line += '0'
                    case 'gh':
                        translated_line += '1'
                    case 'hj':
                        translated_line += '2'
                    case 'uv':
                        translated_line += '3'
                    case 'ws':
                        translated_line += '4'
                    case 'pk':
                        translated_line += '5'
                    case 'et':
                        translated_line += '6'
                    case 'mc':
                        translated_line += '7'
                    case 'rh':
                        translated_line += '8'
                    case 'wb':
                        translated_line += '9'
                auxiliar = ''
        sum_cr.append(float(translated_line))
        translated_line = ''
    sum_cr = float(round(sum(sum_cr), 3))

    return sum_cr


if __name__ == '__main__':
    run('data/sum_crypto/data1.crypto')
