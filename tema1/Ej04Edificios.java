/*
 4- Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
 (1..4). Realice un programa que permita informar la cantidad de personas que
 concurrieron a cada oficina de cada piso. 
 Para esto, simule la llegada de personas al
 edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de
 oficina a la cual quiere concurrir. 
La llegada de personas finaliza al indicar un nro.de piso 9.
Al finalizar la llegada de personas, informe lo pedido.
 */
package tema1;
import PaqueteLectura.Lector;

public class Ej04Edificios {
    public static void main (String[] args) {
   int [][] edificio = new int [7][3];
    //inicializo
    for (int i=0; i<7; i++) // i piso
        for (int j=0; j<3; j++) // j oficina
            edificio[i][j] =0;
    //inicializo buena practica 
    System.out.print("Leer nro de piso ");
    int pi = Lector.leerInt();
    while (pi != 9){
         System.out.print("Leer nro oficina ");
         int of = Lector.leerInt();
            System.out.println("se leyo piso" + (pi - 1)+" ofic "+ (of - 1));
          edificio[(pi-1)][(of-1)]++;
         System.out.print("Leer nro de piso ");
        pi = Lector.leerInt();
    }
    System.out.println("Finalizo");
    int i, j;
    for (i=0; i<7; i++) {    
        for (j=0; j<3;j++){
            System.out.println("CANT piso" + (i )+ "ofic"+ (j) + "fueron:"+ edificio[i][j]); // valores +1
            }
    }
}
}