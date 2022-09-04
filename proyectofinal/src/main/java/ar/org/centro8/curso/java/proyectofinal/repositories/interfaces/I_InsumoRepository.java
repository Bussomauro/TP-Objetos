package ar.org.centro8.curso.java.proyectofinal.repositories.interfaces;

import java.util.ArrayList;
import java.util.List;

import ar.org.centro8.curso.java.proyectofinal.entities.Insumo;
import ar.org.centro8.curso.java.proyectofinal.entities.Proveedor;

public interface I_InsumoRepository {
    void remove(Insumo insumo);

    void save(Insumo insumo);

    void update(Insumo insumo);

    default Insumo getById(int id) {
        return getAll()
                .stream()
                .filter(i -> i.getId() == id)
                .findFirst()
                .orElse(new Insumo());
    }

    List<Insumo> getAll();

    default List<Insumo> getLikeNombre(String nombre) {
        if (nombre == null)
            return new ArrayList<>();
        return getAll()
                .stream()
                .filter(i -> i.getNombre() != null)
                .filter(i -> i.getNombre().toLowerCase().contains(nombre.toLowerCase()))
                .toList();
    }

    default List<Insumo> getByProveedor(Proveedor proveedor) {
        if (proveedor == null)
            return new ArrayList<>();
        return getAll()
                .stream()
                .filter(i -> i.getProveedor_id() == proveedor.getId())
                .toList();
    }

}
