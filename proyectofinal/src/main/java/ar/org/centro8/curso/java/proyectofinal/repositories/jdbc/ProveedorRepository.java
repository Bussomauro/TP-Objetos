package ar.org.centro8.curso.java.proyectofinal.repositories.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ar.org.centro8.curso.java.proyectofinal.entities.Proveedor;
import ar.org.centro8.curso.java.proyectofinal.enums.Rubro;
import ar.org.centro8.curso.java.proyectofinal.repositories.interfaces.I_ProveedorRepository;

public class ProveedorRepository implements I_ProveedorRepository {

    private Connection conn;

    public ProveedorRepository(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void save(Proveedor proveedor) {
        if (proveedor == null)
            return;
        try (PreparedStatement ps = conn.prepareStatement(
                "insert into proveedor (nombre,rubro) values (?,?)",
                PreparedStatement.RETURN_GENERATED_KEYS);) {
            ps.setString(1, proveedor.getNombre());
            ps.setString(2, proveedor.getRubro().toString());
            ps.execute();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next())
                proveedor.setId(rs.getInt(1));
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public void remove(Proveedor proveedor) {
        if (proveedor == null)
            return;
        try (PreparedStatement ps = conn.prepareStatement("delete from proveedor where id=?")) {
            ps.setInt(1, proveedor.getId());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public void update(Proveedor proveedor) {
        if (proveedor == null)
            return;
        try (PreparedStatement ps = conn.prepareStatement(
                "update proveedor set nombre=?, rubro=? where id=?")) {
            ps.setString(1, proveedor.getNombre());
            ps.setString(2, proveedor.getRubro().toString());
            ps.setInt(3, proveedor.getId());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public List<Proveedor> getAll() {
        List<Proveedor> list = new ArrayList<>();
        try (ResultSet rs = conn.createStatement().executeQuery("select * from proveedor")) {
            while (rs.next()) {
                list.add(
                        new Proveedor(
                                rs.getInt("id"),
                                rs.getString("nombre"),
                                Rubro.valueOf(rs.getString("rubro"))));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
