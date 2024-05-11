# ******************
# FIBONACCI ITERABLE
# ******************

class Fibonacci:
    def __init__(self, fibo_nums: int) -> None:
        self.fibo_nums = fibo_nums
        self.a, self.b = 0, 1
        self.pointer = 0

    def __iter__(self) -> object:
        return self
    
    def __next__(self):
        if self.pointer >= self.fibo_nums:
            raise StopIteration
        if self.pointer == 0:
            self.pointer += 1
            return 0
        self.a, self.b = self.b, self.a + self.b
        self.pointer += 1
        return self.a
        


def run(n: int) -> list[int]:
    return list(Fibonacci(n))