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
public class Jugador extends Empleado {
    private int nroPartidosJugados;
    private int golesAnotados;

    public Jugador(int nroPartidosJugados, int golesAnotados, String nombre, double sueldoBasico, int antigueadad) {
        super(nombre, sueldoBasico, antigueadad);
        this.nroPartidosJugados = nroPartidosJugados;
        this.golesAnotados = golesAnotados;
    }

    public int getNroPartidosJugados() {
        return nroPartidosJugados;
    }

    public void setNroPartidosJugados(int nroPartidosJugados) {
        this.nroPartidosJugados = nroPartidosJugados;
    }

    public int getGolesAnotados() {
        return golesAnotados;
    }

    public void setGolesAnotados(int golesAnotados) {
        this.golesAnotados = golesAnotados;
    }
    
    
    public double calcularEfectividad() {
        return (getNroPartidosJugados()/getGolesAnotados());
    }
    public double calcularSueldo (){
        double aux = getSueldoBasico()+ (getAntigueadad()* getSueldoBasico() * 0.10);
        if (calcularEfectividad()>0.5) 
            aux += getSueldoBasico();
        return aux;
      }
    
}
