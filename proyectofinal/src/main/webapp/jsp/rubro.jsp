<%@page import="ar.org.centro8.curso.java.proyectofinal.enums.Rubro"%>
<%
    for(Rubro r : Rubro.values()){
        out.println("<option value='"+r+"'>"
            +r.toString().toUpperCase()
            +"</option>");
    }  
%>