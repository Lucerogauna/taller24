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
public class Entrenador extends Empleado{
    private int campeonatosGanados;

    public Entrenador(int campeonatosGanados, String nombre, double sueldoBasico, int antigueadad) {
        super(nombre, sueldoBasico, antigueadad);
        this.campeonatosGanados = campeonatosGanados;
    }

    public int getCampeonatosGanados() {
        return campeonatosGanados;
    }

    public void setCampeonatosGanados(int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados;
    }
    
    @Override
    public double calcularEfectividad() {
        return (getCampeonatosGanados()/this.getAntigueadad());
    }

    public double calcularSueldo (){ 
        double aux = getSueldoBasico()+ (getAntigueadad()* getSueldoBasico() * 0.10);   
        if (getCampeonatosGanados() <=4)
            aux+= 5000;
        else if (getCampeonatosGanados() <=10)
            aux+= 30000;
        else 
            aux += 50000;
        return aux; 
            }
}
