VOWELS = 'aeiou'
user_word = input('Inserte la palabra cuyas vocales quiere contar -> ')
vowels_count = 0

for letter in user_word.lower():
    if letter in VOWELS:
        vowels_count += 1

print(f'La palabra {user_word} tiene {vowels_count} vocales')
