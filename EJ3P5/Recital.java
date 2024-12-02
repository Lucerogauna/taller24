/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EJ3P5;

/**
 *
 * @author Usuario
 */
public abstract class Recital {
    private String nombreBanda;
    private String [] listaDeTemas;
    private int dlTemas, dfTemas;

    public Recital(String nombreBanda, int numCanciones) {
        this.nombreBanda = nombreBanda;
        this.listaDeTemas = new String [numCanciones];
        dlTemas=0;
        dfTemas = numCanciones;
    }
    
    public void agregarTema (String songName ){
        if (dlTemas < dfTemas){
            listaDeTemas[dlTemas] = songName;
            dlTemas++;
        }
    }
    
    public  String actuar (){
        String aux = "Listado de temas" + "\n" ;
    
                for (int i= 0;i<dlTemas; i++)
                    aux += listaDeTemas[i] + "\n" ;
        return aux;
    }
    public abstract double calcularCosto ();
}