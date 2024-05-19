from abc import ABC, abstractmethod

class Vehicle(ABC):
    @abstractmethod
    def deliver(self):
        pass

class Car(Vehicle):
    def __init__(self, model) -> None:
        self.model = model

    def deliver(self) -> str:
        return f'Auto {self.model} entregado'
    
class Truck(Vehicle):
    def __init__(self, model) -> None:
        self.model = model

    def deliver(self) -> str:
        return f'Camión {self.model} entregado'