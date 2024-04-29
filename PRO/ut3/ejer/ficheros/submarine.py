# ****************
# YELLOW SUBMARINE
# ****************
from pathlib import Path


def run(route_path: Path) -> tuple:
    data_file = open(route_path)
    distance = depth = 0
    fuel = int(data_file.readline().strip())
    movements = data_file.readline().strip().split(',')

    for move in movements:
        move_x, move_y = move.split(':')
        fuel -= abs((int(move_x) * 3)) + abs((int(move_y) * 2))
        distance += int(move_x)
        depth += int(move_y)
        if fuel <= 0:
            fuel = 0
            break
        if depth > 600 or depth < 0:
            break

    return distance, depth, fuel


if __name__ == '__main__':
    run('data/submarine/route1.dat')
