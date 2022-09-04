package ar.org.centro8.curso.java.proyectofinal.entities;

import ar.org.centro8.curso.java.proyectofinal.enums.Medida;

public class Receta_insumo {
    private int id;
    private double cantidad;
    private Medida und_medida;
    private double subtotal;
    private int receta_id;
    private int insumo_id;

    public Receta_insumo() {
    }

    

    public Receta_insumo(double cantidad, Medida und_medida, int receta_id, int insumo_id) {
        this.cantidad = cantidad;
        this.und_medida = und_medida;
        this.receta_id = receta_id;
        this.insumo_id = insumo_id;
    }



    public Receta_insumo(double cantidad, Medida und_medida, double subtotal, int receta_id, int insumo_id) {
        this.cantidad = cantidad;
        this.und_medida = und_medida;
        this.subtotal = subtotal;
        this.receta_id = receta_id;
        this.insumo_id = insumo_id;
    }

    public Receta_insumo(int id, double cantidad, Medida und_medida, double subtotal, int receta_id, int insumo_id) {
        this.id = id;
        this.cantidad = cantidad;
        this.und_medida = und_medida;
        this.subtotal = subtotal;
        this.receta_id = receta_id;
        this.insumo_id = insumo_id;
    }

    @Override
    public String toString() {
        return "Receta_insumo [cantidad=" + cantidad + ", id=" + id + ", insumo_id=" + insumo_id + ", receta_id="
                + receta_id + ", subtotal=" + subtotal + ", und_medida=" + und_medida + "]";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getCantidad() {
        return cantidad;
    }

    public void setCantidad(double cantidad) {
        this.cantidad = cantidad;
    }

    public Medida getUnd_medida() {
        return und_medida;
    }

    public void setUnd_medida(Medida und_medida) {
        this.und_medida = und_medida;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public int getreceta_id() {
        return receta_id;
    }

    public void setreceta_id(int receta_id) {
        this.receta_id = receta_id;
    }

    public int getinsumo_id() {
        return insumo_id;
    }

    public void setinsumo_id(int insumo_id) {
        this.insumo_id = insumo_id;
    }

}
