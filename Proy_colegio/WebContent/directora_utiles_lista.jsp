<%@page import="beans.UtilAlumnoBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="beans.UtilBean"%>
<%@page import="beans.GrupoBean" %>
<%@page import="beans.AlumnoBean" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin t�tulo</title>
<style type="text/css">
.class1 {font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	font-size: 16px;
}
.class2 {font-family: Arial, Helvetica, sans-serif;
}
body {
	background-color: #143C60;
}
</style>
</head>

<body>

<%
Vector<UtilBean> listautiles = new Vector();
Vector<UtilAlumnoBean> listaua = new Vector();
Vector<GrupoBean> listagrupos = new Vector();


if(request.getAttribute("listagrupos")!=null){
	
	listagrupos =(Vector)request.getAttribute("listagrupos");
}



%>



<form id="form1" name="form1" method="post" action="ReporteDetallado">

  <table width="639" border="0" align="center" cellpadding="0" cellspacing="0" background="img/acuarela.jpg">
  
    <tr>
      <td width="598" valign="top" class="class1"><p><img src="img/logo.jpg" />BIENVENIDA DIRECTOR(A)</p></td>
      <td width="54" height="23"><a href="login.jsp" class="class1">Logout</a></td>
    </tr>
    <tr>
      <td colspan="2"><fieldset>
        <p class="class2">
          <legend>Seleccione una opcion </legend>
        </p>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="38%">&nbsp;</td>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="3" align="center" nowrap="nowrap"><table width="200" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <th width="17%" scope="col"><input type="button" name="button3" id="button3" value="Lista de Utiles" onclick="window.location='/Proy_colegio/Alumno'" /></th>
                <th width="15%" scope="col"><input type="button" name="button2" id="button2" value="Reporte Lista detallada" onclick="window.location='/Proy_colegio/secretaria_ve.jsp'"/></th>
                <td width="68%" align="left" scope="col"><input type="button" name="input" value="Inventario" onclick="window.location='/Proy_colegio/secretaria_add_utiles.jsp'" /></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td colspan="3" align="center" nowrap="nowrap"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <th width="22%" align="left" scope="col">Seleccionar Grado</th>
                <th width="11%" align="left" scope="col"><label for="select"></label>
                  <select name="cb_grado" id="select">
                  
                  <%for(int i=0;i<listagrupos.size();i++){ %> 
                    <option><%=listagrupos.get(i).getDescripcion() %></option>
                  
                  <%} %>
                  </select></th>
                <th width="67%" align="left" scope="col"><input type="submit" name="button5" id="button5" value="Buscar" /></th>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td colspan="3"><table width="100%" border="1" cellspacing="0" cellpadding="0">
              <tr class="class2">
                <th align="center" nowrap="nowrap" scope="col">Nombre</th>
                <th align="center" nowrap="nowrap" scope="col">Tipo</th>
                <th align="center" nowrap="nowrap" scope="col">Detalle</th>
                <th align="center" nowrap="nowrap" scope="col">Cantidad Almacen</th>
                <th align="center" nowrap="nowrap" scope="col">Cantidad requerida</th>
                                <th align="center" nowrap="nowrap" scope="col">Cantidad pendiente</th>
                
              </tr>
              <% for(int i=0;i<listautiles.size();i++){  %>
              
              <%} %>
            </table>              <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <th width="92%" align="right" scope="col"><input type="submit" name="button4" id="button4" value="Imprimir" /></th>
                <th width="8%" scope="col"><input type="submit" name="button" id="button" value="Volver" /></th>
              </tr>
            </table>            <br /></td>
          </tr>
         
        </table>
        <p>&nbsp;</p>
      </fieldset></td>
    </tr>
    <tr>
      <td colspan="2" align="right" class="class2">Todos los derechos reservados</td>
    </tr>
  </table>
</form>
</body>
</html>