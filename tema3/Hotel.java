/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import tema2.Persona;
import tema3.Habitaciones;

public class Hotel {
    private Habitaciones [] habitaciones;
    private int num; // es necesatia esta instancia?

    public int getNum() {
        return num;
    }

    private void setNum(int num) {
        this.num = num;
    }
    
    public Hotel(int N) {
        this.habitaciones  = new Habitaciones[N]; // o es solo esto???
        setNum( N);// para saber la dim en aumentar habi o tiene que ser n-1?
        for (int i = 0; i<N; i++) {
            this.habitaciones[i] = new Habitaciones(); //no es o mismo inicializar cad pos en null
        }
    } 
    
    public void agregarCliAHabitacion (int numX, Persona cliente){ // prehunto si esta ocupada
       if ( this.habitaciones[numX - 1].isOcupada()) // conviene afuera en el ppal
        this.habitaciones[numX - 1].ocuparHabitacion(cliente);
    }
    
    public void aumentarPrecioHabitaciones(double valor){
        for (int i=0 ;i < getNum() ;i++){
            habitaciones[i].aumentarHabitaciones(valor);
        }
    }
 public String toString (){
     String aux="" ;
     for (int i= 0; i<num; i++){
         int j = i + 1;
     aux +=  "\n" +"Habitacion"+ j+ habitaciones[i].toString();
     }
     return aux;
}
}

