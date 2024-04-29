# **************************************************
# IDENTIFICANDO SECUENCIAS CONSECUTIVAS DE UN TAMAÑO
# **************************************************


def consecutive_seq(items: list[int], target_count: int, counter: int = 1, previous_num: int = 0) -> int:
    if len(items) > 0:
        if items[0] == previous_num:
            if counter == target_count:
                return items[0]
            return consecutive_seq(items[1:], target_count, counter=counter+1, previous_num=items[0])
        else:
            return consecutive_seq(items[1:], target_count, counter=1, previous_num=items[0])
    else:
        return False



