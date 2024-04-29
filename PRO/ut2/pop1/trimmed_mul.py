# ******************
# PRODUCTO RECORTADO
# ******************


def run(value1: float, value2: float, vmin: float, vmax: float) -> float:
    # Cálculo de producto
    rmul = value1 * value2
    # Si el producto es menor que A, producto = A
    if rmul < vmin:
        rmul = vmin
    # Si es mayor que B, producto = B
    elif rmul > vmax:
        rmul = vmax
    # Si no se cumple ninguna condición, se mantendrá con su valor.
    rmul = round(rmul, 2)  # Redondeo a 2 decimales

    return rmul


if __name__ == '__main__':
    run(3.21, 7.44, 0, 20.51)
