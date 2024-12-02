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
public class VersionSistema1 extends Sistema{

    public VersionSistema1(int anioApartir, int nAnios, Estacion e) {
        super(anioApartir, nAnios, e);
    }
    // reportar el promedio histórico por años
    public String reportarProm (){
    String Aux= "";  double sumaXaño = 0;
    int i; int j; int ap= this.getAnioAParti(); 
    double prom;
    for (j = 0; j< this.getnAnios(); j++)
      for (i = 0; i<11; i++)
          sumaXaño += this.getTemperatura(i, j);
        prom = sumaXaño/11; // suma/ meses
        Aux += "Año"+ ap +":"+ prom +"°C"+ "/n"; 
        ap++;
    return Aux;
    }

    @Override
    public String toString() {
        return super.toString()+ reportarProm();//informa la estacion y la info proms
    }
    
}
