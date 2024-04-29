# ********************
# CUALIFICANDO NÚMEROS
# ********************


def run(number: int) -> str:
    inverted_num = ''.join(reversed(str(number)))
    qnumber = ''
    count = 0
    for char in inverted_num:
        if count == 3:
            qnumber += f',{char}'
            count = 1
        else:
            count += 1
            qnumber += char
    qnumber = ''.join(reversed(qnumber))

    return qnumber


if __name__ == '__main__':
    run(1)
