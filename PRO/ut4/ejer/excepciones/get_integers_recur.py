def getint() -> int:
    try:
        user_input = input('Give me an integer number: ')
        result = int(user_input)
    except ValueError:
        print('Not a valid integer. Try it again!')
        return getint()
    return result


if __name__ == '__main__':
    value = getint()
