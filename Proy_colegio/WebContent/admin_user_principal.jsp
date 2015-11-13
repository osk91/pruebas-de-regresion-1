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
.style6 {font-family: Arial, Helvetica, sans-serif; color: #000000; }
.style9 {font-size: 12px}
.style10 {font-family: Arial, Helvetica, sans-serif; font-size: 12px; }
.style11 {font-family: Arial, Helvetica, sans-serif; font-size: 12; }
</style>
<script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%
Vector<CuentaBean> listacuenta = new Vector();
Vector<TipoCuentaBean> listatipocuenta = new Vector();


	if(request.getAttribute("listacuenta")!=null){
		listacuenta = (Vector)request.getAttribute("listacuenta");
		listatipocuenta = (Vector)request.getAttribute("listatipocuenta");
		
	}

%>





<form id="form1" name="form1" method="post" action="Usuario">
   <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" background="img/acuarela.jpg" bgcolor="#FFFFFF" class="class1">
    <tr>
      <td width="394" rowspan="2" valign="top" class="class1"><h1><img src="img/logo.jpg" /> BIENVENIDO ADMINISTRADOR</h1></td>>
      <td width="92" rowspan="2">&nbsp;</td>
      <td width="4">&nbsp;</td>
      <td width="56" valign="top" class="class2"><span class="class2"><a href="login.jsp">Logout</a></span></td>
    </tr>
   
    <tr>
      <td>&nbsp;</td>
      
    </tr>
    <tr>
      <td colspan="4"><fieldset>
       <div align="left"><span class="left style9">Seleccione una opcion        </span>
        </div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>&nbsp;</td>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="3"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
              
                 <td align="right"><input type="button" name="button3" id="button3" value="Administracion de usuarios" onclick="window.location='/Proy_colegio/Usuario'" /></td>
            <td align="left"><input type="button" name="button2" id="button2" value="Administracion de utiles" onclick="window.location='/Proy_colegio/Administrador'"/></td>
            
              
              </tr>
            </table></td>
            </tr>
          <tr>
            <td colspan="3"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <th scope="col"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="20%" class="class1"><span class="class1"><span class="class2">Buscar usuario (DNI)</span></span></td>
                    <td width="37%" align="left"><label for="textfield"></label>
                    
                    
                      <span id="sprytextfield1">
                      <label for="text1"></label>
                      <input type="text" name="txt_busqueda" id="text1" />
                      <span class="textfieldRequiredMsg">Se necesita un valor.</span><span class="textfieldInvalidFormatMsg">Formato no válido.</span></span></td>
                    <td width="7%" align="right"><input type="submit" name="button5" id="button5" value="Buscar" /></td>
                    <td width="36%" align="left"><input type="button" name="button6" id="button6" value="Agregar Nuevo" onclick="window.location='/Proy_colegio/AgregarUser'"  />
                      <input type="button" name="button4" id="button4" value="Salir" onclick="window.location='/Proy_colegio/admin_principal.jsp'" /></td>
                  </tr>
                </table></th>
              </tr>
              <tr>
                <td><table width="100%" border="1" cellspacing="0" cellpadding="0">
                  <tr class="class2">
                    <th scope="col">Usuario</th>
                    <th scope="col">Tipo</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Ver</th>
                    <th scope="col">Modificar</th>
                    <th scope="col">Eliminar</th>
                  </tr>
                  
                  <% for (int i=0;i<listacuenta.size();i++){ %>
                  <tr class="style9">
                    <td align="center"><%=listacuenta.get(i).getCuenta() %></td>
                    
                    <% for(int j=0;j<listatipocuenta.size();j++){ %>
                    
                   	 <% if(listatipocuenta.get(j).getId()==listacuenta.get(i).getFk_tipocuenta()){ %>
                    <td align="center"><%=listatipocuenta.get(j).getDescripcion() %></td>
                    
                   	 <%} %>
                    <%} %>
                    <td align="center"><%=listacuenta.get(i).getEstado() %></td>
                    <td align="center"><a href="ModificarUser?dato=detalle&codigo=<%=listacuenta.get(i).getId()%>">ver detalle</a></td>
                    <td align="center"><a href="ModificarUser?dato=modificar&codigo=<%=listacuenta.get(i).getId()%>">modificar</a></td>
                    <td align="center"><a href="ModificarUser?dato=eliminar&codigo=<%=listacuenta.get(i).getId()%>">eliminar</a></td>
                  </tr>
                  <%} %>
                </table></td>
              </tr>
            </table></td>
            </tr>
          <tr>
            <td>&nbsp;</td>
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
     
      </tr>
  </table>
</form>
<script type="text/javascript">
var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1", "integer");
</script>
</body>
</html>