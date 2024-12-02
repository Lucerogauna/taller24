/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class EJ1P3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Triangulo tri = new Triangulo();
        tri.setLad1(3);
        tri.setLad2(3);
        tri.setLad3(4);
        tri.setColorRelleno("amarillo");
        System.out.println(tri);
        System.out.println("el perimetro calculado es de "+tri.calcularPerimetro(tri.getLad1(),tri.getLad2(), tri.getLad3()));
        System.out.println (" el area calculada es de "+tri.calcularArea());
        
    }
    
}
