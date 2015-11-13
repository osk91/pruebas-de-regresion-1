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


if(request.getAttribute("listautiles")!=null){
	listautiles = (Vector)request.getAttribute("listautiles");
	listaua = (Vector)request.getAttribute("listaua");
	
}



%>



<form id="form1" name="form1" method="post" action="">

  <table width="639" border="0" align="center" cellpadding="0" cellspacing="0" background="img/acuarela.jpg">
  
    <tr>
      <td width="598" valign="top" class="class1"><p><img src="img/logo.jpg" width="71" height="70" />BIENVENIDA DIRECTOR(A)</p></td>
      <td width="54" height="23"><a href="login.jsp" class="class1">Logout</a></td>
    </tr>
    <tr>
      <td colspan="2"><fieldset>
        <p class="class2">Lista de Inventario</p>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="38%">&nbsp;</td>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="3" align="center" nowrap="nowrap"><table width="200" border="0" cellspacing="0" cellpadding="0">
              <tr>
              
               <th width="17%" scope="col"><input type="button" name="button3" id="button3" value="Lista de Utiles" onclick="window.location='/Proy_colegio/ReporteUtiles'" /></th>
                <th width="15%" scope="col"><input type="button" name="button2" id="button2" value="Reporte Lista detallada" onclick="window.location='/Proy_colegio/ReporteDetallado'"/></th>
                <td width="68%" align="left" scope="col"><input type="button" name="input" value="Inventario" onclick="window.location='/Proy_colegio/DirectoraInventario'" />
                
                </td>
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
              <tr>
                <td align="center" nowrap="nowrap"><%=listautiles.get(i).getNombre() %></td>
                <td align="center" nowrap="nowrap"><%=listautiles.get(i).getTipo() %></td>
                <td align="center" nowrap="nowrap"><%=listautiles.get(i).getDetalletipo() %></td>
                <%
                int calmacen=0;
                int cant_req=0;
                for(int j=0;j<listaua.size();j++){
                	if(listautiles.get(i).getCodigo()==listaua.get(j).getId_util()){
                		int aux = Integer.parseInt(listaua.get(j).getReg_util());
                		calmacen= calmacen + aux;
                		int aux2 = Integer.parseInt(listaua.get(j).getCant_util());
                		cant_req = cant_req + aux2;
                	}
                	
                }
                
                
                %>
                
                <td align="center" nowrap="nowrap"><%=calmacen %></td>
                <td align="center" nowrap="nowrap"><%=cant_req %></td>
                                <td align="center" nowrap="nowrap"><%=(cant_req-calmacen) %></td>
                
              </tr>
              
              <%} %>
              <tr>
                <td align="center" nowrap="nowrap">&nbsp;</td>
                <td align="center" nowrap="nowrap">&nbsp;</td>
                <td align="center" nowrap="nowrap">&nbsp;</td>
                <td align="center" nowrap="nowrap">&nbsp;</td>
                <td align="center" nowrap="nowrap">&nbsp;</td>
                <td align="center" nowrap="nowrap">&nbsp;</td>
              </tr>
            </table>              <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <th width="92%" align="right" scope="col">&nbsp;</th>
                <th width="8%" scope="col"><input type="button" name="button" id="button" value="Volver" onclick="window.location='/Proy_colegio/directora_principal.jsp'"/></th>
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