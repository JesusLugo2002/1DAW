import re


def is_valid_email(email: str) -> bool:
    regexp = r'(-?\w+)+@(\w+\.?)+'
    return re.fullmatch(regexp, email, re.IGNORECASE) is not None
