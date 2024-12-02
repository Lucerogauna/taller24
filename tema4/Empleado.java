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
public abstract class Empleado {
    private String nombre;
    private double sueldoBasico;
    private int antigueadad;

    public Empleado(String nombre, double sueldoBasico, int antigueadad) {
        setNombre (nombre);
        setSueldoBasico(sueldoBasico);
        setAntiguedad(antigueadad);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }

    public int getAntigueadad() {
        return antigueadad;
    }

    public void setAntiguedad(int antigueadad) {
        this.antigueadad = antigueadad;
    }
    
    public abstract double calcularEfectividad ();
    public abstract double calcularSueldo ();

    @Override//+ "\n" +
    public String toString() {
        return "Nombre  "+ nombre + "\n" +"Sueldo  "+ this.calcularSueldo() +"\n" +  "Efectividad " +this.calcularEfectividad(); 
    }
    
}
