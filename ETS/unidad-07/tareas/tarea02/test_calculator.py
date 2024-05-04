import pytest

from calculator import my_sum, my_sub, my_mul, my_div, my_pow

@pytest.mark.parametrize("a,b,expected", [(2, 4, 6), (3, 1, 4), (9, 2, 11)])
def test_sum(a, b, expected):
    assert my_sum(a, b) == expected

@pytest.mark.parametrize("a,b,expected", [(3, 1, 2), (10, 10, 0), (150, 25, 125)])
def test_sub(a, b, expected):
    assert my_sub(a, b) == expected

@pytest.mark.parametrize("a,b,expected", [(2, 2, 4), (3, 3, 9), (9, 2, 18)])
def test_mul(a, b, expected):
    assert my_mul(a, b) == expected

@pytest.mark.parametrize("a,b,expected", [(6, 3, 2), (10, 2, 5)])
def test_div(a, b, expected):
    assert my_div(a, b) == expected

@pytest.mark.parametrize("a,b,expected", [(2, 3, 8), (10, 2, 100)])
def test_pow(a, b, expected):
    assert my_pow(a, b) == expected