<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.InsumoRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.connections.Connector"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.entities.Insumo"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.utils.html.HtmlTable"%>
<%
    String buscarNombre = request.getParameter("buscarNombre");
    if (buscarNombre == null) {
        buscarNombre = "";
    }
    out.println(
            new HtmlTable<Insumo>().getTable(
                    new InsumoRepository(Connector.getConnection())
                            .getLikeNombre(buscarNombre)
            )
    );
%>