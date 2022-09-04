<%@page import="ar.org.centro8.curso.java.proyectofinal.utils.html.HtmlTable"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.repositories.jdbc.InsumoRepository"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.connections.Connector"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.entities.Insumo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <%@include file="jsp/head.jsp" %>
    </head>

    <body>
        <%@include file="jsp/menu.jsp" %>
        <h1>Planilla Insumos</h1>
        <div class="form">
            <form>
                <fieldset>
                <table>
                    <tr>
                        <td><label class="label">Nombre:      </label></td>
                        <td><input type="text" class="input" name="nombre" required minlenght="3" maxlenght="30"/></td>
                    </tr>
                    <tr>
                        <td><label class="label">Precio Compra:    </label></td>
                        <td><input type="number" class="input" name="precio_compra" required min="0.00" step="0.01" /></td>
                    </tr>
                    <tr>
                        <td><label class="label">Factor:    </label></td>
                        <td><input type="number" class="input" name="factor" required min="0.00" step="0.01" /></td>
                    </tr>
                    <tr>
                        <td><label class="label">Proveedor:         </label></td>
                        <td>
                            <select name="proveedor_id" class="input2" >
                                <%@include file="jsp/proveedor.jsp" %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><input class="button" type="reset"     value="Limpiar"  /></td>
                        <td><input class="button" type="submit"    value="Guardar" /></td>
                    </tr>
                </table>
            </fieldset>
            </form>
            <%@include file="jsp/insumoAlta.jsp" %>
        </div>
        <div class="form1">
            <form>
                <label class="label">Buscar por Nombre: </label>
                <input class="input" type="text" name="buscarNombre" />
            </form>
            <div class="datos">
            <%@include file="jsp/insumoTabla.jsp" %>
            </div>
       </div>
    </body>
</html>