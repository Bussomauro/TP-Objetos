package ar.org.centro8.curso.java.proyectofinal.entities;

public class Insumo {
    private int id;
    private String nombre;
    private double precio_compra;
    private double factor;
    private double precio_x_und;
    private int proveedor_id;

    public Insumo() {
    }

    public Insumo(String nombre, double precio_compra, double factor, int proveedor_id) {
        this.nombre = nombre;
        this.precio_compra = precio_compra;
        this.factor = factor;
        this.proveedor_id = proveedor_id;
    }

    public Insumo(String nombre, double precio_compra, double factor, double precio_x_und, int proveedor_id) {
        this.nombre = nombre;
        this.precio_compra = precio_compra;
        this.factor = factor;
        this.precio_x_und = precio_x_und;
        this.proveedor_id = proveedor_id;
    }

    public Insumo(int id, String nombre, double precio_compra, double factor, double precio_x_und, int proveedor_id) {
        this.id = id;
        this.nombre = nombre;
        this.precio_compra = precio_compra;
        this.factor = factor;
        this.precio_x_und = precio_x_und;
        this.proveedor_id = proveedor_id;
    }

    @Override
    public String toString() {
        return "Insumo [factor=" + factor + ", id=" + id + ", proveedor_id=" + proveedor_id + ", nombre=" + nombre
                + ", precio_compra=" + precio_compra + ", precio_x_und=" + precio_x_und + "]";
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

    public double getPrecio_compra() {
        return precio_compra;
    }

    public void setPrecio_compra(double precio_compra) {
        this.precio_compra = precio_compra;
    }

    public double getFactor() {
        return factor;
    }

    public void setFactor(double factor) {
        this.factor = factor;
    }

    public double getPrecio_x_und() {
        return precio_x_und;
    }

    public void setPrecio_x_und(double precio_x_und) {
        this.precio_x_und = precio_x_und;
    }

    public int getProveedor_id() {
        return proveedor_id;
    }

    public void setProveedor_id(int proveedor_id) {
        this.proveedor_id = proveedor_id;
    }

}
