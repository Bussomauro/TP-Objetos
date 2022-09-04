package ar.org.centro8.curso.java.proyectofinal.repositories.interfaces;

import java.util.ArrayList;
import java.util.List;

import ar.org.centro8.curso.java.proyectofinal.entities.Insumo;
import ar.org.centro8.curso.java.proyectofinal.entities.Receta;
import ar.org.centro8.curso.java.proyectofinal.entities.Receta_insumo;

public interface I_Receta_insumoRepository {
    void remove(Receta_insumo receta_insumo);

    void save(Receta_insumo receta_insumo);

    void update(Receta_insumo receta_insumo);

    default Receta_insumo getById(int id) {
        return getAll()
                .stream()
                .filter(ri -> ri.getId() == id)
                .findFirst()
                .orElse(new Receta_insumo());
    }

    List<Receta_insumo> getAll();

    default List<Receta_insumo> getLikeId(int id) {
        if (id == 0)
            return new ArrayList<>();
        return getAll()
                .stream()
                .filter(ri -> ri.getId() != 0)
                .toList();
    }

    default List<Receta_insumo> getByReceta(Receta receta) {
        if (receta == null)
            return new ArrayList<>();
        return getAll()
                .stream()
                .filter(ri -> ri.getreceta_id() == receta.getId())
                .toList();
    }

    default List<Receta_insumo> getByInsumo(Insumo insumo) {
        if (insumo == null)
            return new ArrayList<>();
        return getAll()
                .stream()
                .filter(ri -> ri.getinsumo_id() == insumo.getId())
                .toList();
    }
}
