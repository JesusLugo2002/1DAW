import pytest
from classes import Car, Triangle, Square

@pytest.fixture
def my_car() -> Car:
    return Car('Ford', 'Explorer', 'Brown')

@pytest.fixture
def my_triangle() -> Triangle:
    return Triangle(5, 10)

@pytest.fixture
def my_square() -> Square:
    return Square(10)

def test_car_engine(my_car: Car):
    assert not my_car.engine_status
    my_car.toggle_engine()
    assert my_car.engine_status

def test_triangle_area(my_triangle: Triangle):
    assert my_triangle.area == 25

def test_square_perimeter(my_square: Square):
    assert my_square.perimeter == 40