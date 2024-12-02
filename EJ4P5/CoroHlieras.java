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
public class CoroHlieras extends Coro{
    private Coristas [][] coroXHileras;
    private int dimH, dimF, numDF ;

    public CoroHlieras(Coristas[][] coroXHileras, String nombreCoro, Director director, int num) {
        super(nombreCoro, director);
        numDF = num;
        dimH=0; dimF =0;
        this.coroXHileras = new Coristas[num][num]; // en teoria esta en null
    }
    

    @Override
// En el coro por hileras los coristas se deben ir agregando de izquierda a
 //derecha, completando la hilera antes de pasar a la siguiente RARRRRRP
    public void agregarCorista(Coristas co) {
        if ((dimH<numDF)&&(dimF<numDF)){
            this.coroXHileras[dimH][dimF]= co;
            dimF ++;}
        else if (dimF<numDF){
            dimH ++; //cambia de hilera a la siguiente
            dimF = 0; //actualiza fila 
            this.coroXHileras[dimH][dimF]= co;
        }
 }
                       
    

    @Override
    public boolean isLleno() {
        return (coroXHileras[4][4]!= null); // si la ultima posicion es dstinta de nuull entonces esta llena
    }

    @Override
    public boolean estaBienFormado() {
        int hilera =0 ; int fila =0;   boolean ok = true;
        while ((hilera < numDF)&&(ok ==true)){
            fila =0;
            while ((fila - 1 < dimF) && (ok ==true)){
                if (this.coroXHileras[hilera][fila].getTonoFundamental()>(this.coroXHileras[hilera][fila+1].getTonoFundamental()))
                    ok = true;
                            else ok = false;
              fila ++;}
    }
        return ok;
    }

    @Override
    public String toString() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
