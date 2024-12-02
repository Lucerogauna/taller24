/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author Usuario
 */
public class Autor {
    private String nombre;
    private String bio;
    private String origen;

    public Autor(String nombre, String bio, String origen) {
        this.nombre = nombre;
        this.bio = bio;
        this.origen = origen;
    }
    
    public Autor (){
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    @Override
    public String toString() {
        return "Datos del autor " + 
                "nombre " + nombre +
                " bio " + bio +
                " origen " + origen  ;
    }
    
   
}
