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
public class EventoOcasional  extends Recital{
    private String motivo;
    private String contratanteName;
    private String diaDelEvento;

    public EventoOcasional(String motivo, String contratanteName, String diaDelEvento, String nombreBanda, int numCanciones) {
        super(nombreBanda, numCanciones);
        this.motivo = motivo;
        this.contratanteName = contratanteName;
        this.diaDelEvento = diaDelEvento;
    }

    public String getMotivo() {
        return motivo;
    }

    public String getContratanteName() {
        return contratanteName;
    }

    @Override
    public String actuar() {
        String aux="";
        if (getMotivo().equals("Show de beneficio"))
              aux= "Recuerden colaborar con" + getContratanteName();
        else if (getMotivo ().equals("Show de TV"))
            aux = "Saludos amigos televidentes";
        else 
            aux= "un feliz cumpleaños para" + getContratanteName();
        aux += "\n"+super.actuar();
        return aux;
        
    }
    
    public double calcularCosto (){
        double aux;
        switch (getMotivo()) {
            case "Show de beneficio":
                aux= 0;
                break;
            case "Show de TV":
                aux = 5000;
                break;
            default:
                aux= 15000;
                break;
        }
    return aux;}
}
