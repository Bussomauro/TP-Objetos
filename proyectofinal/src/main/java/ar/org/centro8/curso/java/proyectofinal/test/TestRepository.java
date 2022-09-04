package ar.org.centro8.curso.java.proyectofinal.test;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import ar.org.centro8.curso.java.proyectofinal.connections.Connector;
import ar.org.centro8.curso.java.proyectofinal.entities.Insumo;
import ar.org.centro8.curso.java.proyectofinal.entities.Proveedor;
import ar.org.centro8.curso.java.proyectofinal.entities.Receta;
import ar.org.centro8.curso.java.proyectofinal.entities.Receta_insumo;
import ar.org.centro8.curso.java.proyectofinal.enums.Medida;
import ar.org.centro8.curso.java.proyectofinal.enums.Rubro;
import ar.org.centro8.curso.java.proyectofinal.negocio.RecetaNegocio;
import ar.org.centro8.curso.java.proyectofinal.repositories.interfaces.I_RecetaRepository;
import ar.org.centro8.curso.java.proyectofinal.repositories.interfaces.I_Receta_insumoRepository;
import ar.org.centro8.curso.java.proyectofinal.repositories.interfaces.I_InsumoRepository;
import ar.org.centro8.curso.java.proyectofinal.repositories.interfaces.I_ProveedorRepository;
import ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.InsumoRepository;
import ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.ProveedorRepository;
import ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.RecetaRepository;
import ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.Receta_insumoRepository;

public class TestRepository {

    public static void main(String[] args) {
        
        Connection conn = Connector.getConnection();

        // System.out.println("--------------------------");

        // -- CREO PROVEEDOR --
        // I_ProveedorRepository pr = new ProveedorRepository(conn);

        // -- CREO PROVEEDOR NACCATO --
        // Proveedor proveedor = new Proveedor("NACCATO", Rubro.ALMACEN);
        // pr.save(proveedor);
        // System.out.println(proveedor);

        // -- ELIMINO PROVEEDOR CON ID= --

        // pr.remove(pr.getById(6));

        //  -- SETEO ALGUN CAMPO DE PROVEEDOR CON ID= --

        // Proveedor proveedor = pr.getById(1);
        // proveedor.setRubro(Rubro.ALMACEN);
        // pr.update(proveedor);

        // pr.getAll().forEach(System.out::println);

        // System.out.println("--------------------------");

        // -- CREO INSUMO --
        I_InsumoRepository ir = new InsumoRepository(conn);

        // -- CREO INSUMO ARROZ --
        //  Insumo insumo = new Insumo("ARROZ", 95.5, 1, 1);
        //  ir.save(insumo);
        //  System.out.println(insumo);
        
        // -- CREO INSUMO CHOCOLATE --
        // Insumo insumo = new Insumo("CHOCOLATE", 350.84, 0.55, 1);
        // ir.save(insumo);
        // System.out.println(insumo);
        // System.out.println("**************************************************************************************");

        // -- ELIMINO INSUMO CON ID= --
        // ir.remove(ir.getById(7));

        // -- SETEO ALGUN CAMPO DE INSUMO CON ID= --
        // insumo = ir.getById(12);
        // insumo.setPrecio_compra(65);
        // ir.update(insumo);

        // ir.getAll().forEach(System.out::println);

        // System.out.println("--------------------------");

        I_RecetaRepository rr = new RecetaRepository(conn);
        
        Receta receta = new Receta("POLLO AL DISCO");
        rr.save(receta);
        System.out.println(receta);
        int recetaId = receta.getId();

        // System.out.println("--------------------------");

        I_Receta_insumoRepository rir = new Receta_insumoRepository(conn);
        
        List <Receta_insumo> listaRI= new ArrayList<>(); 
        listaRI.add(new Receta_insumo(0.3, Medida.KG, receta.getId(), 14));
        listaRI.add(new Receta_insumo(0.05, Medida.KG, recetaId, 9));
        listaRI.add(new Receta_insumo(0.05, Medida.KG, recetaId, 8));
        listaRI.add(new Receta_insumo(0.1, Medida.KG, recetaId, 5));
        listaRI.add(new Receta_insumo(0.08, Medida.KG, recetaId, 6));
        listaRI.add(new Receta_insumo(0.01, Medida.KG, recetaId, 4));

        for(Receta_insumo ri: listaRI){
            rir.save(ri);
        }

        double costo_receta=0;
        for(Receta_insumo ri: listaRI){
            costo_receta+=(ir.getById(ri.getinsumo_id()).getPrecio_x_und()*ri.getCantidad());
        }

        // carga costo y precio ideal
        receta.setCosto_receta(costo_receta);
        receta.setPrecio_ideal(costo_receta * 3.5);

        // carga precio venta
        receta.setPrecio_venta(costo_receta *3.6);

        // rendimiento
        receta.setRendimiento(costo_receta * 100 / receta.getPrecio_venta());

        System.out.println(receta);
        rr.update(receta);
        System.out.println(receta);
        rr.getAll().forEach(System.out::println);


        System.out.println("-------------------------------");
        RecetaNegocio rn = new RecetaNegocio(new Receta("POLLO CON PAPA"), rr, ir, rir);
        List<Receta_insumo> list = new ArrayList<>();
        list.add(new Receta_insumo(0.3, Medida.KG, rn.getReceta().getId(), 14));
        list.add(new Receta_insumo(1.3, Medida.KG, rn.getReceta().getId(), 5));
        list.add(new Receta_insumo(0.8, Medida.KG, rn.getReceta().getId(), 2));
        list.add(new Receta_insumo(0.56, Medida.KG, rn.getReceta().getId(), 7));
        rn.setReceta_Insumos(listaRI);
        System.out.println(rn.getReceta().getPrecio_ideal());
        rn.setPrecio_venta(1500);
        rr.getAll().forEach(System.out::println);

    }

}
