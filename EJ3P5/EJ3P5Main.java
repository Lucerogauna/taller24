/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EJ3P5;

//PReguntar error al imprimir y linea 22 y 23 del main es lo mismo?
//Preguntar TEMA 3 ej de Hoteles, porqu hace new ?
public class EJ3P5Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        EventoOcasional evento = new EventoOcasional ("Show de beneficio" , "Municipalidad de Berisso", "9deMayo", "Los totora", 7);
        evento.agregarTema("Marchate ahora"); evento.agregarTema("Solo por un beso");
        System.out.println(evento.actuar());
        System.out.println(evento.calcularCosto()); 
        Gira gira = new Gira ("Black Summer" , 10 , "Red Hot Chilli Peppers", 10);
       // Fecha fecha = new Fecha ( "Argentina", "26 de Noviembre");
        Fecha fecha2 = new Fecha ( "Brasil", "04 de Diciembre");
        gira.agregarFecha(new Fecha("Argentina", "26 de Noviembre"));
        gira.agregarFecha(fecha2);
      gira.imprimirFechas();
      System.out.println(gira.getFechaAct()); //Par VER SI ME CARGAN
        gira.actuar();
        gira.agregarTema("Californication");
        System.out.println(gira.actuar());
        System.out.println(gira.calcularCosto());
    }
    
}
