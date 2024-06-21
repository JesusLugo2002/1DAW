import re


def is_valid_url(url: str) -> bool:
    pattern = r'https?://\w+(\.\w+)+(/(\w+\.\w+|\w+/?))*'
    return re.fullmatch(pattern, url, re.IGNORECASE) is not None
