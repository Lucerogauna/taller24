/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EJ3P5;

/**
 *
 * @author Usuario
 */
public class Fecha {
    private String ciudad;
    private String dia;

    public Fecha() {
    }

    public Fecha(String ciudad, String dia) {
        this.ciudad = ciudad;
        this.dia = dia;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    @Override
    public String toString() {
        return "Ciudad: " + ciudad + " "+"Dia: " + dia ;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }
    
    
    
}
