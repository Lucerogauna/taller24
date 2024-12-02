/*
3- Escriba un programa que defina una matriz de enteros de tamaño 5x5. Inicialice
la matriz con números aleatorios entre 0 y 30.
Luego realice las siguientes operaciones:
- Mostrar el contenido de la matriz en consola. done 
- Calcular e informar la suma de los elementos de la fila 1
- Generar un vector de 5 posiciones donde cada posición j contiene la suma
de los elementos de la columna j de la matriz. Luego, imprima el vector.
- Leer un valor entero e indicar si se encuentra o no en la matriz. En caso de
encontrarse indique su ubicación (fila y columna) en caso contrario
imprima “No se encontró el elemento”.
NOTA: Dispone de un esqueleto para este programa en Ej03Matrices.java

 */
package tema1;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
//Paso 1. importar la funcionalidad para generar datos aleatorios

public class Ej03Matrices {

    public static void main(String[] args) {
        int mtz[][]= new int [5][5];
        int vec[]= new int[5];
        GeneradorAleatorio.iniciar();
        int i, j; 
        int sumaFi= 0;
        //i filas - ; j columnas | 
        for (i=0; i<5; i++){
            for (j=0; j<5; j++){
                mtz[i][j]= GeneradorAleatorio.generarInt(31);
                if (i == 0)
                sumaFi = sumaFi + mtz[i][j];
        System.out.println("mtz pos " + (i+ 1) + "|"+ (j+1) + " es "+ mtz[i][j]);}
        }
        System.out.println("suma de la fila 1 es "+ sumaFi);
        System.out.println("///////Finalizo la carga //////////");
     System.out.print("Leer un valor");
     int x = Lector.leerInt();
     System.out.println("se leyo "+ x);
     //buscar
      boolean ok = false;
    for (i = 0; i < 5; i++) {
      for (j = 0; j < 5; j++) {
           if ( x == mtz[i][j] ){
               ok= true;
            System.out.println(mtz[i][j] + "se encontro en la pos"+ (i+1) + "-"+ (j+1));}
      }
    }
                    if (ok==false) 
      System.out.println("no se encontro");
    
        
      System.out.println("SECOND VERSION BUSCO EL " + x);
        ok = false; // recorro la matriz hasta encontrar  preguntsr 
        i=0;
        j=0;
        while ((i<5) && (ok==false)){
            System.out.println("fila"+ i);
            
            while ((j<5)&& (ok == false)){
               System.out.println ("col"+ j);
            if (mtz[i][j]== x ) {
                ok = true;
                System.out.println(mtz[i][j] + "se encontro en la pos"+ (i+1) + "-"+ (j+1));
            }
           j++;
         
    }
        j=0;
        i++;
        }
    }
        
}