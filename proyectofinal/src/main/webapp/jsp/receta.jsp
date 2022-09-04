<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.RecetaRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.connections.Connector"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.entities.Receta"%>
<%
    for (Receta r : new RecetaRepository(Connector.getConnection()).getAll()) {
        out.println("<option value='" + r.getId() + "'>"
                + r.getId() + " " + r.getNombre()
                + "</option>");
    }
%>