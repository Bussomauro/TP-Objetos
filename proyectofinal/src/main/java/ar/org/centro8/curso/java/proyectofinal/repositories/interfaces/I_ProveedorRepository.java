package ar.org.centro8.curso.java.proyectofinal.repositories.interfaces;

import java.util.ArrayList;
import java.util.List;

import ar.org.centro8.curso.java.proyectofinal.entities.Proveedor;

public interface I_ProveedorRepository {
    void save(Proveedor proveedor);

    void remove(Proveedor proveedor);

    void update(Proveedor proveedor);

    default Proveedor getById(int id) {
        return getAll()
                .stream()
                .filter(p -> p.getId() == id)
                .findFirst()
                .orElse(new Proveedor());
    }

    List<Proveedor> getAll();

    default List<Proveedor> getLikeNombre(String nombre) {
        if (nombre == null)
            return new ArrayList<>();
        return getAll()
                .stream()
                .filter(p -> p.getNombre() != null)
                .filter(p -> p.getNombre().toLowerCase().contains(nombre.toLowerCase()))
                .toList();
    }
}