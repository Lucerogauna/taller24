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
public class CoroSemicircular  extends Coro{
    private Coristas [] coroSemi;
    private int dl, numDF;

    public CoroSemicircular( String nombreCoro, Director director, int num) {
        super(nombreCoro, director);
        this.coroSemi = new Coristas[num];
        this.numDF = num;
        dl =0 ;
        for (int i=0; i<num; i++)
            this.coroSemi[i]= new Coristas(); // ya esta inicializadp en null 
    }

    public void agregarCorista(Coristas newCorista) {
       if (dl < numDF){
             coroSemi[dl] = newCorista;
             dl++;}
         else System.out.print("No se pudo agregar. Coro lleno");
       }


    @Override
    public boolean isLleno() {
        return (dl == numDF); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean estaBienFormado() { //chequea que esten de tono fundamental mayyor a menor
        int i = 0; boolean cumple = true;
        while ((i<dl-1)&&(cumple == true)){
            if (coroSemi[i].getTonoFundamental() > coroSemi[i+1].getTonoFundamental())
                cumple = true;
                i++;
        }
        return cumple;
    }

    @Override
    public String toString() {
        String aux= super.toString();
        for (int i = 0; i<dl; i++)
            aux += "\n"+ coroSemi[i].toString();
    return aux;}



}
