<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.InsumoRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.interfaces.I_InsumoRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.Receta_insumoRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.interfaces.I_Receta_insumoRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.interfaces.I_RecetaRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.RecetaRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.connections.Connector"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.entities.Receta"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.utils.text.validator.TextValidator"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.negocio.RecetaNegocio"%>
<%I_RecetaRepository rr = new RecetaRepository(Connector.getConnection()); %>
<%I_Receta_insumoRepository rir = new Receta_insumoRepository(Connector.getConnection()); %>
<%I_InsumoRepository ir = new InsumoRepository(Connector.getConnection()); %>

<%
    try {
        int idReceta = Integer.parseInt(request.getParameter("receta_id"));
        Receta receta = rr.getById(idReceta);

        double precio_venta = Double.parseDouble(request.getParameter("precio_venta"));
        if (precio_venta > 0) {
                        
            RecetaNegocio recetaNegocio = new RecetaNegocio(receta, rr);
            recetaNegocio.setPrecio_venta(precio_venta);
                        
            out.println("<div class='info'>Se actualizo el Precio Venta de la Receta id: " + receta.getId() + "</div>");
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