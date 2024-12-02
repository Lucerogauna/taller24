/*
 4- Sobre un nuevoprograma, modifique el ejercicio anterior para considerar que:
 a) Durante el proceso de inscripción se pida a cada persona sus datos (nombre, DNI, edad)
 y el día en quesequiere presentar al casting. La persona debe ser inscripta en ese día, en el
 siguiente turno disponible. En caso de no existir un turno en ese día, informe la situación.
 La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos de
 casting.
 Unavezfinalizada la inscripción:
 b) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre de la
 persona a entrevistar en cada turno asignado.
 */
package tema2;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class EJ4P2 {
    public static void main (String []args){
    Persona [][] mtz = new Persona [4][7];
    int [] VecDimDias = new int[4]; //cuento la cantidad de turnod¿s de ese dia
    for (int k=0; k<4; k++)
        VecDimDias[k]=0;
    int i=0; int j=0; // i dias j turnos
    Persona per =  new Persona();
    System.out.println("Leer nombre");
    per.setNombre(Lector.leerString());
       int dia =0;
       int dl = 0;
    while (!per.getNombre().equals("zzz") && (dl <40)){//mientras no sea zz y la ultimapos este vacia
        int turno =0;
        while (!per.getNombre().equals("zzz")&& (turno <7)) {
        dl++;
        System.out.println("Leer DNI");
        per.setDNI(GeneradorAleatorio.generarInt(10000));
         //per.setDNI(Lector.leerInt());
         System.out.println("Leer edad");
         per.setEdad(GeneradorAleatorio.generarInt(100));
         //per.setEdad(Lector.leerInt());
         System.out.println("Leer dia que quiere ");
         dia = Lector.leerInt();
         mtz[dia][VecDimDias[dia]] = per;  
         System.out.print("Carga el dia"+ dia + "Turno" + VecDimDias[dia]);
         VecDimDias[dia]++; // sumo un turno mas a ese dia
        //LEO NUEVAMENTE
         System.out.println("Leer nombre");
         per = new Persona ();
         per.setNombre(Lector.leerString());
    }
    }
    for (i=0 ;i<4; i++){
        for (j=0; j<VecDimDias[i]; j++)
            System.out.println(mtz[i][j]);
    }

}
}