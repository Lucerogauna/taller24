/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica.EJ2P5;

/**
 *
 * @author Usuario
 */
public class EJ2P5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estacionamiento estacionamiento = new Estacionamiento("Pepon", "162 3333", "8AM", "00AM" , 3,3);
        Auto auto1= new Auto("Carlos", "HZU324");
        Auto auto2= new Auto("Lu", "3224f");
        Auto auto3= new Auto("Miel", "4huh");
        Auto auto4= new Auto("Pepe", "34i3f");
       estacionamiento.buscarAuto("HZU324");
       estacionamiento.registrarAuto(auto4, 3, 3);
       estacionamiento.registrarAuto(auto3, 3, 2);
       estacionamiento.registrarAuto(auto2, 2, 1);
       estacionamiento.registrarAuto(auto1, 1, 2);
       
       System.out.print(estacionamiento.toString());
    }
    
}
