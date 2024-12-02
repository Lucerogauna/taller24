/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import tema2.Persona;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author Usuario
 */
public class Habitaciones {
    private double costoXnoche = GeneradorAleatorio.generarInt((8000)-2000);
    private boolean ocupada;
    private Persona infoC;
    
    

   public Habitaciones (){
        this.ocupada = false;
        this.costoXnoche = GeneradorAleatorio.generarInt(6000) + 2000;
        //infoC = new Persona ();
        //original//this.infoC = null;
   }
   
   public void ocuparHabitacion(Persona cliente) {
       this.ocupada = true;
       this.infoC = cliente;
   }

    public double getCostoXnoche() {
        return costoXnoche;
    }

    public void setCostoXnoche(double costoXnoche) {
        this.costoXnoche = costoXnoche;
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }
   
   /* Aumentar el precio de todas las habitaciones en un monto recibido.*/
   public void aumentarHabitaciones (double aumento){
       setCostoXnoche(getCostoXnoche() + aumento);
   }
   
  /*  public Habitaciones(double costoXnoche, boolean ocupada) {
        this.costoXnoche = costoXnoche;
        this.ocupada = ocupada;
        //Condicion si esta ocupada hace 
        if (ocupada == false) {
            System.out.println("leer registro");
            this.infoC = this.leerPersona(); // lee persona     
        }
    }*/
//+ "\n" +
    public String toString() {
        String aux  = "\n"+
                "$" + costoXnoche +  "\n"+
                " ocupada " + ocupada ;
        if (this.ocupada==true) 
                aux += "\n "+ infoC.toString();
        return aux;
    }
    
    
}
