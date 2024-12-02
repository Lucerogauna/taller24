/*
 3- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
 cada día se entrevistarán a 8 personas en distinto turno.
 a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
 nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
 personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
 siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
 40cupos decasting.
 Unavezfinalizada la inscripción:
 b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
 NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar
 Strings use el método equals
 */
package tema2;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class EJ3P2 {
    public static void main (String []args){
    Persona [][] mtz = new Persona [4][7];
    int i=0; int j=0; // i dias j turnos
    Persona per =  new Persona();
    System.out.println("Leer nombre");
    per.setNombre(Lector.leerString());
       int DiaAct=0;
       int dl = 0;
    while (!per.getNombre().equals("zzz") && (dl <40)){//mientras no sea zz y la ultimapos este vacia
     
        int turno = 0;
        while (!per.getNombre().equals("zzz")&& (turno <7)) {
        dl++;
        System.out.println("Leer DNI");
         per.setDNI(Lector.leerInt());
         System.out.println("Leer edad");
         per.setEdad(Lector.leerInt());
         mtz[DiaAct][turno] = per;
         System.out.print("Carga el dia"+ DiaAct + "Turno" + turno);
         turno++;
         System.out.println("Leer nombre");
         per = new Persona ();
         per.setNombre(Lector.leerString());
    }
       DiaAct++;
 }
    System.out.println("informo dl por las dudas"+ dl);
    int dia=0;
    while ((i<dl) && (dia<4)){
         j = 0;
        while ((i<dl)&&(j<7)){
         System.out.println(mtz[dia][j].toString());
        j++;
        i++;
        }
        dia++;
     }
    /*otra opcion es recorrer con un for y saco df div cantColumnas = *cant de filas completas para imprimir*
    df mod CantColumnas= *imprime los restantes de la ultima columna *
    */
}}