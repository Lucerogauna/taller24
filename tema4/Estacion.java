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
public class Estacion{
    private String nombre;
    private double latitud;
    private double longitud;

    public Estacion(String nombre, double latitud, double longitud) {
        this.nombre = nombre;
        this.latitud = latitud;
        this.longitud = longitud;
    }

    public Estacion() {
    }

    @Override
    public String toString() {
        return "Estacion"+"\n" +
                nombre +  "( " + latitud + ") " +
                "(" + longitud+ ")"+ " \n";
    }

}
