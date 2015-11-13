<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@page import="beans.GrupoBean"%>
<%@page import="java.util.Vector"%>

<%@page import="beans.UtilBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin ttulo</title>
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
UtilBean util= new UtilBean();
//Vector<GrupoBean> listagrupo= new Vector();

if( request.getAttribute("utilaux") != null){
	 util = (UtilBean)request.getAttribute("utilaux");
	//listagrupo = (Vector)request.getAttribute("listagrupo");
}
%>


<form id="form1" name="form1" method="post" action="ModificarUtil?accion=update">
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
      <td colspan="4"><fieldset>
          <span class="class2">Complete los campos a modificar
          </span>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td colspan="2">&nbsp;</td>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
             <td align="right"><input type="button" name="button3" id="button3" value="Administracion de usuarios" onclick="window.location='/Proy_colegio/Usuario'" /></td>
            <td align="left"><input type="button" name="button2" id="button2" value="Administracion de utiles" onclick="window.location='/Proy_colegio/Administrador'"/></td>
            
          </tr>
          <tr>
            <td width="9%" align="left">Codigo</td>
            <td width="37%" align="left">
            
            <input type="text" name="" id="textfield4" disabled="disabled" value="<%=util.getCodigo()%>"/>
                        <input type="hidden" name="txt_codigo" id="textfield4" value="<%=util.getCodigo()%>"/>
            
            </td>
            <td width="16%" align="left" nowrap="nowrap">Detalle Tipo<br /></td>
            <td width="38%" align="left"><label for="select"></label>
              <select name="cb_detalletipo" id="cb_detalletipo" >
                
                <option value="unidad">unidad</option>
               
                <option value="millares">millares</option>
              
                <option value="paquete">paquete</option>
                
             
                
                
                
                
                
                
                
              </select></td>
          </tr>
          <tr>
            <td align="left">Nombre</td>
            <td align="left"><label for="textfield2" ></label>
              <label for="textfield4">
                <input type="text" name="txt_nombre" id="textfield3" value="<%=util.getNombre()%>"/>
              </label></td>
            <td align="left">Cantidad</td>
            <td align="left"><label for="textfield"></label>
              <input type="text" name="txt_cantidad" id="textfield" value="<%=util.getCantidad()%>"/></td>
          </tr>
          <tr>
            <td align="left">Tipo</td>
            <td align="left"><label for="textfield5"></label>
              <input type="text" name="txt_tipo" id="textfield5" value="<%=util.getTipo()%>" /></td>
            <td align="left">&nbsp;</td>
            <td align="left">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="left"><label for="select3"></label>
              <label for="select4"></label>
              <label for="textarea"></label></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td align="left"><input type="submit" name="button5" id="button5" value="Modificar" /></td>
            <td align="left"><input type="submit" name="button4" id="button4" value="Volver" /></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td align="right">&nbsp;</td>
            <td align="right">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
            <td colspan="2" align="right">&nbsp;</td>
          </tr>
        </table>
        <p>&nbsp;</p>
      </fieldset></td>
    </tr>
    <tr>
      <td colspan="4" align="right">Todos los derechos reservados</td>
    </tr>
    <tr>
      
  </table>
</form>
</body>
</html>