<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.ProveedorRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.connections.Connector"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.entities.Proveedor"%>
<%
    for (Proveedor p : new ProveedorRepository(Connector.getConnection()).getAll()) {
        out.println("<option value='" + p.getId() + "'>"
                + p.getId() + " " + p.getNombre()
                + "</option>");
    }
%>