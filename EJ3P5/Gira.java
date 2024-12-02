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
public class Gira extends Recital {
    private String nombreGira;
    private Fecha [] fechas;
    private int fechaAct; // dl del vec de fechas

    public Gira(String nombreGira, int Nfechas,  String nombreBanda, int numCanciones) {
        super(nombreBanda, numCanciones);
        this.nombreGira = nombreGira;
       this.fechas = new Fecha [Nfechas];
         for (int i = 0; i<Nfechas; i++)
             this.fechas[i] = new Fecha(); //inicializo cada pos 
        this.fechaAct = 0;
    }

    public int getFechaAct() {
        return fechaAct;
    }

    private void setFechaAct(int fechaAct) {
        this.fechaAct = fechaAct;
    }
    
    public void agregarFecha (Fecha fecha){
        fechas[fechaAct] = fecha;
       fechaAct++;
    }
    public void imprimirFechas(){ //Lo hice de prueba
        System.out.print("IMPRIME LAS FECHAS CARGADAS"+"\n");
    for (int i = 0; i< fechaAct; i++)
        System.out.print("\n"+fechas[i].toString()+"\n");
                
      System.out.print("fin");
                }
    @Override
    public String actuar() { 
//Corregir capaz imprime mal 
// edto comparte con evento ocacional entonces tengo que agregarlo a la superclass
        int i = 0;String aux ="";
        for (i= 0; i<fechaAct; i++)
             aux +=  "Buenas noches"+"\n" + "Quiero acceder a la fecha n" + (i+1);
        if (fechas[i] != null) { // me dice que no esta cargado
             aux += "\n"+fechas[i].getCiudad() +
             "\n"+super.actuar();
            }
        this.setFechaAct(this.getFechaAct()+1);
        System.out.println("fecha proxima"+ fechaAct);
        
        return aux;
       //? 
    }

    @Override
    public double calcularCosto() {
       return (3000* fechaAct); //fechA ACT TIENE LA CANT DE FECHAS
    }
    
    
}
