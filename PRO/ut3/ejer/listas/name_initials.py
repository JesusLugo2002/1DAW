# **********************
# INICIALES DE UN NOMBRE
# **********************


def run(fullname: str) -> str:
    splitted_fullname = fullname.split(',')
    first_name = splitted_fullname[1].strip()
    last_names = splitted_fullname[0].split(' ')
    initials = ''

    initials = first_name[0].upper() + '.' + '.'.join([last_name[0].upper() for last_name in last_names]) + '.'

    return initials


if __name__ == '__main__':
    run('Delgado Quintero, sergio')