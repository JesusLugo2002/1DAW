# ********************
# CUBOIDES Y VOLÚMENES
# ********************


def run(cuboid1: list, cuboid2: list) -> float:
    vol_cuboid1 = 1
    vol_cuboid2 = 1

    for measures_cub1, measures_cub2 in zip(cuboid1, cuboid2):
        vol_cuboid1 = vol_cuboid1 * measures_cub1
        vol_cuboid2 = vol_cuboid2 * measures_cub2

    vol_diff = abs(vol_cuboid1 - vol_cuboid2)

    return vol_diff


if __name__ == '__main__':
    run([2, 2, 3], [5, 4, 1])
