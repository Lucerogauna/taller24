
package tema2;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
public class EJ5P2 {
    public static void main( String []args){
        Partido []vec = new Partido [19] ;
        GeneradorAleatorio.iniciar();
        Partido p = new Partido();
        System.out.println ("Leer nombre local");
        p.setLocal(Lector.leerString());
        System.out.println ("Leer nombre del visitante");
        p.setVisitante(Lector.leerString());
        int indice = 0;
        while (!p.getVisitante().equals("zzz") && (indice <19)){
            //System.out.println ("Leer cant goles visitante");
            p.setGolesLocal(GeneradorAleatorio.generarInt(5));
            //System.out.println ("Leer cant goles local");
            p.setGolesVisitante(GeneradorAleatorio.generarInt(5));
            vec[indice] = p;
            indice++; //check
            p = new Partido ();
            //Partido p2= new Partido ();
            //p = p2; /////////////////////// preguntar si esta bien
            System.out.println ("Leer nombre local");
            p.setLocal(Lector.leerString());
            System.out.println ("Leer nombre del visitante");
            p.setVisitante(Lector.leerString());
        }
        int i ; int riverGana=0;int sumaGolesBoca=0;
        for (i=0 ; i< indice; i++){
        System.out.println(i);
        System.out.println(indice);
            System.out.println(vec[i].toString());
           if (vec[i].getGanador().equals("river"))
               riverGana ++;
           if (vec[i].getLocal().equals("boca"))
               sumaGolesBoca += vec[i].getGolesLocal();
    }
    
        System.out.println("Cantidad de veces que gano river" + riverGana);
        System.out.println("Cantidad de goles todo el torneo que hizo boca de local" + sumaGolesBoca);
    }
}
