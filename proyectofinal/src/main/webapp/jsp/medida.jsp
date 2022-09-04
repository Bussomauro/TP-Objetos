<%@page import="ar.org.centro8.curso.java.proyectofinal.enums.Medida"%>
<%
    for(Medida m : Medida.values()){
        out.println("<option value='"+m+"'>"
            +m.toString().toUpperCase()
            +"</option>");
    }  
%>