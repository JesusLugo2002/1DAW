# *****************
# FICHO CUANDO TOCA
# *****************


def run(time: str, offset: int) -> str:
    current_hour = int(time.split(':')[0])
    previous_minutes = int(time.split(':')[1])

    current_minutes = previous_minutes + offset
    while current_minutes >= 60:
        current_minutes -= 60
        current_hour += 1
        if current_hour == 24:
            current_hour = 0
    
    final_time = f'{current_hour}:{current_minutes}'

    return final_time


if __name__ == '__main__':
    run('17:15', 240)