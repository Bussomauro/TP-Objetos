package ar.org.centro8.curso.java.proyectofinal.entities;

import ar.org.centro8.curso.java.proyectofinal.enums.Rubro;

public class Proveedor {
    private int id;
    private String nombre;
    private Rubro rubro;

    public Proveedor() {
    }

    public Proveedor(String nombre, Rubro rubro) {
        this.nombre = nombre;
        this.rubro = rubro;
    }

    public Proveedor(int id, String nombre, Rubro rubro) {
        this.id = id;
        this.nombre = nombre;
        this.rubro = rubro;
    }

    @Override
    public String toString() {
        return "Proveedor [id=" + id + ", nombre=" + nombre + ", rubro=" + rubro + "]";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Rubro getRubro() {
        return rubro;
    }

    public void setRubro(Rubro rubro) {
        this.rubro = rubro;
    }

}
