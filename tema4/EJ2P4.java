/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Usuario
 */
public class EJ2P4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Jugador j1 = new Jugador(10, 5, "Martin", 3000, 3);
        System.out.println(j1.getSueldoBasico());

        System.out.println("Efectividad "+j1.calcularEfectividad()+ "\n" + "Sueldo a Cobrar" + j1.calcularSueldo());
        System.out.println(j1.toString());
    }
    
}
