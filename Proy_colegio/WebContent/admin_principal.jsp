<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Administrador</title>
<link rel="stylesheet" type="text/css" href="css/EstiloGeneral.css"/>
<link rel="stylesheet" type="text/css" href="css/table.css"/>
<style type="text/css">
.class1 {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	font-size: 16px;
}
.class2 {
	font-family: Arial, Helvetica, sans-serif;
}
body {
	text-align: center;
	margin-left: 200px;
	font-size: 9px;
	background-color: #143C60;
}
.style1 {font-size: 12px}
.style2 {font-size: 10px}
</style>
</head>

<body>
<form id="form1" name="form1" method="post" action="login.jsp" style="alignment-adjust:central">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="class1" background="img/acuarela.jpg">
    <tr>
      <td width="814" rowspan="2" valign="top" class="class1"><h1><img src="img/logo.jpg" width="71" height="70" /> BIENVENIDO ADMINISTRADOR</h1></td>
     
      <td width="4">&nbsp;</td>
       <td width="99" valign="top" class="class2"><a href="login.jsp">Logout</a></td>
    </tr>
    <tr>
	 <td>&nbsp;</td>
      
    </tr>
    <tr>
      <td colspan="3"><fieldset>
        <legend><span class="style1">Seleccione una opcion</span> </legend>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            </tr>
          <tr>
            <td align="right"><input type="button" name="button3" id="button3" value="Administracion de usuarios" onclick="window.location='/Proy_colegio/Usuario'" /></td>
            <td align="left"><input type="button" name="button2" id="button2" value="Administracion de utiles" onclick="window.location='/Proy_colegio/Administrador'"/>
              <input type="submit" name="button4" id="button4" value="Salir" /></td>
            </tr>
          <tr>
            <td>&nbsp;</td>
            <td align="right"><br /></td>
            </tr>
        </table>
        <p>&nbsp;</p>
      </fieldset></td>
    </tr>
    <tr>
       <td colspan="3" align="right"><span class="style2">Todos los derechos reservados</span></td>
    </tr>
  </table>
</form>
</body>
</html>