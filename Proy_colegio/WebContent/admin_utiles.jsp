<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="beans.UtilBean"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin t�tulo</title>
<style type="text/css">
.class1 {	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	font-size: 16px;
}
.class2 {	font-family: Arial, Helvetica, sans-serif;
}
tama�o {
	font-size: 9px;
}
body {
	background-color: #143C60;
}
</style>
</head>

<body>
<%
Vector<UtilBean> lista= new Vector();



if( request.getAttribute("listautiles") != null){
	 lista = (Vector)request.getAttribute("listautiles");

	 
}


%>



<form id="form1" name="form1" method="post" action="BuscarUtil">
  <table width="546" border="0" align="center" cellpadding="0" cellspacing="0" background="img/acuarela.jpg">
    <tr>
      <td width="394" rowspan="2" valign="top" class="class1"><p><img src="img/logo.jpg" width="71" height="70" />BIENVENIDO ADMINISTRADOR</p></td>
      <td width="92" rowspan="2">&nbsp;</td>
      <td width="4">&nbsp;</td>
      <td width="56" valign="top" class="class2"><span class="class1"><a href="login.jsp">Logout</a></span></td>
    </tr>
    <tr>
      <td height="23">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="4" align="right"><fieldset>
        <legend>Seleccione una opci�n </legend>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
             <td align="right"><input type="button" name="button3" id="button3" value="Administracion de usuarios" onclick="window.location='/Proy_colegio/Usuario'" /></td>
            <td align="left"><input type="button" name="button2" id="button2" value="Administracion de utiles" onclick="window.location='/Proy_colegio/Administrador'"/></td>
          
            
            </tr>
          <tr>
            <td colspan="2"><fieldset>
              <legend class="class1">Datos</legend>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="30%" align="left" class="class2">Buscar Util</td>
                  <td width="27%"><label for="textfield"></label>
                    <input type="text" name="txt_buscar" id="textfield" /></td>
                  <td width="10%"><input type="submit" name="button6" id="button6" value="Buscar" /></td>
                  <td width="33%"><input type="button" name="button5" id="button5" value="Crear " onclick="window.location='/Proy_colegio/AgregarUtil'" />
                    <input type="button" name="button4" id="button4" value="Volver"  onclick="window.location='/Proy_colegio/admin_principal.jsp'"/></td>
                </tr>
              </table>
              <br />
              </fieldset>              <br /></td>
          </tr>
        </table>
      </fieldset></td>
    </tr>
    <tr>
    
    
      <td colspan="4" align="right"><table width="100%" border="1" cellspacing="0" cellpadding="0">
        <tr class="class2">
          <td>Codigo</td>
          <td>Nombre</td>
          <td>Tipo</td>
          <td>Descripcion</td>
          <td>Cantidad</td>
          <td>Modificar</td>
          <td>Eliminar</td>
        </tr>
               <% for(int i=0;i<lista.size();i++){ %>
       
        <tr>
          <td align="center"><%=lista.get(i).getCodigo() %></td>
          <td align="center"><%=lista.get(i).getNombre() %></td>
          
          
          <td align="center"><%=lista.get(i).getTipo()%></td>
          <td align="center"><%=lista.get(i).getDetalletipo()%></td>
                   
          		
          <td align="center"><%=lista.get(i).getCantidad()%></td>
          <td align="center"><a href="ModificarUtil?accion=editar&codigo=<%=lista.get(i).getCodigo() %>">editar</a></td>
          <td align="center"><a href="ModificarUtil?accion=eliminar&codigo=<%=lista.get(i).getCodigo() %>">eliminar</a></td>
        </tr>
                <%} %>
        
      </table></td>
    </tr>
    <tr>
      <td colspan="4" align="right">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="4" align="right">Todos los derechos reservados</td>
    </tr>
  </table>
</form>
</body>
</html>