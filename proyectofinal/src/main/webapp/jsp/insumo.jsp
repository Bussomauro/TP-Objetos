<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.InsumoRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.connections.Connector"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.entities.Insumo"%>
<%
    for (Insumo i : new InsumoRepository(Connector.getConnection()).getAll()) {
        out.println("<option value='" + i.getId() + "'>"
                + i.getId() + " " + i.getNombre()
                + "</option>");
    }
%>