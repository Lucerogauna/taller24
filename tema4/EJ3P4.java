/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

import tema2.Persona;

/**
 *
 * @author Usuario
 */
public class EJ3P4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Persona per = new Persona("Carlos", 8822382, 80);
        Trabajador trabajador = new Trabajador ("Roberto", 737848, 48, "plomero");
        System.out.println(trabajador.toString());
        System.out.println(per.toString());

    }
    
}
