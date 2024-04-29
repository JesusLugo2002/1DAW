def check_even(num):
    return num % 2 == 0


def split_even_odd(nums):
    if isinstance(nums, list):
        even_nums = []
        odd_nums = []
        for num in nums:
            if check_even(num):
                even_nums.append(num)
            else:
                odd_nums.append(num)
        return even_nums, odd_nums


nums = [1, 3, 4, 5, 9, 7, 2]
even_nums, odd_nums = split_even_odd(nums)
print(f'Pares: {even_nums}')
print(f'Impares: {odd_nums}')
