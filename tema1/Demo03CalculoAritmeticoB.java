/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;
import PaqueteLectura.Lector;

public class Demo03CalculoAritmeticoB {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        double num = 88.8888;
        System.out.print("leer edad");
        int edad= Lector.leerInt();
        System.out.println ("la edad leida fue: "+edad);
        int i = 4/3;             // División entera i=1
        System.out.println(i);
        double d1 = 4.0/3.0;     // División real d1=1.3333
        System.out.println(d1);
        double d2 = 4/3;         // División entera d2=1.0
        System.out.println(d2);
        double d3 = (double) 4/3; 
        System.out.println(d3);  // División real d3=1.333
        
    }
    
}
