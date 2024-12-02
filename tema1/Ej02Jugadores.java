/* 2- Escriba un programa que lea las alturas de los 15 jugadores de un equipo de
 básquet y las almacene en un vector. Luego informe:
la altura promedio
la cantidad de jugadores con altura por encima del promedio
 NOTA: Dispone de unesqueleto para este programa en Ej02Jugadores.java
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;


public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        double [] vector = new double [15];
        double suma=0.0;
        //Paso 3: Crear el vector para 15 double 
        for (int i=0; i<15; i++){
            vector[i]= GeneradorAleatorio.generarDouble(50);
            suma += vector[i];
        System.out.println("el vector en la pos" +i+"tiene"+ vector[i]);
        }
        double promedio= suma /15;
        System.out.print("el promedio es:"+ promedio);
        int sup=0;
        for (int j=0; j<15; j++){
        if (vector[j] > promedio)
            sup++;
        
        }
        System.out.println("la cantidad de jogadores que superan el promedio es de"+sup);
        //Paso 4: Declarar indice y variables auxiliares a usar
                
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        
        //Paso 7: Calcular el promedio de alturas, informarlo
        
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
     
        //Paso 9: Informar la cantidad.
    }
    
}
