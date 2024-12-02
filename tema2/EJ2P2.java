/*2- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
obtener edad 0. Luego de almacenar la información:
- Informe la cantidad de personas mayores de 65 años.
- Muestre la representación de la persona con menor DNI.
preguntar del minimo!!
 */
package tema2;
import PaqueteLectura.GeneradorAleatorio;
public class EJ2P2 {
    public static void main (String []args){
        Persona [] vec = new Persona [14];
        GeneradorAleatorio.iniciar();
        Persona per;
        per = new Persona();
        Persona perMenor = new Persona();
        int menorDni= 9999;
       // perMenor.setEdad(100);
        per.setDNI(GeneradorAleatorio.generarInt(5000));
        per.setNombre(GeneradorAleatorio.generarString(10));
        per.setEdad(GeneradorAleatorio.generarInt(100));
        int  i = 0;
        int cant=0;
        while (( per.getEdad()!= 0) && (i<14)){
            System.out.println("imprime lo guardado en "+ i);
           System.out.println( per.toString());
            vec[i] = per;
            i++;
            if (per.getEdad()> 65)
                cant++;
            if (per.getDNI()< menorDni){ //preguntar
                menorDni = per.getDNI();
                perMenor= per;
            }
            ///LEE otra persona nuevament
        per = new Persona();
        per.setDNI(GeneradorAleatorio.generarInt(500000));
        per.setNombre(GeneradorAleatorio.generarString(10));
        per.setEdad(GeneradorAleatorio.generarInt(100));
    }
        System.out.print("La cantidad de personas myores a 65 son"+ cant);
        System.out.println(perMenor.toString());
        System.out.print("fin");
    }
    
}
