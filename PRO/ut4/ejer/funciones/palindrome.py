# **********
# PALÍNDROMO
# **********


def is_palindrome(text: str) -> bool:
    normal_text = text.replace(' ', '').lower()
    reversed_text = ''.join(reversed(normal_text))
    return normal_text == reversed_text