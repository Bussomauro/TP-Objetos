package ar.org.centro8.curso.java.proyectofinal.negocio;

import java.util.List;

import ar.org.centro8.curso.java.proyectofinal.entities.Insumo;
import ar.org.centro8.curso.java.proyectofinal.entities.Receta;
import ar.org.centro8.curso.java.proyectofinal.entities.Receta_insumo;
import ar.org.centro8.curso.java.proyectofinal.repositories.interfaces.I_InsumoRepository;
import ar.org.centro8.curso.java.proyectofinal.repositories.interfaces.I_RecetaRepository;
import ar.org.centro8.curso.java.proyectofinal.repositories.interfaces.I_Receta_insumoRepository;

public class RecetaNegocio {
    private Receta receta;
    private I_RecetaRepository rr;
    private I_InsumoRepository ir;
    private I_Receta_insumoRepository rir;


    public RecetaNegocio(Receta receta, I_RecetaRepository rr) {
        this.receta = receta;
        this.rr = rr;
    }

    public RecetaNegocio(Receta receta, I_RecetaRepository rr, I_InsumoRepository ir, I_Receta_insumoRepository rir) {
        this.receta = receta;
        this.rr = rr;
        this.ir = ir;
        this.rir = rir;
        rr.save(receta);
    }

    public void setReceta_Insumos(List<Receta_insumo> listaRI) {
        for (Receta_insumo ri : listaRI) {
            ri.setreceta_id(receta.getId());
            rir.save(ri);
        }
        double costo_receta = 0;
        for (Receta_insumo ri : listaRI) {
            costo_receta += (ir.getById(ri.getinsumo_id()).getPrecio_x_und() * ri.getCantidad());
        }
        // carga costo y precio ideal
        receta.setCosto_receta(Math.round(costo_receta*100.0)/100.0);
        receta.setPrecio_ideal(Math.round((costo_receta * 3.5)*100.0)/100.0);
        rr.update(receta);
    }

    public void setPrecio_venta(double precio_venta) {
        receta.setPrecio_venta(precio_venta);
        receta.setRendimiento(Math.round(receta.getCosto_receta() * 100.0 / receta.getPrecio_venta()));
        rr.update(receta);

    }

    public Receta getReceta() {
        return receta;
    }

    public void setReceta(Receta receta) {
        this.receta = receta;
    }

}
