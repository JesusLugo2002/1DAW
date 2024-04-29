size = int(input('Inserte el tamaño del mosaico -> '))
characters = ''

for row in range(size):
    for column in range(size):
        if column == row:
            characters += 'X'
        elif column > row:
            characters += 'U'
        else:
            characters += 'D'
    print(characters)
    characters = ''
