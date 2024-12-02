/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author Usuario
 */
public class Circulos {
    private double radio;
    private String relleno;
    private String linea;

    public Circulos(double radio, String relleno, String linea) {
        this.radio = radio;
        this.relleno = relleno;
        this.linea = linea;
    }
    public Circulos (){
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getRelleno() {
        return relleno;
    }

    public void setRelleno(String relleno) {
        this.relleno = relleno;
    }

    public String getLinea() {
        return linea;
    }

    public void setLinea(String linea) {
        this.linea = linea;
    }
    
    public double calcularPerimetro (){
    double aux= 2* Math.PI * this.radio ; // this radio o solo radio????
    return aux; 
    }
    
    public double calcularArea (){
    double aux;
    aux = Math.pow((Math.PI* radio ), 2); // math.pow(base, exponente)-> hace elevado al cuadrad
    return aux;
    }
}

