package areaperimetrotriangulo;

public class Triangulo {
    
    float area;
    float perimetro;
    
    public float CalcularArea(float base, float lado) {
        area = (base * lado) / 2;
        return area;
    }

    public float CalcularPerimetro(float lado) {
        perimetro = lado * 3;
        return perimetro;
    }
    
}
