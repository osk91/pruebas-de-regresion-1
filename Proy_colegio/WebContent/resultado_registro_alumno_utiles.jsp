<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
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
</style>
</head>

<body>
<form action="secretaria_reg_alumnos1.jsp" method="get">

<%String alerta_agregar = (String)request.getAttribute("mensaje"); %>
	<table width="546" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="92" rowspan="2">&nbsp;</td>
    <td width="4">&nbsp;</td>
  </tr>
  <tr>
    <td height="23">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="4"><fieldset>
        <span class="class2">RESULTADO DE OPERACION
        </span>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="46%"><span class="class1"><%=alerta_agregar %></span></td>
          <td width="54%">&nbsp;</td>
        </tr>
        <tr>
          <td><form id="form1" name="form1" method="post" action="">
            <input type="submit" name="button2" id="button2" value="Volver" />
            
          </form></td>
          <td>&nbsp;</td>
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