/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author Usuario
 */
public class EJ5P3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Circulos c = new Circulos (3, "rojo", "rosa");
        Circulos c2 = new Circulos ();
        c2.setRadio(3);
        c2.setRelleno("azul");
        c2.setLinea("amarillo");
        System.out.println("el perimetro de c2 es"+c2.calcularPerimetro());
        System.out.println ("area"+ c2.calcularArea());
    }
    
}
