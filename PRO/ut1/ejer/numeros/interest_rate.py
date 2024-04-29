# *****************
# INTERÉS COMPUESTO
# *****************


def run(amount: float, rate: float, years: int) -> float:
    future_amount = amount * ((1 + rate / 100) ** years)

    return future_amount


if __name__ == '__main__':
    run(10000, 3.5, 7)
