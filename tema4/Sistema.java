/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.Lector;
public  abstract class Sistema  {
    private Estacion estacion;
    private double [][] anioMes;
    private int anioAParti;
    private int nAnios;

    public Estacion getEstacion() {
        return estacion;
    }

    public void setEstacion(Estacion estacion) {
        this.estacion = estacion;
    }

    public int getnAnios() {
        return nAnios;
    }

    public void setnAnios(int nAños) {
        this.nAnios = nAnios;
    }

    public int getAnioAParti() {
        return anioAParti;
    }

    public void setAnioAParti(int anioAParti) {
        this.anioAParti = anioAParti;
    }

    public Sistema(int anioApartir, int nAnios, Estacion e) {
      setEstacion(e);
      setAnioAParti(anioApartir);
      setnAnios(nAnios);
      int j, i;
     anioMes = new double [12][nAnios]; //12 meses y años
     for (i = 0; i<12  ; i++){
        for (j = 0; j< nAnios; j++){
            anioMes [i][j] = 0;
        }
        
     }
    }
    
    public void setTemperatura (int año, int mes){
        System.out.print("Registrar temp -> ingrese temp a registrar");
        double aux = Lector.leerDouble();
        System.out.println ("Imrpimime el mes: " + mes + "\n"+ "Del año: " + (año)  );
        System.out.println(anioMes [mes-1][año - this.anioAParti]);
        anioMes [mes-1][(año - this.anioAParti)] = aux;
    }
    public double getTemperatura (int mes, int anio){
        double aux=7979;
        System.out.println("mes"+ mes + "año"+ anio);
        aux = anioMes[0][0]; // esto me carga en la pos mes y año 
        
        return aux;
    }
    public abstract String reportarProm ();
    
    
    public String toString() {
        return estacion.toString();
    }


    
}