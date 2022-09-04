<%@page import="ar.org.centro8.curso.java.proyectofinal.utils.html.HtmlTable"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.connections.Connector"%>
<%@page import="ar.org.centro8.curso.java.proyectofinal.negocio.RecetaNegocio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <%@include file="jsp/head.jsp" %>
    </head>

    <body>
        <%@include file="jsp/menu.jsp" %>
        <h1>Planilla Recetas / Insumos</h1>
        <div class="form2">
            <form>
                <table>
                    <tr>
                        <!-- RECETA -->
                        <td><label class="label1">Receta:         </label></td>
                        <td>
                            <select name="receta_id" class="input4" >
                                <%@include file="jsp/receta.jsp" %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <!-- INSUMO 1 -->
                        <td><label class="label1">Insumo 1:         </label></td>
                        <td><select name="insumo_id1" class="input4" ><%@include file="jsp/insumo.jsp" %></select></td>
                        <td><label class="label1">Cantidad:      </label></td>
                        <td><input name="cantidad1" value=0 type="number" class="input3" required min="0.00" step="0.01" /></td>
                        <td><label class="label1">Medida:        </label></td>
                        <td><select name="und_medida1" class="input4" ><%@include file="jsp/medida.jsp" %></select></td>
                    </tr>
                    <tr>
                        <!-- INSUMO 2 -->
                        <td><label class="label1">Insumo 2:         </label></td>
                        <td><select name="insumo_id2" class="input4" ><%@include file="jsp/insumo.jsp" %></select></td>
                        <td><label class="label1">Cantidad:      </label></td>
                        <td><input name="cantidad2" value=0 type="number" class="input3" required min="0.00" step="0.01" /></td>
                        <td><label class="label1">Medida:        </label></td>
                        <td><select name="und_medida2" class="input4" ><%@include file="jsp/medida.jsp" %></select></td>
                    </tr>
                    <tr>
                        <!-- INSUMO 3 -->
                        <td><label class="label1">Insumo 3:         </label></td>
                        <td><select name="insumo_id3" class="input4" ><%@include file="jsp/insumo.jsp" %></select></td>
                        <td><label class="label1">Cantidad:      </label></td>
                        <td><input name="cantidad3" value=0 type="number" class="input3" required min="0.00" step="0.01" /></td>
                        <td><label class="label1">Medida:        </label></td>
                        <td><select name="und_medida3" class="input4" ><%@include file="jsp/medida.jsp" %></select></td>
                    </tr>
                    <tr>
                        <!-- INSUMO 4 -->
                        <td><label class="label1">Insumo 4:         </label></td>
                        <td><select name="insumo_id4" class="input4" ><%@include file="jsp/insumo.jsp" %></select></td>
                        <td><label class="label1">Cantidad:      </label></td>
                        <td><input name="cantidad4" value=0 type="number" class="input3" required min="0.00" step="0.01" /></td>
                        <td><label class="label1">Medida:        </label></td>
                        <td><select name="und_medida4" class="input4" ><%@include file="jsp/medida.jsp" %></select></td>
                    </tr>
                    <tr>
                        <!-- INSUMO 5 -->
                        <td><label class="label1">Insumo 5:         </label></td>
                        <td><select name="insumo_id5" class="input4" ><%@include file="jsp/insumo.jsp" %></select></td>
                        <td><label class="label1">Cantidad:      </label></td>
                        <td><input name="cantidad5" value=0 type="number" class="input3" required min="0.00" step="0.01" /></td>
                        <td><label class="label1">Medida:        </label></td>
                        <td><select name="und_medida5" class="input4" ><%@include file="jsp/medida.jsp" %></select></td>
                    </tr>
                    <tr>
                        <!-- INSUMO 6 -->
                        <td><label class="label1">Insumo 6:         </label></td>
                        <td><select name="insumo_id6" class="input4" ><%@include file="jsp/insumo.jsp" %></select></td>
                        <td><label class="label1">Cantidad:       </label></td>
                        <td><input name="cantidad6" value=0 type="number" class="input3" required min="0.00" step="0.01" /></td>
                        <td><label class="label1">Medida:         </label></td>
                        <td><select name="und_medida6" class="input4" ><%@include file="jsp/medida.jsp" %></select></td>
                    </tr>
                    <tr>
                        <td><input class="button1" type="reset"     value="Limpiar"  /></td>
                        <td><input class="button" type="submit"    value="Guardar" /></td>
                    </tr>
                </table>
            </form>
            <%@include file="jsp/receta_insumoAlta.jsp" %>
        </div>
        <div class="form3">
            <form>
                <label class="label">Buscar por Receta: </label>
                
            
            <td>
                <select name="receta_id" class="input" >
                    <%@include file="jsp/receta.jsp" %>
                </select>
            </td>
            <input class="button" type="submit"    value="Mostrar" />
        </form>
            <div class="datos">
            <%@include file="jsp/receta_insumoTabla.jsp" %>
            </div>
        </div>
    </body>
</html>