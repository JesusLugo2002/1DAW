class Car:
    def __init__(self, manufacturer: str, model: str, color: str):
        self.manufacturer = manufacturer
        self.model = model
        self.color = color
        self.engine_status = False
    
    def toggle_engine(self):
        self.engine_status = not self.engine_status

class Triangle:
    def __init__(self, height: int, width: int):
        self.height = height
        self.width = width

    @property
    def area(self) -> int:
        return self.height * self.width // 2

class Square:
    def __init__(self, side_length: int):
        self.side_length = side_length

    @property
    def perimeter(self) -> int:
        return self.side_length * 4