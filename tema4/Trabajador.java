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
public class Trabajador extends Persona{
    private String empleo;

    public String getEmpleo() {
        return empleo;
    }

    public void setEmpleo(String empleo) {
        this.empleo = empleo;
    }

    public Trabajador(String unNombre, int unDNI, int unaEdad, String trabajo) {
        super(unNombre, unDNI, unaEdad);
        setEmpleo(trabajo);
    }

    public Trabajador() {
    }

    @Override
    public String toString() {
        return super.toString()+ "soy" + empleo ;
    }
    
}
