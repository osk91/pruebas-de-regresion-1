<%@page import="beans.TipoCuentaBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="beans.GrupoBean"%>
<%@page import="java.util.Vector"%>

<%@page import="beans.UtilBean"%>
<%@page import="beans.CuentaBean"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Administrador</title>
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
Vector<TipoCuentaBean> listatipocuenta = new Vector();


if( request.getAttribute("listatipocuenta") != null){
	 listatipocuenta = (Vector)request.getAttribute("listatipocuenta");
}


%>
<form id="form1" name="form1" method="post" action="AgregarUser">
  <table width="639" border="0" align="center" cellpadding="0" cellspacing="0" background="img/acuarela.jpg">
    <tr>
      <td width="397" rowspan="2" valign="top" class="class1"><p>BIENVENIDO ADMINISTRADOR<br />
        Agregar Usuario </p></td>
      <td width="93" rowspan="2">&nbsp;</td>
      <td width="4">&nbsp;</td>
      <td width="145" valign="top" class="class2"><span class="class1"><a href="login.jsp">Logout</a></span></td>
    </tr>
    <tr>
      <td height="23">&nbsp;</td>
      <td><input type="button" name="button4" id="button4" value="Volver" onclick="window.location='/Proy_colegio/secretaria_reg_alumnos1.jsp'" /></td>
    </tr>
    <tr>
      <td colspan="4"><fieldset>
        <p class="class2">Ingrese los datos<br />
        </p>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><fieldset>
              <legend class="class2">Datos Personales</legend>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="23%" class="class2">Nombres</td>
                  <td width="77%"><label for="textfield"></label>
                    <input type="text" name="txt_nombre" id="textfield" value="" /></td>
                </tr>
                <tr>
                  <td class="class2">Apellidos</td>
                  <td><label for="textfield2"></label>
                    <input type="text" name="txt_apellido" id="textfield2" value="" /></td>
                </tr>
                <tr>
                  <td class="class2">DNI</td>
                  <td><label for="textfield3"></label>
                    <input type="text" name="txt_dni" id="textfield3" value="" /></td>
                </tr>
                <tr>
                  <td class="class2">Direccion</td>
                  <td><label for="textfield4"></label>
                    <input type="text" name="txt_direccion" id="textfield4" value="" /></td>
                </tr>
                <tr>
                  <td class="class2">Correo</td>
                  <td><label for="textfield5"></label>
                    <input type="text" name="txt_correo" id="textfield5" value="" /></td>
                </tr>
                <tr>
                  <td class="class2">Telefono</td>
                  <td><label for="textfield7"></label>
                    <input type="text" name="txt_telefono" id="textfield7" value="" /></td>
                </tr>
              </table>
              <br />
            </fieldset></td>
          </tr>
          <tr>
            <td><fieldset>
              <legend class="class2">Datos de la cuenta</legend>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="23%" class="class2">Nombre de usuario</td>
                  <td width="77%"><label for="select"></label>
                    <label for="textfield6"></label>
                    <input type="text" name="txt_cuenta" id="textfield6" /></td>
                </tr>
                <tr>
                  <td class="class2">Contrasea</td>
                  <td><label for="textfield8"></label>
                    <input type="password" name="txt_pass1" id="textfield8" />                    <label for="select2"></label></td>
                </tr>
                <tr>
                  <td class="class2">Repetir Contrasea</td>
                  <td><label for="textfield9"></label>
                    <input type="password" name="txt_pass2" id="textfield9" /></td>
                </tr>
                <tr>
                  <td class="class2">Tipo de Usuaio</td>
                  <td><label for="select3"></label>
                    <select name="cb_tipo_user" id="select3">
                    <% for(int i=0;i<listatipocuenta.size();i++){ %>
                    
                      <option><%=listatipocuenta.get(i).getDescripcion() %></option>
                      
                      <%} %>
                    </select></td>
                </tr>
                <tr>
                  <td class="class2">Estado</td>
                  <td><label for="select"></label>
                    <select name="cb_estado" id="select">
                      <option>Activo</option>
                      <option>Bloqueado</option>
                    </select></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="79%" align="right"><input type="submit" name="button3" id="button3" value="Guardar" /></td>
                      <td width="11%" align="right"><input type="submit" name="button5" id="button5" value="Limpiar" /></td>
                      <td width="10%" align="right"><input type="submit" name="button6" id="button6" value="Volver" /></td>
                    </tr>
                  </table></td>
                </tr>
              </table>
              <br />
            </fieldset></td>
          </tr>
        </table>
      </fieldset></td>
    </tr>
    <tr>
      <td colspan="4" align="right">Todos los derechos reservados</td>
    </tr>
  </table>
</form>
</body>
</html>