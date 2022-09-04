<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.InsumoRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.interfaces.I_InsumoRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.interfaces.I_Receta_insumoRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.interfaces.I_RecetaRepository"%>
<%@page import="java.util.List"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.Receta_insumoRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.entities.Receta_insumo"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.negocio.RecetaNegocio"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.RecetaRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.connections.Connector"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.entities.Receta"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.utils.html.HtmlTable"%>
<%I_Receta_insumoRepository rir2 = new Receta_insumoRepository(Connector.getConnection()); %>

<%
    try{
        int idReceta = Integer.parseInt(request.getParameter("receta_id"));
    out.println(
            new HtmlTable<Receta_insumo>().getTable(
                    List.of(rir2.getById(idReceta)
            )))  
    ;
            }catch(Exception e){}
%>