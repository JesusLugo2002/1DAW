
package areaperimetrotriangulo;

import javax.swing.JOptionPane;

public class main {

    public static void main(String[] args) {

        Triangulo triangulo = new Triangulo();
        
        float base = Float.parseFloat(JOptionPane.showInputDialog("Inserte la base del triángulo:"));
        float lado = Float.parseFloat(JOptionPane.showInputDialog("Inserte el lado del triángulo:"));

        float area = triangulo.CalcularArea(lado, base);
        float perimetro = triangulo.CalcularPerimetro(lado);

        System.out.println("Para un triángulo equilatero cuyo lado mide " + lado + " y su base mide " + base);
        System.out.println("Su área mide " + area);
        System.out.println("Y su perímetro es " + perimetro);

        

    }
    
}
