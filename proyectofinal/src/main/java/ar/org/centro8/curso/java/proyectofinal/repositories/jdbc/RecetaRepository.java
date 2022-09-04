package ar.org.centro8.curso.java.proyectofinal.repositories.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ar.org.centro8.curso.java.proyectofinal.entities.Receta;
import ar.org.centro8.curso.java.proyectofinal.repositories.interfaces.I_RecetaRepository;

public class RecetaRepository implements I_RecetaRepository {

    private Connection conn;

    public RecetaRepository(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void save(Receta receta) {
        if (receta == null)
            return;
        try (PreparedStatement ps = conn.prepareStatement(
                "insert into receta (nombre) values (?)",
                PreparedStatement.RETURN_GENERATED_KEYS);) {
            ps.setString(1, receta.getNombre());
            // ps.setDouble(2, receta.getCosto_receta());
            // ps.setDouble(3, receta.getCosto_receta() * 3.5);
            // ps.setDouble(4, receta.getPrecio_venta());
            // ps.setDouble(5, receta.getCosto_receta() * 100 / receta.getPrecio_venta());
            ps.execute();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next())
                receta.setId(rs.getInt(1));
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    @Override
    public void remove(Receta receta) {
        if (receta == null)
            return;
        try (PreparedStatement ps = conn.prepareStatement("delete from receta where id=?")) {
            ps.setInt(1, receta.getId());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    @Override
    public void update(Receta receta) {
        if (receta == null)
            return;
        try (PreparedStatement ps = conn.prepareStatement(
                "update receta set nombre=?, costo_receta=?, precio_ideal=?, precio_venta=?, rendimiento=?  where id=?")) {
            ps.setString(1, receta.getNombre());
            ps.setDouble(2, receta.getCosto_receta());
            ps.setDouble(3, receta.getPrecio_ideal());
            ps.setDouble(4, receta.getPrecio_venta());
            ps.setDouble(5, receta.getRendimiento());
            ps.setInt(6, receta.getId());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    @Override
    public List<Receta> getAll() {
        List<Receta> list = new ArrayList<>();
        try (ResultSet rs = conn.createStatement().executeQuery("select * from receta")) {
            while (rs.next()) {
                list.add(
                        new Receta(
                                rs.getInt("id"),
                                rs.getString("nombre"),
                                rs.getDouble("costo_receta"),
                                rs.getDouble("precio_ideal"),
                                rs.getDouble("precio_venta"),
                                rs.getDouble("rendimiento")));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

}
