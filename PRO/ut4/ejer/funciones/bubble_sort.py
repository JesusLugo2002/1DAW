# **********************
# ORDENANDO CON BURBUJAS
# **********************


def bubble(items: list[int]) -> list[int]:
    items_length = len(items)
    items_copy = items.copy()
    for round in range(items_length - 1):
        for index in range(items_length - 1 - round):
            if items_copy[index] > items_copy[index + 1]:
                buffer = items_copy[index + 1]
                items_copy[index + 1] = items_copy[index]
                items_copy[index] = buffer
    return items_copy