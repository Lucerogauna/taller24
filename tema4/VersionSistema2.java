/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author alumnos
 */
public class VersionSistema2 extends Sistema{

    public VersionSistema2(int anioApartir, int nAnios, Estacion e) {
        super(anioApartir, nAnios, e);
    }
    //a reportar el promedio histórico por meses.
     public String reportarProm (){
    String Aux= "";  double sumaXmes = 0;
    int i; int j; 
    for ( i = 0; i<11; i++){ // recorre por filas ( primero se fija mes 1 en todos los años y asi suc
       sumaXmes=0;
    // no hacer getMatriz porque rompo el encapsulamiento!!!!!!!!!!!OJOOOO
        for ( j = 0; j<this.getnAnios(); j++)
            sumaXmes += this.getTemperatura(i, j); // me quedo con la tempo de ese año y mes
         double prom = sumaXmes / this.getnAnios(); // o tendria que iniciarlo simepre?
        Aux += "Mes"+ i +":"+ prom+"°C"+ "/n"; // recorre filas (meses) e informa el promedio por mes
    }
    return Aux;
    }
      public String toString() {
        return super.toString()+ reportarProm();
   }
    
}
