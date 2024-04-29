# **************************
# AQUÍ TIENE SU VUELTA (MAX)
# **************************


def run(to_give_back: float, available_currencies: dict) -> dict:
    money_back = {}
    for currency, limit in sorted(available_currencies.items(), reverse=True):
        while to_give_back - currency >= 0:
            to_give_back -= currency
            money_back[currency] = money_back.get(currency, 0) + 1
            if money_back[currency] == limit:
                break

    if to_give_back > 0:
        money_back = None

    return money_back


if __name__ == '__main__':
    run(20, {5: 3, 2: 7, 1: 3})
