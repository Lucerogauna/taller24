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
public class EJ4P4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estacion estacion = new Estacion ("La Plata",  -34.921, -57.955);
        Sistema reporte = new VersionSistema1(2021, 3, estacion);
        Estacion estacion2 = new Estacion ("MDQ",-38.002, -57.556);
        Sistema reporte2 = new VersionSistema2(2020, 4, estacion2);
        System.out.println(reporte.getTemperatura(0,0));
        reporte.setTemperatura(2021, 3); // se rompe al setear
       System.out.println(reporte.getTemperatura(3, 2021));
      System.out.println(reporte);
      System.out.println(reporte2);

    }
    
}
