from client_code import cliente_vehicle_code
from concrete_factory import CarFactory, TruckFactory

if __name__ == '__main__':
    cliente_vehicle_code(CarFactory(), 'Sedan')
    cliente_vehicle_code(TruckFactory(), 'Remolque')