package ar.org.centro8.curso.java.proyectofinal.repositories.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ar.org.centro8.curso.java.proyectofinal.entities.Receta_insumo;
import ar.org.centro8.curso.java.proyectofinal.enums.Medida;
import ar.org.centro8.curso.java.proyectofinal.repositories.interfaces.I_Receta_insumoRepository;

public class Receta_insumoRepository implements I_Receta_insumoRepository {

    private Connection conn;

    public Receta_insumoRepository(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void remove(Receta_insumo receta_insumo) {
        if (receta_insumo == null)
            return;
        try (PreparedStatement ps = conn.prepareStatement("delete from receta_insumo where id=?")) {
            ps.setInt(1, receta_insumo.getId());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    @Override
    public void save(Receta_insumo receta_insumo) {
        if (receta_insumo == null)
            return;
        try (PreparedStatement ps = conn.prepareStatement(
                "insert into receta_insumo (cantidad,und_medida,subtotal,receta_id,insumo_id) values (?,?,?,?,?)",
                PreparedStatement.RETURN_GENERATED_KEYS);) {
            ps.setDouble(1, receta_insumo.getCantidad());
            ps.setString(2, receta_insumo.getUnd_medida().toString());
            ps.setDouble(3, receta_insumo.getSubtotal());
            ps.setInt(4, receta_insumo.getreceta_id());
            ps.setInt(5, receta_insumo.getinsumo_id());
            ps.execute();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next())
                receta_insumo.setId(rs.getInt(1));
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    @Override
    public void update(Receta_insumo receta_insumo) {
        if (receta_insumo == null)
            return;
        try (PreparedStatement ps = conn.prepareStatement(
                "update receta_insumo set cantidad=?, und_medida=?, subtotal=?, receta_id=?, insumo_id=?  where id=?")) {
            ps.setDouble(1, receta_insumo.getCantidad());
            ps.setString(2, receta_insumo.getUnd_medida().toString());
            ps.setDouble(3, receta_insumo.getSubtotal());
            ps.setDouble(4, receta_insumo.getreceta_id());
            ps.setInt(5, receta_insumo.getinsumo_id());
            ps.setInt(6, receta_insumo.getId());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    @Override
    public List<Receta_insumo> getAll() {
        List<Receta_insumo> list = new ArrayList<>();
        try (ResultSet rs = conn.createStatement().executeQuery("select * from receta_insumo")) {
            while (rs.next()) {
                list.add(
                        new Receta_insumo(
                                rs.getInt("id"),
                                rs.getDouble("cantidad"),
                                Medida.valueOf(rs.getString("und_medida")),
                                rs.getDouble("subtotal"),
                                rs.getInt("receta_id"),
                                rs.getInt("insumo_id")));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

}
