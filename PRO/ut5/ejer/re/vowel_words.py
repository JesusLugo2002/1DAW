import re


def extract_vowel_words(text: str) -> list[str]:
    pattern = r'\b[aeiou]\w*'
    return re.findall(pattern, text, re.IGNORECASE)
