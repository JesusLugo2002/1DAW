from concrete_factory import CarFactory, TruckFactory

def cliente_vehicle_code(factory, vehicle_type):
    vehicle = factory.get_vehicle(vehicle_type)
    print(vehicle.deliver())