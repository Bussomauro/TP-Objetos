<%@page import="ar.org.centro8.curso.java.proyectofinal.utils.text.validator.TextValidator"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.entities.Proveedor"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.enums.Rubro"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.connections.Connector"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.ProveedorRepository"%>

<%
    try {
        String nombre = request.getParameter("nombre");
        String rubro = request.getParameter("rubro");
        if (new TextValidator(nombre).length(3, 30)){
            Proveedor proveedor = new Proveedor(nombre, Rubro.valueOf(rubro));
            new ProveedorRepository(Connector.getConnection()).save(proveedor);
            out.println("<div class='info'>Se guardo el Proveedor id: " + proveedor.getId() + "</div>");
        } else {
            out.println("<div class='error'>Falta completar parametros</div>");
        }
    } catch (Exception e) {
        System.out.println("****************************************************");
        System.out.println(e);
        System.out.println("****************************************************");
        if (request.getParameter("nombre") != null) {
            out.println("<div class='error'>No se pudo guardar el Proveedor</div>");
        }
    }
%>