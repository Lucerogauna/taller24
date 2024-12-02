/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EJ1P5;

/**
 *
 * @author Usuario
 */
public class Proyecto {
    private String nombreProy;
    private int cod;
    private String nombreDir;
    private Investigador investigador[] ;
    private int dl; //Canti de investigadores

    public Proyecto(String nombreProy, int cod, String nombreDir) {
        this.nombreProy = nombreProy;
        this.cod = cod;
        this.nombreDir = nombreDir;
        this.investigador = new Investigador [50];
        dl = 0;
    }

    public int getDl() {
        return dl;
    }

    private void setDl(int dl) {
        this.dl = dl;
    }
    
    public void agregarInvestigador (Investigador in){
        investigador[getDl()] = in;
        setDl(getDl()+1);
    }
    
    public double dineroTotalOtorgado(){
        double aux= 0;
        for (int i=0; i<getDl(); i++){
        aux += investigador[i].montoSub();
        }
        return aux;
    }
    
    public void otorgarTodos (String nombre){
        int i = 0;
        while ((i< getDl()) && (!investigador[i].equals(nombre)))
            i++;
        if (investigador[i].equals(nombre)) 
            investigador[i].otorgarTodas();
    }

    @Override
    public String toString() {
        String aux= "Proyecto " + nombreProy + "\n"+"Codigo " + cod + "\n"+"Nombre del Director " + nombreDir 
                +"\n"+ "Dinero Total del proyecto"+ this.dineroTotalOtorgado()+
                "\n" ;
             for (int i = 0; i<getDl(); i++)
             aux+= investigador[i].toString();
         return aux;
    }
    
    
}
