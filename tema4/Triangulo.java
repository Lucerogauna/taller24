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
public class Triangulo extends Figura {
    private int lado1, lado2, lado3;

    public Triangulo(int lado1, int lado2, int lado3, String unCR, String unCL) {
        super(unCR, unCL);
        setLado1(lado1);
        setLado2(lado2);
        setLado3(lado3);
    }
    

    
    public int getLado1() {
        return lado1;
    }

    public void setLado1(int lado1) {
        this.lado1 = lado1;
    }

    public int getLado2() {
        return lado2;
    }

    public void setLado2(int lado2) {
        this.lado2 = lado2;
    }

    public int getLado3() {
        return lado3;
    }

    public void setLado3(int lado3) {
        this.lado3 = lado3;
    }
    
    public double calcularPerimetro(){
    int aux= getLado1() + getLado2()+ getLado3();
    return aux;
    }
    public double calcularArea() {
     double aux = getLado3() + getLado1()/2;
     return aux;
    }

    @Override
    public String toString() {
        return "Triangulo" + "lado1=" + lado1 + ", lado2=" + lado2 + ", lado3=" + lado3 + "\n"+
                super.toString();
    }
    
}
