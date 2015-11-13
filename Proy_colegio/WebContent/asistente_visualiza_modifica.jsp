<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="beans.UtilBean"%>
<%@page import="beans.GrupoBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Asistente</title>
<link rel="stylesheet" type="text/css" href="css/EstiloGeneral.css"/>
<link rel="stylesheet" type="text/css" href="css/table.css"/>
<style type="text/css">
.titulo {	text-align: center;
	font-weight: bold;
	font-family: Arial, Helvetica, sans-serif;
}
.titulo2 {	font-size: 10px;
}
.titulo2 {	font-size: 12px;
}
.titulo1 {
	text-align: center;
	font-weight: bold;
	font-family: "Arial Black", Gadget, sans-serif;
}
body {
	background-image: url(img/acuarela.jpg);
}
</style>
</head>

<body>
<%
Vector<UtilBean> lista= new Vector();
Vector<GrupoBean> listagrupo= new Vector();
Vector<UtilBean> idsel = new Vector();
Vector<UtilBean> grado_sel = new Vector();
String grado = "";

if( request.getAttribute("listautiles") != null){
	 lista = (Vector)request.getAttribute("listautiles");
	listagrupo = (Vector)request.getAttribute("listagrupo");
	 idsel = (Vector)request.getAttribute("idsel");
	grado_sel = (Vector)request.getAttribute("grado_sel")	 ;
	grado = (String)request.getAttribute("grado");
	 
}


%>


<h1 class="titulo"><img src="img/logo.jpg" width="71" height="70" /> BIENVENIDO ASISTENTE <br />
</h1>
<table width="100%">
<tr align="right"></tr>
<td align="right">
<a href="login.jsp"><p>Logout</p></a>
</td>
</table>
<span class="titulo2">Visualizar utiles por grado </span></p>
<form id="form1" name="form1" method="post" action="AsistenteVista">
  <fieldset>
    <span class="titulo2">
    Estos son los utiles asignados para el 
    <input type="text" name="textfield" id="textfield" value="<%=grado%>" disabled="disabled" />
        <input type="hidden" name="txt_codigo_grado" id="textfield" value="<%=grado%>"  />
    
    </span>
    <table width="100%" border="1" cellpadding="0" cellspacing="0" id="content">
      <tr class="titulo">
        <td width="9%" align="center" nowrap="nowrap">&nbsp;</td>
        <td width="8%" align="center" nowrap="nowrap">&nbsp;</td>
        <td width="9%" align="center" nowrap="nowrap">&nbsp;</td>
        <td width="20%" align="center" nowrap="nowrap" class="titulo2">&nbsp;</td>
        <td colspan="3" align="center" nowrap="nowrap"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="32%" nowrap="nowrap" class="titulo2">Seleccionar grupo</td>
            <td width="19%" nowrap="nowrap"><select name="cb_grado" id="select">
              <option>Seleccionar</option>
              <% for(int i=0; i<listagrupo.size();i++){ %>
              <option><%=listagrupo.get(i).getDescripcion() %></option>
              <%} %>
            </select></td>
            <td width="26%" nowrap="nowrap"><input type="submit" name="button" id="button" value="Ver" />
              <span class="titulo2">Nuevo</span>
              <span class="titulo2">
              <input type="button" name="button2" id="button2" value="Agregar" onclick="window.location='/Proy_colegio/Asistente'" />
              </span></td>
            <td width="23%" nowrap="nowrap" class="titulo2">Retonar
              <input type="button" name="button3" id="button3" value="Volver" onclick="window.location='/Proy_colegio/Asistente'" /></td>
          </tr>
        </table></td>
      </tr>
      <tr class="titulo">
        <td align="center" nowrap="nowrap">Grupo</td>
        <td align="center" nowrap="nowrap">Nombre</td>
        <td align="center" nowrap="nowrap">Tipo</td>
        <td align="center" nowrap="nowrap">Detalle_TIpo</td>
        <td width="24%" align="center" nowrap="nowrap">Cantidad</td>
        <td width="15%" align="center" nowrap="nowrap">Modificar cantidad</td>
        <td width="15%" align="center" nowrap="nowrap">Eliminar</td>
      </tr>
      
      	<%for(int i=0;i<lista.size();i++){ %>

		<% for(int j=0;j<idsel.size();j++){ %>

				<%if(lista.get(i).getCodigo()==idsel.get(j).getCodigo()){ %>
      <tr>
	
<td align="center" nowrap="nowrap"><label for="checkbox4"><%=grado %></label></td>
       <td align="center" nowrap="nowrap"><%=lista.get(i).getNombre() %></td>
       <td align="center" nowrap="nowrap"><%=lista.get(i).getTipo() %></td>
        <td align="center" nowrap="nowrap"><%=lista.get(i).getDetalletipo() %></td>
        <td align="center" nowrap="nowrap"><%=lista.get(i).getCantidad() %></td>
        <td align="center" nowrap="nowrap"><a href="#">modificar</a></td>
        <td align="center" nowrap="nowrap"><a href="AsistenteEliminar?dato=eliminar&amp;codigo=<%=lista.get(i).getCodigo()%>&amp;grado=<%=grado%>">eliminar</a></td>
      </tr>
     			 <%} %>
      
      
		<%} %>
	
            	<%} %>
  </table>
    <br />
    <p>&nbsp;</p>
  </fieldset>
</form>
<p></p>
</body>
</html>