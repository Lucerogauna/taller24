/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica.EJ2P5;

/**
 *
 * @author Usuario
 */
public class Estacionamiento {
    private String nombre;
    private String direc;
    private String horaApertura;
    private String horaCierre;
    private Auto autos [][];
    private int m, n;

    public Estacionamiento(String nombre, String direc) {
        this.nombre = nombre;
        this.direc = direc;
        this.horaApertura = "8:00";
        this.horaCierre = "21:00";
        //inicializoEstacionamiento (5, 10); //esta bien? SI O pueedo decir que esto deberia tener un for inicializando las pos de la matriz en null
        this.autos= new Auto [5][10]; // 5 pisos 10 plazas 
   
    }
    private void inicializoEstacionamiento (int m, int n){
    for (int i=0; i< m; i++)
        for (int j=0; j<n; j++)
            autos[i][j]= null;
    }

    public Estacionamiento(String nombre, String direc, String horaApertura, String horaCierre, int N, int M) {
        this.nombre = nombre;
        this.direc = direc;
        this.horaApertura = horaApertura;
        this.horaCierre = horaCierre;  
        m = M; n = N;
        this.autos= new Auto [N][M]; // acordarse que empieza en 0;
        inicializoEstacionamiento (m, n); 

        
    }
    public void registrarAuto (Auto A, int X, int Y){
        autos[X-1][Y-1] = A;
    }
    /*
       //PREGUNTAR SI ESTA BIEN TENER UNA INSTANCIA DL Y DESPUES TENER METODOS PRIVADOS PARA USARLA
       */ 
        public String buscarAuto (String patenteX){
         String aux = "Auto Inexistente";
          int i=0;int j;
          boolean ok = false;
          while ((i<n) && (ok==false)){
            j = 0;
             while ((j<m) && (ok==false)){
                 
                     if ((autos[i][j] != null )&&autos[i][j].getPatente().equals(patenteX)){
                         ok = true;
                         aux = "Se encontro el auto con patente " + patenteX + "en piso :" + (i+1)+" plaza :" + (j+1);
                        }
                        j++;
                    }
                 i++;
          }
          return aux;
    
        }
        public String toString (){
            String aux ="";
        for (int i=0; i<m; i++)
            for (int j=0; j<n; j++){
                if (autos[i][j] ==null)  
                        aux += "\n"+ "Plaza " + (i+1) + " piso" + (j+1) +"   Libre" + "\n" ;
                else aux +="\n"+ "Plaza " + (i+1) + " piso" + (j+1) +"\n"+ autos[i][j].toString() ;
            }
            
        return aux;
        }
}
    
    
   
