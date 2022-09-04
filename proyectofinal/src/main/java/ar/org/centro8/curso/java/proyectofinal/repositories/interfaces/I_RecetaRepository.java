package ar.org.centro8.curso.java.proyectofinal.repositories.interfaces;

import java.util.ArrayList;
import java.util.List;

import ar.org.centro8.curso.java.proyectofinal.entities.Receta;

public interface I_RecetaRepository {
    void save(Receta receta);

    void remove(Receta receta);

    void update(Receta receta);

    default Receta getById(int id) {
        return getAll()
                .stream()
                .filter(r -> r.getId() == id)
                .findFirst()
                .orElse(new Receta());
    }

    List<Receta> getAll();

    default List<Receta> getLikeNombre(String nombre) {
        if (nombre == null)
            return new ArrayList<>();
        return getAll()
                .stream()
                .filter(r -> r.getNombre() != null)
                .filter(r -> r.getNombre().toLowerCase().contains(nombre.toLowerCase()))
                .toList();
    }
}
