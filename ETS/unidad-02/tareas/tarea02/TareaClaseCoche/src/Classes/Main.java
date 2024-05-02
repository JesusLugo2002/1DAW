
package Classes;

public class Main {
    
    public static void main(String [] args) {
    
    Coche coche1 = new Coche();
    
    coche1.modelo = "No sé de coches, pero uno que es rápido";
    coche1.marca = "Ford";
    coche1.color = "Amarillo, porque me gusta";
    coche1.cilindrada = 5;
    
    System.out.println("Modelo: " + coche1.modelo);
    System.out.println("Marca: " + coche1.marca);
    System.out.println("Color: " + coche1.color);
    System.out.println("Cilindrada: " + coche1.cilindrada + "\n");
    
    coche1.Arrancar();
    coche1.Acelerar();
    coche1.Frenar();
    
    }
    
}
