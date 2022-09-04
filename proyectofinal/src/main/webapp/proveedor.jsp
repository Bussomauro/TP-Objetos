<%@page import="ar.org.centro8.curso.java.proyectofinal.utils.html.HtmlTable"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.ProveedorRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.connections.Connector"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.entities.Proveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <%@include file="jsp/head.jsp" %>
    </head>

    <body>
        <%@include file="jsp/menu.jsp" %>
        <h1>Planilla Proveedores</h1>
        <div class="form">
            <form>
                <table>
                    <tr>
                        <td><label class="label">Nombre:   </label></td>
                        <td><input type="text" class="input" name="nombre" required minlenght="3" maxlenght="30"/></td>
                    </tr>
                    <tr>
                        <td><label class="label">Rubro:         </label></td>
                        <td>
                            <select name="rubro" class="input2" >
                                
                                <%@include file="jsp/rubro.jsp" %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><input class="button" type="reset"     value="Limpiar"  /></td>
                        <td><input class="button" type="submit"    value="Guardar" /></td>
                    </tr>
                </table>
            </form>
            <%@include file="jsp/proveedorAlta.jsp" %>
        </div>
        <div class="form1">
            <form>
                <label class="label">Buscar por nombre: </label>
                <input class="input" type="text" name="buscarNombre" />
            </form>
            <div class="datos">
            <%@include file="jsp/proveedorTabla.jsp" %>
            </div>
       </div>
    </body>
</html>