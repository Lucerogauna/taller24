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
public class Circulo extends Figura{
    private double radio;

    public Circulo(double radio, String unCR, String unCL) {
        super(unCR, unCL);
        this.radio = radio;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    @Override
    public double calcularArea() {
       return Math.pow(Math.PI*getRadio(), 2);
    }

    @Override
    public double calcularPerimetro() {
        return (2*Math.PI*getRadio());
    }

    @Override
    public String toString() {
        return "Circulo" + "radio " + radio + super.toString();
    }

    
    
}
