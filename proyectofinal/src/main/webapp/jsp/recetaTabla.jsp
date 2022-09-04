<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.RecetaRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.connections.Connector"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.entities.Receta"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.utils.html.HtmlTable"%>
<%
    String buscarNombre = request.getParameter("buscarNombre");
    if (buscarNombre == null) {
        buscarNombre = "";
    }
    out.println(
            new HtmlTable<Receta>().getTable(
                    new RecetaRepository(Connector.getConnection())
                            .getLikeNombre(buscarNombre)
            )
    );
%>