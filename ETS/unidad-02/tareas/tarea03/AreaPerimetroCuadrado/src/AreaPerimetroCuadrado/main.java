package AreaPerimetroCuadrado;

import javax.swing.JOptionPane;

public class main {
    
    public static void main(String [] args) {

        Cuadrado cuadrado = new Cuadrado();
        float lado = Float.parseFloat(JOptionPane.showInputDialog("Indique la medida del lado del cuadrado -> "));

        float perimetro = cuadrado.CalcularPerimetro(lado);
        float area = cuadrado.CalcularArea(lado);

        System.out.println("Según la medida de lado -> " + lado);
        System.out.println("Su perímetro = " + perimetro);
        System.out.println("Su área = " + area);


    }

}
