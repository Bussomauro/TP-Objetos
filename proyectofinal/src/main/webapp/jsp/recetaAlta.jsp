<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.RecetaRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.connections.Connector"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.entities.Receta"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.utils.text.validator.TextValidator"%>

<%
    try {
        String nombre = request.getParameter("nombre");
        if (new TextValidator(nombre).length(3, 30)) {
            Receta receta = new Receta(nombre);
            new RecetaRepository(Connector.getConnection()).save(receta);
            out.println("<div class='info'>Se guardo la Receta id: " + receta.getId() + "</div>");
        } else {
            out.println("<div class='error'>Falta completar parametros</div>");
        }
    } catch (Exception e) {
        System.out.println("****************************************************");
        System.out.println(e);
        System.out.println("****************************************************");
        if (request.getParameter("nombre") != null) {
            out.println("<div class='error'>No se pudo guardar la Receta</div>");
        }
    }
%>