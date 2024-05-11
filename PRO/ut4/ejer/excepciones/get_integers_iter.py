def getint() -> int:
    is_valid = False
    while not is_valid:
        try:
            user_input = input('Give me an integer number: ')
            result = int(user_input)
            is_valid = True
        except ValueError:
            print('Not a valid integer. Try it again!')
    return result


if __name__ == '__main__':
    value = getint()
