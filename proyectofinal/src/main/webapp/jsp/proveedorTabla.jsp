<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.ProveedorRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.connections.Connector"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.entities.Proveedor"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.utils.html.HtmlTable"%>
<%
    String buscarNombre = request.getParameter("buscarNombre");
    if (buscarNombre == null) {
        buscarNombre = "";
    }
    out.println(
            new HtmlTable<Proveedor>().getTable(
                    new ProveedorRepository(Connector.getConnection())
                            .getLikeNombre(buscarNombre)
            )
    );
%>