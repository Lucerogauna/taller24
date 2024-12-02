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
public class Investigador {
    private String nombre;
    private int categoria; // como hacer un rango?
    private String especialidad;
    private Subsidio sub[];
    private int DLSub ;

    public Investigador(String nombre, int categoria, String especialidad) {
        this.nombre = nombre;
        this.categoria = categoria;
        this.especialidad = especialidad;
        sub = new Subsidio [4];
        DLSub =0;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    private int getDLSub() {
        return DLSub;
    }

    private void setDLSub(int DLSub) {
        this.DLSub = DLSub;
    }
    
    public void agregarSub (Subsidio s){
    if (getDLSub ()< 4){
    sub[getDLSub()] = s;
    sub[getDLSub()].setOtorgado(true);
    setDLSub(getDLSub()+1);
        }
    }
    public double montoSub (){
    double aux=0;
    for (int i=0; i<getDLSub(); i++){
    aux+= sub[i].getMonto();
            }
    return aux;
    }
    public void otorgarTodas(){
    for (int i =0; i<getDLSub(); i++){ // de los subsidios que ya tengo(algunos pueden ser rechazados) otorgar todos
        if (sub[i].isOtorgado()==false)
             sub[i].setOtorgado(true);
        }
    }
    @Override
    public String toString() {
        return "Nombre " + nombre + "\n"+ "Categoria " + categoria +"\n"+ "Especialidad " + especialidad +"\n";
    }
    
    
    
}
