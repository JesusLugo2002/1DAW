# ********************
# AQUÍ TIENE SU VUELTA
# ********************


def run(to_give_back: float, available_currencies: list) -> dict:
    money_back = {}
    for currency in sorted(available_currencies, reverse=True):
        while to_give_back - currency >= 0:
            to_give_back -= currency
            money_back[currency] = money_back.get(currency, 0) + 1
            
    if to_give_back > 0:
        money_back = None

    return money_back


if __name__ == '__main__':
    run(20, [5, 2, 1])
