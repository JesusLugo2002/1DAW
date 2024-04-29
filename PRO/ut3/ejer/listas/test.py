elements = [
    0,
    10,
    [20, [-10, [5, 5, 5], -20], 30],
    40,
    50,
    [60, 70, [-1, -2, -3], 80],
    [90, 100, 110, 120],
]

sorted_list = []
need_repeat = True

while True:
    for item in elements:
        if not isinstance(item, list):
            sorted_list.append(item)
        else:
            sorted_list.extend(item)
            for sub_item in item:
                if isinstance(sub_item, list):
                    need_repeat = True
                    break
    if need_repeat:
        elements = sorted_list.copy()
        need_repeat = False
    else:
        break


print(sorted_list)
