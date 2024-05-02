package Classes;

public class Persona {
    String nombre;
    String apellidos;
    int edad;
    float altura;
    int peso;
    
    public static void Caminar() {
        System.out.println("Estoy caminando");
    }
    
    public static void Hablar() {
        System.out.println("Estoy hablando");
    }
    
    public static void Nacer() {
        System.out.println("Estoy naciendo");
    }
    
    public static void Morir() {
        System.out.println("Estoy muriendo");
    }
    
    public static void main(String [] args) {
        
        Persona miguelito = new Persona();
        
        miguelito.nombre = "Miguelito";
        miguelito.apellidos = "Perez Perez";
        miguelito.edad = 4;
        miguelito.altura = 1.27f;
        miguelito.peso = 10;
        
        System.out.println(miguelito.nombre);
        System.out.println(miguelito.apellidos);
        System.out.println("Tengo " + miguelito.edad + " años");
        System.out.println("Altura: " + miguelito.altura);
        System.out.println("Peso: " + miguelito.peso + "\n");
        
        miguelito.Nacer();
        miguelito.Hablar();
        miguelito.Caminar();
        miguelito.Morir();
    }
    
}
