<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="beans.UtilBean"%>
<%@page import="beans.GrupoBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Asistente</title>
<link rel="stylesheet" type="text/css" href="css/EstiloGeneral.css"/>
<link rel="stylesheet" type="text/css" href="css/table.css"/>
<style type="text/css">
.titulo {
	text-align: center;
	font-weight: bold;
	font-family: Arial, Helvetica, sans-serif;
}
.titulo2 {
	font-size: 10px;
}
.titulo2 {
	font-size: 12px;
}
.titulo #form1 fieldset {
	font-weight: normal;
	text-align: left;
}
body {
	background-image: url(img/acuarela.jpg);
}
</style>
</head>

<body class="titulo">
<%
Vector<UtilBean> lista= new Vector();
Vector<GrupoBean> listagrupo= new Vector();



if( request.getAttribute("listautiles") != null){
	 lista = (Vector)request.getAttribute("listautiles");
	listagrupo = (Vector)request.getAttribute("listagrupo");
	 
}


%>


<h1><img src="img/logo.jpg" width="71" height="70" /> BIENVENIDO ASISTENTE</h1>
<span class="titulo2">Principal</span></p>

<table width="100%">
<tr align="right"></tr>
<td align="right">
<a href="login.jsp"><p>Logout</p></a>
</td>
</table>


<form id="form1" name="form1" method="post" action="Asistente">
  <fieldset>
    <legend class="titulo2">Seleccione los Campos que desea Asignar al Grupo</legend>
    <table width="100%" border="1" cellpadding="0" cellspacing="0" id="content">
      <tr class="titulo">
        <td width="13%" align="center">&nbsp;</td>
        <td width="11%" align="center">&nbsp;</td>
        <td width="13%" align="center">&nbsp;</td>
        <td colspan="2" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" align="right" nowrap="nowrap" class="titulo2">Seleccionar grupo</td>
            <td width="16%" align="right" nowrap="nowrap"><label for="select"></label>
              <select name="cb_grado" id="select">
                <option>Seleccionar</option>
                <%for(int i=0;i<listagrupo.size();i++){ %>
                <option><%=listagrupo.get(i).getDescripcion() %></option>
                
                <%} %>
              </select></td>
            <td width="9%" align="right" nowrap="nowrap"><input type="submit" name="button" id="button" value="Aceptar" /></td>
            <td width="18%" align="right" valign="middle" nowrap="nowrap" class="titulo2">Visualizar por grado              </td>
            <td width="11%" align="right" nowrap="nowrap"><span class="titulo2">
              <input type="button" name="button4" id="button4" value="Visualizar" onclick="window.location='/Proy_colegio/AsistenteVista'" />
            </span></td>
          </tr>
        </table></td>
      </tr>
      <tr class="titulo">
        <td align="center" nowrap="nowrap">Seleccion</td>
        <td align="center">Nombre</td>
        <td align="center">Tipo</td>
        <td width="28%" align="center">Detalle_TIpo</td>
        <td width="35%" align="center">Cantidad</td>
      </tr>
           	<%for(int i=0;i<lista.size();i++){  %>
     
      <tr>
        <td align="center" nowrap="nowrap"><input name="checkutil" type="checkbox" id="checkbox4" value="<%=lista.get(i).getCodigo()%>"/>
          <label for="checkbox4"></label></td>
          
        <td align="center"><%=lista.get(i).getNombre() %></td>
        <td align="center"><%=lista.get(i).getTipo() %></td>
        <td align="center"><%=lista.get(i).getDetalletipo() %></td>
        <td align="center"><%=lista.get(i).getCantidad() %></td>
      </tr>
              <%} %>
  </table>
    <br />
<p>&nbsp;</p>
  </fieldset>
</form>
<p>&nbsp;</p>
</body>
</html>