<%@page import="ar.org.centro8.curso.java.proyectofinal.utils.html.HtmlTable"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.RecetaRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.connections.Connector"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.entities.Receta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <%@include file="jsp/head.jsp" %>
    </head>

    <body>
        <%@include file="jsp/menu.jsp" %>
        <h1>Planilla Receta</h1>
        <div class="form">
            <form>
                <table>
                    <tr>
                        <td><label class="label">Nombre:      </label></td>
                        <td><input name="nombre" type="text" class="input" required minlenght="3" maxlenght="30"/></td>
                    </tr>
                    <tr>
                        <td><input class="button" type="reset"     value="Limpiar"  /></td>
                        <td><input class="button" type="submit"    value="Guardar" /></td>
                    </tr>
                    
                </table>
            </form>
            <%@include file="jsp/recetaAlta.jsp" %>
        </div>
        <div class="form1">
            <form>
                <label class="label">Buscar por Nombre: </label>
                <input class="input" type="text" name="buscarNombre" />
            </form>
            <div class="datos">
            <%@include file="jsp/recetaTabla.jsp" %>
            </div>
        </div>
        <div class="form">
            <form>
                <tr>
                    <!-- RECETA -->
                    <td><label class="label1">Receta:         </label></td>
                    <td>
                        <select name="receta_id" class="input" >
                            <%@include file="jsp/receta.jsp" %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label class="label">Precio Venta:      </label></td>
                    <td><input name="precio_venta" type="number" class="input" min="0.00" step="0.01"/></td>
                </tr>
                <tr>
                    <td><input class="button" type="reset"     value="Limpiar"  /></td>
                    <td><input class="button" type="submit"    value="Actualizar" /></td>
                </tr>
            </form>
            <%@include file="jsp/recetaPrecio.jsp" %>
       </div>
    </body>
</html>