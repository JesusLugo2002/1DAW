package AreaPerimetroCuadrado;

public class Cuadrado {
    
    float area;
    float perimetro;
    
    public float CalcularPerimetro(float lado) {
        perimetro = lado + lado + lado + lado;
        return perimetro;
    }
    
    public float CalcularArea(float lado) {
        area = lado * lado;
        return area;
    }
    
}
