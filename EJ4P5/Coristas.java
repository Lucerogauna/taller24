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
public class Coristas extends Persona{
    private int tonoFundamental;

    public Coristas(){
        super("sd", 7,7);
        tonoFundamental =0;
    };

    public int getTonoFundamental() {
        return tonoFundamental;
    }

    
    
    public Coristas(int tonoFundamental, String nombre, int dni, int edad) {
        super(nombre, dni, edad);
        this.tonoFundamental = tonoFundamental;
    }

    @Override
    public String toString() {
        return "Coristas{"+super.toString() + "tonoFundamental=" + tonoFundamental + '}';
    }
    
    
}
