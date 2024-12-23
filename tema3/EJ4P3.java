/*
 4-A- Un hotel posee N habitaciones. De cada habitación conoce costo por noche, si está
 ocupada y, en caso de estarlo, guarda el cliente que la reservó (nombre, DNI y edad).
 (i) Genere las clases necesarias. Para cada una provea métodos getters/setters adecuados.
 (ii) Implemente los constructores necesarios para iniciar: los clientes a partir de nombre,
 DNI, edad; el hotel para N habitaciones, cada una desocupada y con costo aleatorio e/ 2000
 y 8000.
 (iii) Implemente en las clases que corresponda todos los métodos necesarios para:--
Ingresar un cliente C en la habitación número X. Asuma que X es válido (es decir, está
 en el rango 1.N) y quelahabitación está libre.
 Aumentar el precio de todas las habitaciones en un monto recibido.
 Obtener la representación String del hotel, siguiendo el formato:
 {Habitación 1: costo, libre u ocupada, información del cliente si está ocupada}
 …
 {Habitación N: costo, libre u ocupada, información del cliente si está ocupada}
 B- Realice un programa que instancie un hotel, ingrese clientes en distintas habitaciones,
 muestre el hotel, aumente el precio de las habitaciones y vuelva a mostrar el hotel.
 NOTAS: Reúsela clase Persona. Para cada método solicitado piense a qué clase debe
 delegar la responsabilidad de la operación
 */
package tema3;

import PaqueteLectura.GeneradorAleatorio;
import tema2.Persona;

/**
 *
 * @author Usuario
 */
public class EJ4P3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        // TODO code application logic here
        Hotel h = new Hotel(10);
        Persona cliente= new Persona ("Carlos", 1234, 50);
        h.agregarCliAHabitacion(1, cliente);
        Persona cliente2 = new Persona ("Lucia", 9747, 26);
        h.agregarCliAHabitacion(5, cliente2);
        System.out.println (h.toString());
        h.aumentarPrecioHabitaciones(200);
        System.out.println (h.toString());
        
    }
    
}
