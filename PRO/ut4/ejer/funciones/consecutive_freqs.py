# ************************************
# FRECUENCIA DE ELEMENTOS CONSECUTIVOS
# ************************************


def cfreq(items, /, as_str=False):
    cfreqs = []
    items_lenght = len(items)
    if items_lenght > 0:
        ref_item = items[0]
        freq = 0
        last_index = items_lenght - 1
        for index, item in enumerate(items):
            if item == ref_item:
                freq += 1
            else:
                cfreqs.append((ref_item, freq))
                ref_item = item
                freq = 1
            
            if index == last_index:
                cfreqs.append((ref_item, freq))
    
    if as_str:
        result = []
        for num, num_freq in cfreqs:
            result.append(f'{num}:{num_freq}')
        return ','.join(result)
        
    return cfreqs