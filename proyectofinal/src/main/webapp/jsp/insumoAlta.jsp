<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.InsumoRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.connections.Connector"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.entities.Insumo"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.utils.text.validator.TextValidator"%>

<%
    try {
        String nombre = request.getParameter("nombre");
        double precio_compra = Double.parseDouble(request.getParameter("precio_compra"));
        double factor = Double.parseDouble(request.getParameter("factor"));
        int proveedor_id = Integer.parseInt(request.getParameter("proveedor_id"));
        if (new TextValidator(nombre).length(3, 30)) {
            Insumo insumo = new Insumo(
                                nombre, 
                                precio_compra,
                                factor, 
                                proveedor_id
                                );
            new InsumoRepository(Connector.getConnection()).save(insumo);
            out.println("<div class='info'>Se guardo el Insumo id: " + insumo.getId() + "</div>");
        } else {
            out.println("<div class='error'>Falta completar parametros</div>");
        }
    } catch (Exception e) {
        System.out.println("****************************************************");
        System.out.println(e);
        System.out.println("****************************************************");
        if (request.getParameter("nombre") != null) {
            out.println("<div class='error'>No se pudo guardar el Insumo</div>");
        }
    }
%>