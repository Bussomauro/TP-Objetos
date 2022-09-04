package ar.org.centro8.curso.java.proyectofinal.repositories.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ar.org.centro8.curso.java.proyectofinal.entities.Insumo;
import ar.org.centro8.curso.java.proyectofinal.repositories.interfaces.I_InsumoRepository;

public class InsumoRepository implements I_InsumoRepository {

    private Connection conn;

    public InsumoRepository(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void remove(Insumo insumo) {
        if (insumo == null)
            return;
        try (PreparedStatement ps = conn.prepareStatement("delete from insumo where id=?")) {
            ps.setInt(1, insumo.getId());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public void save(Insumo insumo) {
        if (insumo == null)
            return;
        try (PreparedStatement ps = conn.prepareStatement(
                "insert into insumo (nombre,precio_compra,factor,precio_x_und,proveedor_id) values (?,?,?,?,?)",
                PreparedStatement.RETURN_GENERATED_KEYS);) {
            ps.setString(1, insumo.getNombre());
            ps.setDouble(2, insumo.getPrecio_compra());
            ps.setDouble(3, insumo.getFactor());
            ps.setDouble(4, insumo.getPrecio_compra() / insumo.getFactor());
            ps.setInt(5, insumo.getProveedor_id());
            ps.execute();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next())
                insumo.setId(rs.getInt(1));
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    @Override
    public void update(Insumo insumo) {
        if (insumo == null)
            return;
        try (PreparedStatement ps = conn.prepareStatement(
                "update insumo set nombre=?, precio_compra=?, factor=?, precio_x_und=?, proveedor_id=?  where id=?")) {
            ps.setString(1, insumo.getNombre());
            ps.setDouble(2, insumo.getPrecio_compra());
            ps.setDouble(3, insumo.getFactor());
            ps.setDouble(4, insumo.getPrecio_x_und());
            ps.setInt(5, insumo.getProveedor_id());
            ps.setInt(6, insumo.getId());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    @Override
    public List<Insumo> getAll() {
        List<Insumo> list = new ArrayList<>();
        try (ResultSet rs = conn.createStatement().executeQuery("select * from insumo")) {
            while (rs.next()) {
                list.add(
                        new Insumo(
                                rs.getInt("id"),
                                rs.getString("nombre"),
                                rs.getDouble("precio_compra"),
                                rs.getDouble("factor"),
                                rs.getDouble("precio_x_und"),
                                rs.getInt("proveedor_id")));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

}
