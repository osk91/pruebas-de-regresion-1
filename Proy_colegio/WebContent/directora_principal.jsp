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
body {
	background-color: #143C60;
}
</style>
</head>

<body>
<form id="form1" name="form1" method="post" action="">
  <table width="639" border="0" align="center" cellpadding="0" cellspacing="0" background="img/acuarela.jpg">
    <tr>
      <td width="598" valign="top" class="class1"><p><img src="img/logo.jpg" width="71" height="70" />BIENVENIDA DIRECTOR(A)</p></td>
      <td width="54" height="23"><a href="login.jsp" class="class1">Logout</a></td>
    </tr>
    <tr>
      <td colspan="2"><fieldset>
        <p class="class2">
          <legend>Seleccione una opción </legend>
        </p>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="38%">&nbsp;</td>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
          
            <th colspan="3" align="center" scope="col"><table width="49%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <th width="31%" scope="col"><input type="button" name="button3" id="button3" value="Lista de Utiles" onclick="window.location='/Proy_colegio/ReporteUtiles'" /></th>
                <th width="23%" scope="col"><input type="button" name="button2" id="button2" value="Reporte Lista detallada" onclick="window.location='/Proy_colegio/ReporteDetallado'"/></th>
                <th width="46%" scope="col"><input type="button" name="input" value="Inventario" onclick="window.location='/Proy_colegio/DirectoraInventario'" /></th>
              </tr>
          </table></th>
          </tr>
          <tr>
            <td colspan="3"><br /></td>
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