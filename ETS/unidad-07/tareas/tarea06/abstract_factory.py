from abc import ABC, abstractmethod

class UIABstractFactory(ABC):
    @abstractmethod
    def create_button(self):
        pass

    @abstractmethod
    def create_textbox(self):
        pass

class Button(ABC):
    @abstractmethod
    def paint(self):
        pass

class Textbox(ABC):
    @abstractmethod
    def paint(self):
        pass