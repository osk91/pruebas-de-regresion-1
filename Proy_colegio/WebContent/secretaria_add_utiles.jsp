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
<title>Documento sin título</title>
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

<form id="form1" name="form1" method="post" action="ListaAlumno">
  <table width="639" border="0" align="center" cellpadding="0" cellspacing="0" background="img/acuarela.jpg">
    <tr>
      <td width="397" rowspan="2" valign="top" class="class1"><p><img src="img/logo.jpg" width="71" height="70" />BIENVENIDA SECRETARIA<br />
        Registro de utiles entregados por alumno</p></td>
      <td width="93" rowspan="2">&nbsp;</td>
      <td width="4">&nbsp;</td>
      <td width="145" valign="top" class="class2"><span class="class1"><a href="login.jsp">Logout</a></span></td>
    </tr>
    <tr>
      <td height="23">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="4"><fieldset>
        <p class="class2">
          <legend>Seleccione una opcion </legend>
        </p>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="38%">&nbsp;</td>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
          
            <td align="right"><input type="button" name="button3" id="button3" value="Registro de alumnos"  onclick= 					"window.location='/Proy_colegio/secretaria_reg_alumnos1.jsp'"/></td>
            <td width="20%" align="left"><input type="button" name="button2" id="button2" value="Verificacion de lista" onclick="window.location='/Proy_colegio/secretaria_ve.jsp'"/></td>
            <td width="42%" align="left" valign="middle"><input type="button" name="input" value="Registrar utiles"  onclick=								 					"window.location='/Proy_colegio/secretaria_add_utiles.jsp'" /></td>
          </tr>
          <tr>
            <td colspan="3"><table width="100%" border="1" cellspacing="0" cellpadding="0">
              <tr>
                <th colspan="5" scope="col"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <th width="23%" scope="col">Codigo Alumno</th>
                    <th width="23%" align="left" scope="col"><input type="text" name="txt_codigo" id="textfield" /></th>
                    <th width="9%" align="left" scope="col"><input type="submit" name="button5" id="button5" value="Buscar" /></th>
                    <th width="45%" align="left" scope="col"><input type="submit" name="button4" id="button4" value="Volver" /></th>
                  </tr>
                </table>
                  <label for="textfield"></label></th>
                <th width="1%" colspan="2" scope="col">&nbsp;</th>
              </tr>
              <tr>
                <th colspan="7" scope="col"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td>Alumno</td>
                    <td>Grado</td>
                  </tr>
                </table></th>
              </tr>
              <tr>
                <th scope="col">Nombre Util</th>
                <th scope="col">Tipo</th>
                <th scope="col">Detalle_tipo</th>
                <th scope="col">Cantidad</th>
                <th scope="col">Entregado</th>
                
              </tr>
             
              

            </table>
              <br /></td>
          </tr>
        </table>
        <p>&nbsp;</p>
      </fieldset></td>
    </tr>
    <tr>
      <td colspan="4" align="right">Todos los derechos reservados</td>
    </tr>
  </table>
</form>
</body>
</html>