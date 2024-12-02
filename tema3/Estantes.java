/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

public class Estantes {
    private Libro[] estante;
    private int dl;
    
    
    public Estantes() {
        this.estante = new Libro[20];
        this.dl = 0;
        for (int i=0; i<20; i++)
            estante[i] = null; // null para objetos, 0 para numeros
    }
    
  
   
   public int getDimLog (){
        return this.dl;
   }
    
    public boolean estaLleno (){
        return (this.getDimLog() == 20);
    }
    
    public void agregarLibro (Libro li){
    if (this.getDimLog() < 20){
        estante[dl] = li;    
        dl++;
        }
    }
    
    public String toString (){
        String aux= "";
        
        for (int i = 0; i<dl; i++ )
            aux += (estante[i].toString()) + "\n";
        
        return aux;
    }
    
    public Libro getLibroConTitulo (String titulo){
        Libro  aux = null; int i =0;
        while ((i < this.dl) && (!estante[i].getTitulo().equals(titulo)))
            i++;
        if ((i < this.dl) && (estante[i].getTitulo().equals(titulo))) 
            aux = estante[i];
    return aux;
    }
    
    
    /*
    public String libroX (String titulo){
        String  aux= "---"; int i =0;
        while ((i < this.dl) && (!estante[i].getTitulo().equals(titulo)))
            i++;
        if (estante[i].getTitulo().equals(titulo)) 
            aux = estante[i].getAutor().getNombre();
    return aux;
    }No hace falta este método*/
}

