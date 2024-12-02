/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EJ4P5;

/**
 *
 * @author Usuario
 */
public class Director extends Persona{
    private String antiguedad;

    public Director(String antiguedad, String nombre, int dni, int edad) {
        super(nombre, dni, edad);
        this.antiguedad = antiguedad;
    }

    @Override
    public String toString() {
        return "Director{"+super.toString() + "antiguedad=" + antiguedad + '}';
    }
    
    
}
