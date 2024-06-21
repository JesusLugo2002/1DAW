import re


def is_valid_float(number: str) -> bool:
    pattern = r'((\d*|-?\d+)\.\d*(_?\d+)*|\d+e\d+)'
    return re.fullmatch(pattern, number) is not None
