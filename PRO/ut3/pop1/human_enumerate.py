# ********************************
# ENUMERANDO ELEMENTOS MODO HUMANO
# ********************************


def run(items: str) -> str:
    splitted_items = items.split(':')
    if len(splitted_items) > 1:
        last_item = splitted_items[-1]
        enum_items = ', '.join(splitted_items[:-1]) + ' and ' + last_item
    else:
        enum_items = items

    return enum_items


if __name__ == '__main__':
    run('apples')
