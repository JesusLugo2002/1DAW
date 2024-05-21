from abstract_factory import UIABstractFactory, Button, Textbox

class DarkButton(Button):
    def paint(self):
        print("Dark Button")

class DarkTextbox(Textbox):
    def paint(self):
        print("Dark Textbox")

class LightButton(Button):
    def paint(self):
        print("Light Button")

class LightTextbox(Textbox):
    def paint(self):
        print("Light Textbox")

class DarkUIFactory(UIABstractFactory):
    def create_button(self):
        return DarkButton()

    def create_textbox(self):
        return DarkTextbox()

class LightUIFactory(UIABstractFactory):   
    def create_button(self):
        return LightButton()
    
    def create_textbox(self):
        return LightTextbox()