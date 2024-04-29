class Plane:
    BLACKBOX = True
    MINIMAL_FUEL_LITERS = 100
    FUEL_CONSUMPTION_RATE = 0.5
    FLIGHT_HEIGHT = 10000
    current_flights = 0

    def __init__(
        self,
        manufacturer: str,
        model: str,
        max_passengers: int,
        storage_size: float,
        fuel_capacity: float,
    ):
        self.manufacturer = manufacturer
        self.model = model
        self.max_passengers = max_passengers
        self.storage_size = storage_size
        self.current_fuel = self.fuel_capacity = fuel_capacity
        self.doors = {
            'labra-door': True,
            'mira-door': True,
            'sena-door': True,
            'porta-door': True,
            'tira-door': True,
            'esplen-door': True,
        }
        self.traveled_distance = self.current_height = 0
        self.on_air = self.on_emergency = False
        

    @staticmethod
    def view_status(method):
        def wrapper(self, *args, **kwargs):
            def print_lines() -> None:
                print(f'{self.traveled_distance=}')
                print(f'{self.current_fuel=}')
                print(f'{self.on_air=}')
                print(f'{self.on_emergency=}\n')
            print('Antes de la acción:')
            print_lines()
            result = method(self, *args, **kwargs)
            print(f'Despues de correr el método {method.__name__}')
            print_lines()
            print('-----------------------------------------------')
            return result

        return wrapper

    @classmethod
    def get_current_flights(cls) -> None:
        print(f'Están volando {cls.current_flights} aviones.')

    @classmethod
    def set_current_flight(cls, to_air: bool) -> None:
        cls.current_flights += 1 if to_air else -1

    @staticmethod
    def broadcast_message(type: str) -> None:
        match type.lower():
            case 'emergency':
                print('MAYDAY MAYDAY')
            case 'request fuel':
                print('No hay combustible suficiente para el recorrido, solicitando combustible mágicamente...')
            case 'alien attack':
                print('Ayuda, se acercan ovnis.')
            case 'impact':
                print('Cuidado en el suelo, hemos atropellado un extraterrestre ciclista.')
            case 'sleep':
                print('El piloto se quedó dormido, ¿qué hacemos?')
            case _:
                print('Tipo de mensaje no reconocido.')

    def manage_doors(self, status: bool) -> None:
        state = 'abierta' if status else 'cerrada'
        for door in self.doors.keys():
            self.doors[door] = status
            print(f'Puerta {door} {state}')

    def take_off(self) -> None:
        if not self.on_air and self.current_fuel >= self.MINIMAL_FUEL_LITERS:
            print('Entran los pasajeros')
            self.manage_doors(False)
            self.on_air = True
            self.current_height += self.FLIGHT_HEIGHT
            self.set_current_flight(True)

    def to_land(self) -> None:
        if self.on_air and self.current_fuel >= self.MINIMAL_FUEL_LITERS:
            self.on_air = False
            self.current_height -= self.FLIGHT_HEIGHT
            self.set_current_flight(False)
            self.manage_doors(True)

    def request_fuel(self, fuel_quantity: float) -> None:
        self.current_fuel = fuel_quantity

    def travel(self, distance: int) -> None:
        fuel_cost = distance * self.FUEL_CONSUMPTION_RATE
        if self.on_air: 
            if self.current_fuel - fuel_cost >= self.MINIMAL_FUEL_LITERS:
                self.current_fuel -= fuel_cost
                self.traveled_distance += distance
            else:
                self.broadcast_message('request fuel')
                self.request_fuel(self.fuel_capacity)
        
    def exec_emergency_protocol(self) -> None:
        if not self.on_emergency:
            self.on_emergency = True
            self.broadcast_message('emergency')