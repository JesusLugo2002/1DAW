from concrete_factory import DarkUIFactory, LightUIFactory

def client_code(factory):
    button = factory.create_button()
    textbox = factory.create_textbox()

    button.paint()
    textbox.paint()

if __name__ == '__main__':
    client_code(DarkUIFactory())
    client_code(LightUIFactory())