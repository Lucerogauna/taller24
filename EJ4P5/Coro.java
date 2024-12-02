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
public abstract class Coro{
    private String nombreCoro;
    private Director director;

    public Coro(String nombreCoro, Director director) {
        this.nombreCoro = nombreCoro;
        this.director = director;
    }
    public abstract void agregarCorista (Coristas co);
    public abstract boolean isLleno();
    public abstract boolean estaBienFormado();

    @Override
    public String toString() {
        return "Coro{" + "nombreCoro=" + nombreCoro + ", director=" + director + '}';
    }
    
    
}
