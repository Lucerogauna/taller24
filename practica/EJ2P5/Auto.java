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
public class Auto {
    private String nombreDueño;
    private String patente;

    public Auto(String nombreDueño, String patente) {
        this.nombreDueño = nombreDueño;
        this.patente = patente;
    }

    public String getNombreDueño() {
        return nombreDueño;
    }

    public void setNombreDueño(String nombreDueño) {
        this.nombreDueño = nombreDueño;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    @Override
    public String toString() {
        return "Nombre del Dueño" + nombreDueño + "\n"+"Patente " + patente+ "\n";
    }
    
    
}
