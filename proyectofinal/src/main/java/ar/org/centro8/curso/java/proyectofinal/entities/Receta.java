package ar.org.centro8.curso.java.proyectofinal.entities;

public class Receta {
    private int id;
    private String nombre;
    private double costo_receta;
    private double precio_ideal;
    private double precio_venta;
    private double rendimiento;

    public Receta() {
    }

    public Receta(String nombre) {
        this.nombre = nombre;
    }

    public Receta(String nombre, double costo_receta, double precio_ideal, double precio_venta, double rendimiento) {
        this.nombre = nombre;
        this.costo_receta = costo_receta;
        this.precio_ideal = precio_ideal;
        this.precio_venta = precio_venta;
        this.rendimiento = rendimiento;
    }

    public Receta(int id, String nombre, double costo_receta, double precio_ideal, double precio_venta,
            double rendimiento) {
        this.id = id;
        this.nombre = nombre;
        this.costo_receta = costo_receta;
        this.precio_ideal = precio_ideal;
        this.precio_venta = precio_venta;
        this.rendimiento = rendimiento;
    }

    @Override
    public String toString() {
        return "Receta [costo_receta=" + costo_receta + ", id=" + id + ", nombre=" + nombre + ", precio_ideal="
                + precio_ideal + ", precio_venta=" + precio_venta + ", rendimiento=" + rendimiento + "]";
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

    public double getCosto_receta() {
        return costo_receta;
    }

    public void setCosto_receta(double costo_receta) {
        this.costo_receta = costo_receta;
    }

    public double getPrecio_ideal() {
        return precio_ideal;
    }

    public void setPrecio_ideal(double precio_ideal) {
        this.precio_ideal = precio_ideal;
    }

    public double getPrecio_venta() {
        return precio_venta;
    }

    public void setPrecio_venta(double precio_venta) {
        this.precio_venta = precio_venta;
    }

    public double getRendimiento() {
        return rendimiento;
    }

    public void setRendimiento(double rendimiento) {
        this.rendimiento = rendimiento;
    }

}
