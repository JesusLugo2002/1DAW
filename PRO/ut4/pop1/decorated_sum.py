# ****************************
# DECORANDO LA SUMA DE VALORES
# ****************************


def result_as_status(func):
    def wrapper(*args, **kwargs):
        status, result = func(*args, **kwargs)
        return {'status': status, 'result': result}

    return wrapper


@result_as_status
def run(values: list) -> tuple:
    if all(isinstance(value, int) for value in values):
        return True, sum(values)
    return False, 'Not int value found'
