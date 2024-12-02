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
public class Dibujo {
     private String titulo;
     private Figura [] vector;
    private int guardadas;
    private int capacidadMaxima=10;
     //inicia el dibujo, sin figuras
    public Dibujo (String titulo){
        this.titulo = titulo;
        vector= new Figura [capacidadMaxima];
        setGuardadas(0);
    }

    public int getGuardadas() {
        return guardadas;
    }

    public void setGuardadas(int guardadas) {
        this.guardadas = guardadas;
    }
 //agrega la figura al dibujo
    public void agregar(Figura f){
    vector[getGuardadas()] = f ;
    setGuardadas(getGuardadas()+1);
    System.out.println("la figura "+f.toString() + " se ha guardado");
    }
 //calcula el área del dibujo:
 //suma de las áreas de sus figuras
    public double calcularArea(){
       double aux = 0;
        for (int i=0; i<guardadas; i++)
            aux += vector[i].calcularArea();
       return aux;
 //completar
    }
  //imprime el título, representación
 //de cada figura, y área del dibujo
    public void mostrar(){
        String aux= this.titulo;
        for (int i=0; i<guardadas; i++)
            aux += vector[i].toString();
    }
 //retorna está lleno el dibujo
    public boolean estaLleno() {
    return (guardadas == capacidadMaxima);
    }
}
