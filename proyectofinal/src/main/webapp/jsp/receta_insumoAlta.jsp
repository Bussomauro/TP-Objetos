<%@page import="ar.org.centro8.curso.java.proyectofinal.negocio.RecetaNegocio"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.enums.Medida"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.entities.Receta_insumo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.entities.Receta"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.Receta_insumoRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.RecetaRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.interfaces.I_Receta_insumoRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.connections.Connector"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.InsumoRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.interfaces.I_RecetaRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.interfaces.I_InsumoRepository"%>
<%I_InsumoRepository ri= new InsumoRepository(Connector.getConnection()); %>
<%I_RecetaRepository rr = new RecetaRepository(Connector.getConnection()); %>
<%I_Receta_insumoRepository rir = new Receta_insumoRepository(Connector.getConnection()); %>

<%
    try{
        int idReceta = Integer.parseInt(request.getParameter("receta_id"));
        Receta receta = rr.getById(idReceta);
        List<Receta_insumo>listaRI = new ArrayList();
        
        // double cantidad, Medida und_medida, int receta_id, int insumo_id
        
        // insumo1
        double cantidad1 = Double.parseDouble(request.getParameter("cantidad1"));
        if(cantidad1 > 0){
            listaRI.add(
                new Receta_insumo(
                    cantidad1, 
                    Medida.valueOf(request.getParameter("und_medida1")), 
                    idReceta,
                    Integer.parseInt(request.getParameter("insumo_id1")) 
                    ));
        }

        // insumo2
        double cantidad2 = Double.parseDouble(request.getParameter("cantidad2"));
        if(cantidad2 > 0){
            listaRI.add(
                new Receta_insumo(
                    cantidad2, 
                    Medida.valueOf(request.getParameter("und_medida2")), 
                    idReceta,
                    Integer.parseInt(request.getParameter("insumo_id2")) 
                    ));
        }

        // insumo3
        double cantidad3 = Double.parseDouble(request.getParameter("cantidad3"));
        if(cantidad3 > 0){
            listaRI.add(
                new Receta_insumo(
                    cantidad3, 
                    Medida.valueOf(request.getParameter("und_medida3")), 
                    idReceta,
                    Integer.parseInt(request.getParameter("insumo_id3")) 
                    ));
        }

        // insumo4
        double cantidad4 = Double.parseDouble(request.getParameter("cantidad4"));
        if(cantidad4 > 0){
            listaRI.add(
                new Receta_insumo(
                    cantidad1, 
                    Medida.valueOf(request.getParameter("und_medida4")), 
                    idReceta,
                    Integer.parseInt(request.getParameter("insumo_id4")) 
                    ));
        }

        // insumo5
        double cantidad5 = Double.parseDouble(request.getParameter("cantidad5"));
        if(cantidad5 > 0){
            listaRI.add(
                new Receta_insumo(
                    cantidad5, 
                    Medida.valueOf(request.getParameter("und_medida5")), 
                    idReceta,
                    Integer.parseInt(request.getParameter("insumo_id5")) 
                    ));
        }

        // insumo6
        double cantidad6 = Double.parseDouble(request.getParameter("cantidad6"));
        if(cantidad6 > 0){
            listaRI.add(
                new Receta_insumo(
                    cantidad6, 
                    Medida.valueOf(request.getParameter("und_medida6")), 
                    idReceta,
                    Integer.parseInt(request.getParameter("insumo_id6")) 
                    ));
        }

        // receta negocio
        RecetaNegocio recetaNegocio = new RecetaNegocio(receta, rr, ri, rir);
        recetaNegocio.setReceta_Insumos(listaRI);

        out.println("<div class='info'>Se pudo guardar la Receta/Insumo</div>");

    }catch(Exception e){
        System.out.println("****************************************************");
        System.out.println(e);
        System.out.println("****************************************************");
        if (request.getParameter("receta_id") != null) {
            out.println("<div class='error'>No se pudo guardar la Receta/Insumo</div>");
        }
    }

%>