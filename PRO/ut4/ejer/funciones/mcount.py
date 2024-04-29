# *******************
# CONTANDO SIN CONTAR
# *******************


def mcount(items: tuple[int], target: int) -> int:
    """Count frequency of target num in the items tuple.

    :param items: represents numbers tuple.
    :type items: tuple[int]
    :param target: represents target number to count.
    :type target: int

    :return: count
    :rtype: int
    """
    count = 0
    for num in items:
        if num == target:
            count += 1
    return count