/*
  5- El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen
 (con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad
 de la comida (2) Precio (3) Ambiente.
 Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
 para cada uno de los aspectos y almacene la información en una estructura. Luego
 imprima la calificación promedio obtenida por cada aspecto
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio; //why?

import PaqueteLectura.GeneradorAleatorio;
public class Ej05Resto {
   public static void main (String[]args){
       int [][] mtz = new int [4][3];
       GeneradorAleatorio.iniciar();
       //Fila Clientes/ Columnas aspectos
       for (int i=0; i<4; i++){
           int n= i+1;
               System.out.println("Leer puntajes del cliente "+ n);
           
           for (int j=0; j<3; j++){
               System.out.println("Leer aspecto "+ j);{
               int puntaje= GeneradorAleatorio.generarInt(11);
           
              System.out.println(puntaje);
           mtz[i][j]= puntaje;
           }
//Lector.leerInt();
           }
       }
   System.out.print("Finalizo la carga");
       double p;
   for (int j=0; j<3; j++){
       int suma=0;
       for (int i=0; i<4; i++){ //recorro las filas
           System.out.println(mtz[i][j]);
           suma= suma +  mtz[i][j]; 
       }
       p = (double)suma/5;
       System.out.println("el puntaje promedio de la categoria "+ j+" es de " + p);
   }
  }
    
   
}