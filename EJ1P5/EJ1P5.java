/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EJ1P5;

/**
 *
 * @author Usuario
 */
public class EJ1P5 {

    /**
     *preguntar otorgar todas en investigador?
     */
    public static void main(String[] args) {
        Proyecto pro = new Proyecto("Proyecto X", 1234, "Lucero Gauna");
        Investigador investigador1= new Investigador ("Ana", 2, "Ambiente");
        Investigador investigador2= new Investigador ("Josefina", 3, "Tecnologia");
        Investigador investigador3= new Investigador ("Soni", 1, "Seguridad");
        pro.agregarInvestigador(investigador1);
        pro.agregarInvestigador(investigador2);
        pro.agregarInvestigador(investigador3);
        Subsidio sub1 = new Subsidio (800, "Expensas");
        Subsidio sub2 = new Subsidio (5000, "Luz");
        Subsidio sub3 = new Subsidio (1000, "Gas");
        investigador1.agregarSub(sub1);
        investigador2.agregarSub(sub1);
        investigador3.agregarSub(sub1);
        investigador1.agregarSub(sub2);
        investigador2.agregarSub(sub2);
        investigador3.agregarSub(sub2);
        investigador1.agregarSub(sub3);
        investigador2.agregarSub(sub3);
        investigador3.agregarSub(sub3);
        System.out.println(pro.toString());
    }
    
}
